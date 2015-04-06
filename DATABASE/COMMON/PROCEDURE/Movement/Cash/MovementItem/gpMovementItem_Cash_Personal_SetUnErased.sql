-- Function: gpMovementItem_Cash_Personal_SetUnErased (Integer, Integer, TVarChar)

DROP FUNCTION IF EXISTS gpMovementItem_Cash_Personal_SetUnErased (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpMovementItem_Cash_Personal_SetUnErased(
    IN inMovementItemId      Integer              , -- ���� ������� <������� ���������>
   OUT outIsErased           Boolean              , -- ����� ��������
    IN inSession             TVarChar               -- ������� ������������
)
  RETURNS Boolean
AS
$BODY$
   DECLARE vbMovementId Integer;
   DECLARE vbStatusId Integer;
   DECLARE vbUserId Integer;
BEGIN
  vbUserId:= lpCheckRight (inSession, zc_Enum_Process_SetUnErased_MI_Cash_Personal());

  -- ������������� ����� ��������
  outIsErased := FALSE;

  -- ����������� ������
  UPDATE MovementItem SET isErased = FALSE WHERE Id = inMovementItemId
         RETURNING MovementId INTO vbMovementId;

  -- �������� - ��������� ��������� �������� ������
  -- PERFORM lfCheck_Movement_Parent (inMovementId:= vbMovementId, inComment:= '���������');

  -- ���������� <������>
  vbStatusId := (SELECT StatusId FROM Movement WHERE Id = vbMovementId);
  -- �������� - �����������/��������� ��������� �������� ������
  IF vbStatusId <> zc_Enum_Status_UnComplete()
  THEN
      RAISE EXCEPTION '������.��������� ��������� � ������� <%> �� ��������.', lfGet_Object_ValueData (vbStatusId);
  END IF;

  -- � ������� ������ �������� �����
  PERFORM lpUpdate_MovementItem_Cash_Personal_TotalSumm (vbMovementId, vbUserId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpMovementItem_Cash_Personal_SetUnErased (Integer, TVarChar) OWNER TO postgres;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.A.
 16.09.14         *
*/

-- ����
-- SELECT * FROM gpMovementItem_Cash_Personal_SetUnErased (inMovementId:= 55, inJuridicalId = 1, inSession:= '2')
