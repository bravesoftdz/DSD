-- Function: gpUnComplete_Movement_ProductionUnion (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpUnComplete_Movement_ProductionUnion (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUnComplete_Movement_ProductionUnion(
    IN inMovementId        Integer               , -- ���� ���������
    IN inSession           TVarChar DEFAULT ''     -- ������ ������������
)
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= lpCheckRight(inSession, zc_Enum_Process_UnComplete_ProductionUnion());

     -- �������� - ���� <Master> ������, �� <������>
     PERFORM lfCheck_Movement_ParentStatus (inMovementId:= inMovementId, inNewStatusId:= zc_Enum_Status_UnComplete(), inComment:= '�����������');

     -- ����������� ��������
     PERFORM lpUnComplete_Movement (inMovementId := inMovementId
                                  , inUserId     := vbUserId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 31.05.14                                                       *
*/

-- ����
-- SELECT * FROM gpUnComplete_Movement_ProductionUnion (inMovementId:= 149639, inSession:= zfCalc_UserAdmin())
