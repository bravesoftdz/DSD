-- Function: lpInsertUpdate_Movement_IncomeCost()

DROP FUNCTION IF EXISTS lpInsertUpdate_Movement_IncomeCost (Integer, Integer, Integer, TVarChar, Integer);

CREATE OR REPLACE FUNCTION lpInsertUpdate_Movement_IncomeCost(
 INOUT ioId                  Integer   , -- ���� ������� <��������>
    IN inParentId            Integer   , -- ��� ������
    IN inMovementId          Integer   , -- ��� �����
    IN inComment             TVarChar  , --
    IN inUserId              Integer     -- ������������
)
RETURNS Integer
AS
$BODY$
   DECLARE vbIsInsert Boolean;
BEGIN

     -- ���������� ������� ��������/�������������
     vbIsInsert:= COALESCE (ioId, 0) = 0;

     -- ��������� <��������>
     IF COALESCE (ioId, 0) = 0
     THEN
         -- ��������� �����
         ioId := lpInsertUpdate_Movement (ioId
                                        , zc_Movement_IncomeCost()
                                        , CAST (NEXTVAL ('Movement_IncomeCost_seq') AS TVarChar)
                                        , (SELECT Movement.OperDate FROM Movement WHERE Movement.Id = inParentId)
                                        , inParentId
                                         );

     ELSE
         -- ��������� ������������
         ioId := lpInsertUpdate_Movement (ioId
                                        , zc_Movement_IncomeCost()
                                        , (SELECT Movement.InvNumber FROM Movement WHERE Movement.Id = ioId)
                                        , CURRENT_DATE
                                        , inParentId
                                         );
     END IF;

     -- ��������� �������� <>
     PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_MovementId(), ioId, inMovementId);
     -- ��������� �������� <>
     PERFORM lpInsertUpdate_MovementString (zc_MovementString_Comment(), ioId, inComment);

     -- ��������� ��������
     PERFORM lpInsert_MovementProtocol (ioId, inUserId, vbIsInsert);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 29.04.16         *
*/

-- ����
-- SELECT * FROM lpInsertUpdate_Movement_IncomeCost (ioId:= 0, inInvNumber:= '-1', inOperDate:= '01.01.2013', inParentId:= 0, inMovementId:= 0, inComment:= 'xfdf', inSession:= '2')