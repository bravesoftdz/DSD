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
  OutSaldo TFloat,
  PriceSIP TFloat,
  SummSIP TFloat,
  SummSaldoSIP TFloat
) AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
   -- проверка прав пользователя на вызов процедуры
   -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_User());
   vbUserId:= lpGetUserBySession (inSession);


   -- для остальных...
   RETURN QUERY
    WITH
    tmpContainer AS (
                        SELECT AnalysisContainer.UnitID                                                      AS UnitID
                             , AnalysisContainer.GoodsId                                                     AS GoodsId
                             , Sum(AnalysisContainer.Saldo)::TFloat                                          AS Saldo
                        FROM AnalysisContainer AS AnalysisContainer
                        GROUP BY AnalysisContainer.UnitID
                               , AnalysisContainer.GoodsId),

    tmpAnalysisContainerItem AS (
                        SELECT AnalysisContainerItem.UnitID                                               AS UnitID
                             , AnalysisContainerItem.GoodsId                                              AS GoodsId


                             , Sum(CASE WHEN AnalysisContainerItem.OperDate <= inEndDate THEN 
                                 AnalysisContainerItem.AmountCheck END)                                  AS Amount
                             , Sum(CASE WHEN AnalysisContainerItem.OperDate > inEndDate THEN 
                                 AnalysisContainerItem.Saldo END)                                         AS Saldo
                        FROM AnalysisContainerItem AS AnalysisContainerItem
                        WHERE AnalysisContainerItem.OperDate >= inStartDate
                        GROUP BY AnalysisContainerItem.UnitID
                               , AnalysisContainerItem.GoodsId),
    tmpMIPromo AS (SELECT --MovementLinkObject_Maker.ObjectId  AS MakerID
                          MI_Goods.ObjectId                  AS GoodsId
                        , MAX(MIFloat_Price.ValueData)       AS Price
                   FROM Movement
                     INNER JOIN MovementLinkObject AS MovementLinkObject_Maker
                                                   ON MovementLinkObject_Maker.MovementId = Movement.Id
                                                  AND MovementLinkObject_Maker.DescId = zc_MovementLinkObject_Maker()

                     INNER JOIN MovementDate AS MovementDate_StartPromo
                                             ON MovementDate_StartPromo.MovementId = Movement.Id
                                            AND MovementDate_StartPromo.DescId = zc_MovementDate_StartPromo()
                     INNER JOIN MovementDate AS MovementDate_EndPromo
                                             ON MovementDate_EndPromo.MovementId = Movement.Id
                                            AND MovementDate_EndPromo.DescId = zc_MovementDate_EndPromo()

                     INNER JOIN MovementItem AS MI_Goods ON MI_Goods.MovementId = Movement.Id
                                                        AND MI_Goods.DescId = zc_MI_Master()
                                                        AND MI_Goods.isErased = FALSE
                     LEFT JOIN MovementItemFloat AS MIFloat_Price
                                                 ON MIFloat_Price.MovementItemId = MI_Goods.Id
                                                AND MIFloat_Price.DescId = zc_MIFloat_Price()
                   WHERE Movement.StatusId = zc_Enum_Status_Complete()
                     AND Movement.DescId = zc_Movement_Promo()
                     AND MovementDate_StartPromo.ValueData <= inEndDate
                     AND MovementDate_EndPromo.ValueData >= inEndDate
                     AND COALESCE (MIFloat_Price.ValueData, 0) <> 0
                   GROUP BY MI_Goods.ObjectId)


   SELECT
      Object_Unit.ObjectCode           AS UnitID
    , (Object_Unit.ValueData || COALESCE(' (' || Object_Parent.ValueData || ')', ''))::TVarChar  AS UnitName
    , Object_Goods.ObjectCode          AS GoodsId
    , Object_Goods.ValueData           AS GoodsName
    , Null::TVarChar                   AS PromoID
    , Object_GoodsGroup.ObjectCode     AS GoodsGroupId
    , Object_GoodsGroup.ValueData      AS GoodsGroupName
    , Object_NDSKind.ObjectCode        AS NDSKindId
    , Object_NDSKind.ValueData         AS NDSKindName
    , Null::Integer                    AS JuridicalID
    , Null::TVarChar                   AS JuridicalName
    , tmpAnalysisContainerItem.Amount::TFloat    AS Amount
    , (tmpContainer.Saldo - COALESCE(tmpAnalysisContainerItem.Saldo, 0))::TFloat AS OutSaldo
    , tmpMIPromo.Price::TFloat         AS PriceSIP     
    , Round(tmpAnalysisContainerItem.Amount * tmpMIPromo.Price, 2) ::TFloat AS SummSIP
    , Round((tmpContainer.Saldo - COALESCE(tmpAnalysisContainerItem.Saldo, 0)) * tmpMIPromo.Price, 2) ::TFloat AS SummSaldoSIP
   FROM tmpContainer
     LEFT OUTER JOIN tmpAnalysisContainerItem AS tmpAnalysisContainerItem
        ON tmpAnalysisContainerItem.UnitId = tmpContainer.UnitId AND
           tmpAnalysisContainerItem.GoodsId = tmpContainer.GoodsId

     INNER JOIN Object AS Object_Unit
                       ON Object_Unit.ID = tmpContainer.UnitID
     INNER JOIN Object AS Object_Goods
                       ON Object_Goods.Id = tmpContainer.GoodsID

     LEFT JOIN ObjectLink AS ObjectLink_Goods_GoodsGroup
                          ON ObjectLink_Goods_GoodsGroup.ObjectId = Object_Goods.Id
                         AND ObjectLink_Goods_GoodsGroup.DescId = zc_ObjectLink_Goods_GoodsGroup()
     LEFT JOIN Object AS Object_GoodsGroup ON Object_GoodsGroup.Id = ObjectLink_Goods_GoodsGroup.ChildObjectId

     LEFT JOIN ObjectLink AS ObjectLink_Goods_NDSKind
                          ON ObjectLink_Goods_NDSKind.ObjectId = Object_Goods.Id
                         AND ObjectLink_Goods_NDSKind.DescId = zc_ObjectLink_Goods_NDSKind()
     LEFT JOIN Object AS Object_NDSKind ON Object_NDSKind.Id = ObjectLink_Goods_NDSKind.ChildObjectId
    
     LEFT JOIN ObjectLink AS ObjectLink_Unit_Parent
                          ON ObjectLink_Unit_Parent.ObjectId = Object_Unit.Id
                         AND ObjectLink_Unit_Parent.DescId = zc_ObjectLink_Unit_Parent()
     LEFT JOIN Object AS Object_Parent 
                      ON Object_Parent.Id = ObjectLink_Unit_Parent.ChildObjectId    
     LEFT JOIN tmpMIPromo ON tmpMIPromo.GoodsId = tmpContainer.GoodsID

   WHERE ((tmpContainer.Saldo - COALESCE(tmpAnalysisContainerItem.Saldo, 0)) <> 0 OR
           COALESCE(tmpAnalysisContainerItem.Amount, 0) <> 0);
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Шаблий О.В.
 11.08.18        *                                                                         *
 15.04.18        *                                                                         *

*/

-- тест
-- select * from gpReport_Analysis_Remains_Selling ('2018-10-01'::TDateTime, '2018-12-31'::TDateTime, '3')
