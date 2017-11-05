-- Function: gpSelect_Object_GoodsReportSale()

DROP FUNCTION IF EXISTS gpSelect_Object_GoodsReportSale(TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Object_GoodsReportSale(
    IN inSession     TVarChar       -- ������ ������������
)
RETURNS TABLE (UnitId Integer, UnitName TVarChar, GoodsId Integer
            , GoodsCode Integer, GoodsName TVarChar
            , GoodsKindId Integer, GoodsKindName TVarChar
            , MeasureName TVarChar, Weight TFloat
            
            , Amount1 TFloat
            , Amount2 TFloat
            , Amount3 TFloat
            , Amount4 TFloat
            , Amount5 TFloat
            , Amount6 TFloat
            , Amount7 TFloat
            
            , Promo1 TFloat
            , Promo2 TFloat
            , Promo3 TFloat
            , Promo4 TFloat
            , Promo5 TFloat
            , Promo6 TFloat
            , Promo7 TFloat

            , Branch1 TFloat
            , Branch2 TFloat
            , Branch3 TFloat
            , Branch4 TFloat
            , Branch5 TFloat
            , Branch6 TFloat
            , Branch7 TFloat

            , Order1 TFloat
            , Order2 TFloat
            , Order3 TFloat
            , Order4 TFloat
            , Order5 TFloat
            , Order6 TFloat
            , Order7 TFloat

            , OrderPromo1 TFloat
            , OrderPromo2 TFloat
            , OrderPromo3 TFloat
            , OrderPromo4 TFloat
            , OrderPromo5 TFloat
            , OrderPromo6 TFloat
            , OrderPromo7 TFloat
              
            , OrderBranch1 TFloat
            , OrderBranch2 TFloat
            , OrderBranch3 TFloat
            , OrderBranch4 TFloat
            , OrderBranch5 TFloat
            , OrderBranch6 TFloat
            , OrderBranch7 TFloat

             ) AS
$BODY$
BEGIN

   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight(inSession, zc_Enum_Process_User());

       RETURN QUERY 
       SELECT Object_Unit.Id                       AS UnitId
            , Object_Unit.ValueData                AS UnitName
            , Object_Goods.Id                      AS GoodsId
            , Object_Goods.ObjectCode              AS GoodsCode
            , Object_Goods.ValueData               AS GoodsName
            , Object_GoodsKind.Id                  AS GoodsKindId
            , Object_GoodsKind.ValueData           AS GoodsKindName
            
            , Object_Measure.ValueData             AS MeasureName
            , COALESCE (ObjectFloat_Weight.ValueData, 0) :: TFloat AS Weight
            
            , ObjectFloat_Amount1.ValueData        AS Amount1
            , ObjectFloat_Amount2.ValueData        AS Amount2
            , ObjectFloat_Amount3.ValueData        AS Amount3
            , ObjectFloat_Amount4.ValueData        AS Amount4
            , ObjectFloat_Amount5.ValueData        AS Amount5
            , ObjectFloat_Amount6.ValueData        AS Amount6
            , ObjectFloat_Amount7.ValueData        AS Amount7
            
            , ObjectFloat_Promo1.ValueData         AS Promo1
            , ObjectFloat_Promo2.ValueData         AS Promo2
            , ObjectFloat_Promo3.ValueData         AS Promo3
            , ObjectFloat_Promo4.ValueData         AS Promo4
            , ObjectFloat_Promo5.ValueData         AS Promo5
            , ObjectFloat_Promo6.ValueData         AS Promo6
            , ObjectFloat_Promo7.ValueData         AS Promo7

            , ObjectFloat_Branch1.ValueData        AS Branch1
            , ObjectFloat_Branch2.ValueData        AS Branch2
            , ObjectFloat_Branch3.ValueData        AS Branch3
            , ObjectFloat_Branch4.ValueData        AS Branch4
            , ObjectFloat_Branch5.ValueData        AS Branch5
            , ObjectFloat_Branch6.ValueData        AS Branch6
            , ObjectFloat_Branch7.ValueData        AS Branch7

            , ObjectFloat_Order1.ValueData         AS Order1
            , ObjectFloat_Order2.ValueData         AS Order2
            , ObjectFloat_Order3.ValueData         AS Order3
            , ObjectFloat_Order4.ValueData         AS Order4
            , ObjectFloat_Order5.ValueData         AS Order5
            , ObjectFloat_Order6.ValueData         AS Order6
            , ObjectFloat_Order7.ValueData         AS Order7

            , ObjectFloat_OrderPromo1.ValueData    AS OrderPromo1
            , ObjectFloat_OrderPromo2.ValueData    AS OrderPromo2
            , ObjectFloat_OrderPromo3.ValueData    AS OrderPromo3
            , ObjectFloat_OrderPromo4.ValueData    AS OrderPromo4
            , ObjectFloat_OrderPromo5.ValueData    AS OrderPromo5
            , ObjectFloat_OrderPromo6.ValueData    AS OrderPromo6
            , ObjectFloat_OrderPromo7.ValueData    AS OrderPromo7
                                                   
            , ObjectFloat_OrderBranch1.ValueData   AS OrderBranch1
            , ObjectFloat_OrderBranch2.ValueData   AS OrderBranch2
            , ObjectFloat_OrderBranch3.ValueData   AS OrderBranch3
            , ObjectFloat_OrderBranch4.ValueData   AS OrderBranch4
            , ObjectFloat_OrderBranch5.ValueData   AS OrderBranch5
            , ObjectFloat_OrderBranch6.ValueData   AS OrderBranch6
            , ObjectFloat_OrderBranch7.ValueData   AS OrderBranch7

       FROM Object AS Object_GoodsReportSale
       
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount1
                                  ON ObjectFloat_Amount1.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount1.DescId = zc_ObjectFloat_GoodsReportSale_Amount1()
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount2
                                  ON ObjectFloat_Amount2.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount2.DescId = zc_ObjectFloat_GoodsReportSale_Amount2()
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount3
                                  ON ObjectFloat_Amount3.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount3.DescId = zc_ObjectFloat_GoodsReportSale_Amount3()
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount4
                                  ON ObjectFloat_Amount4.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount4.DescId = zc_ObjectFloat_GoodsReportSale_Amount4()
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount5
                                  ON ObjectFloat_Amount5.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount5.DescId = zc_ObjectFloat_GoodsReportSale_Amount5()
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount6
                                  ON ObjectFloat_Amount6.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount6.DescId = zc_ObjectFloat_GoodsReportSale_Amount6()
            LEFT JOIN ObjectFloat AS ObjectFloat_Amount7
                                  ON ObjectFloat_Amount7.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Amount7.DescId = zc_ObjectFloat_GoodsReportSale_Amount7()
--
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo1
                                  ON ObjectFloat_Promo1.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo1.DescId = zc_ObjectFloat_GoodsReportSale_Promo1()
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo2
                                  ON ObjectFloat_Promo2.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo2.DescId = zc_ObjectFloat_GoodsReportSale_Promo2()
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo3
                                  ON ObjectFloat_Promo3.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo3.DescId = zc_ObjectFloat_GoodsReportSale_Promo3()
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo4
                                  ON ObjectFloat_Promo4.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo4.DescId = zc_ObjectFloat_GoodsReportSale_Promo4()
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo5
                                  ON ObjectFloat_Promo5.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo5.DescId = zc_ObjectFloat_GoodsReportSale_Promo5()
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo6
                                  ON ObjectFloat_Promo6.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo6.DescId = zc_ObjectFloat_GoodsReportSale_Promo6()
            LEFT JOIN ObjectFloat AS ObjectFloat_Promo7
                                  ON ObjectFloat_Promo7.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Promo7.DescId = zc_ObjectFloat_GoodsReportSale_Promo7()
--
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch1
                                  ON ObjectFloat_Branch1.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch1.DescId = zc_ObjectFloat_GoodsReportSale_Branch1()
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch2
                                  ON ObjectFloat_Branch2.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch2.DescId = zc_ObjectFloat_GoodsReportSale_Branch2()
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch3
                                  ON ObjectFloat_Branch3.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch3.DescId = zc_ObjectFloat_GoodsReportSale_Branch3()
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch4
                                  ON ObjectFloat_Branch4.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch4.DescId = zc_ObjectFloat_GoodsReportSale_Branch4()
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch5
                                  ON ObjectFloat_Branch5.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch5.DescId = zc_ObjectFloat_GoodsReportSale_Branch5()
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch6
                                  ON ObjectFloat_Branch6.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch6.DescId = zc_ObjectFloat_GoodsReportSale_Branch6()
            LEFT JOIN ObjectFloat AS ObjectFloat_Branch7
                                  ON ObjectFloat_Branch7.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Branch7.DescId = zc_ObjectFloat_GoodsReportSale_Branch7()
--
            LEFT JOIN ObjectFloat AS ObjectFloat_Order1
                                  ON ObjectFloat_Order1.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order1.DescId = zc_ObjectFloat_GoodsReportSale_Order1()
            LEFT JOIN ObjectFloat AS ObjectFloat_Order2
                                  ON ObjectFloat_Order2.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order2.DescId = zc_ObjectFloat_GoodsReportSale_Order2()
            LEFT JOIN ObjectFloat AS ObjectFloat_Order3
                                  ON ObjectFloat_Order3.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order3.DescId = zc_ObjectFloat_GoodsReportSale_Order3()
            LEFT JOIN ObjectFloat AS ObjectFloat_Order4
                                  ON ObjectFloat_Order4.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order4.DescId = zc_ObjectFloat_GoodsReportSale_Order4()
            LEFT JOIN ObjectFloat AS ObjectFloat_Order5
                                  ON ObjectFloat_Order5.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order5.DescId = zc_ObjectFloat_GoodsReportSale_Order5()
            LEFT JOIN ObjectFloat AS ObjectFloat_Order6
                                  ON ObjectFloat_Order6.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order6.DescId = zc_ObjectFloat_GoodsReportSale_Order6()
            LEFT JOIN ObjectFloat AS ObjectFloat_Order7
                                  ON ObjectFloat_Order7.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_Order7.DescId = zc_ObjectFloat_GoodsReportSale_Order7()
--
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo1
                                  ON ObjectFloat_OrderPromo1.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo1.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo1()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo2
                                  ON ObjectFloat_OrderPromo2.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo2.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo2()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo3
                                  ON ObjectFloat_OrderPromo3.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo3.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo3()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo4
                                  ON ObjectFloat_OrderPromo4.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo4.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo4()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo5
                                  ON ObjectFloat_OrderPromo5.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo5.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo5()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo6
                                  ON ObjectFloat_OrderPromo6.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo6.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo6()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderPromo7
                                  ON ObjectFloat_OrderPromo7.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderPromo7.DescId = zc_ObjectFloat_GoodsReportSale_OrderPromo7()
--
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch1
                                  ON ObjectFloat_OrderBranch1.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch1.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch1()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch2
                                  ON ObjectFloat_OrderBranch2.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch2.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch2()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch3
                                  ON ObjectFloat_OrderBranch3.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch3.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch3()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch4
                                  ON ObjectFloat_OrderBranch4.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch4.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch4()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch5
                                  ON ObjectFloat_OrderBranch5.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch5.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch5()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch6
                                  ON ObjectFloat_OrderBranch6.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch6.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch6()
            LEFT JOIN ObjectFloat AS ObjectFloat_OrderBranch7
                                  ON ObjectFloat_OrderBranch7.ObjectId = Object_GoodsReportSale.Id
                                 AND ObjectFloat_OrderBranch7.DescId = zc_ObjectFloat_GoodsReportSale_OrderBranch7()
--
                                 
            LEFT JOIN ObjectLink AS ObjectLink_Unit
                                 ON ObjectLink_Unit.ObjectId = Object_GoodsReportSale.Id
                                AND ObjectLink_Unit.DescId = zc_ObjectLink_GoodsReportSale_Unit()
            LEFT JOIN Object AS Object_Unit ON Object_Unit.Id = ObjectLink_Unit.ChildObjectId 

            LEFT JOIN ObjectLink AS ObjectLink_Goods
                                 ON ObjectLink_Goods.ObjectId = Object_GoodsReportSale.Id
                                AND ObjectLink_Goods.DescId = zc_ObjectLink_GoodsReportSale_Goods()
            LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = ObjectLink_Goods.ChildObjectId 


            LEFT JOIN ObjectLink AS ObjectLink_GoodsKind
                                 ON ObjectLink_GoodsKind.ObjectId = Object_GoodsReportSale.Id
                                AND ObjectLink_GoodsKind.DescId = zc_ObjectLink_GoodsReportSale_GoodsKind()
            LEFT JOIN Object AS Object_GoodsKind ON Object_GoodsKind.Id = ObjectLink_GoodsKind.ChildObjectId 

            LEFT JOIN ObjectLink AS ObjectLink_Goods_Measure
                                 ON ObjectLink_Goods_Measure.ObjectId = Object_Goods.Id
                                AND ObjectLink_Goods_Measure.DescId = zc_ObjectLink_Goods_Measure()
            LEFT JOIN Object AS Object_Measure ON Object_Measure.Id = ObjectLink_Goods_Measure.ChildObjectId
            
            LEFT JOIN ObjectFloat AS ObjectFloat_Weight
                                  ON ObjectFloat_Weight.ObjectId = Object_Goods.Id
                                 AND ObjectFloat_Weight.DescId = zc_ObjectFloat_Goods_Weight()

      WHERE Object_GoodsReportSale.DescId = zc_Object_GoodsReportSale()
;
  
END;
$BODY$

LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 02.11.17         *

*/

-- ����
-- SELECT * FROM gpSelect_Object_GoodsReportSale ('2')


