-- Function: gpUpdate_Object_Partner_Address()

DROP FUNCTION IF EXISTS gpUpdate_Object_Partner_AddressLoad (Integer, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar,  TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar);

DROP FUNCTION IF EXISTS gpUpdate_Object_Partner_AddressLoad (Integer, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar,  TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar);

DROP FUNCTION IF EXISTS gpUpdate_Object_Partner_AddressLoad (Integer, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar,  TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar, TVarChar, TVarChar, TVarChar
                                                       , TVarChar);

CREATE OR REPLACE FUNCTION gpUpdate_Object_Partner_AddressLoad(
    IN inId                  Integer   ,    -- ���� ������� <����������> 
    IN inPartnerName         TVarChar  ,    -- ������������ �����������
    IN inJuridicalName       TVarChar  ,    -- ������������ 
    IN inOKPO                TVarChar  ,    -- ����
    IN inRegionName          TVarChar  ,    -- ������������ �������
    IN inProvinceName        TVarChar  ,    -- ������������ �����
    IN inCityName            TVarChar  ,    -- ������������ ���������� �����
    IN inCityKindName        TVarChar  ,    -- ��� ����������� ������
    IN inProvinceCityName    TVarChar  ,    -- ����������
    IN inPostalCode          TVarChar  ,    -- ������
    IN inStreetName          TVarChar  ,    -- ������������ �����
    IN inStreetKindName      TVarChar  ,    -- ��� �����
    IN inHouseNumber         TVarChar  ,    -- ����� ����
    IN inCaseNumber          TVarChar  ,    -- ����� �������
    IN inRoomNumber          TVarChar  ,    -- ����� ��������
    IN inShortName           TVarChar  ,    -- �������� �����������

    IN inOrderName           TVarChar  ,    -- ������
    IN inOrderPhone          TVarChar  ,    --
    IN inOrderMail           TVarChar  ,    --

    IN inDocName             TVarChar  ,    -- ��������
    IN inDocPhone            TVarChar  ,    --
    IN inDocMail             TVarChar  ,    --

    IN inActName             TVarChar  ,    -- ����
    IN inActPhone            TVarChar  ,    --
    IN inActMail             TVarChar  ,    --
    
    IN inPersonal            TVarChar  ,    -- ��������� (�����������)
    IN inPersonalTrade       TVarChar  ,    -- ��������� (��������)
    IN inArea                TVarChar  ,    -- ������
    IN inRetailName          TVarChar  ,    -- �������� ����
    IN inPartnerTag          TVarChar  ,    -- ������� �������� �����

    IN inSession             TVarChar       -- ������ ������������
)
  RETURNS VOID AS
