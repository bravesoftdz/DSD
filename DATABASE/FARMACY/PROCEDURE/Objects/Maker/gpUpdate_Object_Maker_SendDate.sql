-- Function: gpUpdate_Object_Maker_SendDate (Integer,Integer,Integer,TVarChar)

DROP FUNCTION IF EXISTS gpUpdate_Object_Maker_SendDate (Integer,Integer,Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpUpdate_Object_Maker_SendDate(
 INOUT ioId              Integer   ,    -- ���� ������� <�������������>
    IN inAddMonth        Integer   ,    -- �������� ����� � ��������
    IN inAddDay          Integer   ,    -- �������� ��� � ��������
    IN inSession         TVarChar       -- ������ ������������
)
 RETURNS Integer AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbSendPlan TDateTime;    
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   --vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Object_Maker());
   vbUserId := inSession; 

   IF not EXISTS(SELECT * FROM Object WHERE Object.DescId = zc_Object_Maker() and Object.Id = ioId)
   THEN
        RAISE EXCEPTION '������.������������� �� ������.'; 
   END IF;

   IF EXISTS(SELECT * FROM ObjectDate WHERE ObjectDate.DescId = zc_ObjectDate_Maker_SendPlan() and ObjectDate.ObjectId = ioId)
   THEN
     SELECT 
       ObjectDate.ValueData
     INTO
       vbSendPlan
     FROM ObjectDate 
     WHERE ObjectDate.DescId = zc_ObjectDate_Maker_SendPlan() and ObjectDate.ObjectId = ioId;
     
     IF COALESCE (inAddMonth, 0) <> 0 
     THEN
       vbSendPlan := vbSendPlan + inAddMonth * interval '1 month';
     ELSE
       vbSendPlan := vbSendPlan + inAddDay * interval '1 day';     
     END IF;

     -- ��������� �������� <>
     PERFORM lpInsertUpdate_ObjectDate (zc_ObjectDate_Maker_SendPlan(), ioId, vbSendPlan);
     
   END IF;

   PERFORM lpInsertUpdate_ObjectDate (zc_ObjectDate_Maker_SendReal(), ioId, CURRENT_TIMESTAMP);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);

END;
$BODY$ LANGUAGE plpgsql;

-------------------------------------------------------------------------------
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 25.01.19                                                       *
 
*/

-- ����
-- SELECT * FROM gpUpdate_Object_Maker_SendDate()