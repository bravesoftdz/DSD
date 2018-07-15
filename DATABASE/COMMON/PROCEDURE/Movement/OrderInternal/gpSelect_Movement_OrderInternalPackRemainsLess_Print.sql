-- Function: gpSelect_Movement_OrderInternalPackRemainsLess_Print()

DROP FUNCTION IF EXISTS gpSelect_Movement_OrderInternalPackRemainsLess_Print (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Movement_OrderInternalPackRemainsLess_Print(
    IN inMovementId    Integer  , -- ���� ���������
    IN inSession       TVarChar   -- ������ ������������
)
RETURNS TABLE (FromId               Integer
             , FromName             TVarChar
             , GoodsId              Integer
             , GoodsCode            Integer
             , GoodsName            TVarChar
             , GoodsKindId          Integer
             , GoodsKindName        TVarChar
             , MeasureName          TVarChar
             , GoodsGroupNameFull   TVarChar
                
             , Amount_result_pack      TFloat
             , Amount_result_pack_pack TFloat
             , AmountPartnerPriorTotal TFloat
             , AmountPartnerTotal      TFloat
             , Income_PACK_from        TFloat
             , Remains                 TFloat
             , Remains_pack            TFloat
             , AmountPackAllTotal      TFloat

             , AmountPartner           TFloat
             , AmountPartnerPromo      TFloat
             , AmountPartnerNext       TFloat
             , AmountPartnerNextPromo  TFloat
             , AmountPartnerPrior      TFloat
             , AmountPartnerPriorPromo TFloat
             
             , Amount1         TFloat
             , Amount2         TFloat
              )
AS
$BODY$
    DECLARE vbUserId Integer;

    DECLARE vbDescId Integer;
    DECLARE vbStatusId Integer;
    DECLARE vbFromId Integer;
    DECLARE vbOperDate TDateTime;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Select_Movement_OrderInternal());
     vbUserId:= lpGetUserBySession (inSession);


     -- ��������� �� ���������
     SELECT Movement.DescId
          , Movement.StatusId
          , Movement.OperDate
          , MovementLinkObject_From.ObjectId
      INTO vbDescId, vbStatusId, vbOperDate, vbFromId
     FROM Movement
         LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                      ON MovementLinkObject_From.MovementId = Movement.Id
                                     AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
     WHERE Movement.Id = inMovementId;

     -- ����� ������ ��������
     /*IF COALESCE (vbStatusId, 0) <> zc_Enum_Status_Complete() AND vbUserId <> 5 -- !!!����� ������!!!
     THEN
         IF vbStatusId = zc_Enum_Status_Erased()
         THEN
             RAISE EXCEPTION '������.�������� <%> � <%> �� <%> ������.', (SELECT MovementDesc.ItemName FROM MovementDesc WHERE MovementDesc.Id = vbDescId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), (SELECT DATE (OperDate) FROM Movement WHERE Id = inMovementId);
         END IF;
         IF vbStatusId = zc_Enum_Status_UnComplete()
         THEN
             RAISE EXCEPTION '������.�������� <%> � <%> �� <%> �� ��������.', (SELECT MovementDesc.ItemName FROM MovementDesc WHERE Id = vbDescId), (SELECT InvNumber FROM Movement WHERE Id = inMovementId), (SELECT DATE (OperDate) FROM Movement WHERE Id = inMovementId);
         END IF;
         -- ��� ��� �������� ������
         RAISE EXCEPTION '������.�������� <%>.', (SELECT ItemName FROM MovementDesc WHERE Id = vbDescId);
     END IF;*/


      -- ����������� ������ � _Result_Master, _Result_Child, _Result_ChildTotal
      PERFORM lpSelect_MI_OrderInternalPackRemains (inMovementId:= inMovementId, inShowAll:= FALSE, inIsErased:= FALSE, inUserId:= vbUserId) ;

      -- ���������
      RETURN QUERY
           WITH 
                tmpUnit AS (SELECT tmp.UnitId
                            FROM lfSelect_Object_Unit_byGroup (vbFromId) AS tmp
                            )
              -- ������ �� ����������� ������� �� _Result_Child
              , tmpGoods_Less AS (SELECT *
                                   FROM _Result_Child
                                   WHERE _Result_Child.Amount_result_pack_pack < 0
                                      OR _Result_Child.Amount_result_pack < 0
                                  )
              -- �������� ������
              , tmpMovementOrder AS (SELECT Movement.Id
                                          , Movement.InvNumber
                                          , Movement.OperDate
                                          , MovementDate_OperDatePartner.ValueData AS OperDatePartner
                                          , MovementLinkObject_From.ObjectId       AS FromId           -- ����������
                  
                                      FROM Movement
                                          LEFT JOIN MovementDate AS MovementDate_OperDatePartner
                                                                 ON MovementDate_OperDatePartner.MovementId = Movement.Id
                                                                AND MovementDate_OperDatePartner.DescId = zc_MovementDate_OperDatePartner()

                                          LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                                                       ON MovementLinkObject_To.MovementId = Movement.Id
                                                                      AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
                                          INNER JOIN tmpUnit ON tmpUnit.UnitId = MovementLinkObject_To.ObjectId

                                          LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                                                       ON MovementLinkObject_From.MovementId = Movement.Id
                                                                      AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From() -- ����������

                                      WHERE Movement.OperDate BETWEEN (vbOperDate - INTERVAL '3 DAY') AND (vbOperDate - INTERVAL '0 DAY')
                                        AND MovementDate_OperDatePartner.ValueData >= vbOperDate
                                        AND Movement.DescId = zc_Movement_OrderExternal()
                                        AND Movement.StatusId = zc_Enum_Status_Complete()
                                      )

              , tmpMIOrder AS (SELECT Movement.FromId
                                    , MovementItem.ObjectId                                             AS GoodsId
                                    , COALESCE (MILinkObject_GoodsKind.ObjectId, zc_GoodsKind_Basis())  AS GoodsKindId
                                                                              
                                    , SUM (CASE WHEN Movement.OperDate = vbOperDate 
                                                THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0) 
                                                ELSE 0 END)                                             AS Amount1
                                    , SUM (CASE WHEN Movement.OperDate <> Movement.OperDatePartner 
                                                       AND Movement.OperDatePartner = vbOperDate 
                                                      THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0)
                                                      ELSE 0 END)                                       AS Amount2
                                                      
                                      -- ����� ���������� ��� �����, ������� + ������
                                    , SUM (CASE WHEN Movement.OperDate >= vbOperDate AND COALESCE (MIFloat_PromoMovementId.ValueData, 0) = 0 THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0) ELSE 0 END) AS AmountPartner
                                      -- ����� ���������� ������ �����, ������� + ������
                                    , SUM (CASE WHEN Movement.OperDate >= vbOperDate AND COALESCE (MIFloat_PromoMovementId.ValueData, 0) > 0 THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0) ELSE 0 END) AS AmountPartnerPromo
 
                                      -- "������������" ����� ���������� ��� �����, ������
                                    , SUM (CASE WHEN Movement.OperDate >= vbOperDate AND Movement.OperDatePartner > vbOperDate AND COALESCE (MIFloat_PromoMovementId.ValueData, 0) = 0 THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0) ELSE 0 END) AS AmountPartnerNext
                                      -- "������������" ����� ���������� ������ �����, ������
                                    , SUM (CASE WHEN Movement.OperDate >= vbOperDate AND Movement.OperDatePartner > vbOperDate AND COALESCE (MIFloat_PromoMovementId.ValueData, 0) > 0 THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0) ELSE 0 END) AS AmountPartnerNextPromo
                                    
                                      -- ����� ���������� ��� �����, �������� - �����
                                    , SUM (CASE WHEN Movement.OperDate < vbOperDate
                                                 AND Movement.OperDatePartner >= vbOperDate
                                                 AND COALESCE (MIFloat_PromoMovementId.ValueData, 0) = 0
                                                     THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0)
                                                ELSE 0
                                           END) AS AmountPartnerPrior
                                      -- ����� ���������� ������ �����, �������� - �����
                                    , SUM (CASE WHEN Movement.OperDate < vbOperDate
                                                 AND Movement.OperDatePartner >= vbOperDate
                                                 AND COALESCE (MIFloat_PromoMovementId.ValueData, 0) > 0
                                                     THEN COALESCE (MovementItem.Amount,0) + COALESCE (MIFloat_AmountSecond.ValueData, 0)
                                                ELSE 0
                                           END) AS AmountPartnerPriorPromo
                               FROM tmpMovementOrder AS Movement
                                    INNER JOIN MovementItem ON MovementItem.MovementId = Movement.Id
                                                           AND MovementItem.DescId     = zc_MI_Master()
                                                           AND MovementItem.isErased   = FALSE

                                    LEFT JOIN MovementItemLinkObject AS MILinkObject_GoodsKind
                                                                     ON MILinkObject_GoodsKind.MovementItemId = MovementItem.Id
                                                                    AND MILinkObject_GoodsKind.DescId = zc_MILinkObject_GoodsKind()

                                    INNER JOIN tmpGoods_Less ON tmpGoods_Less.GoodsId = MovementItem.ObjectId
                                                            AND tmpGoods_Less.GoodsKindId = COALESCE (MILinkObject_GoodsKind.ObjectId, zc_GoodsKind_Basis())

                                    LEFT JOIN MovementItemFloat AS MIFloat_AmountSecond
                                                                ON MIFloat_AmountSecond.MovementItemId = MovementItem.Id
                                                               AND MIFloat_AmountSecond.DescId = zc_MIFloat_AmountSecond()

                                    LEFT JOIN MovementItemFloat AS MIFloat_PromoMovementId
                                                                ON MIFloat_PromoMovementId.MovementItemId = MovementItem.Id
                                                               AND MIFloat_PromoMovementId.DescId = zc_MIFloat_PromoMovementId()

                               GROUP BY Movement.FromId
                                      , MovementItem.ObjectId
                                      , COALESCE (MILinkObject_GoodsKind.ObjectId, zc_GoodsKind_Basis())
                               )


              
           -- ���������
           SELECT Object_From.Id        AS FromId
                , Object_From.ValueData AS FromName
               
                , tmpGoods_Less.GoodsId         
                , tmpGoods_Less.GoodsCode
                , tmpGoods_Less.GoodsName    
                , tmpGoods_Less.GoodsKindId  
                , tmpGoods_Less.GoodsKindName

                , tmpGoods_Less.MeasureName       
                , tmpGoods_Less.GoodsGroupNameFull
                
                , tmpGoods_Less.Amount_result_pack
                , tmpGoods_Less.Amount_result_pack_pack
                , tmpGoods_Less.AmountPartnerPriorTotal
                , tmpGoods_Less.AmountPartnerTotal
                , tmpGoods_Less.Income_PACK_from
                , tmpGoods_Less.Remains
                , tmpGoods_Less.Remains_pack
                , tmpGoods_Less.AmountPackAllTotal
                
                  -- ����� ���������� ��� �����, ������� + ������
                , (tmpMIOrder.AmountPartner * (CASE WHEN tmpGoods_Less.MeasureId = zc_Measure_Sh() THEN ObjectFloat_Weight.ValueData ELSE 1 END ))          :: TFloat AS AmountPartner
                  -- ����� ���������� ������ �����, ������� + ������
                , (tmpMIOrder.AmountPartnerPromo * (CASE WHEN tmpGoods_Less.MeasureId = zc_Measure_Sh() THEN ObjectFloat_Weight.ValueData ELSE 1 END ))     :: TFloat AS AmountPartnerPromo
                  -- "������������" ����� ���������� ��� �����, ������
                , (tmpMIOrder.AmountPartnerNext * (CASE WHEN tmpGoods_Less.MeasureId = zc_Measure_Sh() THEN ObjectFloat_Weight.ValueData ELSE 1 END ))      :: TFloat AS AmountPartnerNext
                  -- "������������" ����� ���������� ������ �����, ������
                , (tmpMIOrder.AmountPartnerNextPromo * (CASE WHEN tmpGoods_Less.MeasureId = zc_Measure_Sh() THEN ObjectFloat_Weight.ValueData ELSE 1 END )) :: TFloat AS AmountPartnerNextPromo
                  -- ����� ���������� ��� �����, �������� - �����
                , (tmpMIOrder.AmountPartnerPrior * (CASE WHEN tmpGoods_Less.MeasureId = zc_Measure_Sh() THEN ObjectFloat_Weight.ValueData ELSE 1 END ))     :: TFloat AS AmountPartnerPrior
                  -- ����� ���������� ������ �����, �������� - �����
                , (tmpMIOrder.AmountPartnerPriorPromo * (CASE WHEN tmpGoods_Less.MeasureId = zc_Measure_Sh() THEN ObjectFloat_Weight.ValueData ELSE 1 END )):: TFloat AS AmountPartnerPriorPromo

                , 0 :: TFloat AS Amount1         
                , 0 :: TFloat AS Amount2

           FROM tmpMIOrder
                INNER JOIN tmpGoods_Less ON tmpGoods_Less.GoodsId     = tmpMIOrder.GoodsId
                                        AND tmpGoods_Less.GoodsKindId = tmpMIOrder.GoodsKindId
                INNER JOIN Object AS Object_From ON Object_From.Id = tmpMIOrder.FromId

                LEFT JOIN ObjectFloat AS ObjectFloat_Weight
                                      ON ObjectFloat_Weight.ObjectId = tmpMIOrder.GoodsId
                                     AND ObjectFloat_Weight.DescId = zc_ObjectFloat_Goods_Weight()
                
           ORDER BY tmpGoods_Less.GoodsName, Object_From.ValueData

          ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 13.07.18         *
*/

-- ����
-- SELECT * FROM gpSelect_Movement_OrderInternalPackRemainsLess_Print (inMovementId:= 9492049 , inSession:= zfCalc_UserAdmin())
--where GoodsCode = 777