-- Function: gpUpdate_PeriodClose_CloseDate (Integer, Integer, Integer, TVarChar)

DROP FUNCTION IF EXISTS gpUpdate_PeriodClose_all (TDateTime, TVarChar);
DROP FUNCTION IF EXISTS gpUpdate_PeriodClose_CloseDate (Integer, TDateTime, TVarChar);

CREATE OR REPLACE FUNCTION gpUpdate_PeriodClose_CloseDate(
    IN inId	        Integer   ,     -- ���� �������
    IN inCloseDate      TDateTime ,     -- �������� ������
    IN inSession        TVarChar        -- ������ ������������
)
RETURNS VOID
AS
$BODY$
   DECLARE vbUserId Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_...());
   vbUserId:= lpGetUserBySession (inSession);

   -- �������� ������� ����������� �� �������� <���� �������>
   UPDATE PeriodClose SET OperDate  = CURRENT_TIMESTAMP
                        , UserId    = vbUserId
                        , CloseDate = inCloseDate
                        , Period    = '0 DAY' :: INTERVAL
   WHERE Id = inId;
  
END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 28.04.16                                        *
*/

-- ����
-- SELECT * FROM gpUpdate_PeriodClose_CloseDate()