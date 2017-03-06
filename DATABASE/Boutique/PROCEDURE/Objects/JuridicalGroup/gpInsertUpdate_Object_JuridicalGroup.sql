-- Function: gpInsertUpdate_Object_JuridicalGroup (Integer,Integer,TVarChar,Integer,TVarChar)

DROP FUNCTION IF EXISTS gpInsertUpdate_Object_JuridicalGroup (Integer,Integer,TVarChar,Integer,TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_JuridicalGroup(
 INOUT ioId                       Integer   ,    -- ���� ������� <������ ����������� ���> 
    IN inCode                     Integer   ,    -- ��� ������� <������ ����������� ���>
    IN inName                     TVarChar  ,    -- �������� ������� <������ ����������� ���>
    IN inParentId                 Integer   ,    -- ���� ������� <������ ����������� ���> 
    IN inSession                  TVarChar       -- ������ ������������  
)
RETURNS Integer
AS
$BODY$
   DECLARE vbUserId Integer; 
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   --vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Object_JuridicalGroup());
   vbUserId:= lpGetUserBySession (inSession);

   -- ����� ��� �������� �� Sybase �.�. ��� ��� = 0 
   IF inCode = 0 THEN  inCode := NEXTVAL ('Object_JuridicalGroup_seq'); END IF;  
 
   -- �������� ���� ������������ ��� �������� <������������ >
   --PERFORM lpCheckUnique_Object_ValueData(ioId, zc_Object_JuridicalGroup(), inName);

   -- �������� ������������ <������������> ��� !!!�����!! <������ ����������� ���>
   IF TRIM (inName) <> '' AND COALESCE (inParentId, 0) <> 0 
   THEN
       IF EXISTS (SELECT Object.Id
                  FROM Object
                       JOIN ObjectLink AS ObjectLink_JuridicalGroup_Parent
                                       ON ObjectLink_JuridicalGroup_Parent.ObjectId = Object.Id
                                      AND ObjectLink_JuridicalGroup_Parent.DescId = zc_ObjectLink_JuridicalGroup_Parent()
                                      AND ObjectLink_JuridicalGroup_Parent.ChildObjectId = inParentId
                                   
                  WHERE TRIM (Object.ValueData) = TRIM (inName)
                   AND Object.Id <> COALESCE (ioId, 0))
       THEN
           RAISE EXCEPTION '������. ������ ����������� ��� <%> ��� ����������� � <%>.', TRIM (inName), lfGet_Object_ValueData (inParentId);
       END IF;
   END IF;


   -- �������� ���� ������������ ��� �������� <���>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_JuridicalGroup(), inCode);

   -- ��������� <������>
   ioId := lpInsertUpdate_Object (ioId, zc_Object_JuridicalGroup(), inCode, inName);
   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink(zc_ObjectLink_JuridicalGroup_Parent(), ioId, inParentId);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);
   
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
06.03.17                                                           *
27.02.17                                                           *

*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_JuridicalGroup()
