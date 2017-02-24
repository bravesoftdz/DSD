﻿-- Function: gpGet_Object_Partner (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpGet_Object_Partner (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Object_Partner(
    IN inId          Integer,       -- Состав товара
    IN inSession     TVarChar       -- Cессия пользователя
)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar, UnitNameId Integer, UnitName TVarChar, ValutaNameId Integer, ValutaName TVarChar, BrandNameId Integer, BrandName TVarChar, FabrikaNameId Integer, FabrikaName TVarChar, PeriodNameId Integer, PeriodName TVarChar, KindAccount TFloat, PeriodYear TFloat) 
AS
$BODY$
BEGIN

  -- проверка прав пользователя на вызов процедуры
  -- PERFORM lpCheckRight(inSession, zc_Enum_Process_Partner());
  PERFORM lpGetUserBySession (inSession);

  IF COALESCE (inId, 0) = 0
   THEN
       RETURN QUERY
       SELECT
             CAST (0 as Integer)    AS Id
           , COALESCE(MAX (Object.ObjectCode), 0) + 1 AS Code
           , CAST ('' as TVarChar)  AS Name
           , CAST (0 as Integer)    AS UnitNameId
           , CAST ('' as TVarChar)  AS UnitName
           , CAST (0 as Integer)    AS ValutaNameId
           , CAST ('' as TVarChar)  AS ValutaName
           , CAST (0 as Integer)    AS BrandNameId
           , CAST ('' as TVarChar)  AS BrandName
           , CAST (0 as Integer)    AS FabrikaNameId
           , CAST ('' as TVarChar)  AS FabrikaName
           , CAST (0 as Integer)    AS PeriodNameId
           , CAST ('' as TVarChar)  AS PeriodName
           , CAST (0 as TFloat)     AS KindAccount
           , CAST (0 as TFloat)     AS PeriodYear

       FROM Object
       WHERE Object.DescId = zc_Object_Partner();
   ELSE
       RETURN QUERY
       SELECT 
             Object_Partner.Id                  AS Id
           , Object_Partner.ObjectCode          AS Code
           , Object_Partner.ValueData           AS Name
           , Object_Unit.Id                     AS UnitId
           , Object_Unit.ValueData              AS UnitName
           , Object_Valuta.Id                   AS ValutaId
           , Object_Valuta.ValueData            AS ValutaName
           , Object_Brand.Id                    AS BrandId
           , Object_Brand.ValueData             AS BrandName
           , Object_Fabrika.Id                  AS FabrikaId
           , Object_Fabrika.ValueData           AS FabrikaName
           , Object_Period.Id                   AS PeriodId
           , Object_Period.ValueData            AS PeriodName
           , ObjectFloat_KindAccount.ValueData  AS KindAccount
           , ObjectFloat_PeriodYear.ValueData   AS PeriodYear
           
       FROM Object AS Object_Partner
            LEFT JOIN ObjectLink AS ObjectLink_Goods_Unit
                                 ON ObjectLink_Goods_Unit.ObjectId = Object_Partner.Id
                                AND ObjectLink_Goods_Unit.DescId = zc_ObjectLink_Goods_Unit()
            LEFT JOIN Object AS Object_Unit ON Object_Unit.Id = ObjectLink_Goods_Unit.ChildObjectId

            LEFT JOIN ObjectLink AS ObjectLink_Goods_Valuta
                                 ON ObjectLink_Goods_Valuta.ObjectId = Object_Partner.Id
                                AND ObjectLink_Goods_Valuta.DescId = zc_ObjectLink_Goods_Valuta()
            LEFT JOIN Object AS Object_Valuta ON Object_Valuta.Id = ObjectLink_Goods_Valuta.ChildObjectId

            LEFT JOIN ObjectLink AS ObjectLink_Goods_Brand
                                 ON ObjectLink_Goods_Brand.ObjectId = Object_Partner.Id
                                AND ObjectLink_Goods_Brand.DescId = zc_ObjectLink_Goods_Brand()
            LEFT JOIN Object AS Object_Brand ON Object_Brand.Id = ObjectLink_Goods_Brand.ChildObjectId

            LEFT JOIN ObjectLink AS ObjectLink_Goods_Fabrika
                                 ON ObjectLink_Goods_Fabrika.ObjectId = Object_Partner.Id
                                AND ObjectLink_Goods_Fabrika.DescId = zc_ObjectLink_Goods_Fabrika()
            LEFT JOIN Object AS Object_Fabrika ON Object_Fabrika.Id = ObjectLink_Goods_Fabrika.ChildObjectId

            LEFT JOIN ObjectLink AS ObjectLink_Goods_Period
                                 ON ObjectLink_Goods_Period.ObjectId = Object_Partner.Id
                                AND ObjectLink_Goods_Period.DescId = zc_ObjectLink_Goods_Period()
            LEFT JOIN Object AS Object_Period ON Object_Period.Id = ObjectLink_Goods_Period.ChildObjectId

            LEFT JOIN ObjectFloat AS ObjectFloat_KindAccount 
                                  ON ObjectFloat_KindAccount.ObjectId = Object_Partner.Id 
                                 AND ObjectFloat_KindAccount.DescId = zc_ObjectFloat_Partner_KindAccount()

            LEFT JOIN ObjectFloat AS ObjectFloat_PeriodYear 
                                  ON ObjectFloat_PeriodYear.ObjectId = Object_Partner.Id 
                                 AND ObjectFloat_PeriodYear.DescId = zc_ObjectFloat_Partner_PeriodYear()

       WHERE Object_Partner.Id = inId;

   END IF;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;


/*-------------------------------------------------------------------------------*/
/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Фелонюк И.В.   Кухтин И.В.   Климентьев К.И.   Полятыкин А.А.
24.02.17                                                          *
 
*/

-- тест
-- SELECT * FROM gpSelect_Partner(1,'2')
