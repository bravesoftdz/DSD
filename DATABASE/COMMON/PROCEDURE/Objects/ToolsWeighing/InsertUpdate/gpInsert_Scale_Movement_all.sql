-- Function: gpInsert_Scale_Movement_all()

DROP FUNCTION IF EXISTS gpInsert_Scale_Movement_all (Integer, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpInsert_Scale_Movement_all(
    IN inMovementId          Integer   , -- ���� ������� <��������>
    IN inOperDate            TDateTime , -- ���� ���������
    IN inSession             TVarChar    -- ������ ������������
)                              
RETURNS TABLE (MovementId_begin    Integer
              )
AS
$BODY$
   DECLARE vbUserId Integer;

   DECLARE vbMovementId_begin Integer;
   DECLARE vbMovementDescId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Scale_Movement());
     vbUserId:= lpGetUserBySession (inSession);


     -- ��������
     IF COALESCE (inMovementId, 0) = 0
     THEN
         RAISE EXCEPTION '������.��� ������ ��� ���������.';
     END IF;

     -- ���������� <��� ���������>
     vbMovementDescId:= (SELECT ValueData FROM MovementFloat WHERE MovementId = inMovementId AND DescId = zc_MovementFloat_MovementDesc()) :: Integer;


     IF vbMovementDescId = zc_Movement_Sale()
     THEN
          -- ����� ������������� ��������� <������� ����������> �� ������
          vbMovementId_begin:= (SELECT Movement.Id
                              FROM MovementLinkMovement
                                   INNER JOIN MovementLinkMovement AS MovementLinkMovement_Order
                                                                   ON MovementLinkMovement_Order.MovementChildId = MovementLinkMovement.MovementChildId
                                                                  AND MovementLinkMovement_Order.DescId = zc_MovementLinkMovement_Order()
                                   INNER JOIN Movement ON Movement.Id = MovementLinkMovement_Order.MovementId
                                                      AND Movement.DescId = zc_Movement_Sale()
                                                      AND Movement.OperDate = inOperDate
                                                      AND Movement.StatusId IN (zc_Enum_Status_UnComplete(), zc_Enum_Status_Complete())
                              WHERE MovementLinkMovement.MovementId = inMovementId
                                AND MovementLinkMovement.DescId = zc_MovementLinkMovement_Order());

          IF COALESCE (vbMovementId_begin, 0) = 0
          THEN
              -- ��������� ��������
              vbMovementId_begin:= (SELECT lpInsertUpdate_Movement_Sale_Value(
                                                    ioId                    := 0
                                                  , inInvNumber             := CAST (NEXTVAL ('movement_sale_seq') AS TVarChar)
                                                  , inInvNumberPartner      := ''
                                                  , inInvNumberOrder        := InvNumberOrder
                                                  , inOperDate              := inOperDate
                                                  , inOperDatePartner       := (inOperDate + (COALESCE (ObjectFloat_Partner_DocumentDayCount.ValueData, 0) :: TVarChar || ' DAY') :: INTERVAL) :: TDateTime
                                                  , inChecked               := NULL
                                                  , inChangePercent         := ChangePercent
                                                  , inFromId                := FromId
                                                  , inToId                  := ToId
                                                  , inPaidKindId            := PaidKindId
                                                  , inContractId            := ContractId
                                                  , inRouteSortingId        := NULL
                                                  , inCurrencyDocumentId    := NULL
                                                  , inCurrencyPartnerId     := NULL
                                                  , inMovementId_Order      := MovementId_Order
                                                  , ioPriceListId           := NULL
                                                  , ioCurrencyPartnerValue  := NULL
                                                  , ioParPartnerValue       := NULL
                                                  , inUserId                := vbUserId
                                                   )
                                             FROM gpGet_Movement_WeighingPartner (inMovementId:= inMovementId, inSession:= inSession) AS tmp
                                                  LEFT JOIN ObjectFloat AS ObjectFloat_Partner_DocumentDayCount
                                                                        ON ObjectFloat_Partner_DocumentDayCount.ObjectId = tmp.ToId
                                                                       AND ObjectFloat_Partner_DocumentDayCount.DescId = zc_ObjectFloat_Partner_DocumentDayCount()
                                 );
          ELSE
              -- ����������� �������� !!!������������!!!
              PERFORM lpUnComplete_Movement (inMovementId := vbMovementId_begin
                                           , inUserId     := vbUserId);

          END IF;

          -- �������� �����
          PERFORM lpInsertUpdate_MovementItem_Sale_Value (ioId                  := tmp.MovementItemId_find
                                                        , inMovementId          := vbMovementId_begin
                                                        , inGoodsId             := tmp.GoodsId
                                                        , inAmount              := tmp.Amount
                                                        , inAmountPartner       := tmp.AmountPartner
                                                        , inAmountChangePercent := tmp.AmountChangePercent
                                                        , inChangePercentAmount := tmp.ChangePercentAmount
                                                        , inPrice               := tmp.Price
                                                        , ioCountForPrice       := tmp.CountForPrice
                                                        , inHeadCount           := 0
                                                        , inBoxCount            := tmp.BoxCount
                                                        , inPartionGoods        := ''
                                                        , inGoodsKindId         := tmp.GoodsKindId
                                                        , inAssetId             := NULL
                                                        , inBoxId               := NULL
                                                        , inUserId              := vbUserId
                                                         )
          FROM (SELECT MAX (tmp.MovementItemId)      AS MovementItemId_find
                     , tmp.GoodsId
                     , tmp.GoodsKindId
                     , SUM (tmp.Amount)              AS Amount
                     , SUM (tmp.AmountChangePercent) AS AmountChangePercent
                     , SUM (tmp.AmountPartner)       AS AmountPartner
                     , tmp.ChangePercentAmount
                     , tmp.Price
                     , tmp.CountForPrice
                     , SUM (tmp.BoxCount)  AS BoxCount
                FROM (SELECT 0                                                   AS MovementItemId
                           , MovementItem.ObjectId                               AS GoodsId
                           , COALESCE (MILinkObject_GoodsKind.ObjectId, 0)       AS GoodsKindId
                           , MovementItem.Amount                                 AS Amount
                           , MovementItem.Amount                                 AS AmountChangePercent
                           , COALESCE (MIFloat_AmountPartner.ValueData, 0)       AS AmountPartner
                           , COALESCE (MIFloat_ChangePercentAmount.ValueData, 0) AS ChangePercentAmount
                           , COALESCE (MIFloat_Price.ValueData, 0)               AS Price
                           , COALESCE (MIFloat_CountForPrice.ValueData, 0)       AS CountForPrice
                           , COALESCE (MIFloat_BoxCount.ValueData, 0)            AS BoxCount
                           , MovementItem.Amount                                 AS Amount_mi
                      FROM MovementItem
                           LEFT JOIN MovementItemFloat AS MIFloat_AmountPartner
                                                       ON MIFloat_AmountPartner.MovementItemId = MovementItem.Id
                                                      AND MIFloat_AmountPartner.DescId = zc_MIFloat_AmountPartner()
                           LEFT JOIN MovementItemFloat AS MIFloat_ChangePercentAmount
                                                       ON MIFloat_ChangePercentAmount.MovementItemId = MovementItem.Id
                                                      AND MIFloat_ChangePercentAmount.DescId = zc_MIFloat_ChangePercentAmount()
                           LEFT JOIN MovementItemFloat AS MIFloat_BoxCount
                                                       ON MIFloat_BoxCount.MovementItemId = MovementItem.Id
                                                      AND MIFloat_BoxCount.DescId = zc_MIFloat_BoxCount()
                           LEFT JOIN MovementItemFloat AS MIFloat_Price
                                                       ON MIFloat_Price.MovementItemId = MovementItem.Id
                                                      AND MIFloat_Price.DescId = zc_MIFloat_Price()
                           LEFT JOIN MovementItemFloat AS MIFloat_CountForPrice
                                                       ON MIFloat_CountForPrice.MovementItemId = MovementItem.Id
                                                      AND MIFloat_CountForPrice.DescId = zc_MIFloat_CountForPrice()

                           LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKind
                                                            ON MILinkObject_GoodsKind.MovementItemId = MovementItem.Id
                                                           AND MILinkObject_GoodsKind.DescId = zc_MILinkObject_GoodsKind()
                           LEFT JOIN MovementItemLinkObject AS MILinkObject_Box
                                                            ON MILinkObject_Box.MovementItemId = MovementItem.Id
                                                           AND MILinkObject_Box.DescId = zc_MILinkObject_Box()

                      WHERE MovementItem.MovementId = inMovementId
                        AND MovementItem.DescId     = zc_MI_Master()
                        AND MovementItem.isErased   = FALSE
                     UNION ALL
                      SELECT MovementItem.Id                                     AS MovementItemId
                           , MovementItem.ObjectId                               AS GoodsId
                           , COALESCE (MILinkObject_GoodsKind.ObjectId, 0)       AS GoodsKindId
                           , MovementItem.Amount                                 AS Amount
                           , COALESCE (MIFloat_AmountChangePercent.ValueData, 0) AS AmountChangePercent
                           , COALESCE (MIFloat_AmountPartner.ValueData, 0)       AS AmountPartner
                           , COALESCE (MIFloat_ChangePercentAmount.ValueData, 0) AS ChangePercentAmount
                           , COALESCE (MIFloat_Price.ValueData, 0)               AS Price
                           , COALESCE (MIFloat_CountForPrice.ValueData, 0)       AS CountForPrice
                           , COALESCE (MIFloat_BoxCount.ValueData, 0)            AS BoxCount
                           , 0                                                   AS Amount_mi
                      FROM MovementItem
                           LEFT JOIN MovementItemFloat AS MIFloat_AmountChangePercent
                                                       ON MIFloat_AmountChangePercent.MovementItemId = MovementItem.Id
                                                      AND MIFloat_AmountChangePercent.DescId = zc_MIFloat_AmountChangePercent()
                           LEFT JOIN MovementItemFloat AS MIFloat_AmountPartner
                                                       ON MIFloat_AmountPartner.MovementItemId = MovementItem.Id
                                                      AND MIFloat_AmountPartner.DescId = zc_MIFloat_AmountPartner()
                           LEFT JOIN MovementItemFloat AS MIFloat_ChangePercentAmount
                                                       ON MIFloat_ChangePercentAmount.MovementItemId = MovementItem.Id
                                                      AND MIFloat_ChangePercentAmount.DescId = zc_MIFloat_ChangePercentAmount()
                           LEFT JOIN MovementItemFloat AS MIFloat_BoxCount
                                                       ON MIFloat_BoxCount.MovementItemId = MovementItem.Id
                                                      AND MIFloat_BoxCount.DescId = zc_MIFloat_BoxCount()
                           LEFT JOIN MovementItemFloat AS MIFloat_Price
                                                       ON MIFloat_Price.MovementItemId = MovementItem.Id
                                                      AND MIFloat_Price.DescId = zc_MIFloat_Price()
                           LEFT JOIN MovementItemFloat AS MIFloat_CountForPrice
                                                       ON MIFloat_CountForPrice.MovementItemId = MovementItem.Id
                                                      AND MIFloat_CountForPrice.DescId = zc_MIFloat_CountForPrice()

                           LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKind
                                                            ON MILinkObject_GoodsKind.MovementItemId = MovementItem.Id
                                                           AND MILinkObject_GoodsKind.DescId = zc_MILinkObject_GoodsKind()
                           LEFT JOIN MovementItemLinkObject AS MILinkObject_Box
                                                            ON MILinkObject_Box.MovementItemId = MovementItem.Id
                                                           AND MILinkObject_Box.DescId = zc_MILinkObject_Box()

                      WHERE MovementItem.MovementId = vbMovementId_begin
                        AND MovementItem.DescId     = zc_MI_Master()
                        AND MovementItem.isErased   = FALSE
                     ) AS tmp
                GROUP BY tmp.GoodsId
                       , tmp.GoodsKindId
                       , tmp.ChangePercentAmount
                       , tmp.Price
                       , tmp.CountForPrice
                HAVING SUM (tmp.Amount_mi) <> 0
               ) AS tmp;

          -- ��������� ��������� ������� - ��� ������������ ������ ��� ��������
          PERFORM lpComplete_Movement_Sale_CreateTemp();
          -- �������� ��������
          PERFORM lpComplete_Movement_Sale (inMovementId     := vbMovementId_begin
                                          , inUserId         := vbUserId
                                          , inIsLastComplete := NULL);

     ELSE
         RAISE EXCEPTION '������.������ ��������� ������ ��� ���������.';
     END IF;


     -- ����� - ��������� <��������>
     PERFORM lpInsertUpdate_Movement (Movement.Id, Movement.DescId, Movement.InvNumber, inOperDate, vbMovementId_begin, Movement.AccessKeyId)
     FROM Movement
     WHERE Id =inMovementId ;

     -- ����� - ����������� ������ ������ ��������� + ��������� ��������
     PERFORM lpComplete_Movement (inMovementId := inMovementId
                                , inDescId     := zc_Movement_WeighingPartner()
                                , inUserId     := vbUserId
                                 );

     -- ���������
     RETURN QUERY
       SELECT vbMovementId_begin AS MovementId_begin;


END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 03.02.15                                        *
*/

-- ����
-- SELECT * FROM gpInsert_Scale_Movement_all (ioId:= 0, inMovementId:= 10, inGoodsId:= 1, inAmount:= 0, inAmountPartner:= 0, inAmountPacker:= 0, inPrice:= 1, inCountForPrice:= 1, inLiveWeight:= 0, inHeadCount:= 0, inPartionGoods:= '', inGoodsKindId:= 0, inAssetId:= 0, inSession:= '2')
