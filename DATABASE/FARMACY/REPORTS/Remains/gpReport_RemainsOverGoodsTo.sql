-- Function: gpReport_RemainsOverGoods_To()

--DROP FUNCTION IF EXISTS gpReport_RemainsOverGoods_To (Integer, TDateTime, TFloat, TFloat, TFloat, Boolean, Boolean, Boolean, Boolean, Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpReport_RemainsOverGoods_To (Integer, TDateTime, TFloat, TFloat, TFloat, Boolean, Boolean, Boolean, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpReport_RemainsOverGoods_To(
    IN inUnitId           Integer  ,  -- �������������
    IN inStartDate        TDateTime,  -- ���� �������
    IN inPeriod           TFloat,     -- ���-�� ���� ��� ������� ���
    IN inDay              TFloat,     -- ��������� ����� ��� ��� � ����
    IN inAssortment       TFloat,     -- ���-�� ��� ������������
    IN inisMCS            Boolean,    -- ��� ������-����������� ������������ ��� �� �����������
    IN inisInMCS          Boolean,    -- ��� �����-����������� ������������ ��� �� �����������
    IN inisRecal          Boolean,    -- �� / ��� - "�������� ����������� ������ � ������ � �����"
    IN inisAssortment     Boolean,    -- �������� ���-�� ��� ������������ �� / ���
    --IN inisTo             Boolean,    -- ����������� "��" �������� ������������� �� ���� ����� (��/���) (� ��������� ������ � ���������� �������������)
    IN inSession          TVarChar    -- ������ ������������
)
RETURNS  SETOF refcursor
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbObjectId Integer;
   DECLARE Cursor1 refcursor;
   DECLARE Cursor2 refcursor;
   DECLARE Cursor3 refcursor;
   DECLARE Cursor4 refcursor;

   DECLARE vbMovementId Integer;
   DECLARE vbMovementItemId Integer;
   DECLARE vbMovementItemChildId Integer;
   
BEGIN

    -- �������� ���� ������������ �� ����� ���������
    -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Movement_Income());
    vbUserId:= lpGetUserBySession (inSession);

    -- ������
    inStartDate := DATE_TRUNC ('DAY', inStartDate);

    -- !!!������ �� ��� ������������ <�������� ����>!!!
    -- vbObjectId := lpGet_DefaultValue('zc_Object_Retail', vbUserId);
    -- !!!������ ��� - ������������ <�������� ����>!!!
    vbObjectId:= (SELECT ObjectLink_Juridical_Retail.ChildObjectId
                  FROM ObjectLink AS ObjectLink_Unit_Juridical
                       INNER JOIN ObjectLink AS ObjectLink_Juridical_Retail
                                             ON ObjectLink_Juridical_Retail.ObjectId = ObjectLink_Unit_Juridical.ChildObjectId
                                            AND ObjectLink_Juridical_Retail.DescId = zc_ObjectLink_Juridical_Retail()
                  WHERE ObjectLink_Unit_Juridical.ObjectId = inUnitId
                    AND ObjectLink_Unit_Juridical.DescId = zc_ObjectLink_Unit_Juridical()
                 );


    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    -- !!!�������� ����������� ������ � ������ � �����!!!
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    IF inisRecal = TRUE  -- inSession <> '3'
    THEN
    UPDATE  ObjectHistory set EndDate = coalesce (tmp.StartDate, zc_DateEnd())
    FROM (with tmp as (select ObjectHistory_Price.*
                            , Row_Number() OVER (PARTITION BY ObjectHistory_Price.ObjectId ORDER BY ObjectHistory_Price.StartDate Asc, ObjectHistory_Price.Id) AS Ord
                       from ObjectHistory AS ObjectHistory_Price
                       -- Where ObjectHistory_Price.DescId = zc_ObjectHistory_Price()
                      )
          select  tmp.Id, tmp.ObjectId, tmp.EndDate,  tmp2.StartDate, tmp2.Ord, ObjectHistoryDesc.Code
          from tmp
               left join tmp as tmp2 ON tmp2.ObjectId = tmp.ObjectId and tmp2.Ord = tmp.Ord + 1 and tmp2.DescId = tmp.DescId
               left join ObjectHistoryDesc ON ObjectHistoryDesc. Id = tmp.DescId
          where tmp.EndDate <> coalesce (tmp2.StartDate, zc_DateEnd())
          order by 3
         ) as tmp
    WHERE tmp.Id = ObjectHistory.Id;
    END IF;
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


    -- �������
    CREATE TEMP TABLE tmpGoods_list (GoodsId Integer, UnitId Integer, PriceId Integer, MCSValue TFloat, PRIMARY KEY (UnitId, GoodsId)) ON COMMIT DROP;
    CREATE TEMP TABLE tmpRemains_1 (GoodsId Integer, UnitId Integer, RemainsStart TFloat, ContainerId Integer, PRIMARY KEY (UnitId, GoodsId,ContainerId)) ON COMMIT DROP;
    CREATE TEMP TABLE tmpRemains (GoodsId Integer, UnitId Integer, RemainsStart TFloat, RemainsStart_save TFloat, MinExpirationDate TDateTime, PRIMARY KEY (UnitId, GoodsId)) ON COMMIT DROP;
    CREATE TEMP TABLE tmpMCS (GoodsId Integer, UnitId Integer, MCSValue TFloat, PRIMARY KEY (UnitId, GoodsId)) ON COMMIT DROP;
    CREATE TEMP TABLE tmpMIMaster (UnitId Integer, GoodsId Integer, Amount TFloat, Summa TFloat, InvNumber TVarChar, MovementId Integer, MIMaster_Id Integer, PRIMARY KEY (MovementId, MIMaster_Id, GoodsId, UnitId)) ON COMMIT DROP;
    CREATE TEMP TABLE tmpMIChild (UnitId Integer, GoodsId Integer, Amount TFloat, Summa TFloat, MIChild_Id Integer, PRIMARY KEY (MIChild_Id, UnitId,GoodsId)) ON COMMIT DROP;
    CREATE TEMP TABLE tmpUnit_list (UnitId Integer) ON COMMIT DROP;
    CREATE TEMP TABLE tmpSend (GoodsId Integer, UnitId Integer, Amount TFloat) ON COMMIT DROP;      
    CREATE TEMP TABLE tmpPrice (PriceId Integer, UnitId Integer, GoodsId Integer, MCSValue TFloat) ON COMMIT DROP;

    CREATE TEMP TABLE tmpMovOver (Id Integer, UnitId Integer) ON COMMIT DROP;

    CREATE TEMP TABLE tmpGoods (GoodsId Integer, UnitId Integer, MCSValue TFloat ) ON COMMIT DROP;

    -- ������� - ���������
    CREATE TEMP TABLE tmpData (GoodsId Integer, UnitId Integer, MCSValue TFloat
                             , Price TFloat, StartDate TDateTime, EndDate TDateTime, MinExpirationDate TDateTime
                             , RemainsStart TFloat, SummaRemainsStart TFloat
                             , RemainsMCS_from TFloat, SummaRemainsMCS_from TFloat
                             , RemainsMCS_to TFloat, SummaRemainsMCS_to TFloat
                             , AmountSend TFloat
                             , PRIMARY KEY (UnitId, GoodsId)
                              ) ON COMMIT DROP;
    -- ������� - ���������
    CREATE TEMP TABLE tmpDataTo (GoodsId Integer, UnitId Integer, Price TFloat, RemainsStart TFloat, MCSValue TFloat, RemainsMCS_result TFloat, PRIMARY KEY (UnitId, GoodsId)) ON COMMIT DROP;


       -- ���������� ������������� ��� �������������
       INSERT INTO tmpUnit_list (UnitId)
                           SELECT inUnitId  AS UnitId
                          UNION
                           SELECT ObjectBoolean_Over.ObjectId  AS UnitId
                           FROM ObjectBoolean AS ObjectBoolean_Over
                                   INNER JOIN ObjectLink AS ObjectLink_Unit_Juridical
                                                         ON ObjectLink_Unit_Juridical.ObjectId = ObjectBoolean_Over.ObjectId --Container.WhereObjectId
                                                        AND ObjectLink_Unit_Juridical.DescId = zc_ObjectLink_Unit_Juridical()
                                   INNER JOIN ObjectLink AS ObjectLink_Juridical_Retail
                                                         ON ObjectLink_Juridical_Retail.ObjectId = ObjectLink_Unit_Juridical.ChildObjectId
                                                        AND ObjectLink_Juridical_Retail.DescId = zc_ObjectLink_Juridical_Retail()
                                                        AND ObjectLink_Juridical_Retail.ChildObjectId = vbObjectId
                           WHERE ObjectBoolean_Over.DescId = zc_ObjectBoolean_Unit_Over()
                             AND ObjectBoolean_Over.ValueData = TRUE;

      -- ���� �� ��������� ������������� �������� (���� - ����, �������������) 
      INSERT INTO tmpMovOver (Id, UnitId) 
                      SELECT Movement.Id  
                           , MovementLinkObject_Unit.ObjectId AS UnitId
                      FROM Movement
                           LEFT JOIN MovementLinkObject AS MovementLinkObject_Unit
                                                         ON MovementLinkObject_Unit.MovementId = Movement.ID
                                                        AND MovementLinkObject_Unit.DescId = zc_MovementLinkObject_Unit()
                               --                         AND MovementLinkObject_Unit.ObjectId = inUnitId
                           INNER JOIN tmpUnit_list ON tmpUnit_list.UnitId = MovementLinkObject_Unit.ObjectId 
                                                  AND tmpUnit_list.UnitId <> inUnitId
                      WHERE Movement.OperDate = inStartDate
                        AND Movement.DescId = zc_Movement_Over()
                        AND Movement.StatusId <> zc_Enum_Status_Erased();


      -- ���� c����� ������� (���� - �� ���������, �����)
      INSERT INTO tmpMIMaster (UnitId, GoodsId, Amount, Summa, InvNumber, MovementId, MIMaster_Id)
         SELECT  tmpMovOver.UnitId
               , MovementItem.ObjectId             AS GoodsId
               , MovementItem.Amount               AS Amount
               , (MovementItem.Amount * COALESCE(MIFloat_Price.ValueData,0)) :: TFloat AS Summa
               , Movement.InvNumber
               , Movement.Id                       AS MovementId
               , MovementItem.Id                   AS MIMaster_Id
         FROM tmpMovOver
              LEFT JOIN Movement ON Movement.Id = tmpMovOver.Id
              LEFT JOIN MovementItem ON Movement.Id = MovementItem.MovementId
              LEFT JOIN MovementItemFloat AS MIFloat_Price
                                          ON MIFloat_Price.MovementItemId = MovementItem.Id
                                         AND MIFloat_Price.DescId = zc_MIFloat_Price()
         WHERE MovementItem.DescId = zc_MI_Master()
           AND MovementItem.isErased = FALSE;

      -- ���� c����� ������ (���� - �� ���������, �����)
      INSERT INTO tmpMIChild (UnitId, GoodsId, Amount, Summa, MIChild_Id)
      SELECT  MI_Child.ObjectId                 AS UnitId
            , tmpMIMaster.GoodsId               AS GoodsId
            , MI_Child.Amount                   AS Amount
            , (MI_Child.Amount * COALESCE(MIFloat_Price.ValueData,0)) :: TFloat AS Summa
            , MI_Child.Id                       AS MIChild_Id
      FROM tmpMIMaster
           INNER JOIN MovementItem AS MI_Child
                                   ON MI_Child.ParentId = tmpMIMaster.MIMaster_Id
                                  AND MI_Child.ObjectId = inUnitId
                                  AND MI_Child.DescId = zc_MI_Child()
                                  AND MI_Child.isErased = FALSE
           LEFT JOIN MovementItemFloat AS MIFloat_Price
                                       ON MIFloat_Price.MovementItemId =  MI_Child.Id
                                      AND MIFloat_Price.DescId = zc_MIFloat_Price()
          ;
------------------------------------------------

      -- Remains
       INSERT INTO tmpRemains_1 (GoodsId, UnitId, RemainsStart, ContainerId)
                              SELECT Container.Objectid      AS GoodsId
                                   , Container.WhereObjectId AS UnitId
                                   , Container.Amount - COALESCE (SUM (MIContainer.Amount), 0) AS RemainsStart
                                   , Container.Id  AS ContainerId
                              FROM tmpUnit_list
                                   INNER JOIN Container ON Container.WhereObjectId = tmpUnit_list.UnitId
                                                       AND Container.DescId = zc_Container_Count()
                                   LEFT JOIN MovementItemContainer AS MIContainer
                                                                   ON MIContainer.ContainerId = Container.Id
                                                                  AND MIContainer.OperDate >= inStartDate
                              GROUP BY Container.Id, Container.Objectid, Container.WhereObjectId, Container.Amount
                              HAVING  Container.Amount - COALESCE (SUM (MIContainer.Amount), 0) <> 0
                              ;

         -- ��������������� ������ / ������
         INSERT INTO tmpSend  (GoodsId, UnitId, Amount) 
                        SELECT MI_Send.ObjectId                 AS GoodsId
                             , MovementLinkObject_Unit.ObjectId AS UnitId
                             , SUM (CASE WHEN MovementLinkObject_Unit.DescId = zc_MovementLinkObject_From() AND MovementLinkObject_Unit.ObjectId = inUnitId
                                         THEN -1 * MI_Send.Amount
                                         WHEN MovementLinkObject_Unit.DescId = zc_MovementLinkObject_To() AND MovementLinkObject_Unit.ObjectId <> inUnitId
                                         THEN  1 * MI_Send.Amount
                                         ELSE 0
                                    END) ::TFloat  AS Amount--_From
                     
                        FROM Movement AS Movement_Send
                               INNER JOIN MovementBoolean AS MovementBoolean_isAuto
                                                          ON MovementBoolean_isAuto.MovementId = Movement_Send.Id
                                                         AND MovementBoolean_isAuto.DescId = zc_MovementBoolean_isAuto()
                                                         AND MovementBoolean_isAuto.ValueData = TRUE
                               LEFT JOIN MovementLinkObject AS MovementLinkObject_Unit
                                                            ON MovementLinkObject_Unit.MovementId = Movement_Send.Id
                                                           AND MovementLinkObject_Unit.DescId in (zc_MovementLinkObject_To(), zc_MovementLinkObject_From())
                               INNER JOIN tmpUnit_list ON tmpUnit_list.UnitId = MovementLinkObject_Unit.ObjectId
                               INNER JOIN MovementItem AS MI_Send
                                                       ON MI_Send.MovementId = Movement_Send.Id
                                                      AND MI_Send.DescId = zc_MI_Master()
                                                      AND MI_Send.isErased = FALSE
                        WHERE Movement_Send.OperDate >= inStartDate AND Movement_Send.OperDate < inStartDate + INTERVAL '1 DAY'
                          AND Movement_Send.DescId = zc_Movement_Send()
                          AND Movement_Send.StatusId IN (zc_Enum_Status_Complete(), zc_Enum_Status_UnComplete())
                        GROUP BY MI_Send.ObjectId 
                               , MovementLinkObject_Unit.ObjectId 
                        HAVING SUM (MI_Send.Amount) <> 0 
                       ;

       -- �������
       INSERT INTO tmpRemains (GoodsId, UnitId, RemainsStart, RemainsStart_save, MinExpirationDate)                              
                         WITH tmp AS
                        (SELECT tmp.GoodsId
                              , tmp.UnitId
                              , SUM (tmp.RemainsStart) AS RemainsStart
                              , Null    ::TDateTime AS MinExpirationDate -- ���� ��������
                          FROM tmpRemains_1 AS tmp 
                          --��������� ��� ���������� ��������� "�������" - ������ ������ ����� ��������
                          GROUP BY tmp.GoodsId, tmp.UnitId
                          HAVING  SUM (tmp.RemainsStart) <> 0
                         )
                         -- ���������        --
                         -- ���� ������� �������� ��� ������������ ��, ����� ������� � ������� ��� ���-�� 
                         SELECT tmp.GoodsId
                              , tmp.UnitId
                              --, tmp.RemainsStart + COALESCE (tmpSend.Amount, 0) AS RemainsStart
                              
                              , tmp.RemainsStart + COALESCE (tmpSend.Amount, 0)
                              - CASE WHEN inisAssortment = TRUE AND tmp.UnitId = inUnitId
                                          THEN inAssortment
                                     ELSE 0
                                END                                             AS RemainsStart
                              , tmp.RemainsStart                                AS RemainsStart_save
                              , tmp.MinExpirationDate
                         FROM tmp
                              LEFT JOIN tmpSend ON tmpSend.GoodsId = tmp.GoodsId AND tmpSend.UnitId = tmp.UnitId AND tmpSend.UnitId <> inUnitId
                        UNION
                         SELECT tmpSend.GoodsId
                              , tmpSend.UnitId
                              , COALESCE (tmpSend.Amount, 0)
                              - CASE WHEN inisAssortment = TRUE AND tmpSend.UnitId = inUnitId
                                     THEN inAssortment 
                                     ELSE 0
                                END                          AS RemainsStart
                              , 0                            AS RemainsStart_save
                              , NULL                         AS MinExpirationDate
                         FROM tmpSend
                              LEFT JOIN tmp ON tmp.GoodsId = tmpSend.GoodsId AND tmp.UnitId = tmpSend.UnitId
                         WHERE tmpSend.UnitId <> inUnitId
                           AND tmp.GoodsId IS NULL
                        ;

       -- MCS
       IF (inisMCS = FALSE AND inisInMCS = FALSE) OR (inisMCS = FALSE AND inisInMCS = TRUE)
          THEN 
              INSERT INTO tmpMCS (GoodsId, UnitId, MCSValue)
                   WITH 
                   tmp AS (SELECT tmp.GoodsId
                                , tmp.UnitId
                                , tmp.MCSValue
                           FROM gpSelect_RecalcMCS (-1 * inUnitId, 0, inPeriod::Integer, inDay::Integer, inStartDate, inSession) AS tmp
                           WHERE tmp.MCSValue > 0
                           )
                   SELECT tmp.GoodsId
                        , tmp.UnitId
                        , tmp.MCSValue
                   FROM tmpUnit_list
                        JOIN tmp ON tmp.UnitId = tmpUnit_list.UnitId;
       ELSEIF inisMCS = TRUE AND inisInMCS = FALSE
          THEN 
              INSERT INTO tmpMCS (GoodsId, UnitId, MCSValue)
                   SELECT tmp.GoodsId
                        , tmp.UnitId
                        , tmp.MCSValue
                   FROM gpSelect_RecalcMCS (inUnitId, 0, inPeriod::Integer, inDay::Integer, inStartDate, inSession) AS tmp
                   WHERE tmp.MCSValue > 0
;
       END IF;
       

       -- tmpPrice
       INSERT INTO tmpPrice (PriceId, UnitId, GoodsId, MCSValue)   
                    SELECT ObjectLink_Price_Unit.ObjectId           AS PriceId
                         , ObjectLink_Price_Unit.ChildObjectId      AS UnitId
                         , Price_Goods.ChildObjectId                AS GoodsId
                         , COALESCE(MCS_Value.ValueData,0) ::Tfloat AS MCSValue 
                    FROM tmpUnit_list
                       LEFT JOIN ObjectLink AS ObjectLink_Price_Unit
                                            ON ObjectLink_Price_Unit.ChildObjectId = tmpUnit_list.UnitId
                                           AND ObjectLink_Price_Unit.DescId = zc_ObjectLink_Price_Unit()  
                       LEFT JOIN ObjectLink AS Price_Goods
                                            ON Price_Goods.ObjectId = ObjectLink_Price_Unit.ObjectId
                                           AND Price_Goods.DescId = zc_ObjectLink_Price_Goods()
                       LEFT JOIN ObjectFloat AS MCS_Value
                                             ON MCS_Value.ObjectId = ObjectLink_Price_Unit.ObjectId
                                            AND MCS_Value.DescId = zc_ObjectFloat_Price_MCSValue();

       -- Goods_list
       INSERT INTO tmpGoods_list (GoodsId, UnitId, PriceId, MCSValue)
               SELECT tmpRemains.GoodsId, tmpRemains.UnitId, 0 AS PriceId, 0 :: TFloat AS MCSValue 
               FROM tmpRemains
              UNION 
               SELECT tmpPrice.GoodsId, tmpPrice.UnitId, 0 AS PriceId, 0 :: TFloat AS MCSValue 
               FROM tmpPrice
               WHERE tmpPrice.MCSValue <> 0 AND inisMCS = TRUE
              UNION
               SELECT tmpMCS.GoodsId, tmpMCS.UnitId, 0 AS PriceId, 0 :: TFloat AS MCSValue 
               FROM tmpMCS
               WHERE inisMCS = FALSE
        ;


       -- Goods_list - PriceId
     /*  UPDATE tmpGoods_list SET PriceId = Price_Goods.ObjectId
       FROM ObjectLink AS Price_Goods, ObjectLink AS Price_Unit
       WHERE Price_Goods.ChildObjectId = tmpGoods_list.GoodsId
         AND Price_Goods.DescId        = zc_ObjectLink_Price_Goods()
         AND Price_Unit.ObjectId       = Price_Goods.ObjectId
         AND Price_Unit.ChildObjectId  = tmpGoods_list.UnitId
         AND Price_Unit.DescId         = zc_ObjectLink_Price_Unit();
*/
       UPDATE tmpGoods_list SET PriceId = tmpPrice.PriceId
       FROM tmpPrice
       WHERE tmpPrice.GoodsId = tmpGoods_list.GoodsId
         AND tmpPrice.UnitId = tmpGoods_list.UnitId;


         -- Goods_list - MCSValue
       UPDATE tmpGoods_list
              SET MCSValue = CASE WHEN (inisMCS = TRUE AND tmpGoods_list.UnitId <> inUnitId) THEN COALESCE (tmpPrice.MCSValue, 0)
                                  WHEN (inisInMCS = TRUE AND tmpGoods_list.UnitId = inUnitId) THEN COALESCE (tmpPrice.MCSValue, 0)
                                  ELSE COALESCE (tmpMCS.MCSValue, 0)
                             END
       FROM tmpGoods_list AS tmp
           LEFT JOIN tmpPrice ON tmpPrice.PriceId = tmp.PriceId
                             AND tmpPrice.UnitId  = tmp.UnitId
                             AND tmpPrice.GoodsId = tmp.GoodsId
           LEFT JOIN tmpMCS ON tmpMCS.UnitId = tmp.UnitId
                           AND tmpMCS.GoodsId = tmp.GoodsId
       WHERE tmp.PriceId = tmpGoods_list.PriceId
         AND tmp.UnitId  = tmpGoods_list.UnitId
         AND tmp.GoodsId = tmpGoods_list.GoodsId;
            

        -- Result
        INSERT INTO tmpData  (GoodsId, UnitId, MCSValue 
                            , Price, StartDate, EndDate, MinExpirationDate
                            , RemainsStart, SummaRemainsStart
                            , RemainsMCS_from, SummaRemainsMCS_from
                            , RemainsMCS_to, SummaRemainsMCS_to
                            , AmountSend
                             )
             WITH tmpOverSettings AS (SELECT *
                                      FROM gpSelect_Object_OverSettings (inSession) AS tmp
                                      WHERE tmp.isErased = FALSE AND tmp.MinPrice <> tmp.MinPriceEnd
                                     )
             -- ���������
             SELECT
                 tmpGoods_list.GoodsId
               , tmpGoods_list.UnitId
               , tmpGoods_list.MCSValue

               , COALESCE (ObjectHistoryFloat_Price.ValueData, 0)  AS Price
               , COALESCE (ObjectHistory_Price.StartDate, NULL)    AS StartDate
               , COALESCE (ObjectHistory_Price.EndDate, NULL)      AS EndDate
               , Object_Remains.MinExpirationDate

               , Object_Remains.RemainsStart_save                       AS RemainsStart
               , (Object_Remains.RemainsStart_save * COALESCE (ObjectHistoryFloat_Price.ValueData, 0)) AS SummaRemainsStart
               
                 -- �������
               , CASE WHEN ObjectBoolean_Goods_Close.ValueData = TRUE
                           THEN 0
                      WHEN Object_Remains.RemainsStart > tmpGoods_list.MCSValue AND tmpGoods_list.MCSValue >= 0
                           THEN FLOOR ((Object_Remains.RemainsStart - tmpGoods_list.MCSValue) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                                --*** ((Object_Remains.RemainsStart - tmpGoods_list.MCSValue) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                              * COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1))
                      ELSE 0
                 END AS RemainsMCS_from
               , CASE WHEN ObjectBoolean_Goods_Close.ValueData = TRUE
                           THEN 0
                      WHEN Object_Remains.RemainsStart > tmpGoods_list.MCSValue AND tmpGoods_list.MCSValue >= 0
                          THEN FLOOR ((Object_Remains.RemainsStart - tmpGoods_list.MCSValue) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                               --*** ((Object_Remains.RemainsStart - tmpGoods_list.MCSValue) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                             * COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1))
                             * COALESCE (ObjectHistoryFloat_Price.ValueData, 0)
                      ELSE 0
                 END AS SummaRemainsMCS_from

                 -- �� �������
               , CASE WHEN ObjectBoolean_Goods_Close.ValueData = TRUE
                           THEN 0
                      WHEN COALESCE (Object_Remains.RemainsStart, 0) < tmpGoods_list.MCSValue AND tmpGoods_list.MCSValue > 0
                           THEN CEIL ((tmpGoods_list.MCSValue - COALESCE (Object_Remains.RemainsStart, 0)) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                                --***((tmpGoods_list.MCSValue - COALESCE (Object_Remains.RemainsStart, 0)) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                              * COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1))
                      ELSE 0
                 END AS RemainsMCS_to
               , CASE WHEN ObjectBoolean_Goods_Close.ValueData = TRUE
                           THEN 0
                      WHEN COALESCE (Object_Remains.RemainsStart, 0) < tmpGoods_list.MCSValue AND tmpGoods_list.MCSValue > 0
                           THEN CEIL ((tmpGoods_list.MCSValue - COALESCE (Object_Remains.RemainsStart, 0)) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                                --***((tmpGoods_list.MCSValue - COALESCE (Object_Remains.RemainsStart, 0)) / COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1)))
                              * COALESCE (tmpOverSettings.MinimumLot, COALESCE (tmpOverSettings_all.MinimumLot, 1))
                              * COALESCE (ObjectHistoryFloat_Price.ValueData, 0)
                      ELSE 0
                 END AS SummaRemainsMCS_to

               , Object_Send.Amount   AS AmountSend
