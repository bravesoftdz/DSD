-- Function: gpUnComplete_Movement_ReturnIn (Integer, TVarChar)

DROP FUNCTION IF EXISTS gpUnComplete_Movement_ReturnIn (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUnComplete_Movement_ReturnIn(
    IN inMovementId        Integer               , -- ���� ���������
    IN inSession           TVarChar                -- ������ ������������
)
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
  DECLARE vbStatusId Integer;
BEGIN
    -- �������� ���� ������������ �� ����� ���������
    -- vbUserId:= lpCheckRight(inSession, zc_Enum_Process_UnComplete_ReturnIn());
    vbUserId:= lpGetUserBySession (inSession);

    -- ���.������ ���������
    vbStatusId:= (SELECT Movement.StatusId FROM Movement WHERE Movement.Id = inMovementId);
    
    -- ����������� ��������
    PERFORM lpUnComplete_Movement (inMovementId := inMovementId
                                 , inUserId     := vbUserId);

    -- ����������� "��������" ����� �� ��������� �������
    PERFORM lpUpdate_MI_Sale_Total(Object_PartionMI.ObjectCode :: Integer)
    FROM MovementItem
         INNER JOIN MovementItemLinkObject AS MILinkObject_PartionMI
                                           ON MILinkObject_PartionMI.MovementItemId = MovementItem.Id
                                          AND MILinkObject_PartionMI.DescId         = zc_MILinkObject_PartionMI()
         LEFT JOIN Object AS Object_PartionMI ON Object_PartionMI.Id = MILinkObject_PartionMI.ObjectId
    WHERE MovementItem.MovementId = inMovementId
      AND MovementItem.DescId     = zc_MI_Master()
      AND MovementItem.isErased   = FALSE;

    -- ���� ��� ������ �������� ����� ����������� ��������� ����� �� ����������
    IF vbStatusId = zc_Enum_Status_Complete() 
    THEN 
         -- ��������� ��������� ����� �� ����������
         PERFORM lpUpdate_Object_Client_Total (inMovementId, inIsComplete:=FALSE, vbUserId);
    END IF;
      
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.  ��������� �.�
 23.07.17         *
 14.05.17         *
*/