-- Function: gpUpdateMovement_Electron()

DROP FUNCTION IF EXISTS gpUpdateMovement_Electron (Integer, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpUpdateMovement_Electron(
    IN ioId                  Integer   , -- ���� ������� <��������>
 INOUT inElectron            Boolean   , -- ��������
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS Boolean 
AS
$BODY$
    DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= inSession;  --  lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Movement_Sale());

     -- ���������� �������
     inElectron:= NOT inElectron;

     -- ��������� ��������
     PERFORM lpInsertUpdate_MovementBoolean (zc_MovementBoolean_Electron(), ioId, inElectron);
  
     -- ��������� ��������
     PERFORM lpInsert_MovementProtocol (ioId, vbUserId, FALSE);


END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 15.08.14                                        *
*/


-- ����
-- SELECT * FROM gpUpdateMovement_Electron (ioId:= 275079, inElectron:= 'False', inSession:= '2')
