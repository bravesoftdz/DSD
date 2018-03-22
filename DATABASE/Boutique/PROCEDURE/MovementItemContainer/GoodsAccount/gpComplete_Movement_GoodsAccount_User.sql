-- Function: gpComplete_Movement_GoodsAccount()

DROP FUNCTION IF EXISTS gpComplete_Movement_GoodsAccount_User (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpComplete_Movement_GoodsAccount_User(
    IN inMovementId        Integer               , -- ���� ���������
    IN inSession           TVarChar                -- ������ ������������
)
RETURNS VOID
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Complete_GoodsAccount());
     vbUserId:= lpGetUserBySession (inSession);

     -- ��������� ��������� ������� - ��� ������������ ������ �� ���������
     PERFORM lpComplete_Movement_GoodsAccount_CreateTemp();

     -- ���������� ��������
     PERFORM lpComplete_Movement_GoodsAccount (inMovementId  -- ���� ���������
                                             , vbUserId);    -- ������������

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
 26.02.18        *
 */

-- ����
-- SELECT * FROM gpComplete_Movement_GoodsAccount_User (inMovementId:= 1100, inSession:= zfCalc_UserAdmin())