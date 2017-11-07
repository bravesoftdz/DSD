-- Function: gpInsertUpdate_Object_Sticker()

DROP FUNCTION IF EXISTS gpInsertUpdate_Object_Sticker(Integer, Integer, TVarChar, Integer, Integer, Integer, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar, TBlob, TFloat, TFloat,TFloat,TFloat,TFloat, TVarChar);

CREATE OR REPLACE FUNCTION gpInsertUpdate_Object_Sticker(
 INOUT ioId                  Integer   , -- ���� ������� <�����>
    IN inCode                Integer   , -- ��� ������� <�����>
    IN inComment             TVarChar  , -- ����������
    IN inJuridicalId         Integer   , -- ������ ��.����, ����.����, ����������
    IN inGoodsId             Integer   , -- �����
    IN inStickerFileId       Integer   , -- 
    IN inStickerGroupName    TVarChar  , -- 
    IN inStickerTypeName     TVarChar  , -- 
    IN inStickerTagName      TVarChar  , -- 
    IN inStickerSortName     TVarChar  , -- 
    IN inStickerNormName     TVarChar  , -- 
    IN inInfo                TBlob     , -- 
    IN inValue1              TFloat    , -- �������� ����
    IN inValue2              TFloat    , -- �������� ����
    IN inValue3              TFloat    , --
    IN inValue4              TFloat    , --
    IN inValue5              TFloat    , --
    IN inSession             TVarChar    -- ������ ������������
)
RETURNS Integer AS
$BODY$
   DECLARE vbUserId            Integer;
   DECLARE vbCode              Integer;   
   DECLARE vbStickerGroupId    Integer;
   DECLARE vbStickerTypeId     Integer;
   DECLARE vbStickerTagId      Integer;
   DECLARE vbStickerSortId     Integer;
   DECLARE vbStickerNormId     Integer;
   DECLARE vbIsUpdate          Boolean;
   
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   vbUserId := lpCheckRight (inSession, zc_Enum_Process_InsertUpdate_Object_Sticker());
   
   -- !!! ���� ��� �� ����������, ���������� ��� ��� ���������+1 (!!! ����� ���� ����� ��� �������� !!!)
   vbCode:=lfGet_ObjectCode (inCode, zc_Object_Sticker());
   
   -- �������� ������������ <���>
   PERFORM lpCheckUnique_Object_ObjectCode (ioId, zc_Object_Sticker(), vbCode);

