-- Function: gpReport_JuridicalCollation()

DROP FUNCTION IF EXISTS gpGet_DefaultReportParams (TVarChar);
DROP FUNCTION IF EXISTS gpGet_DefaultReportParams (TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_DefaultReportParams(
    IN inReportName       TVarChar ,  -- �������� ������
    IN inSession          TVarChar    -- ������ ������������
)
RETURNS TABLE (StartDate TDateTime, EndDate TDateTime
             , UnitId Integer, UnitName TVarChar
             , UnitGroupId Integer, UnitGroupName TVarChar
             , GoodsGroupId_gp Integer, GoodsGroupName_gp TVarChar
             , GoodsGroupId Integer, GoodsGroupName TVarChar
              )
AS
$BODY$
DECLARE
  vbUserId Integer;
    DECLARE Cursor1 refcursor;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId := lpGetUserBySession(inSession);

     -- ���������
     RETURN QUERY  
           SELECT DATE_TRUNC ('MONTH', CURRENT_DATE - INTERVAL '1 DAY') :: TDateTime   AS StartDate
                , (CURRENT_DATE - INTERVAL '1 DAY')  :: TDateTime  AS EndDate
                , Object_Unit.Id                 AS UnitId
                , Object_Unit.ValueData          AS UnitName

                , Object_UnitGroup.Id            AS UnitGroupId
                , Object_UnitGroup.ValueData     AS UnitGroupName     

                , Object_GoodsGroupGP.Id         AS GoodsGroupId_gp
                , Object_GoodsGroupGP.ValueData  AS GoodsGroupName_gp

                , Object_GoodsGroup.Id           AS GoodsGroupId
                , Object_GoodsGroup.ValueData    AS GoodsGroupname

           FROM Object AS Object_Unit
                LEFT JOIN Object AS Object_UnitGroup ON Object_UnitGroup.Id = 8460        -- ������ ������� �������� �����
                LEFT JOIN Object AS Object_GoodsGroupGP ON Object_GoodsGroupGP.Id = 1832  -- ������ ������� ��
                LEFT JOIN Object AS Object_GoodsGroup ON Object_GoodsGroup.Id = 1979      -- ������ ������� �������
           WHERE Object_Unit.Id = 8459                                                    -- ����� ����������
              AND inReportName <> 'Report_Goods_byMovementReal'

        UNION
           SELECT DATE_TRUNC ('MONTH', CURRENT_DATE - INTERVAL '1 DAY') :: TDateTime   AS StartDate
                , (CURRENT_DATE - INTERVAL '1 DAY')  :: TDateTime  AS EndDate
                , 0                              AS UnitId
                , '' ::TVarChar                  AS UnitName

                , 0                              AS UnitGroupId
                , '' ::TVarChar                  AS UnitGroupName     

                , Object_GoodsGroupGP.Id         AS GoodsGroupId_gp
                , Object_GoodsGroupGP.ValueData  AS GoodsGroupName_gp

                , Object_GoodsGroup.Id           AS GoodsGroupId
                , Object_GoodsGroup.ValueData    AS GoodsGroupname

           FROM Object AS Object_Unit
                LEFT JOIN Object AS Object_UnitGroup ON Object_UnitGroup.Id = 8460        -- ������ ������� �������� �����
                LEFT JOIN Object AS Object_GoodsGroupGP ON Object_GoodsGroupGP.Id = 1832  -- ������ ������� ��
                LEFT JOIN Object AS Object_GoodsGroup ON Object_GoodsGroup.Id = 1979      -- ������ ������� �������
           WHERE Object_Unit.Id = 8459                                                    -- ����� ����������
            AND inReportName = 'Report_Goods_byMovementReal'
    
 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 04.12.16         *  
*/

-- ����
-- SELECT * FROM gpGet_DefaultReportParams (inReportName:= '', inSession:= '5');
