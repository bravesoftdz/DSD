-- Function: gpUpdate_Cash_Accommodation()

DROP FUNCTION IF EXISTS gpUpdate_Cash_Accommodation (Integer, Integer, TVarChar, TVarChar);



CREATE OR REPLACE FUNCTION gpUpdate_Cash_Accommodation(
    IN inGoodsId               Integer   ,  -- ���� ������� <�����> 
 INOUT ioAccommodationID       Integer   ,  -- ��� �����
 INOUT ioAccommodationName     TVarChar  ,  -- �������� �����
    IN inSession               TVarChar     -- ������ ������������
)
  RETURNS RECORD 
AS
$BODY$
   DECLARE vbUserId Integer;
   DECLARE vbUnitId Integer;
   DECLARE vbUnitKey TVarChar;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
    vbUserId:= lpGetUserBySession (inSession);
    vbUnitKey := COALESCE(lpGet_DefaultValue('zc_Object_Unit', vbUserId), '');
    IF vbUnitKey = '' THEN
        RAISE EXCEPTION '�� ���������� �������������';
    END IF;
    vbUnitId := vbUnitKey::Integer;
    
    
    IF COALESCE (inGoodsId, 0) = 0 THEN
        RAISE EXCEPTION '�� �������� ����������';
    END IF;
    
    IF COALESCE (ioAccommodationID, 0) = 0 THEN
        RAISE EXCEPTION '�� �������� ��� ���������� ������';
    END IF;

    IF NOT Exists(SELECT ObjectId FROM ObjectLink AS ObjectLink_Accommodation_Unit
                  WHERE ObjectLink_Accommodation_Unit.ChildObjectId = vbUnitId
                    AND ObjectLink_Accommodation_Unit.ObjectId = ioAccommodationID 
                    AND ObjectLink_Accommodation_Unit.DescId = zc_Object_Accommodation_Unit()) THEN
        RAISE EXCEPTION '��� ���������� ������ �� ������ ��� ����������� ������ ������';
    END IF;

      -- ���� ����� ���
    IF NOT EXISTS (SELECT * FROM AccommodationLincGoods WHERE AccommodationId = ioAccommodationID 
                                                      AND UnitId = vbUnitId
                                                      AND GoodsId = inGoodsId)
    THEN
        -- ������� ����� � <������������> ���� ����
      IF EXISTS (SELECT * FROM AccommodationLincGoods WHERE UnitId = vbUnitId
                                                        AND GoodsId = inGoodsId)
      THEN
        DELETE FROM AccommodationLincGoods WHERE UnitId = vbUnitId AND GoodsId = inGoodsId;
      END IF;
          
        -- ��������� ����� � <������������>
      INSERT INTO AccommodationLincGoods (AccommodationId, UnitId, GoodsId)
      VALUES (ioAccommodationID, vbUnitId, inGoodsId);
    END IF;
   
    SELECT 
      ValueData
    INTO
      ioAccommodationName
    FROM Object
    WHERE ID = ioAccommodationID;

END;$BODY$
  LANGUAGE plpgsql VOLATILE;


-------------------------------------------------------------------------------
/*
 ������� ����������: ����, �����
               ������ �.�.
 21.08.18         *
*/
