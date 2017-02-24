-- Function: gpInsertUpdate_Object_Kassa (Integer, Integer, TVarChar, TVarChar)

DROP FUNCTION IF EXISTS gpInsertUpdate_Object_Kassa (Integer, Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_Kassa(
 INOUT ioId           Integer,       -- ���� ������� <�����>         
    IN inCode         Integer,       -- ��� ������� <�����>          
    IN inName         TVarChar,      -- �������� ������� <�����>     
    IN inSession      TVarChar       -- ������ ������������
)
RETURNS integer
AS
$BODY$
  DECLARE vbUserId Integer;
  DECLARE vbCode_max Integer;

BEGIN

   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight(inSession, zc_Enum_Process_Kassa());
   vbUserId:= lpGetUserBySession (inSession);

   -- �������� ����� ���
   IF ioId <> 0 AND COALESCE (inCode, 0) = 0 THEN inCode := (SELECT ObjectCode FROM Object WHERE Id = ioId); END IF;

   -- ���� ��� �� ����������, ���������� ��� ��� ���������+1
   vbCode_max:=lfGet_ObjectCode (inCode, zc_Object_Kassa()); 

   -- �������� ������������ ��� �������� <������������ Kassa>
   PERFORM lpCheckUnique_Object_ValueData(ioId, zc_Object_Kassa(), inName); 
   -- �������� ������������ ��� �������� <��� Kassa>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_Kassa(), vbCode_max);

   -- ��������� <������>
   ioId := lpInsertUpdate_Object(ioId, zc_Object_Kassa(), vbCode_max, inName);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);

END;
$BODY$

LANGUAGE plpgsql VOLATILE;



/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
20.02.17                                                          *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_Kassa()
