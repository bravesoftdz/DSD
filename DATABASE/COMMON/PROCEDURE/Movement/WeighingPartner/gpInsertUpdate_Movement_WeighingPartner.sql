-- Function: gpInsertUpdate_Movement_WeighingPartner()

DROP FUNCTION IF EXISTS gpInsertUpdate_Movement_WeighingPartner (Integer, Integer, TDateTime, TDateTime, TDateTime, TFloat, TFloat, TFloat, TVarChar, TVarChar, Integer, Integer, Integer, Integer, Integer, Integer, TVarChar);
DROP FUNCTION IF EXISTS gpInsertUpdate_Movement_WeighingPartner (Integer, TDateTime, TVarChar, Integer, Integer, Integer, Integer, Integer, Integer, Integer, TVarChar, TVarChar);
DROP FUNCTION IF EXISTS gpInsertUpdate_Movement_WeighingPartner (Integer, TDateTime, TVarChar, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, TVarChar, TVarChar);
DROP FUNCTION IF EXISTS gpInsertUpdate_Movement_WeighingPartner (Integer, TDateTime, TVarChar, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, TVarChar, TFloat, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Movement_WeighingPartner(
 INOUT ioId                  Integer   , -- ���� ������� <��������>
    IN inOperDate            TDateTime , -- ���� ���������
    IN inInvNumberOrder      TVarChar  , -- ����� ������ �����������
    IN inMovementDescId      Integer   , -- ��� ���������
    IN inMovementDescNumber  Integer   , -- ��� �������� (�����������)
    IN inWeighingNumber      Integer   , -- ����� �����������
    IN inFromId              Integer   , -- �� ���� (� ���������)
    IN inToId                Integer   , -- ���� (� ���������)
    IN inContractId          Integer   , -- ��������
    IN inPaidKindId          Integer   , -- ����� ������
    IN inPriceListId         Integer   , -- 
    IN inMovementId_Order    Integer   , -- ���� ��������� ������
    IN inPartionGoods        TVarChar  , -- ������ ������
    IN inChangePercent       TFloat    , -- (-)% ������ (+)% �������
    IN inSession             TVarChar    -- ������ ������������
)                              
RETURNS Integer
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbAccessKeyId Integer;
   DECLARE vbIsInsert Boolean;

   DECLARE vbInvNumber TVarChar;
   DECLARE vbParentId Integer;
   DECLARE vbStartWeighing TDateTime;
   DECLARE vbPriceWithVAT  Boolean;
   DECLARE vbVATPercent    TFloat;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Movement_WeighingPartner());
     vbUserId:= lpGetUserBySession (inSession);

     -- ���������� ���� �������
     -- vbAccessKeyId:= ...;

     IF COALESCE (ioId, 0) = 0
     THEN
         vbInvNumber:= CAST (NEXTVAL ('Movement_WeighingPartner_seq') AS TVarChar);
         vbParentId:= NULL;
         vbStartWeighing:= CURRENT_TIMESTAMP;
     ELSE
         SELECT InvNumber, ParentId INTO vbInvNumber, vbParentId FROM Movement WHERE Id = ioId;
     END IF;


     SELECT COALESCE (ObjectBoolean_PriceWithVAT.ValueData, FALSE) AS PriceWithVAT
          , ObjectFloat_VATPercent.ValueData                       AS VATPercent
            INTO vbPriceWithVAT, vbVATPercent
     FROM Object AS Object_PriceList
          LEFT JOIN ObjectBoolean AS ObjectBoolean_PriceWithVAT
                                  ON ObjectBoolean_PriceWithVAT.ObjectId = Object_PriceList.Id
                                 AND ObjectBoolean_PriceWithVAT.DescId = zc_ObjectBoolean_PriceList_PriceWithVAT()
          LEFT JOIN ObjectFloat AS ObjectFloat_VATPercent
                                ON ObjectFloat_VATPercent.ObjectId = Object_PriceList.Id
                               AND ObjectFloat_VATPercent.DescId = zc_ObjectFloat_PriceList_VATPercent()
     WHERE Object_PriceList.Id = inPriceListId;


     -- ���������� ������� ��������/�������������
     vbIsInsert:= COALESCE (ioId, 0) = 0;

     -- ��������� <��������>
     ioId := lpInsertUpdate_Movement (ioId, zc_Movement_WeighingPartner(), vbInvNumber, inOperDate, vbParentId, vbAccessKeyId);

     IF vbIsInsert = TRUE
     THEN
         -- ��������� �������� <�������� ������ �����������>
         PERFORM lpInsertUpdate_MovementDate (zc_MovementDate_StartWeighing(), ioId, vbStartWeighing);
     END IF;
     
     -- ��������� �������� <���� � ��� (��/���)>
     PERFORM lpInsertUpdate_MovementBoolean (zc_MovementBoolean_PriceWithVAT(), ioId, vbPriceWithVAT);
     -- ��������� �������� <% ���>
     PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_VATPercent(), ioId, vbVATPercent);

     -- ��������� �������� <��� ���������>
     PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_MovementDesc(), ioId, inMovementDescId);
     -- ��������� �������� <��� �������� (�����������)>
     PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_MovementDescNumber(), ioId, inMovementDescNumber);
     -- ��������� �������� <����� �����������>
     PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_WeighingNumber(), ioId, inWeighingNumber);

     -- ��������� �������� <����� ������ � �����������>
     PERFORM lpInsertUpdate_MovementString (zc_MovementString_InvNumberOrder(), ioId, inInvNumberOrder);
     -- ��������� �������� <������ ������>
     PERFORM lpInsertUpdate_MovementString (zc_MovementString_PartionGoods(), ioId, inPartionGoods);

     -- ��������� ����� � <�� ���� (� ���������)>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_From(), ioId, inFromId);
     -- ��������� ����� � <���� (� ���������)>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_To(), ioId, inToId);

     -- ��������� ����� � <��������>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_Contract(), ioId, inContractId);
     -- ��������� ����� � <����� ������>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_PaidKind(), ioId, inPaidKindId);

   -- !!!������ ��� ��������!!!
   IF vbIsInsert = TRUE
   THEN
     -- ��������� ����� � <������������>
     PERFORM lpInsertUpdate_MovementLinkObject (zc_MovementLinkObject_User(), ioId, vbUserId);
   END IF;

     -- ��������� ����� � ���������� <������ ���������>
     PERFORM lpInsertUpdate_MovementLinkMovement (zc_MovementLinkMovement_Order(), ioId, inMovementId_Order);

     -- ��������� �������� <(-)% ������ (+)% ������� >
     PERFORM lpInsertUpdate_MovementFloat (zc_MovementFloat_ChangePercent(), ioId, inChangePercent);

     -- ����������� �������� ����� �� ���������
     PERFORM lpInsertUpdate_MovementFloat_TotalSumm (ioId);

     -- ��������� ��������
     PERFORM lpInsert_MovementProtocol (ioId, vbUserId, vbIsInsert);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 27.01.15                                        * all
 11.10.14                                        *
*/

-- select lpInsertUpdate_MovementFloat (zc_MovementFloat_WeighingNumber(), 2005096 , 8);

-- SELECT * FROM gpInsertUpdate_Movement_WeighingPartner (ioId:= 0, inInvNumber:= '-1', inOperDate:= '01.01.2013', , inSession:= '2')
