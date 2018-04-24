-- Function:  gpReport_Analysis_Remains_Selling

DROP FUNCTION IF EXISTS gpReport_Analysis_Remains_Selling (TDateTime, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_Analysis_Remains_Selling (
  inStartDate TDateTime,
  inEndDate TDateTime,
  inSession TVarChar
)
RETURNS TABLE (
  UnitID integer,
  UnitName TVarChar,
  GoodsId integer,
  GoodsName TVarChar,
  PromoID tvarchar,
  GoodsGroupId integer,
  GoodsGroupName TVarChar,
  NDSKindId integer,
  NDSKindName TVarChar,
  JuridicalID integer,
  JuridicalName tvarchar,
  Amount TFloat,
  OutSaldo TFloat
) AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
   -- проверка прав пользователя на вызов процедуры
   -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_User());
   vbUserId:= lpGetUserBySession (inSession);


   -- для остальных...
   RETURN QUERY
   SELECT
      AnalysisRemainsUnit.UnitID          AS UnitID,
      AnalysisRemainsUnit.UnitName        AS UnitName,
      AnalysisRemainsUnit.GoodsId         AS GoodsId,
      AnalysisRemainsUnit.GoodsName       AS GoodsName,
      AnalysisRemainsUnit.PromoID         AS PromoID,
      AnalysisRemainsUnit.GoodsGroupId    AS GoodsGroupId,
      AnalysisRemainsUnit.GoodsGroupName  AS GoodsGroupName,
      AnalysisRemainsUnit.NDSKindId       AS NDSKindId,
      AnalysisRemainsUnit.NDSKindName     AS NDSKindName,
      AnalysisRemainsUnit.JuridicalID     AS JuridicalID,
      AnalysisRemainsUnit.JuridicalName   AS JuridicalName,
      AnalysisSellingDeyUnitAmmount.Amount::TFloat as Amount,
      (AnalysisRemainsUnit.Saldo - COALESCE(AnalysisSellingDeyUnitIn.Saldo, 0))::TFloat as OutSaldo
   FROM AnalysisRemainsUnit
     LEFT OUTER JOIN
       (SELECT
          AnalysisSellingDeyUnit.UnitId,
          AnalysisSellingDeyUnit.GoodsId,
          AnalysisSellingDeyUnit.PromoID,
          AnalysisSellingDeyUnit.JuridicalID,
          Sum(AnalysisSellingDeyUnit.Saldo) as Saldo
        FROM AnalysisSellingDeyUnit
        WHERE AnalysisSellingDeyUnit.OperDate > inEndDate and
            AnalysisSellingDeyUnit.Saldo <> 0
        GROUP BY AnalysisSellingDeyUnit.UnitId, AnalysisSellingDeyUnit.GoodsId,
          AnalysisSellingDeyUnit.PromoID, AnalysisSellingDeyUnit.JuridicalID)
        AS AnalysisSellingDeyUnitIn
        ON AnalysisRemainsUnit.UnitId = AnalysisSellingDeyUnitIn.UnitId AND
           AnalysisRemainsUnit.GoodsId = AnalysisSellingDeyUnitIn.GoodsId AND
           COALESCE(AnalysisRemainsUnit.PromoID, '') = COALESCE(AnalysisSellingDeyUnitIn.PromoId, '') AND
           COALESCE(AnalysisRemainsUnit.JuridicalID, 0) = COALESCE(AnalysisSellingDeyUnitIn.JuridicalID, 0)
     LEFT OUTER JOIN
       (SELECT
          AnalysisSellingDeyUnit.UnitId,
          AnalysisSellingDeyUnit.GoodsId,
          AnalysisSellingDeyUnit.PromoID,
          AnalysisSellingDeyUnit.JuridicalID,
          Sum(-AnalysisSellingDeyUnit.Amount) as Amount
       FROM AnalysisSellingDeyUnit
       WHERE AnalysisSellingDeyUnit.OperDate >= inStartDate AND
          AnalysisSellingDeyUnit.OperDate <= inEndDate AND
          AnalysisSellingDeyUnit.Amount <> 0
       GROUP BY AnalysisSellingDeyUnit.UnitId, AnalysisSellingDeyUnit.GoodsId,
          AnalysisSellingDeyUnit.PromoID, AnalysisSellingDeyUnit.JuridicalID)
       AS AnalysisSellingDeyUnitAmmount
       ON AnalysisRemainsUnit.UnitId = AnalysisSellingDeyUnitAmmount.UnitId AND
          AnalysisRemainsUnit.GoodsId = AnalysisSellingDeyUnitAmmount.GoodsId AND
          COALESCE(AnalysisRemainsUnit.PromoID, '') = COALESCE(AnalysisSellingDeyUnitAmmount.PromoId, '') AND
          COALESCE(AnalysisRemainsUnit.JuridicalID, 0) = COALESCE(AnalysisSellingDeyUnitAmmount.JuridicalID, 0)
    WHERE ((AnalysisRemainsUnit.Saldo - COALESCE(AnalysisSellingDeyUnitIn.Saldo, 0)) <> 0 OR
           COALESCE(AnalysisSellingDeyUnitAmmount.Amount, 0) <> 0);
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Шаблий О.В.
 15.04.18        *                                                                         *

*/

-- тест
-- select * from gpReport_Analysis_Remains_Selling ('2018-04-01'::TDateTime, '2018-04-24'::TDateTime, '3')
