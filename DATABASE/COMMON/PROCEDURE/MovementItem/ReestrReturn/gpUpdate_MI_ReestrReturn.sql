-- Function: gpUpdate_MI_ReestrReturn()

DROP FUNCTION IF EXISTS gpUpdate_MI_ReestrReturn (TVarChar, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUpdate_MI_ReestrReturn(
    IN inBarCode              TVarChar  , -- �������� ��������� ������� 
    IN inReestrKindId         Integer   , -- ��� ��������� �� �������
    IN inMemberId             Integer   , -- ���������� ����(��������/����������) ��� ���� �������� ��� ����
    IN inSession              TVarChar    -- ������ ������������
)                              
RETURNS VOID
AS
$BODY$
   DECLARE vbUserId Integer;

   DECLARE vbMemberId_user Integer;
   DECLARE vbId_mi Integer;
   DECLARE vbMovementId_ReturnIn Integer;
   DECLARE vbMovementId_reestr Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_MI_ReestrReturn());
     

     -- ������ � ���� ������ - ������ �� ������, �.�. �� ������ ���������� "������" ���
     IF COALESCE (TRIM (inBarCode), '') = ''
     THEN
         RETURN; -- !!!�����!!!
     END IF;


     -- ���� 
     IF NOT EXISTS (SELECT 1 FROM Object WHERE Object.Id = inReestrKindId AND Object.DescId = zc_Object_ReestrKind())
     THEN
          RAISE EXCEPTION '������.zc_Object_ReestrKind = <%> �� ��������� ��������.', lfGet_Object_ValueData (inReestrKindId);
     END IF;


     -- ������������ <���������� ����> - ��� ����������� ���� inReestrKindId
     vbMemberId_user:= CASE WHEN vbUserId = 5 THEN 9457 ELSE
                       (SELECT ObjectLink_User_Member.ChildObjectId
                        FROM ObjectLink AS ObjectLink_User_Member
                        WHERE ObjectLink_User_Member.DescId = zc_ObjectLink_User_Member()
                          AND ObjectLink_User_Member.ObjectId = vbUserId)
                       END
                      ;
     -- ��������
     IF COALESCE (vbMemberId_user, 0) = 0
     THEN 
          RAISE EXCEPTION '������.� ������������ <%> �� ��������� �������� <���.����>.', lfGet_Object_ValueData (vbUserId);
     END IF;

     -- ������ ������� ����������
     IF CHAR_LENGTH (inBarCode) >= 13
     THEN -- �� ����� ����, �� ��� "��������" ����������� - 4 MONTH
          vbMovementId_ReturnIn:= (SELECT Movement.Id
                                   FROM (SELECT zfConvert_StringToNumber (SUBSTR (inBarCode, 4, 13-4)) AS MovementId
                                         ) AS tmp
                                       INNER JOIN Movement ON Movement.Id = tmp.MovementId
                                                          AND Movement.DescId = zc_Movement_ReturnIn()
                                                          AND Movement.OperDate >= CURRENT_DATE - INTERVAL '4 MONTH'
                                                          AND Movement.StatusId <> zc_Enum_Status_Erased()
                                   );
     ELSE -- �� InvNumber, �� ��� �������� ����������� - 4 MONTH
          vbMovementId_ReturnIn:= (SELECT Movement.Id
                                   FROM Movement
                                   WHERE Movement.InvNumber = TRIM (inBarCode)
                                     AND Movement.DescId = zc_Movement_ReturnIn()
                                     AND Movement.OperDate >= CURRENT_DATE - INTERVAL '4 MONTH'
                                     AND Movement.StatusId <> zc_Enum_Status_Erased()
                                   );
     END IF;

     -- ��������
     IF COALESCE (vbMovementId_ReturnIn, 0) = 0
     THEN
         RAISE EXCEPTION '������.�������� <������� ����������> � � <%> �� ������.', inBarCode;
     END IF;

     -- ������ �������
     vbId_mi:= (SELECT MF_MovementItemId.ValueData ::Integer AS Id
                FROM MovementFloat AS MF_MovementItemId 
                WHERE MF_MovementItemId.MovementId = vbMovementId_ReturnIn
                  AND MF_MovementItemId.DescId     = zc_MovementFloat_MovementItemId()
               );
     -- ��������
     IF COALESCE (vbId_mi, 0) = 0
     THEN
         -- RAISE EXCEPTION '������.�������� <������� ����������> � � <%> �� ��������������� � �������.', inBarCode;
         --
         -- ��������� ����� "��������"
         vbMovementId_reestr:= (SELECT Movement.Id
                                FROM Movement
                                     LEFT JOIN MovementLinkObject AS ML�
                                                                  ON ML�.MovementId = Movement.Id 
                                                                 AND ML�.DescId = zc_MovementLinkObject_Insert()
                                                                -- AND ML�.ObjectId = vbUserId
                                WHERE Movement.OperDate = CURRENT_DATE
                                  AND Movement.DescId = zc_Movement_ReestrReturn()
                                  AND Movement.StatusId <> zc_Enum_Status_Erased()
                                  AND ML�.MovementId IS NULL
                                LIMIT 1 -- ��������� ��� "�����" ������ ������� ���� ����� ������������ �������� ����� ���.
                               );

         -- ���� �� ����� "��������"
         IF COALESCE (vbMovementId_reestr, 0) = 0
         THEN
             -- �������
             vbMovementId_reestr:=
              lpInsertUpdate_Movement_ReestrReturn (ioId               := COALESCE (vbMovementId_reestr, 0)
                                                  , inInvNumber        := NEXTVAL ('Movement_ReestrReturn_seq') :: TVarChar
                                                  , inOperDate         := CURRENT_DATE
                                                  , inUserId           := -1 * vbUserId -- !!! � �������, ������ "��������"!!!
                                                   );
         END IF;

         -- ��������� <������� ���������> - �� "�����" <��� ����������� ���� "�������� �� �������">
         vbId_mi := lpInsertUpdate_MovementItem (vbId_mi, zc_MI_Master(), vbMemberId_user, vbMovementId_reestr, 0, NULL);

         -- ��������� �������� � ��������� ������� <� �������� ����� � ������� ���������>
         PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_MovementItemId(), vbMovementId_ReturnIn, vbId_mi);

     END IF; -- if COALESCE (vbId_mi, 0) = 0


    -- <����������� ��� �����������>
    IF inReestrKindId = zc_Enum_ReestrKind_RemakeBuh()
    THEN 
       -- ��������� <����� ������������ ����>
       PERFORM lpInsertUpdate_MovementItemDate (zc_MIDate_RemakeBuh(), vbId_mi, CURRENT_TIMESTAMP);
       -- ��������� ����� � <��� ����������� ����>
       PERFORM lpInsertUpdate_MovementItemLinkObject (zc_MILinkObject_RemakeBuh(), vbId_mi, vbMemberId_user);
    END IF;

    -- <�����������>
    IF inReestrKindId = zc_Enum_ReestrKind_Buh()
    THEN 
       -- ��������� <����� ������������ ����>
       PERFORM lpInsertUpdate_MovementItemDate (zc_MIDate_Buh(), vbId_mi, CURRENT_TIMESTAMP);
       -- ��������� ����� � <��� ����������� ����>
       PERFORM lpInsertUpdate_MovementItemLinkObject (zc_MILinkObject_Buh(), vbId_mi, vbMemberId_user);
    END IF;

    -- ���������� "���������" �������� ���� - <��������� �� �������>
    PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_ReestrKind(), vbMovementId_ReturnIn, inReestrKindId);

    -- ��������� ��������
    PERFORM lpInsert_MovementItemProtocol (vbId_mi, vbUserId, FALSE);

    /*IF inSession = '5'
    THEN
        RAISE EXCEPTION '��������� ������ :)';
    END IF;
*/

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 12.03.17         *
*/

-- ����
-- SELECT * FROM gpUpdate_MI_ReestrReturn (inBarCode:= '4323306', inOperDate:= '23.10.2016', inCarId:= 340655, inPersonalDriverId:= 0, inMemberId:= 0, inDocumentId_Transport:= 2298218, inSession:= '5');