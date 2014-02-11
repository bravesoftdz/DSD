-- Function: gpSelect_Movement_TaxCorrective()

DROP FUNCTION IF EXISTS gpSelect_Movement_TaxCorrective (TDateTime, TDateTime, Boolean, Boolean, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Movement_TaxCorrective(
    IN inStartDate      TDateTime , --
    IN inEndDate        TDateTime , --
    IN inIsRegisterDate Boolean ,
    IN inIsErased       Boolean ,
    IN inSession        TVarChar    -- ������ ������������
)
RETURNS TABLE (Id Integer, InvNumber TVarChar, OperDate TDateTime, StatusCode Integer, StatusName TVarChar
             , Checked Boolean, Document Boolean, Registered Boolean, DateRegistered TDateTime
             , PriceWithVAT Boolean, VATPercent TFloat
             , TotalCount TFloat
             , TotalSummMVAT TFloat, TotalSummPVAT TFloat
             , InvNumberPartner TVarChar
             , FromId Integer, FromName TVarChar, ToId Integer, ToName TVarChar
             , ContractId Integer, ContractName TVarChar
             , TaxKindId Integer, TaxKindName TVarChar
             , DocumentMasterId Integer, DocumentMasterName TVarChar
             , DocumentChildId Integer, DocumentChildName TVarChar
              )
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Select_Movement_TaxCorrective());
     vbUserId:= inSession;

     --
     RETURN QUERY
     WITH tmpStatus AS (SELECT zc_Enum_Status_Complete() AS StatusId
                       UNION
                        SELECT zc_Enum_Status_UnComplete() AS StatusId
                       UNION
                        SELECT zc_Enum_Status_Erased() AS StatusId WHERE inIsErased = TRUE
                       )
     SELECT
             Movement.Id								AS Id
           , Movement.InvNumber							AS InvNumber
           , Movement.OperDate							AS OperDate
           , Object_Status.ObjectCode    				AS StatusCode
           , Object_Status.ValueData     				AS StatusName
           , MovementBoolean_Checked.ValueData          AS Checked
           , MovementBoolean_Document.ValueData         AS Document
           , MovementBoolean_Registered.ValueData       AS Registered
           , MovementDate_DateRegistered.ValueData      AS DateRegistered
           , MovementBoolean_PriceWithVAT.ValueData     AS PriceWithVAT
           , MovementFloat_VATPercent.ValueData         AS VATPercent
           , MovementFloat_TotalCount.ValueData         AS TotalCount
           , MovementFloat_TotalSummMVAT.ValueData      AS TotalSummMVAT
           , MovementFloat_TotalSummPVAT.ValueData      AS TotalSummPVAT
           , MovementString_InvNumberPartner.ValueData  AS InvNumberPartner
           , Object_From.Id                    			AS FromId
           , Object_From.ValueData             			AS FromName
           , Object_To.Id                      			AS ToId
           , Object_To.ValueData               			AS ToName
           , Object_Contract.ContractId        			AS ContractId
           , Object_Contract.invnumber         			AS ContractName
           , Object_TaxKind.Id                			AS TaxKindId
           , Object_TaxKind.ValueData         			AS TaxKindName
           , Movement_DocumentMaster.Id                            AS DocumentMasterId
           , CAST(Movement_DocumentMaster.InvNumber as TVarChar)   AS DocumentMasterName
           , CAST(ObjectFloat_DocumentChild.ValueData as INTEGER)  AS DocumentChildId
           , CAST(MS_Child_InvNumberPartner.ValueData as TVarChar) AS DocumentChildName



       FROM (SELECT Movement.id FROM  tmpStatus
               JOIN Movement ON Movement.OperDate BETWEEN inStartDate AND inEndDate  AND Movement.DescId = zc_Movement_TaxCorrective() AND Movement.StatusId = tmpStatus.StatusId
               WHERE inIsRegisterDate = FALSE

             UNION ALL SELECT MovementDate_DateRegistered.movementid  AS Id FROM MovementDate AS MovementDate_DateRegistered
                        JOIN Movement ON Movement.Id = MovementDate_DateRegistered.MovementId AND Movement.DescId = zc_Movement_TaxCorrective()
                        JOIN tmpStatus ON tmpStatus.StatusId = Movement.StatusId
                       WHERE inIsRegisterDate = TRUE AND MovementDate_DateRegistered.ValueData BETWEEN inStartDate AND inEndDate
                         AND MovementDate_DateRegistered.DescId = zc_MovementDate_DateRegistered()
            ) AS tmpMovement

            JOIN Movement ON Movement.id = tmpMovement.id
            LEFT JOIN Object AS Object_Status ON Object_Status.Id = Movement.StatusId

            LEFT JOIN MovementBoolean AS MovementBoolean_Checked
                                      ON MovementBoolean_Checked.MovementId =  Movement.Id
                                     AND MovementBoolean_Checked.DescId = zc_MovementBoolean_Checked()

            LEFT JOIN MovementBoolean AS MovementBoolean_Document
                                      ON MovementBoolean_Document.MovementId =  Movement.Id
                                     AND MovementBoolean_Document.DescId = zc_MovementBoolean_Document()

            LEFT JOIN MovementBoolean AS MovementBoolean_Registered
                                      ON MovementBoolean_Registered.MovementId =  Movement.Id
                                     AND MovementBoolean_Registered.DescId = zc_MovementBoolean_Registered()

            LEFT JOIN MovementDate AS MovementDate_DateRegistered
                                   ON MovementDate_DateRegistered.MovementId =  Movement.Id
                                  AND MovementDate_DateRegistered.DescId = zc_MovementDate_DateRegistered()

            LEFT JOIN MovementBoolean AS MovementBoolean_PriceWithVAT
                                      ON MovementBoolean_PriceWithVAT.MovementId =  Movement.Id
                                     AND MovementBoolean_PriceWithVAT.DescId = zc_MovementBoolean_PriceWithVAT()

            LEFT JOIN MovementString AS MovementString_InvNumberPartner
                                     ON MovementString_InvNumberPartner.MovementId =  Movement.Id
                                    AND MovementString_InvNumberPartner.DescId = zc_MovementString_InvNumberPartner()

            LEFT JOIN MovementFloat AS MovementFloat_VATPercent
                                    ON MovementFloat_VATPercent.MovementId =  Movement.Id
                                   AND MovementFloat_VATPercent.DescId = zc_MovementFloat_VATPercent()

            LEFT JOIN MovementFloat AS MovementFloat_TotalCount
                                    ON MovementFloat_TotalCount.MovementId =  Movement.Id
                                   AND MovementFloat_TotalCount.DescId = zc_MovementFloat_TotalCount()

            LEFT JOIN MovementFloat AS MovementFloat_TotalSummMVAT
                                    ON MovementFloat_TotalSummMVAT.MovementId =  Movement.Id
                                   AND MovementFloat_TotalSummMVAT.DescId = zc_MovementFloat_TotalSummMVAT()

            LEFT JOIN MovementFloat AS MovementFloat_TotalSummPVAT
                                    ON MovementFloat_TotalSummPVAT.MovementId =  Movement.Id
                                   AND MovementFloat_TotalSummPVAT.DescId = zc_MovementFloat_TotalSummPVAT()

            LEFT JOIN MovementLinkObject AS MovementLinkObject_From
                                         ON MovementLinkObject_From.MovementId = Movement.Id
                                        AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()

            LEFT JOIN Object AS Object_From ON Object_From.Id = MovementLinkObject_From.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_To
                                         ON MovementLinkObject_To.MovementId = Movement.Id
                                        AND MovementLinkObject_To.DescId = zc_MovementLinkObject_To()

            LEFT JOIN Object AS Object_To ON Object_To.Id = MovementLinkObject_To.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_DocumentTaxKind
                                         ON MovementLinkObject_DocumentTaxKind.MovementId = Movement.Id
                                        AND MovementLinkObject_DocumentTaxKind.DescId = zc_MovementLinkObject_DocumentTaxKind()

            LEFT JOIN Object AS Object_TaxKind ON Object_TaxKind.Id = MovementLinkObject_DocumentTaxKind.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_Contract
                                         ON MovementLinkObject_Contract.MovementId = Movement.Id
                                        AND MovementLinkObject_Contract.DescId = zc_MovementLinkObject_Contract()

            LEFT JOIN object_contract_invnumber_view AS Object_Contract ON Object_Contract.contractid = MovementLinkObject_Contract.ObjectId

            LEFT JOIN MovementLinkObject AS MovementLinkObject_DocumentMaster
                                         ON MovementLinkObject_DocumentMaster.MovementId = Movement.Id
                                        AND MovementLinkObject_DocumentMaster.DescId = zc_MovementLinkObject_DocumentMaster()

            LEFT JOIN ObjectFloat AS ObjectFloat_DocumentMaster ON ObjectFloat_DocumentMaster.ObjectId = MovementLinkObject_DocumentMaster.ObjectId
                                                               AND ObjectFloat_DocumentMaster.DescId = zc_ObjectFloat_Document_MovementId()

            LEFT JOIN Movement AS Movement_DocumentMaster ON Movement_DocumentMaster.Id = ObjectFloat_DocumentMaster.ValueData

            LEFT JOIN MovementLinkObject AS MovementLinkObject_DocumentChild
                                         ON MovementLinkObject_DocumentChild.MovementId = Movement.Id
                                        AND MovementLinkObject_DocumentChild.DescId = zc_MovementLinkObject_DocumentChild()

            LEFT JOIN ObjectFloat AS ObjectFloat_DocumentChild ON ObjectFloat_DocumentChild.ObjectId = MovementLinkObject_DocumentChild.ObjectId
                                                               AND ObjectFloat_DocumentChild.DescId = zc_ObjectFloat_Document_MovementId()

            LEFT JOIN MovementString AS MS_Child_InvNumberPartner
                                     ON MS_Child_InvNumberPartner.MovementId =  ObjectFloat_DocumentChild.ValueData
                                    AND MS_Child_InvNumberPartner.DescId = zc_MovementString_InvNumberPartner()


            ;



END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpSelect_Movement_TaxCorrective (TDateTime, TDateTime, Boolean, Boolean, TVarChar) OWNER TO postgres;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 10.02.14                                                         *
*/

-- ����
-- SELECT * FROM gpSelect_Movement_TaxCorrective (inStartDate:= '30.01.2013', inEndDate:= '12.12.2014', inIsRegisterDate:=FALSE, inIsErased :=TRUE, inSession:= '2')