-- Function: gpComplete_SelectAll_Sybase_ALL()

DROP FUNCTION IF EXISTS gpComplete_SelectAll_Sybase (TDateTime, TDateTime, Boolean);
DROP FUNCTION IF EXISTS gpComplete_SelectAll_Sybase (TDateTime, TDateTime, Boolean, Boolean);

CREATE OR REPLACE FUNCTION gpComplete_SelectAll_Sybase(
    IN inStartDate          TDateTime , -- 
    IN inEndDate            TDateTime , --
    IN inIsSale             Boolean   , -- 
    IN inIsBefoHistoryCost  Boolean
)                              
RETURNS TABLE (MovementId Integer, OperDate TDateTime, InvNumber TVarChar, Code TVarChar, ItemName TVarChar
              )
AS
$BODY$
BEGIN
     -- ���������
     RETURN QUERY 

     -- ���������
     SELECT tmp.MovementId
          , tmp.OperDate
          , tmp.InvNumber
          , tmp.Code
          , tmp.ItemName
     FROM (

--- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--- !!!!!!!!!!!!!!!START - 1._gpComplete_SelectAll_Sybase__ReturnIn!!!!!!!!!!!!!!!
--- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/*
     SELECT DISTINCT
            Movement.Id AS MovementId
          , Movement.OperDate
          , Movement.InvNumber
          , MovementDesc.Code
          , (MovementDesc.ItemName || ' ' || COALESCE (Object_From.ValueData, '') || ' ' || COALESCE (Object_To.ValueData, '')) ::TVarChar AS ItemName
     FROM Movement
          INNER JOIN MovementLinkObject AS MLO_PaidKind ON MLO_PaidKind.MovementId = Movement.Id
                                                       AND MLO_PaidKind.DescId = zc_MovementLinkObject_PaidKind()
                                                       AND MLO_PaidKind.ObjectId = zc_Enum_PaidKind_FirstForm()

          INNER JOIN MovementLinkMovement AS MovementLinkMovement_Master
                                          ON MovementLinkMovement_Master.MovementChildId = Movement.Id
                                         AND MovementLinkMovement_Master.DescId          = zc_MovementLinkMovement_Master()
          -- ������ ����������� ����.
          INNER JOIN Movement AS Movement2 ON Movement2.Id       = MovementLinkMovement_Master.MovementId
                                          AND Movement2.DescId   = zc_Movement_TaxCorrective()
                                          AND Movement2.StatusId = zc_Enum_Status_Complete()

          LEFT JOIN MovementLinkObject AS MLO_From ON MLO_From.MovementId = Movement.Id
                                                  AND MLO_From.DescId = zc_MovementLinkObject_From()
          LEFT JOIN Object AS Object_From ON Object_From.Id = MLO_From.ObjectId
          LEFT JOIN MovementLinkObject AS MLO_To ON MLO_To.MovementId = Movement.Id
                                                AND MLO_To.DescId = zc_MovementLinkObject_To()
          LEFT JOIN Object AS Object_To ON Object_To.Id = MLO_To.ObjectId
          LEFT JOIN MovementDesc ON MovementDesc.Id = Movement.DescId

     WHERE Movement.OperDate BETWEEN inStartDate AND inEndDate
       AND Movement.DescId = zc_Movement_ReturnIn()
       AND Movement.StatusId = zc_Enum_Status_Complete()
*/

--- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--- !!!!!!!!!!!!!!!START - 2. gpUpdate_Movement_ReturnIn_Auto_OLD!!!!!!!!!!!!!!!
--- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/*     SELECT DISTINCT
            Movement.Id AS MovementId
          , Movement.OperDate
          , Movement.InvNumber
          , MovementDesc.Code
          , (MovementDesc.ItemName || ' ' || COALESCE (Object_From.ValueData, '') || ' ' || COALESCE (Object_To.ValueData, '')) ::TVarChar AS ItemName
     FROM Movement
          INNER JOIN MovementLinkObject AS MLO_PaidKind ON MLO_PaidKind.MovementId = Movement.Id
                                                       AND MLO_PaidKind.DescId = zc_MovementLinkObject_PaidKind()
                                                       AND MLO_PaidKind.ObjectId = zc_Enum_PaidKind_FirstForm()

          INNER JOIN MovementLinkObject AS MovementLinkObject_DocumentTaxKind
                                        ON MovementLinkObject_DocumentTaxKind.MovementId = Movement.Id
                                       AND MovementLinkObject_DocumentTaxKind.DescId     = zc_MovementLinkObject_DocumentTaxKind()
                                       AND MovementLinkObject_DocumentTaxKind.ObjectId  IN (zc_Enum_DocumentTaxKind_CorrectiveSummaryJuridicalR()
                                                                                          , zc_Enum_DocumentTaxKind_CorrectiveSummaryJuridicalSR()
                                                                                          , zc_Enum_DocumentTaxKind_CorrectiveSummaryPartnerR()
                                                                                          , zc_Enum_DocumentTaxKind_CorrectiveSummaryPartnerSR()
                                                                                           )

          LEFT JOIN MovementLinkObject AS MLO_From ON MLO_From.MovementId = Movement.Id
                                                  AND MLO_From.DescId = zc_MovementLinkObject_From()
          LEFT JOIN Object AS Object_From ON Object_From.Id = MLO_From.ObjectId
          LEFT JOIN MovementLinkObject AS MLO_To ON MLO_To.MovementId = Movement.Id
                                                AND MLO_To.DescId = zc_MovementLinkObject_To()
          LEFT JOIN Object AS Object_To ON Object_To.Id = MLO_To.ObjectId
          LEFT JOIN MovementDesc ON MovementDesc.Id = Movement.DescId

     WHERE Movement.OperDate BETWEEN '21.04.2016' AND '31.05.2016'
       AND Movement.DescId = zc_Movement_ReturnIn()
       AND Movement.StatusId = zc_Enum_Status_Complete()

   union*/
     SELECT DISTINCT
            Movement.Id AS MovementId
          , Movement.OperDate
          , Movement.InvNumber
          , MovementDesc.Code
          , (MovementDesc.ItemName || ' ' || COALESCE (Object_From.ValueData, '') || ' ' || COALESCE (Object_To.ValueData, '')) ::TVarChar AS ItemName
     FROM Movement
          INNER JOIN MovementLinkObject AS MLO_PaidKind ON MLO_PaidKind.MovementId = Movement.Id
                                                       AND MLO_PaidKind.DescId = zc_MovementLinkObject_PaidKindFrom()
                                                       AND MLO_PaidKind.ObjectId = zc_Enum_PaidKind_FirstForm()

          LEFT JOIN MovementLinkObject AS MovementLinkObject_Contract
                                        ON MovementLinkObject_Contract.MovementId = Movement.Id
                                       AND MovementLinkObject_Contract.DescId     = zc_MovementLinkObject_Contract()

          LEFT JOIN MovementLinkObject AS MovementLinkObject_DocumentTaxKind
                                        ON MovementLinkObject_DocumentTaxKind.MovementId = Movement.Id
                                       AND MovementLinkObject_DocumentTaxKind.DescId     = zc_MovementLinkObject_DocumentTaxKind()

          LEFT JOIN MovementString ON MovementString.MovementId = Movement.Id
                                  AND MovementString.DescId = zc_MovementString_Comment()

          LEFT JOIN MovementLinkObject AS MLO_From ON MLO_From.MovementId = Movement.Id
                                                  AND MLO_From.DescId = zc_MovementLinkObject_From()
          LEFT JOIN Object AS Object_From ON Object_From.Id = MLO_From.ObjectId
          LEFT JOIN MovementLinkObject AS MLO_To ON MLO_To.MovementId = Movement.Id
                                                AND MLO_To.DescId = zc_MovementLinkObject_To()
          LEFT JOIN Object AS Object_To ON Object_To.Id = MLO_To.ObjectId
          LEFT JOIN MovementDesc ON MovementDesc.Id = Movement.DescId

            LEFT JOIN ObjectLink AS ObjectLink_Partner_Juridical
                                 ON ObjectLink_Partner_Juridical.ObjectId = MLO_From.ObjectId
                                AND ObjectLink_Partner_Juridical.DescId = zc_ObjectLink_Partner_Juridical()
          /*INNER JOIN _tmpKN_err_06062016 ON JuridicalId = ObjectLink_Partner_Juridical.ChildObjectId
                                        AND ContractId  = MovementLinkObject_Contract.ObjectId*/

     WHERE Movement.OperDate BETWEEN inStartDate AND inEndDate
       AND Movement.DescId = zc_Movement_TransferDebtIn()
       AND Movement.StatusId = zc_Enum_Status_Complete()
       -- AND NOT (COALESCE (MovementString.ValueData, '') LIKE '???%')
       AND MovementLinkObject_DocumentTaxKind.ObjectId = zc_Enum_DocumentTaxKind_Corrective()

    ) AS tmp
    ;

END;$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.
 17.05.16                                        *
*/

-- ����
-- SELECT * FROM gpComplete_SelectAll_Sybase (inStartDate:= '01.01.2016', inEndDate:= '31.01.2016', inIsSale:= TRUE, inIsBefoHistoryCost:= TRUE)
-- SELECT * FROM gpComplete_SelectAll_Sybase (inStartDate:= '01.01.2016', inEndDate:= '31.01.2016', inIsSale:= TRUE, inIsBefoHistoryCost:= FALSE)
