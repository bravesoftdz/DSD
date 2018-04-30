-- Function:  gpReport_Goods_RemainsCurrent()

DROP FUNCTION IF EXISTS gpReport_Goods_RemainsCurrent(Integer,Boolean, Boolean,Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpReport_Goods_RemainsCurrent(Integer,Integer,Integer,Integer,Integer,Integer,Boolean, Boolean,Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpReport_Goods_RemainsCurrent(Integer,Integer,Integer,Integer,Integer,Integer,Integer, TDateTime, Boolean, Boolean,Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpReport_Goods_RemainsCurrent (Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Boolean, Boolean, Boolean, Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpReport_Goods_RemainsCurrent (Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Boolean, Boolean, Boolean, Boolean, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_Goods_RemainsCurrent(
    IN inUnitId           Integer  ,  -- ������������� / ������
    IN inBrandId          Integer  ,  -- �������� �����
    IN inPartnerId        Integer  ,  -- ���������
    IN inPeriodId         Integer  ,  -- �����
    IN inStartYear        Integer  ,  -- ��� � ...
    IN inEndYear          Integer  ,  -- ��� �� ...
    IN inUserId           Integer  ,  -- Id ������������ ������ GoodsPrint
    IN inGoodsPrintId     Integer  ,  -- � �/� ������ GoodsPrint
    IN inIsPartion        Boolean  ,  -- �������� <�������� ������ �> (��/���)
    IN inIsPartner        Boolean  ,  -- �������� ���������� (��/���)
    IN inIsSize           Boolean  ,  -- �������� ������� (��/���)
    IN inIsSizeStr        Boolean  ,  -- �������� ������� ������ (��/���)
    IN inIsYear           Boolean  ,  -- ����������� ��� �� (��/���) (����� ������)
    IN inSession          TVarChar    -- ������ ������������
)
RETURNS TABLE (PartionId            Integer
             , MovementId_Partion   Integer
             , InvNumber_Partion    TVarChar
             , InvNumberAll_Partion TVarChar
             , OperDate_Partion     TDateTime
             , DescName_Partion     TVarChar
             , UnitId               Integer
             , UnitName             TVarChar
             , UnitName_in          TVarChar
             , PartnerName          TVarChar
             , BrandName            TVarChar
             , FabrikaName          TVarChar
             , PeriodName           TVarChar
             , PeriodYear           Integer
             , GoodsId Integer, GoodsCode Integer, GoodsName TVarChar, GoodsNameFull TVarChar
             , GoodsGroupNameFull TVarChar, NameFull TVarChar, GoodsGroupName TVarChar, MeasureName TVarChar
             , JuridicalName        TVarChar
             , CompositionGroupName TVarChar
             , CompositionName      TVarChar
             , GoodsInfoName        TVarChar
             , LineFabricaName      TVarChar
             , LabelName            TVarChar
             , GoodsSizeId          Integer
             , GoodsSizeName        TVarChar
             , CurrencyName         TVarChar

             , CurrencyValue        TFloat -- ����    !!!��!!! CURRENT_DATE
             , ParValue             TFloat -- ������� !!!��!!! CURRENT_DATE

             , Amount_in            TFloat -- ����� ���-�� ������ �� ����������
             , OperPrice            TFloat -- ���� ��.
             , CountForPrice        TFloat -- ���. � ����
             , OperPriceList        TFloat -- ���� �� ������

             , Remains              TFloat -- ���-�� - ������� � ��������
             , RemainsDebt          TFloat -- ���-�� - ����� �� ��������
             , RemainsAll           TFloat -- ����� ������� ���-�� � ������ �����
             , SummDebt             TFloat -- ����� ��� - ����� �� ��������
             , SummDebt_profit      TFloat -- ����� ��� - ������� ������� �������� � ������ �� ��������

             , TotalSumm            TFloat -- ����� �� ������� ����� � ������ - ������� ����� � ������ �����
             , TotalSummBalance     TFloat -- ����� �� ������� ����� � ��� - ������� ����� � ������ �����
             , TotalSummPriceList   TFloat -- ����� �� ������ - ������� ����� � ������ �����
             , PriceTax             TFloat -- % �������
             , DiscountTax          TFloat -- % �������� ������ !!!��!!! zc_DateEnd
             , Amount_GoodsPrint    TFloat -- ���-�� ��� ������ ��������

             , PriceListId_Basis    Integer  --
             , PriceListName_Basis  TVarChar --
              )
AS
$BODY$
   DECLARE vbUserId      Integer;
   DECLARE vbIsOperPrice Boolean;
   DECLARE vbPriceListName_Basis TVarChar;
BEGIN
    -- �������� ���� ������������ �� ����� ���������
    -- PERFORM lpCheckRight (inSession, zc_Enum_Process_...());
    vbUserId:= lpGetUserBySession (inSession);


    -- �������� ����� �� �������� ����� �������, ��� ������ ����
    PERFORM lpCheckUnit_byUser (inUnitId_by:= inUnitId, inUserId:= vbUserId);

    -- �������� - ���������� �� ���� ��.
    vbIsOperPrice:= lpCheckOperPrice_visible (vbUserId);

    -- ��� ����������� ���������� ��� ��������� ����� ���� �����
    vbPriceListName_Basis := (SELECT Object.ValueData FROM Object WHERE Object.Id = zc_PriceList_Basis()) ::TVarChar;

    -- !!!������!!!
    IF inIsPartion = TRUE THEN
       inIsPartner:= TRUE;
       -- inIsSize   := TRUE;
    END IF;
    -- !!!������!!!
    inIsYear:= TRUE;
    -- !!!������!!!
    IF inIsYear = TRUE AND COALESCE (inEndYear, 0) = 0 THEN
       inEndYear:= 1000000;
    END IF;
    -- !!!������!!!
    IF inIsSizeStr = TRUE THEN
        inIsSize   := TRUE;
    END IF;

    -- ������� �������������
    CREATE TEMP TABLE _tmpUnit (UnitId Integer) ON COMMIT DROP;
    IF COALESCE (inUnitId, 0) <> 0
    THEN
        --
        INSERT INTO _tmpUnit (UnitId)
          SELECT lfSelect.UnitId FROM lfSelect_Object_Unit_byGroup (inUnitId) AS lfSelect
         ;
    ELSE
        --
        INSERT INTO _tmpUnit (UnitId)
          SELECT Object_Unit.Id FROM Object AS Object_Unit WHERE Object_Unit.DescId = zc_Object_Unit()
         ;
    END IF;

    -- ���������
    RETURN QUERY
    WITH
     tmpContainer AS (SELECT Container.WhereObjectId                                   AS UnitId
                           , Container.PartionId                                       AS PartionId
                           , Container.ObjectId                                        AS GoodsId
                           , CASE WHEN CLO_Client.ContainerId IS NULL THEN Container.Amount ELSE 0 END AS Remains
                           , CASE WHEN CLO_Client.ContainerId > 0     THEN Container.Amount ELSE 0 END AS RemainsDebt
                           , COALESCE (Container.Amount, 0)                                            AS RemainsAll
                           , COALESCE (Container_SummDebt.Amount, 0)                                   AS SummDebt
                           , COALESCE (Container_SummDebt_profit.Amount, 0)                            AS SummDebt_profit

                           , ObjectLink_Partner_Period.ChildObjectId AS PeriodId
                           , Object_PartionGoods.BrandId
                           , Object_PartionGoods.PartnerId
                           , Object_PartionGoods.PeriodYear

                           , Object_PartionGoods.GoodsSizeId
                           , Object_PartionGoods.MeasureId
                           , Object_PartionGoods.GoodsGroupId
                           , Object_PartionGoods.CompositionId
                           , Object_PartionGoods.CompositionGroupId
                           , Object_PartionGoods.GoodsInfoId
                           , Object_PartionGoods.LineFabricaId
                           , Object_PartionGoods.LabelId
                           , Object_PartionGoods.JuridicalId
                           , Object_PartionGoods.CurrencyId

                           , Object_PartionGoods.MovementId
                             -- ���� ���� ����� ������ ���� ��.
                           , CASE WHEN vbIsOperPrice = TRUE THEN Object_PartionGoods.OperPrice ELSE 0 END AS OperPrice
                           , Object_PartionGoods.CountForPrice
                           , Object_PartionGoods.OperPriceList
                           -- , CASE WHEN Container.WhereObjectId = Object_PartionGoods.UnitId THEN Object_PartionGoods.Amount ELSE 0 END AS Amount_in
                           , Object_PartionGoods.Amount     AS Amount_in
                           , Object_PartionGoods.UnitId     AS UnitId_in
                             --  � �/� - ������ ��� = 1 ������� Amount_in
                           , ROW_NUMBER() OVER (PARTITION BY Container.PartionId ORDER BY CASE WHEN Container.WhereObjectId = Object_PartionGoods.UnitId THEN 0 ELSE 1 END ASC) AS Ord

                      FROM Container
                           -- INNER JOIN _tmpUnit ON _tmpUnit.UnitId = Container.WhereObjectId
                           INNER JOIN Object_PartionGoods ON Object_PartionGoods.MovementItemId = Container.PartionId
                                                         AND Object_PartionGoods.GoodsId        = Container.ObjectId
                           LEFT JOIN ObjectLink AS ObjectLink_Partner_Period
                                                ON ObjectLink_Partner_Period.ObjectId = Object_PartionGoods.PartnerId
                                               AND ObjectLink_Partner_Period.DescId = zc_ObjectLink_Partner_Period()
                           LEFT JOIN ContainerLinkObject AS CLO_Client
                                                         ON CLO_Client.ContainerId = Container.Id
                                                        AND CLO_Client.DescId      = zc_ContainerLinkObject_Client()
                           -- �������� + ���������� + ������
                           LEFT JOIN Container AS Container_SummDebt
                                               ON Container_SummDebt.ParentId = Container.Id
                                              AND Container_SummDebt.ObjectId = zc_Enum_Account_20101()
                                              AND Container_SummDebt.DescId   = zc_Container_Summ()
                                              -- AND 1=0
                           -- �������� + ���������� + ������� ������� ��������
                           LEFT JOIN Container AS Container_SummDebt_profit
                                               ON Container_SummDebt_profit.ParentId = Container.Id
                                              AND Container_SummDebt_profit.ObjectId = zc_Enum_Account_20102()
                                              AND Container_SummDebt_profit.DescId   = zc_Container_Summ()
                                              -- AND 1=0
                      WHERE Container.DescId = zc_Container_Count()
                        AND Container.WhereObjectId = inUnitId
                        AND (Container.Amount <> 0 OR Container_SummDebt.Amount <> 0 OR Container_SummDebt_profit.Amount <> 0
                          OR inPartnerId <> 0 OR (inIsYear = TRUE AND inStartYear = inEndYear) -- OR inBrandId <> 0 -- OR (inIsYear = TRUE AND inStartYear >0)
                            )
                        AND (ObjectLink_Partner_Period.ChildObjectId = inPeriodId   OR inPeriodId  = 0)
                        AND (Object_PartionGoods.BrandId             = inBrandId    OR inBrandId   = 0)
                        AND (Object_PartionGoods.PartnerId           = inPartnerId  OR inPartnerId = 0)
                        AND ((Object_PartionGoods.PeriodYear BETWEEN inStartYear AND inEndYear) OR inIsYear = FALSE)
                     )

       , tmpData_All AS (SELECT tmpContainer.UnitId
                          , tmpContainer.GoodsId
                          , CASE WHEN inisPartion = TRUE AND inIsSize = TRUE THEN tmpContainer.PartionId ELSE 0 END AS PartionId
                          , CASE WHEN inisPartion = TRUE THEN tmpContainer.MovementId       ELSE 0  END AS MovementId_Partion
                          , CASE WHEN inisPartion = TRUE THEN MovementDesc_Partion.ItemName ELSE '' END AS DescName_Partion
                          , CASE WHEN inisPartion = TRUE THEN Movement_Partion.InvNumber    ELSE '' END AS InvNumber_Partion
                          , CASE WHEN inisPartion = TRUE THEN Movement_Partion.OperDate     ELSE zc_DateStart() END AS OperDate_Partion
                          , CASE WHEN inisPartner = TRUE THEN tmpContainer.PartnerId        ELSE 0  END AS PartnerId
                          , CASE WHEN inisSize    = TRUE THEN tmpContainer.GoodsSizeId      ELSE 0  END AS GoodsSizeId

                          , tmpContainer.BrandId
                          , tmpContainer.PeriodId
                          , tmpContainer.PeriodYear
                          , ObjectLink_Partner_Fabrika.ChildObjectId AS FabrikaId

                          , tmpContainer.MeasureId
                          , tmpContainer.GoodsGroupId
                          , tmpContainer.CompositionId
                          , tmpContainer.CompositionGroupId
                          , tmpContainer.GoodsInfoId
                          , tmpContainer.LineFabricaId
                          , tmpContainer.LabelId
                          , tmpContainer.JuridicalId
                          , tmpContainer.CurrencyId
                          , tmpContainer.OperPriceList
                          , tmpContainer.UnitId_in

                            --  ������ ��� Ord = 1
                          , SUM (CASE WHEN tmpContainer.Ord = 1 THEN tmpContainer.Amount_in ELSE 0 END) AS Amount_in
                          , SUM (CASE WHEN tmpContainer.Ord = 1 THEN zfCalc_SummIn (tmpContainer.Amount_in, tmpContainer.OperPrice, tmpContainer.CountForPrice) ELSE 0 END) AS TotalSummPrice_in

                          , SUM (tmpContainer.Remains)         AS Remains
                          , SUM (tmpContainer.RemainsDebt)     AS RemainsDebt
                          , SUM (tmpContainer.RemainsAll)      AS RemainsAll
                          , SUM (tmpContainer.SummDebt)        AS SummDebt
                          , SUM (tmpContainer.SummDebt_profit) AS SummDebt_profit


                          , SUM (zfCalc_SummIn        (tmpContainer.RemainsAll, tmpContainer.OperPrice, tmpContainer.CountForPrice)) AS TotalSummPrice
                          , SUM (zfCalc_SummPriceList (tmpContainer.RemainsAll, tmpContainer.OperPriceList))                         AS TotalSummPriceList

                     FROM tmpContainer
                          LEFT JOIN Movement AS Movement_Partion ON Movement_Partion.Id = tmpContainer.MovementId
                          LEFT JOIN MovementDesc AS MovementDesc_Partion ON MovementDesc_Partion.Id = Movement_Partion.DescId
                          LEFT JOIN ObjectLink AS ObjectLink_Partner_Fabrika
                                               ON ObjectLink_Partner_Fabrika.ObjectId = tmpContainer.PartnerId
                                              AND ObjectLink_Partner_Fabrika.DescId   = zc_ObjectLink_Partner_Fabrika()
                          -- LEFT JOIN tmpPrice ON tmpPrice.GoodsId = Object_PartionGoods.GoodsId
                     GROUP BY tmpContainer.UnitId
                            , tmpContainer.GoodsId
                            , CASE WHEN inisPartion = TRUE AND inIsSize = TRUE THEN tmpContainer.PartionId ELSE 0 END
                            , CASE WHEN inisPartion = TRUE THEN tmpContainer.MovementId       ELSE 0  END
                            , CASE WHEN inisPartion = TRUE THEN MovementDesc_Partion.ItemName ELSE '' END
                            , CASE WHEN inisPartion = TRUE THEN Movement_Partion.InvNumber    ELSE '' END
                            , CASE WHEN inisPartion = TRUE THEN Movement_Partion.OperDate     ELSE zc_DateStart() END
                            , CASE WHEN inisPartner = TRUE THEN tmpContainer.PartnerId        ELSE 0  END
                            , CASE WHEN inisSize    = TRUE THEN tmpContainer.GoodsSizeId      ELSE 0  END

                            , tmpContainer.BrandId
                            , tmpContainer.PeriodId
                            , tmpContainer.PeriodYear
                            , ObjectLink_Partner_Fabrika.ChildObjectId

                            , tmpContainer.MeasureId
                            , tmpContainer.GoodsGroupId
                            , tmpContainer.CompositionId
                            , tmpContainer.CompositionGroupId
                            , tmpContainer.GoodsInfoId
                            , tmpContainer.LineFabricaId
                            , tmpContainer.LabelId
                            , tmpContainer.JuridicalId
                            , tmpContainer.CurrencyId
                            , tmpContainer.PeriodYear
                            , tmpContainer.OperPriceList
                            , tmpContainer.UnitId_in
              )
       , tmpData AS (SELECT tmpData_All.UnitId
                          , tmpData_All.GoodsId
                          , tmpData_All.PartionId
                          , tmpData_All.MovementId_Partion
                          , tmpData_All.DescName_Partion
                          , tmpData_All.InvNumber_Partion
                          , tmpData_All.OperDate_Partion
                          , tmpData_All.PartnerId
                          , CASE WHEN inIsSizeStr = TRUE THEN 0 ELSE Object_GoodsSize.id END  AS GoodsSizeId
                          , STRING_AGG (Object_GoodsSize.ValueData, ', ') AS GoodsSizeName

                          , tmpData_All.BrandId
                          , tmpData_All.PeriodId
                          , tmpData_All.PeriodYear
                          , tmpData_All.FabrikaId
                          , tmpData_All.MeasureId
                          , tmpData_All.GoodsGroupId
                          , tmpData_All.CompositionId
                          , tmpData_All.CompositionGroupId
                          , tmpData_All.GoodsInfoId
                          , tmpData_All.LineFabricaId
                          , tmpData_All.LabelId
                          , tmpData_All.JuridicalId
                          , tmpData_All.CurrencyId
                          , tmpData_All.OperPriceList
                          , tmpData_All.UnitId_in

                          , SUM (tmpData_All.Amount_in) AS Amount_in
                          , SUM (tmpData_All.TotalSummPrice_in) AS TotalSummPrice_in

                          , SUM (tmpData_All.Remains)         AS Remains
                          , SUM (tmpData_All.RemainsDebt)     AS RemainsDebt
                          , SUM (tmpData_All.RemainsAll)      AS RemainsAll
                          , SUM (tmpData_All.SummDebt)        AS SummDebt
                          , SUM (tmpData_All.SummDebt_profit) AS SummDebt_profit


                          , SUM (tmpData_All.TotalSummPrice)     AS TotalSummPrice
                          , SUM (tmpData_All.TotalSummPriceList) AS TotalSummPriceList

                     FROM tmpData_All
                          LEFT JOIN Object AS Object_GoodsSize ON Object_GoodsSize.Id = tmpData_All.GoodsSizeId
                     GROUP BY tmpData_All.UnitId
                          , tmpData_All.GoodsId
                          , tmpData_All.PartionId
                          , tmpData_All.MovementId_Partion
                          , tmpData_All.DescName_Partion
                          , tmpData_All.InvNumber_Partion
                          , tmpData_All.OperDate_Partion
                          , tmpData_All.PartnerId
                          , CASE WHEN inIsSizeStr = TRUE THEN 0 ELSE Object_GoodsSize.id END
                          , tmpData_All.BrandId
                          , tmpData_All.PeriodId
                          , tmpData_All.PeriodYear
                          , tmpData_All.FabrikaId
                          , tmpData_All.MeasureId
                          , tmpData_All.GoodsGroupId
                          , tmpData_All.CompositionId
                          , tmpData_All.CompositionGroupId
                          , tmpData_All.GoodsInfoId
                          , tmpData_All.LineFabricaId
                          , tmpData_All.LabelId
                          , tmpData_All.JuridicalId
                          , tmpData_All.CurrencyId
                          , tmpData_All.OperPriceList
                          , tmpData_All.UnitId_in
              )

 
 , tmpDiscountList AS (SELECT DISTINCT tmpData.UnitId, tmpData.GoodsId FROM tmpData)

          , tmpOL1 AS (SELECT * FROM ObjectLink WHERE ObjectLink.ChildObjectId IN (SELECT DISTINCT tmpData.GoodsId FROM tmpData)
                                                  AND ObjectLink.DescId        = zc_ObjectLink_DiscountPeriodItem_Goods()
                      )
          , tmpOL2 AS (SELECT * FROM ObjectLink WHERE ObjectLink.ObjectId IN (SELECT DISTINCT tmpOL1.ObjectId FROM tmpOL1)
                                                  AND ObjectLink.DescId   = zc_ObjectLink_DiscountPeriodItem_Unit()
                      )

 , tmpDiscount AS (SELECT ObjectLink_DiscountPeriodItem_Unit.ChildObjectId      AS UnitId
                        , ObjectLink_DiscountPeriodItem_Goods.ChildObjectId     AS GoodsId
                        , ObjectHistoryFloat_DiscountPeriodItem_Value.ValueData AS DiscountTax
                   FROM tmpDiscountList
                        INNER JOIN tmpOL1 AS ObjectLink_DiscountPeriodItem_Goods
                                              ON ObjectLink_DiscountPeriodItem_Goods.ChildObjectId = tmpDiscountList.GoodsId
                                             -- AND ObjectLink_DiscountPeriodItem_Goods.DescId       = zc_ObjectLink_DiscountPeriodItem_Goods()
                        INNER JOIN tmpOL2 AS ObjectLink_DiscountPeriodItem_Unit
                                              ON ObjectLink_DiscountPeriodItem_Unit.ObjectId      = ObjectLink_DiscountPeriodItem_Goods.ObjectId
                                             AND ObjectLink_DiscountPeriodItem_Unit.ChildObjectId = tmpDiscountList.UnitId
                                             -- AND ObjectLink_DiscountPeriodItem_Unit.DescId       = zc_ObjectLink_DiscountPeriodItem_Unit()
                        INNER JOIN ObjectHistory AS ObjectHistory_DiscountPeriodItem
                                                 ON ObjectHistory_DiscountPeriodItem.ObjectId = ObjectLink_DiscountPeriodItem_Goods.ObjectId
                                                AND ObjectHistory_DiscountPeriodItem.DescId   = zc_ObjectHistory_DiscountPeriodItem()
                                                AND ObjectHistory_DiscountPeriodItem.EndDate  = zc_DateEnd()
                        LEFT JOIN ObjectHistoryFloat AS ObjectHistoryFloat_DiscountPeriodItem_Value
                                                     ON ObjectHistoryFloat_DiscountPeriodItem_Value.ObjectHistoryId = ObjectHistory_DiscountPeriodItem.Id
                                                    AND ObjectHistoryFloat_DiscountPeriodItem_Value.DescId = zc_ObjectHistoryFloat_DiscountPeriodItem_Value()
                  )
 , tmpGoodsPrint AS (SELECT Object_GoodsPrint.UnitId
                          , CASE WHEN inisPartion = TRUE THEN Object_GoodsPrint.PartionId ELSE 0 END AS PartionId
                          , Object_PartionGoods.GoodsId
                          , SUM (Object_GoodsPrint.Amount) AS Amount
                     FROM (SELECT Object_GoodsPrint.InsertDate
                                , ROW_NUMBER() OVER (PARTITION BY Object_GoodsPrint.UserId ORDER BY Object_GoodsPrint.InsertDate) AS ord
                           FROM Object_GoodsPrint
                           WHERE Object_GoodsPrint.UserId = inUserId
                             AND inGoodsPrintId > 0
                           GROUP BY Object_GoodsPrint.UserId
                                  , Object_GoodsPrint.InsertDate
                          ) AS tmp
                          LEFT JOIN Object_GoodsPrint ON Object_GoodsPrint.InsertDate = tmp.InsertDate
                                                     AND Object_GoodsPrint.UserId     = inUserId
                          LEFT JOIN Object_PartionGoods ON Object_PartionGoods.MovementItemId = Object_GoodsPrint.PartionId

                     WHERE tmp.Ord = inGoodsPrintId -- � �/� ������ GoodsPrint
                     GROUP BY Object_GoodsPrint.UnitId
                            , CASE WHEN inisPartion = TRUE THEN Object_GoodsPrint.PartionId ELSE 0 END
                            , Object_PartionGoods.GoodsId
                    )
       , tmpCurrency AS (SELECT lfSelect.*
                         FROM Object
                              CROSS JOIN lfSelect_Movement_Currency_byDate (inOperDate      := CURRENT_DATE
                                                                          , inCurrencyFromId:= zc_Currency_Basis()
                                                                          , inCurrencyToId  := Object.Id
                                                                           ) AS lfSelect
                         WHERE Object.DescId = zc_Object_Currency()
                           AND Object.Id     <> zc_Currency_Basis()
                           AND vbIsOperPrice = TRUE
                        )
        -- ���������
        SELECT
             tmpData.PartionId                      AS PartionId
           , tmpData.MovementId_Partion             AS MovementId_Partion
           , tmpData.InvNumber_Partion :: TVarChar  AS InvNumber_Partion
           , zfCalc_PartionMovementName (0, '', tmpData.InvNumber_Partion, tmpData.OperDate_Partion) AS InvNumberAll_Partion
           , CASE WHEN tmpData.OperDate_Partion = zc_DateStart() THEN NULL ELSE tmpData.OperDate_Partion END  :: TDateTime AS OperDate_Partion
           , tmpData.DescName_Partion  :: TVarChar  AS DescName_Partion

           , Object_Unit.Id                 AS UnitId
           , Object_Unit.ValueData          AS UnitName
           , Object_Unit_in.ValueData       AS UnitName_in
           , Object_Partner.ValueData       AS PartnerName
           , Object_Brand.ValueData         AS BrandName
           , Object_Fabrika.ValueData       AS FabrikaName
           , Object_Period.ValueData        AS PeriodName
           , tmpData.PeriodYear

           , Object_Goods.Id                AS GoodsId
           , Object_Goods.ObjectCode        AS GoodsCode
           , Object_Goods.ValueData         AS GoodsName
           , (COALESCE (ObjectString_GoodsGroupFull.ValueData, '') ||' - '||Object_Label.ValueData||' - '||Object_Goods.ObjectCode||' - ' || Object_Goods.ValueData) ::TVarChar  AS GoodsNameFull
           , ObjectString_GoodsGroupFull.ValueData AS GoodsGroupNameFull
           , (COALESCE (ObjectString_GoodsGroupFull.ValueData, '') || ' - ' || COALESCE (Object_GoodsInfo.ValueData, '')) :: TVarChar AS NameFull
           , Object_GoodsGroup.ValueData    AS GoodsGroupName
           , Object_Measure.ValueData       AS MeasureName
           , Object_Juridical.ValueData     AS JuridicalName
           , Object_CompositionGroup.ValueData AS CompositionGroupName
           , Object_Composition.ValueData   AS CompositionName
           , Object_GoodsInfo.ValueData     AS GoodsInfoName
           , Object_LineFabrica.ValueData   AS LineFabricaName
           , Object_Label.ValueData         AS LabelName
           , tmpData.GoodsSizeId            AS GoodsSizeId
           , tmpData.GoodsSizeName ::TVarChar AS GoodsSizeName
           , CASE WHEN vbIsOperPrice = TRUE THEN Object_Currency.ValueData ELSE '' END :: TVarChar AS CurrencyName

           , tmpCurrency.Amount   ::TFloat  AS CurrencyValue
           , tmpCurrency.ParValue ::TFloat  AS ParValue

           , tmpData.Amount_in    :: TFloat AS Amount_in
           , CASE WHEN tmpData.RemainsAll <> 0 THEN tmpData.TotalSummPrice / tmpData.RemainsAll ELSE 0 END :: TFloat AS OperPrice
           , 1                    :: TFloat AS CountForPrice
           , tmpData.OperPriceList

           , tmpData.Remains                 :: TFloat AS Remains
           , tmpData.RemainsDebt             :: TFloat AS RemainsDebt
           , tmpData.RemainsAll              :: TFloat AS RemainsAll

           , tmpData.SummDebt                :: TFloat AS SummDebt
           , tmpData.SummDebt_profit         :: TFloat AS SummDebt_profit

             -- ����� �� ������� ����� � ������ - ������� ����� � ������ �����
           , tmpData.TotalSummPrice          :: TFloat AS TotalSumm
             -- ����� �� ������� ����� � ��� - ������� ����� � ������ �����
           , CAST (tmpData.TotalSummPrice * tmpCurrency.Amount / CASE WHEN tmpData.CurrencyId = zc_Currency_Basis() THEN 1 WHEN tmpCurrency.ParValue <> 0 THEN tmpCurrency.ParValue ELSE 1 END AS NUMERIC (16, 2)) :: TFloat AS TotalSummBalance
             -- ����� �� ������ - ������� ����� � ������ �����
           , tmpData.TotalSummPriceList      :: TFloat AS TotalSummPriceList
             -- % �������
           , CAST (CASE WHEN (tmpData.TotalSummPrice_in * tmpCurrency.Amount / CASE WHEN tmpData.CurrencyId = zc_Currency_Basis() THEN 1 WHEN tmpCurrency.ParValue <> 0 THEN tmpCurrency.ParValue ELSE 1 END)
                              <> 0
                        THEN (100 * tmpData.Amount_in * tmpData.OperPriceList
                            / (tmpData.TotalSummPrice_in * tmpCurrency.Amount / CASE WHEN tmpData.CurrencyId = zc_Currency_Basis() THEN 1 WHEN tmpCurrency.ParValue <> 0 THEN tmpCurrency.ParValue ELSE 1 END)
                              - 100)
                        ELSE 0
                   END AS NUMERIC (16, 0)) :: TFloat AS PriceTax

             -- % �������� ������ !!!��!!! zc_DateEnd
           , tmpDiscount.DiscountTax         :: TFloat AS DiscountTax
             -- ���-�� ��� ������ ��������
           , tmpGoodsPrint.Amount            :: TFloat AS Amount_GoodsPrint
           
           , zc_PriceList_Basis()  AS PriceListId_Basis
           , vbPriceListName_Basis AS PriceListName_Basis

        FROM tmpData
            LEFT JOIN Object AS Object_Unit    ON Object_Unit.Id    = tmpData.UnitId
            LEFT JOIN Object AS Object_Unit_in ON Object_Unit_in.Id = tmpData.UnitId_in
            LEFT JOIN Object AS Object_Partner ON Object_Partner.Id = tmpData.PartnerId
            LEFT JOIN Object AS Object_Goods   ON Object_Goods.Id   = tmpData.GoodsId

            LEFT JOIN Object AS Object_GoodsGroup       ON Object_GoodsGroup.Id       = tmpData.GoodsGroupId
            LEFT JOIN Object AS Object_Measure          ON Object_Measure.Id          = tmpData.MeasureId
            LEFT JOIN Object AS Object_Composition      ON Object_Composition.Id      = tmpData.CompositionId
            LEFT JOIN Object AS Object_CompositionGroup ON Object_CompositionGroup.Id = tmpData.CompositionGroupId
            LEFT JOIN Object AS Object_GoodsInfo        ON Object_GoodsInfo.Id        = tmpData.GoodsInfoId
            LEFT JOIN Object AS Object_LineFabrica      ON Object_LineFabrica.Id      = tmpData.LineFabricaId
            LEFT JOIN Object AS Object_Label            ON Object_Label.Id            = tmpData.LabelId
            --LEFT JOIN Object AS Object_GoodsSize        ON Object_GoodsSize.Id        = tmpData.GoodsSizeId
            LEFT JOIN Object AS Object_Juridical        ON Object_Juridical.Id        = tmpData.JuridicalId
            LEFT JOIN Object AS Object_Currency         ON Object_Currency.Id         = tmpData.CurrencyId

            LEFT JOIN Object AS Object_Brand   ON Object_Brand.Id   = tmpData.BrandId
            LEFT JOIN Object AS Object_Fabrika ON Object_Fabrika.Id = tmpData.FabrikaId
            LEFT JOIN Object AS Object_Period  ON Object_Period.Id  = tmpData.PeriodId

            LEFT JOIN ObjectString AS ObjectString_GoodsGroupFull
                                   ON ObjectString_GoodsGroupFull.ObjectId = tmpData.GoodsId
                                  AND ObjectString_GoodsGroupFull.DescId   = zc_ObjectString_Goods_GroupNameFull()

            LEFT JOIN tmpCurrency  ON tmpCurrency.CurrencyToId = tmpData.CurrencyId

            LEFT JOIN tmpDiscount ON tmpDiscount.UnitId  = tmpData.UnitId
                                 AND tmpDiscount.GoodsId = tmpData.GoodsId

            LEFT JOIN tmpGoodsPrint ON tmpGoodsPrint.UnitId    = tmpData.UnitId
                                   AND tmpGoodsPrint.PartionId = tmpData.PartionId
                                   AND tmpGoodsPrint.GoodsId   = tmpData.GoodsId
           ;

           
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.  ��������� �.�.
 15.03.18         * add RemainsAll
 19.02.18         *
 22.06.17         *
*/
/*
drop index idx_objectlink_objectid_childobjectid_descid
drop index idx_objectlink_childobjectid_descid
drop index idx_objecthistory_objectid_enddate_descid
CREATE UNIQUE INDEX idx_objectlink_objectid_childobjectid_descid
  ON public.objectlink
  USING btree
  (ObjectId, childobjectid, descid);
CREATE INDEX idx_objectlink_childobjectid_descid
  ON public.objectlink
  USING btree
  (childobjectid, descid);
CREATE UNIQUE INDEX idx_objecthistory_objectid_enddate_descid
  ON public.objecthistory
  USING btree
  (objectid, enddate, descid);
*/

-- ����
-- SELECT * FROM gpReport_Goods_RemainsCurrent (inUnitId:= 1531, inBrandId:= 0, inPartnerId:= 0, inPeriodId:= 0, inStartYear:= 0, inEndYear:= 0, inUserId:= 0, inGoodsPrintId:= 0, inisPartion:= FALSE, inisPartner:= FALSE, inisSize:= TRUE, inIsSizeStr:= TRUE, inIsYear:= FALSE, inSession:= zfCalc_UserAdmin())
