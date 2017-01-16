-- Function: gpSelect_Object_Juridical()

DROP FUNCTION IF EXISTS gpSelect_Object_Juridical(TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Object_Juridical(
    IN inSession     TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar, OKPO TVarChar,
               RetailId Integer, RetailName TVarChar,
               isCorporate boolean,
               Percent TFloat, PayOrder TFloat,
               OrderSumm TVarChar, OrderTime TVarChar,
               isErased boolean) AS
$BODY$
BEGIN

   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight(inSession, zc_Enum_Process_Juridical());

   RETURN QUERY 
       SELECT 
             Object_Juridical.Id                 AS Id
           , Object_Juridical.ObjectCode         AS Code
           , Object_Juridical.ValueData          AS Name
           , ObjectHistory_JuridicalDetails_View.OKPO

           , Object_Retail.Id                    AS RetailId
           , Object_Retail.ValueData             AS RetailName 

           , ObjectBoolean_isCorporate.ValueData AS isCorporate
           , ObjectFloat_Percent.ValueData       AS Percent
           , ObjectFloat_PayOrder.ValueData      AS PayOrder
           
           , CASE WHEN COALESCE (ObjectFloat_OrderSumm.ValueData,0) = 0 THEN COALESCE (ObjectString_OrderSumm.ValueData,'') 
                  ELSE CAST (ObjectFloat_OrderSumm.ValueData AS NUMERIC (16, 2)) ||' ' || COALESCE (ObjectString_OrderSumm.ValueData,'')
             END                                            ::TVarChar AS OrderSumm
           , COALESCE (ObjectString_OrderTime.ValueData,'') ::TVarChar AS OrderTime

           , Object_Juridical.isErased           AS isErased
           
       FROM Object AS Object_Juridical

           LEFT JOIN ObjectFloat AS ObjectFloat_Percent
                                 ON ObjectFloat_Percent.ObjectId = Object_Juridical.Id
                                AND ObjectFloat_Percent.DescId = zc_ObjectFloat_Juridical_Percent()

           LEFT JOIN ObjectLink AS ObjectLink_Juridical_Retail
                                ON ObjectLink_Juridical_Retail.ObjectId = Object_Juridical.Id
                               AND ObjectLink_Juridical_Retail.DescId = zc_ObjectLink_Juridical_Retail()
           LEFT JOIN Object AS Object_Retail ON Object_Retail.Id = ObjectLink_Juridical_Retail.ChildObjectId

           LEFT JOIN ObjectBoolean AS ObjectBoolean_isCorporate 
                                   ON ObjectBoolean_isCorporate.ObjectId = Object_Juridical.Id
                                  AND ObjectBoolean_isCorporate.DescId = zc_ObjectBoolean_Juridical_isCorporate()
           LEFT JOIN ObjectFloat AS ObjectFloat_PayOrder
                                   ON ObjectFloat_PayOrder.ObjectId = Object_Juridical.Id
                                  AND ObjectFloat_PayOrder.DescId = zc_ObjectFloat_Juridical_PayOrder()
           LEFT JOIN ObjectHistory_JuridicalDetails_View ON ObjectHistory_JuridicalDetails_View.JuridicalId = Object_Juridical.Id

           LEFT JOIN ObjectFloat AS ObjectFloat_OrderSumm
                                 ON ObjectFloat_OrderSumm.ObjectId = Object_Juridical.Id
                                AND ObjectFloat_OrderSumm.DescId = zc_ObjectFloat_Juridical_OrderSumm()
           LEFT JOIN ObjectString AS ObjectString_OrderSumm
                                  ON ObjectString_OrderSumm.ObjectId = Object_Juridical.Id
                                 AND ObjectString_OrderSumm.DescId = zc_ObjectString_Juridical_OrderSumm()
           LEFT JOIN ObjectString AS ObjectString_OrderTime
                                  ON ObjectString_OrderTime.ObjectId = Object_Juridical.Id
                                 AND ObjectString_OrderTime.DescId = zc_ObjectString_Juridical_OrderTime()

       WHERE Object_Juridical.DescId = zc_Object_Juridical();
  
END;
$BODY$

LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpSelect_Object_Juridical(TVarChar) OWNER TO postgres;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
 14.01.17         * 
 02.12.15                                                         * PayOrder
 01.07.14         *

*/

-- ����
-- SELECT * FROM gpSelect_Object_Juridical ('2')