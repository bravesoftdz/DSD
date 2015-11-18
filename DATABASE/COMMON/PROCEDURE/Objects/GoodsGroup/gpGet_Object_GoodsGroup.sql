-- Function: gpGet_Object_GoodsGroup (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpGet_Object_GoodsGroup (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Object_GoodsGroup(
    IN inId          Integer,       -- ������ ������� 
    IN inSession     TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar
             , ParentId Integer, ParentName TVarChar
             , GroupStatId Integer, GroupStatName TVarChar
             , TradeMarkId Integer, TradeMarkName TVarChar
             , GoodsTagId Integer, GoodsTagName TVarChar
             , GoodsGroupAnalystId Integer, GoodsGroupAnalystName TVarChar
             , GoodsPlatformId Integer, GoodsPlatformName TVarChar
             , InfoMoneyId Integer, InfoMoneyName TVarChar
             )
AS
$BODY$
BEGIN
   
   -- �������� ���� ������������ �� ����� ���������
   --   PERFORM lpCheckRight(inSession, zc_Enum_Process_GoodsGroup());
   
   IF COALESCE (inId, 0) = 0
   THEN
       RETURN QUERY 
       SELECT
             CAST (0 as Integer)    AS Id
           , lfGet_ObjectCode(0, zc_Object_GoodsGroup()) AS Code
           , CAST ('' as TVarChar)  AS Name
           , CAST (0 as Integer)    AS ParentId
           , CAST ('' as TVarChar)  AS ParentName
           , CAST (0 as Integer)    AS GroupStatId
           , CAST ('' as TVarChar)  AS GroupStatName
           , CAST (0 as Integer)    AS TradeMarkId
           , CAST ('' as TVarChar)  AS TradeMarkName
           , CAST (0 as Integer)    AS GoodsTagId
           , CAST ('' as TVarChar)  AS GoodsTagName
           
           , CAST (0 as Integer)    AS GoodsGroupAnalystId
           , CAST ('' as TVarChar)  AS GoodsGroupAnalystName

           , CAST (0 as Integer)    AS GoodsPlatformId
           , CAST ('' as TVarChar)  AS GoodsPlatformName

           , CAST (0 as Integer)   AS InfoMoneyId
           , CAST ('' as TVarChar) AS InfoMoneyName
           ;
   ELSE
       RETURN QUERY 
       SELECT 
             Object_GoodsGroup.Id            AS Id
           , Object_GoodsGroup.ObjectCode    AS Code
           , Object_GoodsGroup.ValueData     AS Name
           , GoodsGroup.Id            AS ParentId
           , GoodsGroup.ValueData     AS ParentName
           , GoodsGroupStat.Id        AS GroupStatId
           , GoodsGroupStat.ValueData AS GroupStatName

           , Object_TradeMark.Id            AS TradeMarkId
           , Object_TradeMark.ValueData     AS TradeMarkName
          
           , Object_GoodsTag.Id            AS GoodsTagId
           , Object_GoodsTag.ValueData     AS GoodsTagName 
           
           , Object_GoodsGroupAnalyst.Id             AS GoodsGroupAnalystId
           , Object_GoodsGroupAnalyst.ValueData      AS GoodsGroupAnalystName    

           , Object_GoodsPlatform.Id            AS GoodsPlatformId
           , Object_GoodsPlatform.ValueData     AS GoodsPlatformName   

           , Object_InfoMoney.Id          AS InfoMoneyId
           , Object_InfoMoney.ValueData   AS InfoMoneyName

       FROM OBJECT AS Object_GoodsGroup
           LEFT JOIN ObjectLink AS ObjectLink_GoodsGroup
                                ON ObjectLink_GoodsGroup.ObjectId = Object_GoodsGroup.Id
                               AND ObjectLink_GoodsGroup.DescId = zc_ObjectLink_GoodsGroup_Parent()
           LEFT JOIN Object AS GoodsGroup ON GoodsGroup.Id = ObjectLink_GoodsGroup.ChildObjectId
           
           LEFT JOIN ObjectLink AS ObjectLink_GoodsGroupStat
                                ON ObjectLink_GoodsGroupStat.ObjectId = Object_GoodsGroup.Id
                               AND ObjectLink_GoodsGroupStat.DescId = zc_ObjectLink_GoodsGroup_GoodsGroupStat()
           LEFT JOIN Object AS GoodsGroupStat ON GoodsGroupStat.Id = ObjectLink_GoodsGroupStat.ChildObjectId

           LEFT JOIN ObjectLink AS ObjectLink_TradeMark
                                ON ObjectLink_TradeMark.ObjectId = Object_GoodsGroup.Id
                               AND ObjectLink_TradeMark.DescId = zc_ObjectLink_GoodsGroup_TradeMark()
           LEFT JOIN Object AS Object_TradeMark ON Object_TradeMark.Id = ObjectLink_TradeMark.ChildObjectId 

           LEFT JOIN ObjectLink AS ObjectLink_GoodsTag
                                ON ObjectLink_GoodsTag.ObjectId = Object_GoodsGroup.Id
                               AND ObjectLink_GoodsTag.DescId = zc_ObjectLink_GoodsGroup_GoodsTag()
           LEFT JOIN Object AS Object_GoodsTag ON Object_GoodsTag.Id = ObjectLink_GoodsTag.ChildObjectId 
           
           LEFT JOIN ObjectLink AS ObjectLink_GoodsGroupAnalyst
                                ON ObjectLink_GoodsGroupAnalyst.ObjectId = Object_GoodsGroup.Id
                               AND ObjectLink_GoodsGroupAnalyst.DescId = zc_ObjectLink_GoodsGroup_GoodsGroupAnalyst()
           LEFT JOIN Object AS Object_GoodsGroupAnalyst ON Object_GoodsGroupAnalyst.Id = ObjectLink_GoodsGroupAnalyst.ChildObjectId            
           
           LEFT JOIN ObjectLink AS ObjectLink_GoodsPlatform
                                ON ObjectLink_GoodsPlatform.ObjectId = Object_GoodsGroup.Id
                               AND ObjectLink_GoodsPlatform.DescId = zc_ObjectLink_GoodsGroup_GoodsPlatform()
           LEFT JOIN Object AS Object_GoodsPlatform ON Object_GoodsPlatform.Id = ObjectLink_GoodsPlatform.ChildObjectId  

           LEFT JOIN ObjectLink AS ObjectLink_GoodsGroup_InfoMoney
                                ON ObjectLink_GoodsGroup_InfoMoney.ObjectId = Object_GoodsGroup.Id 
                               AND ObjectLink_GoodsGroup_InfoMoney.DescId = zc_ObjectLink_GoodsGroup_InfoMoney()
           LEFT JOIN Object AS Object_InfoMoney ON Object_InfoMoney.Id = ObjectLink_GoodsGroup_InfoMoney.ChildObjectId
           
       WHERE Object_GoodsGroup.Id = inId;
   END IF;
   
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpGet_Object_GoodsGroup (Integer, TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 24.11.14         * add GoodsGroupAnalyst
 15.09.14         * add GoodsTag
 11.09.14         * add TradeMark
 04.09.14         * add zc_ObjectLink_GoodsGroup_GoodsGroupStat
 06.09.13                         *
 12.06.13          *
 03.06.13          

*/

-- ����
-- SELECT * FROM gpSelect_GoodsGroup('2')