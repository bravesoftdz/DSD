-- Function: gpGet_Movement_ReturnIn_ReportName()

DROP FUNCTION IF EXISTS gpGet_Movement_ReturnIn_ReportName (Integer, TVarChar);


CREATE OR REPLACE FUNCTION gpGet_Movement_ReturnIn_ReportName (
    IN inMovementId         Integer  , -- ���� ���������
    IN inSession            TVarChar   -- ������ ������������
)
RETURNS TVarChar
AS
$BODY$
   DECLARE vbPrintFormName TVarChar;
BEGIN

     -- �������� ���� ������������ �� ����� ���������
     -- PERFORM lpCheckRight (inSession, zc_Enum_Process_Get_Movement_Sale());

       SELECT
            COALESCE (PrintForms_View.PrintFormName, PrintForms_View_Default.PrintFormName)
       INTO vbPrintFormName
       FROM Movement

       LEFT JOIN MovementLinkObject AS MovementLinkObject_From
              ON MovementLinkObject_From.MovementId = Movement.Id
             AND MovementLinkObject_From.DescId = zc_MovementLinkObject_From()

       LEFT JOIN ObjectLink AS ObjectLink_Partner_Juridical
              ON ObjectLink_Partner_Juridical.ObjectId = MovementLinkObject_From.ObjectId
             AND ObjectLink_Partner_Juridical.DescId = zc_ObjectLink_Partner_Juridical()

       LEFT JOIN MovementLinkObject AS MovementLinkObject_PaidKind
              ON MovementLinkObject_PaidKind.MovementId = Movement.Id
             AND MovementLinkObject_PaidKind.DescId = zc_MovementLinkObject_PaidKind()

       LEFT JOIN PrintForms_View
              ON Movement.OperDate BETWEEN PrintForms_View.StartDate AND PrintForms_View.EndDate
             AND PrintForms_View.JuridicalId = ObjectLink_Partner_Juridical.ChildObjectId
             AND PrintForms_View.ReportType = 'ReturnIn'
             AND PrintForms_View.DescId = zc_Movement_ReturnIn()

       LEFT JOIN PrintForms_View AS PrintForms_View_Default
              ON Movement.OperDate BETWEEN PrintForms_View_Default.StartDate AND PrintForms_View_Default.EndDate
             AND PrintForms_View_Default.JuridicalId = 0
             AND PrintForms_View_Default.ReportType = 'ReturnIn'
--             AND PrintForms_View_Default.PaidKindId = MovementLinkObject_PaidKind.ObjectId
             AND PrintForms_View_Default.DescId = zc_Movement_ReturnIn()

       WHERE Movement.Id =  inMovementId;
--         AND Movement.DescId = zc_Movement_ReturnIn();

     RETURN (vbPrintFormName);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpGet_Movement_ReturnIn_ReportName (Integer, TVarChar) OWNER TO postgres;


/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.A.
 23.04.14                                                        * + PrintMovement_ReturnIn32049199
 06.02.14                                                        *
*/

-- ����
--SELECT * FROM gpGet_Movement_ReturnIn_ReportName(inMovementId := 139751,  inSession := '5'); -- Metro
--SELECT * FROM gpGet_Movement_ReturnIn_ReportName(inMovementId := 139752,  inSession := '5'); -- ���

--select * from gpSelect_Movement_ReturnIn_Print(inMovementId := 35168 ,  inSession := '5');