--       RAISE EXCEPTION '������.�������� <������ �������> ������ ���� �����������.';
  
   -- ���������� <�������>
   vbIsUpdate:= COALESCE (ioId, 0) > 0;
   
   -- ��������� <������>
   ioId := lpInsertUpdate_Object (ioId, zc_Object_Sticker(), vbCode, COALESCE (inComment, ''));

   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_Juridical(), ioId, inJuridicalId);
   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_Goods(), ioId, inGoodsId);
   -- ��������� ���� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_StickerFile(), ioId, inStickerFileId);
   
   -- ��������� �������� <>
   PERFORM lpInsertUpdate_ObjectBlob (zc_ObjectBlob_Sticker_Info(), ioId, inInfo);
   
   -- ��������� �������� <>
   PERFORM lpInsertUpdate_ObjectFloat (zc_ObjectFloat_Sticker_Value1(), ioId, inValue1);
   -- ��������� �������� <>
   PERFORM lpInsertUpdate_ObjectFloat (zc_ObjectFloat_Sticker_Value2(), ioId, inValue2);
   -- ��������� �������� <>
   PERFORM lpInsertUpdate_ObjectFloat (zc_ObjectFloat_Sticker_Value3(), ioId, inValue3);
   -- ��������� �������� <>
   PERFORM lpInsertUpdate_ObjectFloat (zc_ObjectFloat_Sticker_Value4(), ioId, inValue4);
   -- ��������� �������� <>
   PERFORM lpInsertUpdate_ObjectFloat (zc_ObjectFloat_Sticker_Value5(), ioId, inValue5);
   
   -- �������� ����� "��� �������� (������)"
   -- ���� �� ������� ��������� ����� ������� � ����������
   vbStickerGroupId := (SELECT Object.Id FROM Object WHERE Object.DescId = zc_Object_StickerGroup() AND UPPER (TRIM(Object.ValueData)) LIKE UPPER (TRIM(inStickerGroupName)));
   IF COALESCE (vbStickerGroupId, 0) = 0 AND COALESCE (inStickerGroupName, '')<> ''
   THEN
       -- ���������� ����� �������
       vbStickerGroupId := gpInsertUpdate_Object_StickerGroup (ioId     := 0
                                                             , inCode   := lfGet_ObjectCode(0, zc_Object_StickerGroup()) 
                                                             , inName   := TRIM(inStickerGroupName)
                                                             , inComment:= '' ::TVarChar
                                                             , inSession:= inSession
                                                              );
   END IF; 

   -- �������� ����� "������ ������������ ��������"
   -- ���� �� ������� ��������� ����� ������� � ����������
   vbStickerTypeId := (SELECT Object.Id FROM Object WHERE Object.DescId = zc_Object_StickerType() AND UPPER (TRIM(Object.ValueData)) LIKE UPPER (TRIM(inStickerTypeName)));
   IF COALESCE (vbStickerTypeId, 0) = 0 AND COALESCE (inStickerTypeName, '')<> ''
   THEN
       -- ���������� ����� �������
       vbStickerTypeId := gpInsertUpdate_Object_StickerType (ioId     := 0
                                                           , inCode   := lfGet_ObjectCode(0, zc_Object_StickerType()) 
                                                           , inName   := TRIM(inStickerTypeName)
                                                           , inComment:= '' ::TVarChar
                                                           , inSession:= inSession
                                                            );
   END IF;

   -- �������� ����� "�������� ��������"
   -- ���� �� ������� ��������� ����� ������� � ����������
   vbStickerTagId := (SELECT Object.Id FROM Object WHERE Object.DescId = zc_Object_StickerTag() AND UPPER (TRIM(Object.ValueData)) LIKE UPPER (TRIM(inStickerTagName)));
   IF COALESCE (vbStickerTagId, 0) = 0 AND COALESCE (inStickerTagName, '')<> ''
   THEN
       -- ���������� ����� �������
       vbStickerTagId := gpInsertUpdate_Object_StickerTag (ioId     := 0
                                                         , inCode   := lfGet_ObjectCode(0, zc_Object_StickerTag()) 
                                                         , inName   := TRIM(inStickerTagName)
                                                         , inComment:= '' ::TVarChar
                                                         , inSession:= inSession
                                                          );
   END IF;

   -- �������� ����� " 	��������� ��������"
   -- ���� �� ������� ��������� ����� ������� � ����������
   vbStickerSortId := (SELECT Object.Id FROM Object WHERE Object.DescId = zc_Object_StickerSort() AND UPPER (TRIM(Object.ValueData)) LIKE UPPER (TRIM(inStickerSortName)));
   IF COALESCE (vbStickerSortId, 0) = 0 AND COALESCE (inStickerSortName, '')<> ''
   THEN
       -- ���������� ����� �������
       vbStickerSortId := gpInsertUpdate_Object_StickerSort (ioId     := 0
                                                           , inCode   := lfGet_ObjectCode(0, zc_Object_StickerSort()) 
                                                           , inName   := TRIM(inStickerSortName)
                                                           , inComment:= '' ::TVarChar
                                                           , inSession:= inSession
                                                            );
   END IF;

   -- �������� ����� "�� ��� ����"
   -- ���� �� ������� ��������� ����� ������� � ����������
   vbStickerNormId := (SELECT Object.Id FROM Object WHERE Object.DescId = zc_Object_StickerNorm() AND UPPER (TRIM(Object.ValueData)) LIKE UPPER (TRIM(inStickerNormName)));
   IF COALESCE (vbStickerNormId, 0) = 0 AND COALESCE (inStickerNormName, '')<> ''
   THEN
       -- ���������� ����� �������
       vbStickerNormId := gpInsertUpdate_Object_StickerNorm (ioId     := 0
                                                           , inCode   := lfGet_ObjectCode(0, zc_Object_StickerNorm()) 
                                                           , inName   := TRIM(inStickerNormName)
                                                           , inComment:= '' ::TVarChar
                                                           , inSession:= inSession
                                                            );
   END IF;
  

   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_StickerGroup(), ioId, vbStickerGroupId);
   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_StickerType(), ioId, vbStickerTypeId);
   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_StickerTag(), ioId, vbStickerTagId);
   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_StickerSort(), ioId, vbStickerSortId);
   -- ��������� ����� � <>
   PERFORM lpInsertUpdate_ObjectLink (zc_ObjectLink_Sticker_StickerNorm(), ioId, vbStickerNormId);

   -- ��������� ��������
   PERFORM lpInsert_ObjectProtocol (ioId, vbUserId);

END;
$BODY$
  LANGUAGE PLPGSQL VOLATILE;
 
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 23.10.17         *
*/

-- ����
-- SELECT * FROM gpInsertUpdate_Object_Sticker (ioId:=0, inCode:=-1, inName:= 'TEST-Sticker', ... , inSession:= '2')