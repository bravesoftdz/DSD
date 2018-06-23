-- Function: gpGet_PromoCodeUnitToID_ForSite()

DROP FUNCTION IF EXISTS gpGet_PromoCodeUnitToID_ForSite (Integer, TVarChar, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_PromoCodeUnitToID_ForSite (
    IN inUnitID        Integer ,   -- Подразделение
    IN inGUID          TVarChar,   -- Промо код
    IN inSession       TVarChar    -- сессия пользователя
)
RETURNS TABLE (
               MovementID  Integer,
               MovementItemID  Integer
              )
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
    vbUserId := inSession;

    RETURN QUERY
    WITH
      tmpMovement AS (
         SELECT
             Movement.Id                                                    AS MovementId
         FROM Movement

            LEFT JOIN MovementDate AS MovementDate_StartPromo
                                   ON MovementDate_StartPromo.MovementId = Movement.Id
                                  AND MovementDate_StartPromo.DescId = zc_MovementDate_StartPromo()
            LEFT JOIN MovementDate AS MovementDate_EndPromo
                                   ON MovementDate_EndPromo.MovementId = Movement.Id
                                  AND MovementDate_EndPromo.DescId = zc_MovementDate_EndPromo()

            LEFT JOIN MovementBoolean AS MovementBoolean_Electron
                                      ON MovementBoolean_Electron.MovementId =  Movement.Id
                                     AND MovementBoolean_Electron.DescId = zc_MovementBoolean_Electron()

         WHERE Movement.DescId = zc_Movement_PromoCode()
           AND Movement.StatusId = zc_Enum_Status_Complete()
           AND MovementDate_StartPromo.ValueData <= current_date
           AND MovementDate_EndPromo.ValueData >= current_date
           AND COALESCE(MovementBoolean_Electron.ValueData, FALSE) = True
         ORDER BY MovementDate_EndPromo.ValueData LIMIT 1),

      tmpMovementItem AS (SELECT
           M_PromoCode.MovementId
         FROM tmpMovement AS M_PromoCode
            INNER JOIN MovementItem AS MI_PromoCode ON MI_PromoCode.MovementId = M_PromoCode.MovementId
                                   AND MI_PromoCode.DescId = zc_MI_Child()
                                   AND MI_PromoCode.isErased = FALSE
                                   AND COALESCE (MI_PromoCode.Amount, 0) = 1
         WHERE MI_PromoCode.ObjectId  = inUnitID),

      tmpMovementFloat AS (SELECT DISTINCT MovementFloat_MovementItemId.MovementId
                                  , MovementFloat_MovementItemId.ValueData :: Integer As MovementItemId
                             FROM MovementFloat AS MovementFloat_MovementItemId
                             WHERE MovementFloat_MovementItemId.DescId = zc_MovementFloat_MovementItemId())

      SELECT
        MI_PromoCode.MovementId,
        MI_Sign.Id
      FROM tmpMovementItem AS MI_PromoCode
            INNER JOIN MovementItem AS MI_Sign ON MI_Sign.MovementId = MI_PromoCode.MovementId
                                   AND MI_Sign.DescId = zc_MI_Sign()
                                   AND MI_Sign.isErased = FALSE

            INNER JOIN MovementItemString AS MIString_GUID
                                          ON MIString_GUID.MovementItemId = MI_Sign.Id
                                         AND MIString_GUID.DescId = zc_MIString_GUID()

            LEFT JOIN tmpMovementFloat  AS MovementFloat_MovementItemId
                                        ON MovementFloat_MovementItemId.MovementItemId = MI_Sign.Id

            LEFT JOIN MovementItemString AS MIString_Bayer
                                         ON MIString_Bayer.MovementItemId = MI_Sign.Id
                                        AND MIString_Bayer.DescId = zc_MIString_Bayer()

            LEFT JOIN MovementItemDate AS MIDate_Update
                                       ON MIDate_Update.MovementItemId = MI_Sign.Id
                                      AND MIDate_Update.DescId = zc_MIDate_Update()

         WHERE COALESCE (MovementFloat_MovementItemId.MovementId, 0) = 0
           AND COALESCE (MIString_Bayer.ValueData, '') = ''
           AND MIString_GUID.ValueData = inGUID;

END;

$BODY$
  LANGUAGE PLPGSQL VOLATILE;


/*
 ИСТОРИЯ РАЗРАБОТКИ: ДАТА, АВТОР
               Шаблий О.В.
 15.06.18        *
*/
-- select * from gpGet_PromoCodeUnitToID_ForSite(183292, '894ac34f', zfCalc_UserSite());