--               , Object_Send.Amount_To     AS AmountSend_To

            FROM tmpGoods_list
                LEFT JOIN tmpRemains AS Object_Remains
                                     ON Object_Remains.GoodsId = tmpGoods_list.GoodsId
                                    AND Object_Remains.UnitId  = tmpGoods_list.UnitId
                LEFT JOIN tmpSend AS Object_Send
                                  ON Object_Send.GoodsId = tmpGoods_list.GoodsId
                                 AND Object_Send.UnitId  = tmpGoods_list.UnitId

                LEFT JOIN ObjectBoolean AS ObjectBoolean_Goods_Close
                                        ON ObjectBoolean_Goods_Close.ObjectId = tmpGoods_list.GoodsId
                                       AND ObjectBoolean_Goods_Close.DescId = zc_ObjectBoolean_Goods_Close() 

                -- �������� �������� ���� � ��� �� ������� �������� �� ������ ���                                                          
                LEFT JOIN ObjectHistory AS ObjectHistory_Price
                                        ON ObjectHistory_Price.ObjectId = tmpGoods_list.PriceId
                                       AND ObjectHistory_Price.DescId = zc_ObjectHistory_Price()
                                       AND inStartDate >= ObjectHistory_Price.StartDate AND inStartDate < ObjectHistory_Price.EndDate
                LEFT JOIN ObjectHistoryFloat AS ObjectHistoryFloat_Price
                                             ON ObjectHistoryFloat_Price.ObjectHistoryId = ObjectHistory_Price.Id
                                            AND ObjectHistoryFloat_Price.DescId = zc_ObjectHistoryFloat_Price_Value()

                LEFT JOIN tmpOverSettings ON tmpOverSettings.UnitId = tmpGoods_list.UnitId
                                         AND COALESCE (ObjectHistoryFloat_Price.ValueData, 0) >= tmpOverSettings.MinPrice
                                         AND COALESCE (ObjectHistoryFloat_Price.ValueData, 0) < tmpOverSettings.MinPriceEnd
                LEFT JOIN tmpOverSettings AS tmpOverSettings_all
                                          ON tmpOverSettings_all.UnitId = 0
                                         AND COALESCE (ObjectHistoryFloat_Price.ValueData, 0) >= tmpOverSettings_all.MinPrice
                                         AND COALESCE (ObjectHistoryFloat_Price.ValueData, 0) < tmpOverSettings_all.MinPriceEnd
                                         AND tmpOverSettings.UnitId IS NULL
            ;

     -- !!!ResultTO!!!
  WITH tmpDataFrom AS (SELECT UnitId, GoodsId, RemainsMCS_from -- ���������� "��������" 
                       FROM tmpData
                       WHERE UnitId <> inUnitId AND RemainsMCS_from > 0
                      )
       , tmpDataTo AS (SELECT UnitId, GoodsId, RemainsMCS_to -- ���������� "�� �������"
                            , Price, RemainsStart , MCSValue
                       FROM tmpData
                       WHERE UnitId = inUnitId AND RemainsMCS_to > 0
                      )
      , tmpDataAll AS (SELECT tmpDataFrom.UnitId
                            , tmpDataTo.GoodsId
                            , tmpDataTo.Price
                            , tmpDataTo.RemainsStart
                            , tmpDataTo.MCSValue
                            , tmpDataTo.RemainsMCS_to
                            , tmpDataFrom.RemainsMCS_from
                              -- "�������������" ����� "�� �������" = ��� ���������� + ������� ������ , !!!����������� ���������� ����������� � � �/�!!!
                            , SUM (tmpDataFrom.RemainsMCS_from) OVER (PARTITION BY tmpDataTo.GoodsId ORDER BY tmpDataFrom.RemainsMCS_from DESC, tmpDataFrom.UnitId DESC) AS RemainsMCS_period
                              -- � �/�, �������� � ������������� ���������� /*"�� �������"*/ ������� 
                            , ROW_NUMBER() OVER (PARTITION BY tmpDataTo.GoodsId ORDER BY tmpDataFrom.RemainsMCS_from DESC, tmpDataFrom.UnitId DESC) AS Ord
                       FROM tmpDataTo
                            INNER JOIN tmpDataFrom ON tmpDataTo.GoodsId = tmpDataFrom.GoodsId
                      )
   INSERT INTO tmpDataTo (GoodsId, UnitId, Price, RemainsStart, MCSValue, RemainsMCS_result)

   SELECT tmpDataAll.GoodsId
        , tmpDataAll.UnitId
        , tmpDataAll.Price
        , tmpDataAll.RemainsStart
        , tmpDataAll.MCSValue
        /*, tmpDataAll.RemainsMCS_from
        , tmpDataAll.RemainsMCS_to
        , tmpDataAll.RemainsMCS_period
        , tmpDataAll.Ord*/
        , CASE -- ��� ������� - ����������� ������ "�� �������"
               WHEN Ord = 1 THEN CASE WHEN RemainsMCS_to <= RemainsMCS_from THEN RemainsMCS_to ELSE RemainsMCS_from END
               -- ��� ��������� - ����������� "�������������" ����� "�� �������" !!!�����!!! �� ��� � ������� ������
               WHEN RemainsMCS_from - (RemainsMCS_period - RemainsMCS_to) > 0 -- ������� �������� "��������" ���� ���� ���������� ��� ������������
                    THEN CASE -- ���� "�� �������" ������ ������� �������� "��������"
                              WHEN RemainsMCS_to <= RemainsMCS_from - (RemainsMCS_period - RemainsMCS_to)
                                   THEN RemainsMCS_to
                              ELSE -- ����� ������� "��������"
                                   CASE WHEN RemainsMCS_period - RemainsMCS_to > 0 THEN RemainsMCS_period - RemainsMCS_to ELSE RemainsMCS_from END
                                    --RemainsMCS_from --RemainsMCS_from - (RemainsMCS_period - RemainsMCS_to)
                         END
               ELSE 0
          END AS RemainsMCS_result
   FROM tmpDataAll
   WHERE  CASE -- ��� ������� - ����������� ������ "�� �������"
               WHEN Ord = 1 THEN CASE WHEN RemainsMCS_to <= RemainsMCS_from THEN RemainsMCS_to ELSE RemainsMCS_from END
               -- ��� ��������� - ����������� "�������������" ����� "�� �������" !!!�����!!! �� ��� � ������� ������
               WHEN RemainsMCS_from - (RemainsMCS_period - RemainsMCS_to) > 0 -- ������� �������� "��������" ���� ���� ���������� ��� ������������
                    THEN CASE -- ���� "�� �������" ������ ������� �������� "��������"
                              WHEN RemainsMCS_to <= RemainsMCS_from - (RemainsMCS_period - RemainsMCS_to)
                                   THEN RemainsMCS_to
                              ELSE -- ����� ������� "��������"
                                   CASE WHEN RemainsMCS_period - RemainsMCS_to > 0 THEN RemainsMCS_period - RemainsMCS_to ELSE RemainsMCS_from END
                                    --RemainsMCS_period - RemainsMCS_to--RemainsMCS_from --RemainsMCS_from - (RemainsMCS_period - RemainsMCS_to)
                         END
               ELSE 0
          END <> 0 ;

      