$BODY$
   DECLARE vbUserId                Integer;

   DECLARE vbRetailId              Integer;
   DECLARE vbPersonalId            Integer;
   DECLARE vbPersonalTradeId       Integer;
   DECLARE vbAreaId                Integer;
   DECLARE vbPartnerTagId          Integer; 
   DECLARE vbCityKindId            Integer; 
   DECLARE vbStreetKindId          Integer; 
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   vbUserId := lpCheckRight(inSession, zc_Enum_Process_Update_Object_Partner_Address());


   -- ���������� ������ ������� � Excel
   IF COALESCE (inId, 0) = 0
      AND TRIM (COALESCE (inPartnerNamem, '')) = ''
      AND TRIM (COALESCE (inOKPO, '')) = ''
      AND TRIM (COALESCE (inRetailName, '')) = ''
      AND TRIM (COALESCE (inRegionName, '')) = ''
      AND TRIM (COALESCE (inProvinceName, '')) = ''
      AND TRIM (COALESCE (inCityName, '')) = ''
      AND TRIM (COALESCE (inCityKindName, '')) = ''
      AND TRIM (COALESCE (inProvinceCityName, '')) = ''
      AND TRIM (COALESCE (inPostalCode, '')) = ''
      AND TRIM (COALESCE (inStreetName, '')) = ''
      AND TRIM (COALESCE (inStreetKindName, '')) = ''
      AND TRIM (COALESCE (inHouseNumber, '')) = ''
      AND TRIM (COALESCE (inCaseNumber, '')) = ''
      AND TRIM (COALESCE (inRoomNumber, '')) = ''
      AND TRIM (COALESCE (inShortName, '')) = ''

      AND TRIM (COALESCE (inOrderName, '')) = ''
      AND TRIM (COALESCE (inOrderPhone, '')) = ''
      AND TRIM (COALESCE (inOrderMail, '')) = ''

      AND TRIM (COALESCE (inDocName, '')) = ''
      AND TRIM (COALESCE (inDocPhone, '')) = ''
      AND TRIM (COALESCE (inDocMail, '')) = ''

      AND TRIM (COALESCE (inActName, '')) = ''
      AND TRIM (COALESCE (inActPhone, '')) = ''
      AND TRIM (COALESCE (inActMail, '')) = ''
    
      AND TRIM (COALESCE (inPersonal, '')) = ''
      AND TRIM (COALESCE (inPersonalTrade, '')) = ''
      AND TRIM (COALESCE (inArea, '')) = ''
      AND TRIM (COALESCE (inPartnerTag, '')) = ''
   THEN
      RETURN;
   END IF;


   -- ��������
   IF COALESCE (inId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ���������� �������� <����>.', inPartnerName;
   END IF;
   -- ��������
   IF COALESCE (TRIM (inStreetName), '') = '' THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ���������� �������� <�����>.', inPartnerName;
   END IF;


   -- �����
   vbRetailId:= (SELECT Id FROM Object WHERE DescId = zc_Object_Retail() AND TRIM (ValueData) = TRIM (inRetailName));
   -- ��������
   IF COALESCE (vbRetailId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� <%> � ����������� <�������� ����>.', inPartnerName, inRetailName;
   END IF;


   -- �����
   vbPersonalId:= (SELECT MAX (PersonalId) FROM Object_Personal_View WHERE isMain = TRUE AND TRIM (PersonalName) = TRIM (inPersonal));
   -- ��������
   IF COALESCE (vbPersonalId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� ������������ <%> � ����������� <����������>.', inPartnerName, inPersonal;
   END IF;


   -- �����
   vbPersonalTradeId:= (SELECT MAX (PersonalId) FROM Object_Personal_View WHERE isMain = TRUE AND TRIM (PersonalName) = TRIM (inPersonalTrade));
   -- ��������
   IF COALESCE (vbPersonalTradeId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� �������� ������������� <%> � ����������� <����������>.', inPartnerName, inPersonalTrade;
   END IF;


   -- �����
   vbAreaId:= (SELECT Id FROM Object WHERE DescId = zc_Object_Area() AND TRIM (ValueData) = TRIM (inArea));
   -- ��������
   IF COALESCE (vbAreaId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� <%> � ����������� <�������>.', inPartnerName, inArea;
   END IF;


   -- �����
   vbPartnerTagId:= (SELECT Id FROM Object WHERE DescId = zc_Object_PartnerTag() AND TRIM (ValueData) = TRIM (inPartnerTag));
   -- ��������
   IF COALESCE (vbPartnerTagId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� <%> � ����������� <������� �������� �����>.', inPartnerName, inPartnerTag;
   END IF;


   -- �����
   vbCityKindId:= (SELECT Id FROM Object WHERE DescId = zc_Object_CityKind() AND TRIM (ValueData) = TRIM (inCityKindName));
   -- ��������
   IF COALESCE (vbCityKindId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� <%> � ����������� <��� ����������� ������>.', inPartnerName, inCityKindName;
   END IF;


   -- �����
   vbStreetKindId:= (SELECT Id FROM Object WHERE DescId = zc_Object_StreetKind() AND TRIM (ValueData) = TRIM (inStreetKindName));
   -- ��������
   IF COALESCE (vbStreetKindId, 0) = 0 THEN
      RAISE EXCEPTION '������.��� ����������� <%> �� ������� �������� <%> � ����������� <��� (�����,��������)>.', inPartnerName, inStreetKindName;
   END IF;


  -- ���������
  PERFORM  lpUpdate_Object_Partner_Address( inId                := inId
                                          , inJuridicalId       := (SELECT ChildObjectId FROM ObjectLink WHERE ObjectId = inId AND DescId = zc_ObjectLink_Partner_Juridical())
                                          , inShortName         := inShortName
                                          , inCode              := (SELECT ObjectCode FROM Object WHERE Id = inId)
                                          , inRegionName        := inRegionName
                                          , inProvinceName      := inProvinceName
                                          , inCityName          := inCityName
                                          , inCityKindId        := vbCityKindId
                                          , inProvinceCityName  := inProvinceCityName  
                                          , inPostalCode        := inPostalCode
                                          , inStreetName        := inStreetName
                                          , inStreetKindId      := vbStreetKindId
                                          , inHouseNumber       := inHouseNumber
                                          , inCaseNumber        := inCaseNumber  
                                          , inRoomNumber        := inRoomNumber
                                          , inIsCheckUnique     := FALSE
                                          , inSession           := inSession
                                          , inUserId            := vbUserId
                                           );

   -- ��������� ����� !!!�� ����!!! � <�������� ����)>
   PERFORM lpInsertUpdate_ObjectLink( zc_ObjectLink_Juridical_Personal(), (SELECT ChildObjectId FROM ObjectLink WHERE ObjectId = inId AND DescId = zc_ObjectLink_Partner_Juridical()), vbRetailId);

   -- ��������� ����� � <��������� (�����������)>
   PERFORM lpInsertUpdate_ObjectLink( zc_ObjectLink_Partner_Personal(), inId, vbPersonalId);
   -- ��������� ����� � <��������� (��������)>
   PERFORM lpInsertUpdate_ObjectLink( zc_ObjectLink_Partner_PersonalTrade(), inId, vbPersonalTradeId);
   -- ��������� ����� � <������>
   PERFORM lpInsertUpdate_ObjectLink( zc_ObjectLink_Partner_Area(), inId, vbAreaId);
   -- ��������� ����� � <������� �������� �����>
   PERFORM lpInsertUpdate_ObjectLink( zc_ObjectLink_Partner_PartnerTag(), inId, vbPartnerTagId);


END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 09.12.14                                        * all
 01.12.14                        *
*/

-- ����
-- SELECT * FROM gpUpdate_Object_Partner_Address()


