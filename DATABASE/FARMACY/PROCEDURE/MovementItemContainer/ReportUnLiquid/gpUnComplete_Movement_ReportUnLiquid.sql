-- Function: gpUnComplete_Movement_ReportUnLiquid (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpUnComplete_Movement_ReportUnLiquid (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUnComplete_Movement_ReportUnLiquid(
    IN inMovementId        Integer               , -- ���� ���������
    IN inSession           TVarChar DEFAULT ''     -- ������ ������������
)
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
    -- �������� ���� ������������ �� ����� ���������
    --vbUserId:= lpCheckRight(inSession, zc_Enum_Process_UnComplete_ReportUnLiquid());
    vbUserId:= inSession;

    -- �������� - ���� <Master> ������, �� <������>
    PERFORM lfCheck_Movement_ParentStatus (inMovementId:= inMovementId, inNewStatusId:= zc_Enum_Status_UnComplete(), inComment:= '�����������');

     -- ����������� ��������
     PERFORM lpUnComplete_Movement (inMovementId := inMovementId
                                  , inUserId     := vbUserId);

    --������������� ����� ��������� �� ��������� �����
    --PERFORM lpInsertUpdate_MovementFloat_TotalSumm (inMovementId);    
    

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 19.11.18         *
*/

-- ����
-- SELECT * FROM gpUnComplete_Movement_ReportUnLiquid (inMovementId:= 149639, inSession:= zfCalc_UserAdmin())
