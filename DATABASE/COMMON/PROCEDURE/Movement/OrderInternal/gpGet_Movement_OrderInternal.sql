-- Function: gpGet_Movement_OrderInternal()

-- DROP FUNCTION gpGet_Movement_OrderInternal (Integer, TVarChar);
DROP FUNCTION IF EXISTS gpGet_Movement_OrderInternal (Integer, TVarChar);
DROP FUNCTION IF EXISTS gpGet_Movement_OrderInternal (Integer, TDateTime, TVarChar);
DROP FUNCTION IF EXISTS gpGet_Movement_OrderInternal (Integer, TDateTime, Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpGet_Movement_OrderInternal (Integer, TDateTime, Boolean, Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Movement_OrderInternal(
    IN inMovementId        Integer  , -- ���� ���������
    IN inOperDate          TDateTime, -- ���� ���������
    IN inIsPack            Boolean  , -- 
    IN inFromId            Integer ,   -- �� ����
    IN inToId              Integer ,   -- ����
    IN inSession           TVarChar   -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime, StatusCode Integer, StatusName TVarChar
             , OperDatePartner TDateTime, OperDateStart TDateTime, OperDateEnd TDateTime
             , FromId Integer, FromName TVarChar, ToId Integer, ToName TVarChar
             , DayCount TFloat
             , Comment TVarChar
              )
AS
$BODY$
  DECLARE vbUserId Integer;
BEGIN

     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId := PERFORM lpCheckRight (inSession, zc_Enum_Process_Get_Movement_OrderInternal());
     vbUserId := inSession;

     IF COALESCE (inMovementId, 0) = 0
     THEN
     RETURN QUERY
         SELECT
               0 AS Id
             , CAST (NEXTVAL ('movement_orderinternal_seq') AS TVarChar) AS InvNumber
             , inOperDate                                       AS OperDate
             , Object_Status.Code                               AS StatusCode
             , Object_Status.Name                               AS StatusName
             
             , (CASE WHEN inIsPack = TRUE THEN inOperDate ELSE inOperDate + INTERVAL '1 DAY' END) :: TDateTime     AS OperDatePartner
             , (inOperDate - INTERVAL '56 DAY') ::TDateTime     AS OperDateStart
             , (inOperDate - INTERVAL '1 DAY') ::TDateTime      AS OperDateEnd  
                          
             , Object_From.Id                                     AS FromId
             , Object_From.ValueData                              AS FromName
             , Object_To.Id                                       AS ToId
             , Object_To.ValueData                                AS ToName
             , (1 + EXTRACT (DAY FROM ((inOperDate - INTERVAL '1 DAY') - (inOperDate - INTERVAL '56 DAY')))) :: TFloat AS DayCount
             , CAST ('' as TVarChar) 		                  AS Comment

          FROM lfGet_Object_Status(zc_Enum_Status_UnComplete()) AS Object_Status
               LEFT JOIN Object AS Object_From ON Object_From.Id = CASE WHEN inFromId <> 0 
                                                                             THEN inFromId 
                                                                        ELSE 8457 -- ������ ���� + ����������
                                                                   END
               LEFT JOIN Object AS Object_To ON Object_To.Id = CASE WHEN inIsPack = TRUE
                                                                         THEN 8451 -- ��� ��������
                                                                    ELSE CASE WHEN inToId <> 0 
                                                                                   THEN IntoId
                                                                              ELSE 8446 -- ��� �������+���-��
                                                                         END
                                                               END
         ;

     ELSE

     RETURN QUERY
       SELECT
             Movement.Id                                        AS Id
           , Movement.InvNumber                                 AS InvNumber
           , Movement.OperDate                                  AS OperDate
           , Object_Status.ObjectCode                           AS StatusCode
           , Object_Status.ValueData                            AS StatusName

           , MovementDate_OperDatePartner.ValueData     AS OperDatePartner
           , COALESCE (MovementDate_OperDateStart.ValueData, Movement.OperDate - (INTERVAL '56 DAY')) :: TDateTime      AS OperDateStart
           , COALESCE (MovementDate_OperDateEnd.ValueData, Movement.OperDate - (INTERVAL '1 DAY')) :: TDateTime        AS OperDateEnd                      
           
           , Object_From.Id                                     AS FromId
           , Object_From.ValueData                              AS FromName
           , Object_To.Id                                       AS ToId
           , Object_To.ValueData                                AS ToName

           , (1 + EXTRACT (DAY FROM (COALESCE (MovementDate_OperDateEnd.ValueData, Movement.OperDate - (INTERVAL '1 DAY')) :: TDateTime
                                   - COALESCE (MovementDate_OperDateStart.ValueData, Movement.OperDate - (INTERVAL '56 DAY')) :: TDateTime)
                          )) :: TFloat AS DayCount
           , MovementString_Comment.ValueData       AS Comment
            
       FROM Movement
            LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

            LEFT JOIN MovementDate AS MovementDate_OperDatePartner
                                   ON MovementDate_OperDatePartner.MovementId =  Movement.Id
                                  AND MovementDate_OperDatePartner.DescId = zc_MovementDate_OperDatePartner()

            LEFT JOIN MovementDate AS MovementDate_OperDateStart
                                   ON MovementDate_OperDateStart.MovementId =  Movement.Id
                                  AND MovementDate_OperDateStart.DescId = zc_MovementDate_OperDateStart()
            LEFT JOIN MovementDate AS MovementDate_OperDateEnd
                                   ON MovementDate_OperDateEnd.MovementId =  Movement.Id
                                  AND MovementDate_OperDateEnd.DescId = zc_MovementDate_OperDateEnd()

            LEFT JOIN MovementString AS MovementString_Comment 
                                     ON MovementString_Comment.MovementId = Movement.Id
                                    AND MovementString_Comment.DescId = zc_MovementString_Comment() 

            LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                         ON MovementLinkObject_From.MovementId = Movement.Id
                                        AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
            LEFT JOIN Object AS Object_From ON Object_From.Id = MovementLinkObject_From.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                         ON MovementLinkObject_To.MovementId = Movement.Id
                                        AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
            LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId


       WHERE Movement.Id =  inMovementId
         AND Movement.DescId = zc_Movement_OrderInternal();

       END IF;

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;
ALTER FUNCTION gpGet_Movement_OrderInternal (Integer, TDateTime, Boolean, Integer, Integer, TVarChar) OWNER TO postgres;


/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 27.06.15                                        * all
 02.03.15         * add OperDatePartner, OperDateStart, OperDateEnd, DayCount               
 06.06.14                                                        *
*/

-- ����
-- SELECT * FROM gpGet_Movement_OrderInternal (inMovementId:= 1, inOperDate:= NULL, inIsPack:= FALSE, inSession:= zfCalc_UserAdmin())
