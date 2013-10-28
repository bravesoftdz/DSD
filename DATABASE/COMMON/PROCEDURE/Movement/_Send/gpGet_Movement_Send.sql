-- Function: gpGet_Movement_Send()

-- DROP FUNCTION gpGet_Movement_Send (Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpGet_Movement_Send(
    IN inMovementId        Integer  , -- ���� ���������
    IN inSession           TVarChar   -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime, StatusCode Integer, StatusName TVarChar
             , TotalCount TFloat
             , FromId Integer, FromName TVarChar, ToId Integer, ToName TVarChar
              )
AS
$BODY$
BEGIN

     -- �������� ���� ������������ �� ����� ���������
     -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Get_Movement_Send());

     IF COALESCE (inMovementId, 0) = 0
     THEN
     RETURN QUERY 
       SELECT
             0 AS Id
           , CAST (NEXTVAL ('Movement_Send_seq') AS TVarChar) AS InvNumber
           , CAST (CURRENT_DATE AS TDateTime)      AS OperDate
           , lfObject_Status.Code                  AS StatusCode
           , lfObject_Status.Name                  AS StatusName
                      
           , 0::TFloat                   AS TotalCount
          
           , 0                           AS FromId
           , ''::TVarChar                AS FromName
           , 0                           AS ToId
           , ''::TVarChar                AS ToName
          FROM lfGet_Object_Status (zc_Enum_Status_UnComplete()) AS lfObject_Status;
     ELSE

     RETURN QUERY 
       SELECT
             Movement.Id
           , Movement.InvNumber
           , Movement.OperDate
           , Object_Status.ObjectCode          AS StatusCode
           , Object_Status.ValueData           AS StatusName

           , MovementFloat_TotalCount.ValueData          AS TotalCount
          
           , Object_From.Id                    AS FromId
           , Object_From.ValueData             AS FromName
           , Object_To.Id                      AS ToId
           , Object_To.ValueData               AS ToName

       FROM Movement
            LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

            LEFT JOIN MovementFloat AS MovementFloat_TotalCount
                                    ON MovementFloat_TotalCount.MovementId =  Movement.Id
                                   AND MovementFloat_TotalCount.DescId = zc_MovementFloat_TotalCount()
                                   
            LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                         ON MovementLinkObject_From.MovementId = Movement.Id
                                        AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()
            LEFT JOIN Object AS Object_From ON Object_From.Id = MovementLinkObject_From.ObjectId
           
            LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                         ON MovementLinkObject_To.MovementId = Movement.Id
                                        AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()
            LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId

       WHERE Movement.Id =  inMovementId;
       END IF;
  
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE;
ALTER FUNCTION gpGet_Movement_Send (Integer, TVarChar) OWNER TO postgres;


/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 28.10.13                          * ������� ��� ����� �������               
 15.07.13         * ������� �������               
 09.07.13                                        * �������
 08.07.13                                        * zc_MovementFloat_ChangePercent
 30.06.13                                        *

*/

-- ����
-- SELECT * FROM gpGet_Movement_Send (inMovementId:= 1, inSession:= '2')
