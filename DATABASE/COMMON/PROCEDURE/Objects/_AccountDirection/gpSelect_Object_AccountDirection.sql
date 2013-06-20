-- Function: gpSelect_Object_AccountDirection (TVarChar)

-- DROP FUNCTION gpSelect_Object_AccountDirection (TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Object_AccountDirection(
    IN inSession        TVarChar       -- ������ ������������
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar, isErased Boolean) AS
$BODY$BEGIN

   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Select_Object_AccountDirection());

   RETURN QUERY 
   SELECT
         Object_AccountDirection.Id         AS Id 
       , Object_AccountDirection.ObjectCode AS Code
       , Object_AccountDirection.ValueData  AS Name
       , Object_AccountDirection.isErased   AS isErased
   FROM OBJECT AS Object_AccountDirection
   WHERE Object_AccountDirection.DescId = zc_Object_AccountDirection();
  
END;$BODY$

LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpSelect_Object_AccountDirection (TVarChar) OWNER TO postgres;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 
 21.06.13          * zc_Enum_Process_Select_Object_AccountDirection()
 17.06.13          *

*/

-- ����
-- SELECT * FROM gpSelect_Object_AccountDirection('2')
