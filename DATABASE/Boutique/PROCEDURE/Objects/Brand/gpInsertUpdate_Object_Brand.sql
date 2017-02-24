-- Function: gpInsertUpdate_Object_Brand (Integer, Integer, TVarChar, TVarChar)

DROP FUNCTION IF EXISTS gpInsertUpdate_Object_Brand (Integer, Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_Brand(
 INOUT ioId           Integer,       -- ���� ������� <�����>
    IN inCode         Integer,       -- �������� <��� ������>
    IN inName         TVarChar,      -- ������� �������� ������
    IN inSession      TVarChar       -- ������ ������������
)
RETURNS integer
AS
$BODY$
  DECLARE vbUserId Integer;
  DECLARE vbCode_max Integer;

BEGIN

   -- �������� ���� ������������ �� ����� ���������
   -- PERFORM lpCheckRight(inSession, zc_Enum_Process_Brand());
   vbUserId:= lpGetUserBySession (inSession);

   -- �������� ����� ���
   IF ioId <> 0 AND COALESCE (inCode, 0) = 0 THEN inCode := (SELECT ObjectCode FROM Object WHERE Id = ioId); END IF;

   -- ���� ��� �� ����������, ���������� ��� ��� ���������+1
   vbCode_max:=lfGet_ObjectCode (inCode, zc_Object_Composition()); 

   -- �������� ������������ ��� �������� <������������ ������>
   PERFORM lpCheckUnique_Object_ValueData(ioId, zc_Object_Brand(), inName); 
   -- �������� ������������ ��� �������� <��� ������>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_Brand(), vbCode_max);

   -- ��������� <������>
   ioId := lpInsertUpdate_Object(ioId, zc_Object_Brand(), vbCode_max, inName);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);

END;
$BODY$

LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
19.02.17                                                          *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_Brand()
