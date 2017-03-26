-- Function: gpUpdate_Object_isErased_Partner (Integer, TVarChar) 

DROP FUNCTION IF EXISTS gpUpdate_Object_isErased_Partner (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUpdate_Object_isErased_Partner(
    IN inObjectId Integer, 
    IN inSession  TVarChar
)
RETURNS VOID
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   -- vbUserId := lpCheckRight (inSession, zc_Enum_Process_Update_Object_isErased_Partner());
   vbUserId:= lpGetUserBySession (inSession);

   -- ��������
   PERFORM lpUpdate_Object_isErased (inObjectId:= inObjectId, inUserId:= vbUserId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
17.02.17                                                          *
*/