--  RAISE EXCEPTION '<%>  <%>  <%>  <%>', (select Count (*) from tmpGoods_list), (select Count (*) from tmpDataTo), (select Count (*) from tmpData where UnitId = inUnitId), (select Count (*) from tmpData where UnitId <> inUnitId);


     OPEN Cursor1 FOR
   
     WITH tmpDataTo AS (SELECT tmpDataTo.GoodsId
                             , SUM (tmpDataTo.RemainsMCS_result) AS RemainsMCS_result
                        FROM tmpDataTo
                        GROUP BY tmpDataTo.GoodsId
                       )
                      
       SELECT    tmpData.GoodsId
               , Object_Goods.ObjectCode AS GoodsCode
               , Object_Goods.ValueData                       AS GoodsName
               , Object_Goods.isErased                        AS isErased
               , Object_Measure.ValueData                     AS MeasureName
               , tmpData.MCSValue
               , (tmpData.MCSValue * tmpData.Price) :: TFloat AS SummaMCSValue

               , tmpData.StartDate
               , tmpData.EndDate
               , tmpData.Price
               , tmpDataFrom.Price  :: TFloat  AS PriceFrom 

               , tmpData.RemainsStart
               , tmpData.SummaRemainsStart
               , tmpData.RemainsMCS_from
               , tmpData.SummaRemainsMCS_from
               , tmpData.RemainsMCS_to
               , tmpData.SummaRemainsMCS_to

               , tmpDataTo.RemainsMCS_result
               , (tmpDataTo.RemainsMCS_result * tmpData.Price) :: TFloat AS SummaRemainsMCS_result
               , tmpData.MinExpirationDate

               , tmpMIChild.MIChild_Id                      AS MIChild_Id_Over
               , COALESCE (tmpMIChild.Amount, 0) :: TFloat  AS Amount_Over
               , COALESCE (tmpMIChild.Summa, 0)  :: TFloat  AS Summa_Over
               , (COALESCE (tmpDataTo.RemainsMCS_result, 0) - COALESCE (tmpMIChild.Amount, 0)) :: TFloat AS Amount_OverDiff
               , tmpData.AmountSend            :: TFloat    AS AmountSend

             --  , CASE WHEN COALESCE (tmpMIChild.Amount, 0) > tmpData.RemainsStart THEN TRUE ELSE FALSE END ::Boolean AS isError

     FROM tmpData
          LEFT JOIN Object AS Object_Unit  ON Object_Unit.Id = tmpData.UnitId
          LEFT JOIN Object AS Object_Goods  ON Object_Goods.Id = tmpData.GoodsId
          LEFT JOIN tmpDataTo ON tmpDataTo.GoodsId = tmpData.GoodsId --AND tmpDataTo.UnitId = inUnitId--tmpData.UnitId
          LEFT JOIN tmpData AS tmpDataFrom ON tmpDataFrom.GoodsId = tmpData.GoodsId AND tmpDataFrom.UnitId = tmpData.UnitId --inUnitId

          LEFT JOIN tmpMIChild ON tmpMIChild.GoodsId = tmpData.GoodsId
                            --  AND tmpMIChild.UnitId = tmpData.UnitId

          LEFT JOIN ObjectLink AS ObjectLink_Goods_Measure
                               ON ObjectLink_Goods_Measure.ObjectId = tmpData.GoodsId
                              AND ObjectLink_Goods_Measure.DescId = zc_ObjectLink_Goods_Measure()
          LEFT JOIN Object AS Object_Measure ON Object_Measure.Id = ObjectLink_Goods_Measure.ChildObjectId 

     WHERE tmpData.UnitId = inUnitId
 --      AND tmpDataTo.RemainsMCS_result > 0;
 --RAISE EXCEPTION '������.RemainsMCS_result'
