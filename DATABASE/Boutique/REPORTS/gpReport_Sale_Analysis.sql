
-- Function:  gpReport_Sale()
DROP FUNCTION IF EXISTS gpReport_Sale_Analysis (TDateTime, TDateTime, Integer, Integer, Integer, Integer, Integer, Integer, TFloat, TFloat, Boolean, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_Sale_Analysis (
    IN inStartDate        TDateTime,  -- ���� ������
    IN inEndDate          TDateTime,  -- ���� ���������
    IN inUnitId           Integer  ,  -- �������������
    IN inPartnerId        Integer  ,  -- ���������
    IN inBrandId          Integer  ,  --
    IN inPeriodId         Integer  ,  --
    IN inStartYear        Integer  ,
    IN inEndYear          Integer  ,
    IN inPresent1         TFloat   ,
    IN inPresent2         TFloat   ,
    IN inIsPeriodAll      Boolean  , -- ����������� �� ���� ������ (��/���) (�������� �� ����������)
    IN inIsUnit           Boolean  , -- �� ��������� ��������������
    IN inSession          TVarChar   -- ������ ������������
)
RETURNS SETOF refcursor
AS
$BODY$
   DECLARE vbUserId      Integer;
   DECLARE Cursor1       refcursor;
   DECLARE Cursor2       refcursor;
   DECLARE Cursor3       refcursor;
BEGIN

    -- �������� ���� ������������ �� ����� ���������
    vbUserId:= lpGetUserBySession (inSession);

    -- !!!������!!!
    IF COALESCE (inEndYear, 0) = 0 THEN
       inEndYear:= 1000000;
    END IF;


 CREATE TEMP TABLE _tmpData (PartionId             Integer
                           , BrandName             TVarChar
                           , PeriodName            TVarChar
                           , PeriodYear            Integer
                           , PartnerId             Integer
                           , PartnerName           TVarChar
              
                           , UnitName              TVarChar
                           , UnitName_In           TVarChar
                           , CurrencyName          TVarChar
              
                           , Income_Amount         TFloat
              
                           , Debt_Amount           TFloat
                           , Sale_Amount           TFloat
                           , Sale_Summ             TFloat
                           , Sale_Summ_curr        TFloat
                           , Sale_SummCost         TFloat
                           , Sale_SummCost_curr    TFloat
                           , Sale_SummCost_diff    TFloat
                           , Sale_Summ_prof        TFloat
                           , Sale_Summ_prof_curr   TFloat
                           , Sale_Summ_10100       TFloat
                           , Sale_Summ_10201       TFloat
                           , Sale_Summ_10202       TFloat
                           , Sale_Summ_10203       TFloat
                           , Sale_Summ_10204       TFloat
                           , Sale_Summ_10200       TFloat
                           , Sale_Summ_10200_curr  TFloat
                           , Tax_Amount            TFloat
                           , Tax_Summ_curr         TFloat
                           , Tax_Summ_prof         TFloat               

                         ) ON COMMIT DROP;
                           
        INSERT INTO _tmpData (BrandName
                            , PeriodName
                            , PeriodYear
                            , PartnerId
                            , PartnerName

                            , UnitName
                            , UnitName_In
                            , CurrencyName

                            , Income_Amount
                            , Debt_Amount
                            , Sale_Amount
                            , Sale_Summ
                            , Sale_Summ_curr
                            , Sale_SummCost
                            , Sale_SummCost_curr
                            , Sale_SummCost_diff
                            , Sale_Summ_prof
                            , Sale_Summ_prof_curr
                            , Sale_Summ_10100
                            , Sale_Summ_10201
                            , Sale_Summ_10202
                            , Sale_Summ_10203
                            , Sale_Summ_10204
                            , Sale_Summ_10200
                            , Sale_Summ_10200_curr
                            , Tax_Amount
                            , Tax_Summ_curr
                            , Tax_Summ_prof
                              )
      WITH 
           tmpCurrency_all AS (SELECT Movement.Id                    AS MovementId
                                    , Movement.OperDate              AS OperDate
                                    , MovementItem.Id                AS MovementItemId
                                    , MovementItem.ObjectId          AS CurrencyFromId
                                    , MovementItem.Amount            AS Amount
                                    , CASE WHEN MIFloat_ParValue.ValueData > 0 THEN MIFloat_ParValue.ValueData ELSE 1 END AS ParValue
                                    , MILinkObject_Currency.ObjectId AS CurrencyToId
                                    , ROW_NUMBER() OVER (PARTITION BY MovementItem.ObjectId, MILinkObject_Currency.ObjectId ORDER BY Movement.OperDate, Movement.Id) AS Ord
                               FROM Movement
                                    INNER JOIN MovementItem ON MovementItem.MovementId = Movement.Id
                                                           AND MovementItem.DescId     = zc_MI_Master()
                                    INNER JOIN MovementItemLinkObject AS MILinkObject_Currency
                                                                      ON MILinkObject_Currency.MovementItemId = MovementItem.Id
                                                                     AND MILinkObject_Currency.DescId         = zc_MILinkObject_Currency()
                                    LEFT JOIN MovementItemFloat AS MIFloat_ParValue
                                                                ON MIFloat_ParValue.MovementItemId = MovementItem.Id
                                                               AND MIFloat_ParValue.DescId         = zc_MIFloat_ParValue()
                               WHERE Movement.DescId   = zc_Movement_Currency()
                                 AND Movement.StatusId = zc_Enum_Status_Complete()
                              )

         , tmpCurrency AS (SELECT tmpCurrency_all.OperDate                           AS StartDate
                                , COALESCE (tmpCurrency_next.OperDate, zc_DateEnd()) AS EndDate
                                , tmpCurrency_all.Amount
                                , tmpCurrency_all.ParValue
                                , tmpCurrency_all.CurrencyFromId
                                , tmpCurrency_all.CurrencyToId
                           FROM tmpCurrency_all
                                LEFT JOIN tmpCurrency_all AS tmpCurrency_next
                                                          ON tmpCurrency_next.CurrencyFromId = tmpCurrency_all.CurrencyFromId
                                                         AND tmpCurrency_next.CurrencyToId   = tmpCurrency_all.CurrencyToId
                                                         AND tmpCurrency_next.Ord            = tmpCurrency_all.Ord + 1
                          )

         , tmpUnit AS (SELECT ObjectLink_Object.ChildObjectId AS UnitId
                       FROM Object
                            INNER JOIN ObjectLink AS ObjectLink_User
                                                  ON ObjectLink_User.ObjectId      = Object.Id
                                                 AND ObjectLink_User.DescId        = zc_ObjectLink_ReportOLAP_User()
                                                 AND ObjectLink_User.ChildObjectId = vbUserId
                            INNER JOIN ObjectLink AS ObjectLink_Object
                                                  ON ObjectLink_Object.ObjectId    = Object.Id
                                                 AND ObjectLink_Object.DescId      = zc_ObjectLink_ReportOLAP_Object()
                       WHERE Object.DescId     = zc_Object_ReportOLAP()
                         AND Object.ObjectCode = zc_ReportOLAP_Unit()
                         AND Object.isErased   = FALSE
                         AND inIsUnit = TRUE
                      UNION
                       SELECT inUnitId AS UnitId
                       WHERE inIsUnit = FALSE
                      )

         , tmpContainer AS (SELECT Container.Id         AS ContainerId
                            FROM Container
                                 INNER JOIN tmpUnit ON tmpUnit.UnitId = Container.WhereObjectId
                            WHERE Container.DescId   = zc_Container_Count()
                           UNION ALL
                            SELECT Container.Id         AS ContainerId
                            FROM Container
                                 INNER JOIN tmpUnit ON tmpUnit.UnitId = Container.WhereObjectId
                            WHERE Container.DescId        = zc_Container_Summ()
                              AND Container.ObjectId      = zc_Enum_Account_100301() -- ������� �������� �������
                           )

         , tmpData_all AS (SELECT Object_PartionGoods.BrandId
                                , Object_PartionGoods.PeriodId
                                , Object_PartionGoods.PeriodYear
                                , Object_PartionGoods.PartnerId

                                , COALESCE (MIConatiner.ObjectExtId_Analyzer, Object_PartionGoods.UnitId) :: Integer AS UnitId

                                , Object_PartionGoods.UnitId     AS UnitId_in
                                , Object_PartionGoods.CurrencyId AS CurrencyId

                                  -- ���-�� ������ �� ���������� - ������ ��� UnitId
                                , (Object_PartionGoods.Amount) AS Income_Amount
                                , (Object_PartionGoods.Amount * Object_PartionGoods.OperPrice / CASE WHEN Object_PartionGoods.CountForPrice > 0 THEN Object_PartionGoods.CountForPrice ELSE 1 END) AS Income_Summ

                                  -- ���-��: ����
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Count() THEN MIConatiner.Amount ELSE 0 END) AS Debt_Amount

                                  -- ���-��: ������ �������
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Count() AND MIConatiner.Amount < 0 AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN -1 * MIConatiner.Amount ELSE 0 END) :: TFloat AS Sale_Amount
                                  -- �\� ������� - calc �� ������ � ���
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Count() AND MIConatiner.Amount < 0 AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN -1 * MIConatiner.Amount
                                                     * Object_PartionGoods.OperPrice / CASE WHEN Object_PartionGoods.CountForPrice > 0 THEN Object_PartionGoods.CountForPrice ELSE 1 END
                                                     * CASE WHEN Object_PartionGoods.CurrencyId = zc_Currency_Basis() THEN 1 ELSE COALESCE (tmpCurrency.Amount, 0) END
                                                     / CASE WHEN tmpCurrency.ParValue > 0 THEN tmpCurrency.ParValue  ELSE 1 END
                                            ELSE 0
                                       END) :: TFloat AS Sale_SummCost_calc

                                  -- ����� �������
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND COALESCE (MIConatiner.AnalyzerId, 0) <> zc_Enum_AnalyzerId_SaleSumm_10300() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN -1 * MIConatiner.Amount
                                            ELSE 0
                                       END) :: TFloat AS Sale_Summ
                                   -- ��������� � ������ 
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND COALESCE (MIConatiner.AnalyzerId, 0) <> zc_Enum_AnalyzerId_SaleSumm_10300() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN -1 * MIConatiner.Amount
                                                    / CASE WHEN Object_PartionGoods.CurrencyId = zc_Currency_Basis() THEN 1 WHEN COALESCE (tmpCurrency.Amount, 0) = 0 THEN 1 ELSE COALESCE (tmpCurrency.Amount, 0) END
                                                    * CASE WHEN tmpCurrency.ParValue > 0 THEN tmpCurrency.ParValue  ELSE 1 END
                                                    -- !!!�������� ���� ��� �����!!!
                                                    * CASE WHEN Object_PartionGoods.CurrencyId = zc_Currency_Basis() THEN 1 WHEN COALESCE (tmpCurrency.Amount, 0) = 0 THEN 0 ELSE 1 END
                                            ELSE 0
                                       END) :: TFloat AS Sale_Summ_curr

                                  -- �\� ������� - ���
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId = zc_Enum_AnalyzerId_SaleSumm_10300() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN  1 * MIConatiner.Amount
                                            ELSE 0
                                       END) :: TFloat AS Sale_SummCost
                                  -- �\� ������� - ������
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Count() AND MIConatiner.Amount < 0 AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN -1 * MIConatiner.Amount
                                                    * Object_PartionGoods.OperPrice / CASE WHEN Object_PartionGoods.CountForPrice > 0 THEN Object_PartionGoods.CountForPrice ELSE 1 END
                                            ELSE 0
                                       END) :: TFloat AS Sale_SummCost_curr

                                  -- ����� �����
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId = zc_Enum_AnalyzerId_SaleSumm_10100() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN -1 * MIConatiner.Amount ELSE 0 END) :: TFloat AS Sale_Summ_10100
                                  -- �������� ������
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId = zc_Enum_AnalyzerId_SaleSumm_10201() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN  1 * MIConatiner.Amount ELSE 0 END) :: TFloat AS Sale_Summ_10201
                                  -- ������ outlet
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId = zc_Enum_AnalyzerId_SaleSumm_10202() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN  1 * MIConatiner.Amount ELSE 0 END) :: TFloat AS Sale_Summ_10202
                                  -- ������ �������
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId = zc_Enum_AnalyzerId_SaleSumm_10203() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN  1 * MIConatiner.Amount ELSE 0 END) :: TFloat AS Sale_Summ_10203
                                  -- ������ ��������������
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId = zc_Enum_AnalyzerId_SaleSumm_10204() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN  1 * MIConatiner.Amount ELSE 0 END) :: TFloat AS Sale_Summ_10204

                                  -- ������ �����
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId IN (zc_Enum_AnalyzerId_SaleSumm_10201(), zc_Enum_AnalyzerId_SaleSumm_10202(), zc_Enum_AnalyzerId_SaleSumm_10203(), zc_Enum_AnalyzerId_SaleSumm_10204()) AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN 1 * MIConatiner.Amount
                                            ELSE 0
                                       END) :: TFloat AS Sale_Summ_10200
                                   -- ��������� � ������ 
                                , SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND MIConatiner.AnalyzerId IN (zc_Enum_AnalyzerId_SaleSumm_10201(), zc_Enum_AnalyzerId_SaleSumm_10202(), zc_Enum_AnalyzerId_SaleSumm_10203(), zc_Enum_AnalyzerId_SaleSumm_10204()) AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                                                 THEN 1 * MIConatiner.Amount
                                                    / CASE WHEN Object_PartionGoods.CurrencyId = zc_Currency_Basis() THEN 1 WHEN COALESCE (tmpCurrency.Amount, 0) = 0 THEN 1 ELSE COALESCE (tmpCurrency.Amount, 0) END
                                                    * CASE WHEN tmpCurrency.ParValue > 0 THEN tmpCurrency.ParValue  ELSE 1 END
                                                    -- !!!�������� ���� ��� �����!!!
                                                    * CASE WHEN Object_PartionGoods.CurrencyId = zc_Currency_Basis() THEN 1 WHEN COALESCE (tmpCurrency.Amount, 0) = 0 THEN 0 ELSE 1 END
                                            ELSE 0
                                       END) :: TFloat AS Sale_Summ_10200_curr

                                  --  � �/�
                                , ROW_NUMBER() OVER (PARTITION BY Object_PartionGoods.MovementItemId
                                                     ORDER BY CASE WHEN Object_PartionGoods.UnitId = COALESCE (MIConatiner.ObjectExtId_Analyzer, Object_PartionGoods.UnitId) THEN 0 ELSE 1 END ASC
                                                    ) AS Ord
                                                    

                           FROM Object_PartionGoods
                                LEFT JOIN MovementItemContainer AS MIConatiner
                                                                ON MIConatiner.PartionId = Object_PartionGoods.MovementItemId
                                                               AND (MIConatiner.OperDate BETWEEN inStartDate AND inEndDate
                                                                 OR inIsPeriodAll = TRUE)
                                LEFT JOIN tmpContainer ON tmpContainer.ContainerId = MIConatiner.ContainerId
                                
                                LEFT JOIN tmpCurrency  ON tmpCurrency.CurrencyFromId = zc_Currency_Basis()
                                                      AND tmpCurrency.CurrencyToId   = Object_PartionGoods.CurrencyId
                                                      AND MIConatiner.OperDate       >= tmpCurrency.StartDate
                                                      AND MIConatiner.OperDate       <  tmpCurrency.EndDate

                                LEFT JOIN MovementItemLinkObject AS MILinkObject_PartionMI
                                                                 ON MILinkObject_PartionMI.MovementItemId = MIConatiner.MovementItemId
                                                                AND MILinkObject_PartionMI.DescId         = zc_MILinkObject_PartionMI()
                                LEFT JOIN Object AS Object_PartionMI ON Object_PartionMI.Id = MILinkObject_PartionMI.ObjectId

                                INNER JOIN tmpUnit ON tmpUnit.UnitId = COALESCE (MIConatiner.ObjectExtId_Analyzer, Object_PartionGoods.UnitId)                              
                           WHERE (Object_PartionGoods.PartnerId  = inPartnerId        OR inPartnerId   = 0)
                             AND (Object_PartionGoods.BrandId    = inBrandId          OR inBrandId     = 0)
                             AND (Object_PartionGoods.PeriodId   = inPeriodId         OR inPeriodId    = 0)
                             AND (Object_PartionGoods.PeriodYear BETWEEN inStartYear AND inEndYear)
                             AND (MIConatiner.ContainerId        > 0                  )
                             AND (tmpContainer.ContainerId       > 0                  OR MIConatiner.PartionId IS NULL)
                             AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount())
                      
                           GROUP BY Object_PartionGoods.BrandId
                                  , Object_PartionGoods.PeriodId
                                  , Object_PartionGoods.PeriodYear
                                  , Object_PartionGoods.PartnerId
                                  , MIConatiner.ObjectExtId_Analyzer
                                  , Object_PartionGoods.UnitId
                                  , Object_PartionGoods.CurrencyId
                                  , Object_PartionGoods.Amount
                                  , Object_PartionGoods.MovementItemId

                            HAVING SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND COALESCE (MIConatiner.AnalyzerId, 0) =  zc_Enum_AnalyzerId_SaleSumm_10300() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN -1 * MIConatiner.Amount ELSE 0 END) <> 0
                                OR SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Summ()  AND COALESCE (MIConatiner.AnalyzerId, 0) <> zc_Enum_AnalyzerId_SaleSumm_10300() AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN -1 * MIConatiner.Amount ELSE 0 END) <> 0
                                  -- ���-��: ����
                                OR SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Count() THEN MIConatiner.Amount ELSE 0 END) <> 0
                                  -- ���-��: ������ �������
                                OR SUM (CASE WHEN MIConatiner.DescId = zc_MIContainer_Count() AND MIConatiner.Amount < 0 AND MIConatiner.MovementDescId IN (zc_Movement_Sale(), zc_Movement_GoodsAccount()) THEN -1 * MIConatiner.Amount ELSE 0 END) <> 0
                          )

       , tmpData AS (SELECT tmpData_all.BrandId
                          , tmpData_all.PeriodId
                          , tmpData_all.PeriodYear
                          , tmpData_all.PartnerId

                          , tmpData_all.UnitId
                          , tmpData_all.UnitId_in
                          , tmpData_all.CurrencyId

                          --, SUM (CASE WHEN tmpData_all.Ord = 1 THEN tmpData_all.Income_Amount ELSE 0 END) AS Income_Amount
                          --, SUM (CASE WHEN tmpData_all.Ord = 1 THEN tmpData_all.Income_Summ   ELSE 0 END) AS Income_Summ
                          , SUM (tmpData_all.Income_Amount )        AS Income_Amount
                          , SUM (tmpData_all.Income_Summ)           AS Income_Summ
                          
                          , SUM (tmpData_all.Debt_Amount)           AS Debt_Amount
                          , SUM (tmpData_all.Sale_Amount)           AS Sale_Amount
 
                            -- ����� �������
                          , SUM (tmpData_all.Sale_Summ)             AS Sale_Summ
                          , SUM (tmpData_all.Sale_Summ_curr)        AS Sale_Summ_curr
 
                            -- �\� �������
                          , SUM (tmpData_all.Sale_SummCost_calc)    AS Sale_SummCost_calc -- calc �� ������ � ���
                          , SUM (tmpData_all.Sale_SummCost)         AS Sale_SummCost      -- ���
                          , SUM (tmpData_all.Sale_SummCost_curr)    AS Sale_SummCost_curr -- ������
 
                          , SUM (tmpData_all.Sale_Summ_10100)       AS Sale_Summ_10100
                          , SUM (tmpData_all.Sale_Summ_10201)       AS Sale_Summ_10201
                          , SUM (tmpData_all.Sale_Summ_10202)       AS Sale_Summ_10202
                          , SUM (tmpData_all.Sale_Summ_10203)       AS Sale_Summ_10203
                          , SUM (tmpData_all.Sale_Summ_10204)       AS Sale_Summ_10204
 
                            -- ������ �����
                          , SUM (tmpData_all.Sale_Summ_10200)       AS Sale_Summ_10200
                          , SUM (tmpData_all.Sale_Summ_10200_curr)  AS Sale_Summ_10200_curr

                     FROM tmpData_all

                     GROUP BY tmpData_all.BrandId
                            , tmpData_all.PeriodId
                            , tmpData_all.PeriodYear
                            , tmpData_all.PartnerId
                            , tmpData_all.UnitId
                            , tmpData_all.UnitId_in
                            , tmpData_all.CurrencyId
                    )


        -- ���������
        SELECT Object_Brand.ValueData    :: TVarChar      AS BrandName
             , Object_Period.ValueData   :: TVarChar      AS PeriodName
             , tmpData.PeriodYear        :: Integer       AS PeriodYear
             , Object_Partner.Id                          AS PartnerId
             , Object_Partner.ValueData  :: TVarChar      AS PartnerName
             , Object_Unit.ValueData        :: TVarChar   AS UnitName

             , Object_Unit_In.ValueData     :: TVarChar  AS UnitName_In
             , Object_Currency.ValueData    :: TVarChar  AS CurrencyName
             
             , tmpData.Income_Amount        :: TFloat
                                            
             , tmpData.Debt_Amount          :: TFloat
             , tmpData.Sale_Amount          :: TFloat

               -- ����� �������
             , tmpData.Sale_Summ            :: TFloat
             , tmpData.Sale_Summ_curr       :: TFloat
                                            
               -- �\� �������
             , tmpData.Sale_SummCost_calc   :: TFloat AS Sale_SummCost      -- calc �� ������ � ���
             , tmpData.Sale_SummCost_curr   :: TFloat AS Sale_SummCost_curr -- ������

             , (tmpData.Sale_SummCost - tmpData.Sale_SummCost_calc) :: TFloat AS Sale_SummCost_diff
             , (tmpData.Sale_Summ     - tmpData.Sale_SummCost_calc) :: TFloat AS Sale_Summ_prof
             , (tmpData.Sale_Summ_curr- tmpData.Sale_SummCost_curr) :: TFloat AS Sale_Summ_prof_curr

             , tmpData.Sale_Summ_10100      :: TFloat
             , tmpData.Sale_Summ_10201      :: TFloat
             , tmpData.Sale_Summ_10202      :: TFloat
             , tmpData.Sale_Summ_10203      :: TFloat
             , tmpData.Sale_Summ_10204      :: TFloat

               -- ������ �����
             , tmpData.Sale_Summ_10200      :: TFloat
             , tmpData.Sale_Summ_10200_curr :: TFloat

               -- % ���-�� �������    / ���-�� ������
             , CASE WHEN tmpData.Sale_Amount > 0 AND tmpData.Income_Amount > 0
                         THEN tmpData.Sale_Amount / tmpData.Income_Amount * 100
                    ELSE 0
               END :: TFloat AS Tax_Amount

               -- % ����� �/� ������� / ����� �/� ������
             , CASE WHEN tmpData.Sale_SummCost_curr > 0 AND tmpData.Income_Summ > 0
                         THEN tmpData.Sale_SummCost_curr / tmpData.Income_Summ * 100
                    ELSE 0
               END :: TFloat AS Tax_Summ_curr

               -- % ����� �������     / ����� �/�
             , CASE WHEN tmpData.Sale_Summ_curr > 0 AND tmpData.Sale_SummCost_curr > 0
                         THEN tmpData.Sale_Summ_curr / tmpData.Sale_SummCost_curr * 100 - 100
                    ELSE 0
               END :: TFloat AS Tax_Summ_prof             

        FROM tmpData
            LEFT JOIN Object AS Object_Partner          ON Object_Partner.Id          = tmpData.PartnerId
            LEFT JOIN Object AS Object_Unit             ON Object_Unit.Id             = tmpData.UnitId
            LEFT JOIN Object AS Object_Unit_In          ON Object_Unit_In.Id          = tmpData.UnitId_in
            LEFT JOIN Object AS Object_Currency         ON Object_Currency.Id         = tmpData.CurrencyId
            LEFT JOIN Object AS Object_Brand            ON Object_Brand.Id            = tmpData.BrandId
            LEFT JOIN Object AS Object_Period           ON Object_Period.Id           = tmpData.PeriodId
          ;

     --������� ������ 50% �� �������
     OPEN Cursor1 FOR
     SELECT *
     FROM _tmpData
     WHERE Tax_Amount >= inPresent1 ;
     
     RETURN NEXT Cursor1;


     --������� ������ 20% ������ 50% �� �������
     OPEN Cursor2 FOR
     SELECT *
     FROM _tmpData
     WHERE Tax_Amount >= inPresent2 AND Tax_Amount < inPresent1;
     RETURN NEXT Cursor2;

     --������� ������ 20% �� �������
     OPEN Cursor3 FOR
     SELECT *
     FROM _tmpData
     WHERE Tax_Amount < inPresent2;
     RETURN NEXT Cursor3;

 END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.  ��������� �.�.
 26.07.18         *
*/

-- ����
-- SELECT * FROM gpReport_Sale_Analysis