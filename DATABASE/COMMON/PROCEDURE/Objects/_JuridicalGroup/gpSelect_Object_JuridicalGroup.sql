﻿-- Function: gpSelect_Object_JuridicalGroup()

--DROP FUNCTION gpSelect_Object_JuridicalGroup();

CREATE OR REPLACE FUNCTION gpSelect_Object_JuridicalGroup(
IN inSession     TVarChar       /* текущий пользователь */)
RETURNS TABLE (Id Integer, Code Integer, Name TVarChar, isErased boolean, ParentId Integer) AS
$BODY$BEGIN

   --PERFORM lpCheckRight(inSession, zc_Enum_Process_User());

     RETURN QUERY 
     SELECT 
       Object.Id
     , Object.ObjectCode
     , Object.ValueData
     , Object.isErased
     , ObjectLink.ChildObjectId AS ParentId
     FROM Object
LEFT JOIN ObjectLink 
       ON ObjectLink.ObjectId = Object.Id
      AND ObjectLink.DescId = zc_ObjectLink_JuridicalGroup_Parent()
    WHERE Object.DescId = zc_Object_JuridicalGroup();
  
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 100;
ALTER FUNCTION gpSelect_Object_JuridicalGroup(TVarChar)
  OWNER TO postgres;

-- SELECT * FROM gpSelect_Object_JuridicalGroup('2')