; 
     RETURN NEXT Cursor1;


    -- ��������� 2

     OPEN Cursor2 FOR

     WITH tmpChild AS (SELECT tmpData.GoodsId
                            , SUM (tmpData.RemainsMCS_from) AS RemainsMCS_from, SUM (tmpData.SummaRemainsMCS_from) AS SummaRemainsMCS_from
                            , SUM (tmpData.RemainsMCS_to)   AS RemainsMCS_to,   SUM (tmpData.SummaRemainsMCS_to)   AS SummaRemainsMCS_to
                            , SUM (tmpData.MCSValue)                 AS MCSValue
                            , SUM (tmpData.MCSValue * tmpData.Price) AS SummaMCSValue
                       FROM tmpData
                       WHERE tmpData.UnitId = inUnitId
                       GROUP BY tmpData.GoodsId
                      )
     /* , tmpChildTo AS (SELECT tmpDataTo.GoodsId
                            , SUM (tmpDataTo.RemainsMCS_result) AS RemainsMCS_result
                       FROM tmpDataTo
                       GROUP BY tmpDataTo.GoodsId
                      )*/

          SELECT Object_Unit.Id        AS UnitId
               , Object_Unit.ValueDAta AS UnitName
               , tmpData.StartDate
               , tmpData.EndDate
               , tmpData.Price

               , tmpData.MCSValue
               , (tmpData.MCSValue * tmpData.Price) :: TFloat AS SummaMCSValue

               , tmpData.RemainsStart
               , tmpData.SummaRemainsStart
               , tmpData.RemainsMCS_from
               , tmpData.SummaRemainsMCS_from
               , tmpData.RemainsMCS_to
               , tmpData.SummaRemainsMCS_to

               , tmpChild.MCSValue             :: TFloat  AS MCSValue_Child
               , tmpChild.SummaMCSValue        :: TFloat  AS SummaMCSValue_Child
               , tmpChild.RemainsMCS_from      :: TFloat  AS RemainsMCS_from_Child
               , tmpChild.SummaRemainsMCS_from :: TFloat  AS SummaRemainsMCS_from_Child
               , tmpChild.RemainsMCS_to        :: TFloat  AS RemainsMCS_to_Child
               , tmpChild.SummaRemainsMCS_to   :: TFloat  AS SummaRemainsMCS_to_Child
               
               , tmpChildTo.RemainsMCS_result                   :: TFloat AS RemainsMCS_result
               , (tmpChildTo.RemainsMCS_result * tmpData.Price) :: TFloat AS SummaRemainsMCS_result

               , tmpData.AmountSend            :: TFloat  AS AmountSend
 
               , tmpData.GoodsId
               --, Object_Goods.ObjectCode                      AS GoodsCode

               , tmpMIMaster.InvNumber                        AS InvNumber_Over
               , tmpMIMaster.MovementId                       AS MovementId_Over
               , tmpMIMaster.MIMaster_Id                      AS MIMaster_Id_Over
               , COALESCE (tmpMIMaster.Amount, 0) :: TFloat   AS Amount_Over
               , COALESCE (tmpMIMaster.Summa, 0)  :: TFloat   AS Summa_Over
               , (COALESCE (tmpChildTo.RemainsMCS_result, 0) - COALESCE (tmpMIMaster.Amount, 0)) :: TFloat AS Amount_OverDiff
               
               , CASE WHEN COALESCE (tmpMIMaster.Amount, 0) > tmpData.RemainsStart THEN TRUE ELSE FALSE END ::Boolean AS isError
             
     FROM tmpData
                LEFT JOIN Object AS Object_Unit  ON Object_Unit.Id = tmpData.UnitId
                --LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = tmpData.GoodsId

                LEFT JOIN tmpChild ON tmpChild.GoodsId = tmpData.GoodsId
                LEFT JOIN tmpDataTo AS tmpChildTo ON tmpChildTo.GoodsId = tmpData.GoodsId AND tmpChildTo.UnitId = tmpData.UnitId

                LEFT JOIN tmpMIMaster ON tmpMIMaster.GoodsId = tmpData.GoodsId
                                     AND tmpMIMaster.UnitId = tmpData.UnitId
     WHERE tmpData.UnitId <> inUnitId;


     RETURN NEXT Cursor2;

     -- ��������� 3
     -- !!! !!!
     OPEN Cursor3 FOR
     WITH tmpChild AS (SELECT tmpData.GoodsId
                            , SUM (tmpData.RemainsMCS_from) AS RemainsMCS_from, SUM (tmpData.SummaRemainsMCS_from) AS SummaRemainsMCS_from
                            , SUM (tmpData.RemainsMCS_to)   AS RemainsMCS_to,   SUM (tmpData.SummaRemainsMCS_to)   AS SummaRemainsMCS_to
                            , SUM (tmpData.MCSValue)                 AS MCSValue
                            , SUM (tmpData.MCSValue * tmpData.Price) AS SummaMCSValue
                       FROM tmpData
                       WHERE tmpData.UnitId = inUnitId
                       GROUP BY tmpData.GoodsId
                      )

          SELECT tmpData.UnitId            AS UnitId
               -- Object_Unit.Id         AS UnitId
               --, Object_Unit.ValueDAta AS UnitName
               , tmpData.Price             AS PriceFrom
               , tmpChildTo.Price          AS PriceTo

               , tmpData.MCSValue          AS MCSValueFrom
               , tmpChildTo.MCSValue       AS MCSValueTo
               , (tmpData.MCSValue * tmpData.Price) :: TFloat AS SummaMCSValue

               , tmpData.RemainsStart      AS RemainsStartFrom
               , tmpChildTo.RemainsStart   AS RemainsStartTo
               , tmpData.SummaRemainsStart
               , tmpData.RemainsMCS_from
               , tmpData.SummaRemainsMCS_from
               , tmpData.RemainsMCS_to
               , tmpData.SummaRemainsMCS_to

               , tmpChild.MCSValue             :: TFloat  AS MCSValue_Child
               , tmpChild.SummaMCSValue        :: TFloat  AS SummaMCSValue_Child
               , tmpChild.RemainsMCS_from      :: TFloat  AS RemainsMCS_from_Child
               , tmpChild.SummaRemainsMCS_from :: TFloat  AS SummaRemainsMCS_from_Child
               , tmpChild.RemainsMCS_to        :: TFloat  AS RemainsMCS_to_Child
               , tmpChild.SummaRemainsMCS_to   :: TFloat  AS SummaRemainsMCS_to_Child
               
               , tmpChildTo.RemainsMCS_result                   :: TFloat AS RemainsMCS_result
               , (tmpChildTo.RemainsMCS_result * tmpData.Price) :: TFloat AS SummaRemainsMCS_result

               , tmpData.AmountSend            :: TFloat  AS AmountSend
 
               , tmpData.GoodsId
               --, Object_Goods.ObjectCode AS GoodsCode
               --, Object_Goods.ValueData                       AS GoodsName
               
               , tmpMIMaster.InvNumber                        AS InvNumber_Over
               , tmpMIMaster.MovementId                       AS MovementId_Over
               , tmpMIMaster.MIMaster_Id                      AS MIMaster_Id_Over
               , COALESCE (tmpMIMaster.Amount, 0) :: TFloat   AS Amount_Over
               , COALESCE (tmpMIMaster.Summa, 0)  :: TFloat   AS Summa_Over
     FROM tmpData
                --LEFT JOIN Object AS Object_Unit  ON Object_Unit.Id = tmpData.UnitId
                LEFT JOIN tmpChild ON tmpChild.GoodsId = tmpData.GoodsId
                LEFT JOIN tmpDataTo AS tmpChildTo ON tmpChildTo.GoodsId = tmpData.GoodsId AND tmpChildTo.UnitId = tmpData.UnitId
                --LEFT JOIN Object AS Object_Goods  ON Object_Goods.Id = tmpData.GoodsId
                --LEFT JOIN tmpData AS tmpDataTo ON tmpDataTo.GoodsId = tmpData.GoodsId AND tmpDataTo.UnitId = inUnitId

                LEFT JOIN tmpMIMaster ON tmpMIMaster.GoodsId = tmpData.GoodsId
                                     AND tmpMIMaster.UnitId = tmpData.UnitId
     WHERE tmpData.UnitId <> inUnitId
       AND tmpChildTo.RemainsMCS_result > 0
    ;

     RETURN NEXT Cursor3;

     -- ��������� 4 �����
     -- !!!��������� Cursor2!!!
     OPEN Cursor4 FOR
      SELECT     Object_Unit.Id        AS UnitId
               , Object_Unit.ValueDAta AS UnitName 
               , SUM(tmpData.MCSValue)  :: TFloat  AS MCSValue
               , SUM(tmpData.MCSValue * tmpData.Price) :: TFloat AS SummaMCSValue

               , SUM(tmpData.RemainsStart) :: TFloat  AS  RemainsStart
               , SUM(tmpData.SummaRemainsStart) :: TFloat  AS SummaRemainsStart
               , SUM(tmpData.RemainsMCS_from) :: TFloat  AS RemainsMCS_from
               , SUM(tmpData.SummaRemainsMCS_from) :: TFloat  AS SummaRemainsMCS_from
               , SUM(tmpData.RemainsMCS_to) :: TFloat  AS RemainsMCS_to
               , SUM(tmpData.SummaRemainsMCS_to) :: TFloat  AS SummaRemainsMCS_to

               , SUM(tmpDataTo.RemainsMCS_result ) :: TFloat AS RemainsMCS_result
               , SUM(tmpDataTo.RemainsMCS_result * tmpData.Price) :: TFloat AS SummaRemainsMCS_result

               , SUM(COALESCE (tmpMIMaster.Amount, 0)) :: TFloat  AS Amount_Over
               , SUM(COALESCE (tmpMIMaster.Summa, 0))  :: TFloat  AS Summa_Over
               , SUM(COALESCE (tmpDataTo.RemainsMCS_result, 0) - COALESCE (tmpMIMaster.Amount, 0)) :: TFloat AS Amount_OverDiff

               , (CASE WHEN SUM(COALESCE(tmpData.SummaRemainsStart,0)) <> 0 THEN (SUM(tmpData.SummaRemainsMCS_to) * 100 / SUM(tmpData.SummaRemainsStart)) ELSE  0 END) :: TFloat  AS Rersent_to
               , (CASE WHEN SUM(COALESCE(tmpData.SummaRemainsStart,0)) <> 0 THEN (SUM(tmpData.SummaRemainsMCS_from) * 100 / SUM(tmpData.SummaRemainsStart)) ELSE  0 END)  :: TFloat  AS Rersent_from
     FROM tmpData
          LEFT JOIN Object AS Object_Unit  ON Object_Unit.Id = tmpData.UnitId
          LEFT JOIN tmpDataTo ON tmpDataTo.GoodsId = tmpData.GoodsId AND tmpDataTo.UnitId = tmpData.UnitId
          LEFT JOIN tmpData AS tmpDataFrom ON tmpDataFrom.GoodsId = tmpData.GoodsId AND tmpDataFrom.UnitId = tmpData.UnitId

          /*LEFT JOIN tmpMIChild ON tmpMIChild.GoodsId = tmpData.GoodsId
                              AND tmpMIChild.UnitId = inUnitId*/

          LEFT JOIN tmpMIMaster ON tmpMIMaster.GoodsId = tmpData.GoodsId
                               AND tmpMIMaster.UnitId = tmpData.UnitId

     /*WHERE tmpData.UnitId <> inUnitId
       AND tmpDataTo.RemainsMCS_result > 0 */   
     GROUP BY Object_Unit.Id, Object_Unit.ValueDAta 

       ;
       
     RETURN NEXT Cursor4;
  
END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�. 
 27.02.17         * 
*/

-- ����
--SELECT * FROM gpReport_RemainsOverGoods_To (inUnitId:= 183292, inStartDate:= '12.01.2017' ::TDateTime, inPeriod:= 30::tfloat, inDay:= 28::tfloat,inAssortment:=1::tfloat, inisAssortment:=False, inSession:= '3'::TVarChar);  -- ������_1 ��_������_6


--SELECT * FROM gpReport_RemainsOverGoods_To(inUnitId := 183288 , inStartDate := ('23.02.2017')::TDateTime , inPeriod := 30 , inDay := 30 , inAssortment := 1 , inisMCS := 'False' , inisInMCS := 'True' , inisRecal := 'False' , inisAssortment := 'False' ,  inSession := '3')

