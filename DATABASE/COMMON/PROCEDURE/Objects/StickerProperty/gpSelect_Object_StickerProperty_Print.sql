-- Function: gpSelect_Object_Sticker_Print()

DROP FUNCTION IF EXISTS gpSelect_Object_StickerProperty_Print (Integer, TVarChar);
DROP FUNCTION IF EXISTS gpSelect_Object_StickerProperty_Print (Integer, Boolean, TVarChar);
DROP FUNCTION IF EXISTS gpSelect_Object_StickerProperty_Print(Integer, Boolean, Boolean, Boolean, Boolean, Boolean, Boolean, TDateTime, TDateTime, TDateTime, TDateTime, TFloat, TFloat, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Object_StickerProperty_Print(
    IN inObjectId          Integer  , -- ���� ��������
    IN inIsJPG             Boolean  , --
    IN inIsLength          Boolean  , --

    IN inIsStartEnd        Boolean  , -- 1 - �������� ���� ���/������ ������-�� �� ��������
    IN inIsTare            Boolean  , -- 2 - �������� ��� ����
    IN inIsPartion         Boolean  , -- 3 - �������� ������ ��� ����
    IN inIsGoodsName       Boolean  , -- �������� �������� ���. (��� ����� 2,3)

    IN inDateStart         TDateTime, -- ���. ���� (��� ����� 1)
    IN inDateTare          TDateTime, -- ���� ��� ����  (��� ����� 2)

    IN inDatePack          TDateTime, -- ���� ��������  (��� ����� 3)
    IN inDateProduction    TDateTime, -- ���� ������-�� (��� ����� 3)
    IN inNumPack           TFloat   , -- � ������  ��������, �� ��������� = 1 (��� ����� 3)
    IN inNumTech           TFloat   , -- � ����� ����������, �� ��������� = 1 (��� ����� 3)

    IN inSession           TVarChar   -- ������ ������������
)
RETURNS TABLE (Id Integer, Code Integer, Comment TVarChar
             , StickerId Integer
             , GoodsId Integer, GoodsCode Integer, GoodsName TVarChar
             , GoodsKindId Integer, GoodsKindName TVarChar
             , StickerPackId Integer, StickerPackName TVarChar
             , StickerFileId Integer, StickerFileName TVarChar, TradeMarkName_StickerFile TVarChar
             , StickerSkinId Integer, StickerSkinName TVarChar
             , isFix Boolean
             , Value1 TFloat, Value2 TFloat, Value3 TFloat, Value4 TFloat, Value5 TFloat, Value6 TFloat, Value7 TFloat
             , BarCode TVarChar
             , Sticker_Value1 TFloat, Sticker_Value2 TFloat, Sticker_Value3 TFloat, Sticker_Value4 TFloat, Sticker_Value5 TFloat

             , Level1           TVarChar
             , Level2           TVarChar
             , StickerGroupName TVarChar
             , StickerTypeName  TVarChar
             , StickerTagName   TVarChar
             , StickerSortName  TVarChar
             , StickerNormName  TVarChar
             , Info Text

             , isJPG             Boolean
             , isStartEnd        Boolean
             , isTare            Boolean
             , isPartion         Boolean
             , isGoodsName       Boolean

             , DateStart         TDateTime
             , DateEnd           TDateTime

             , DateTare          TDateTime
             , DatePack          TDateTime
             , DateProduction    TDateTime
             , NumPack           TFloat
             , NumTech           TFloat
              )
AS
$BODY$
    DECLARE vbUserId Integer;

    DECLARE vbStickerFileId Integer;
    DECLARE vbParam1        Integer;
    DECLARE vbParam2        Integer;
    DECLARE vbAddLeft1      Integer;
    DECLARE vbAddLeft2      Integer;
    DECLARE vbAddLine       Integer;
BEGIN
     -- �������� ���� ������������ �� ����� ���������
     vbUserId:= lpGetUserBySession (inSession);

     -- ��������
     -- IF inIsTare = TRUE AND inIsPartion = TRUE
     --   THEN
     --    RAISE EXCEPTION '������.�������� ������������ ��������� ������.';
     --END IF;


     -- ����� �������
     vbStickerFileId:= (WITH -- ������� "�� ���������" - ��� ���������� ��
                             tmpStickerFile AS (SELECT Object_StickerFile.Id                          AS StickerFileId
                                                     , ObjectLink_StickerFile_TradeMark.ChildObjectId AS TradeMarkId
                                                FROM Object AS Object_StickerFile
                                                     LEFT JOIN ObjectLink AS ObjectLink_StickerFile_Juridical
                                                                          ON ObjectLink_StickerFile_Juridical.ObjectId = Object_StickerFile.Id
                                                                         AND ObjectLink_StickerFile_Juridical.DescId   = zc_ObjectLink_StickerFile_Juridical()
                                                     INNER JOIN ObjectLink AS ObjectLink_StickerFile_TradeMark
                                                                           ON ObjectLink_StickerFile_TradeMark.ObjectId = Object_StickerFile.Id
                                                                          AND ObjectLink_StickerFile_TradeMark.DescId = zc_ObjectLink_StickerFile_TradeMark()

                                                     INNER JOIN ObjectBoolean AS ObjectBoolean_Default
                                                                              ON ObjectBoolean_Default.ObjectId  = Object_StickerFile.Id
                                                                             AND ObjectBoolean_Default.DescId    = zc_ObjectBoolean_StickerFile_Default()
                                                                             AND ObjectBoolean_Default.ValueData = TRUE

                                                WHERE Object_StickerFile.DescId   = zc_Object_StickerFile()
                                                  AND Object_StickerFile.isErased = FALSE
                                                  AND ObjectLink_StickerFile_Juridical.ChildObjectId IS NULL -- !!!����������� ��� ����������!!!
                                               )
                        -- ���������
                        SELECT Object_StickerFile.Id AS StickerFileId
                        FROM Object AS Object_StickerProperty
                             -- �������������� - �������� ��������
                             LEFT JOIN ObjectLink AS ObjectLink_StickerProperty_StickerFile
                                                  ON ObjectLink_StickerProperty_StickerFile.ObjectId = Object_StickerProperty.Id
                                                 AND ObjectLink_StickerProperty_StickerFile.DescId   = zc_ObjectLink_StickerProperty_StickerFile()

                             LEFT JOIN ObjectLink AS ObjectLink_StickerProperty_Sticker
                                                  ON ObjectLink_StickerProperty_Sticker.ObjectId = Object_StickerProperty.Id
                                                 AND ObjectLink_StickerProperty_Sticker.DescId   = zc_ObjectLink_StickerProperty_Sticker()
                             -- �������������� - ��������
                             LEFT JOIN ObjectLink AS ObjectLink_Sticker_StickerFile
                                                  ON ObjectLink_Sticker_StickerFile.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                                 AND ObjectLink_Sticker_StickerFile.DescId = zc_ObjectLink_Sticker_StickerFile()

                             LEFT JOIN ObjectLink AS ObjectLink_Sticker_Goods
                                                  ON ObjectLink_Sticker_Goods.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                                 AND ObjectLink_Sticker_Goods.DescId   = zc_ObjectLink_Sticker_Goods()
                             LEFT JOIN ObjectLink AS ObjectLink_Goods_TradeMark
                                                  ON ObjectLink_Goods_TradeMark.ObjectId = ObjectLink_Sticker_Goods.ChildObjectId
                                                 AND ObjectLink_Goods_TradeMark.DescId   = zc_ObjectLink_Goods_TradeMark()
                             -- "�� ���������" - ��� ���������� ��
                             LEFT JOIN tmpStickerFile ON tmpStickerFile.TradeMarkId = ObjectLink_Goods_TradeMark.ChildObjectId

                             LEFT JOIN Object AS Object_StickerFile ON Object_StickerFile.Id = COALESCE (ObjectLink_StickerProperty_StickerFile.ChildObjectId, COALESCE (ObjectLink_Sticker_StickerFile.ChildObjectId, tmpStickerFile.StickerFileId))
                        WHERE Object_StickerProperty.Id = inObjectId
                       );

     -- ������� �������� ������� �����, �.�. ��� ����� ����� - ��������� ����
     vbAddLeft1:= COALESCE ((SELECT ObF.ValueData :: Integer FROM ObjectFloat AS ObF WHERE ObF.ObjectId = vbStickerFileId AND ObF.DescId = zc_ObjectFloat_StickerFile_Left1() AND ObF.ValueData > 0), 0);
     vbAddLeft2:= COALESCE ((SELECT ObF.ValueData :: Integer FROM ObjectFloat AS ObF WHERE ObF.ObjectId = vbStickerFileId AND ObF.DescId = zc_ObjectFloat_StickerFile_Left2() AND ObF.ValueData > 0), 0);
                 /*CASE (SELECT ObjectLink_StickerFile_TradeMark.ChildObjectId
                       FROM ObjectLink AS ObjectLink_StickerFile_TradeMark
                       WHERE ObjectLink_StickerFile_TradeMark.ObjectId = vbStickerFileId
                         AND ObjectLink_StickerFile_TradeMark.DescId   = zc_ObjectLink_StickerFile_TradeMark()
                      )
                      -- WHEN 340617 -- �� ����� ���� (�����)
                      --      THEN 40
                      -- WHEN 340618 -- �� ����� (�����)
                      --     THEN 62
                      WHEN 0
                           THEN 0
                      ELSE 0
                 END;*/

     -- ��� ����� ����� Level1 - StickerType - ��������� � Level2 + ��� ���� ���� � Level2 � 2 ������
     vbParam1:= COALESCE ((SELECT ObF.ValueData :: Integer FROM ObjectFloat AS ObF WHERE ObF.ObjectId = vbStickerFileId AND ObF.DescId = zc_ObjectFloat_StickerFile_Level1() AND ObF.ValueData > 0), 30);
                /*CASE vbAddLeft
                     WHEN 40 -- �� ����� ���� (�����)
                          THEN 25
                     WHEN 62 -- �� ����� (�����)
                          THEN 25
                    ELSE 25 -- 30
                END;*/
     -- ��� ����� ����� Level2 - StickerSort � StickerNorm - ��������� � 2 ������
     vbParam2:= COALESCE ((SELECT ObF.ValueData :: Integer FROM ObjectFloat AS ObF WHERE ObF.ObjectId = vbStickerFileId AND ObF.DescId = zc_ObjectFloat_StickerFile_Level2() AND ObF.ValueData > 0), 30);
                /*CASE vbAddLeft
                     WHEN 40 -- �� ����� ���� (�����)
                          THEN 20
                     WHEN 62 -- �� ����� (�����)
                          THEN 20
                    ELSE 25 -- 30
                END;*/

     -- ��� �� ������� � ��������� ����� ��� Level1 ��� Level2, ����� �� ��������� ������ ����� �����
     vbAddLine:= 0;


     -- ��������
--     IF COALESCE (vbStickerFileId, 0) = 0
--     THEN
--          RAISE EXCEPTION '������.������ �� ����������';
--     END IF;


     -- ���������
     RETURN QUERY
       WITH 
       tmpLanguageParam AS (SELECT ObjectString_Value1.ValueData  AS Value1
                                 , ObjectString_Value2.ValueData  AS Value2
                                 , ObjectString_Value3.ValueData  AS Value3
                                 , ObjectString_Value4.ValueData  AS Value4
                                 , ObjectString_Value5.ValueData  AS Value5
                                 , ObjectString_Value6.ValueData  AS Value6
                                 , ObjectString_Value7.ValueData  AS Value7
                                 , ObjectString_Value8.ValueData  AS Value8
                                 , ObjectString_Value9.ValueData  AS Value9
                                 , ObjectString_Value10.ValueData AS Value10
                                 , ObjectString_Value11.ValueData AS Value11
                                 , ObjectString_Value12.ValueData AS Value12
                                 , ObjectString_Value13.ValueData AS Value13
                                 , ObjectString_Value14.ValueData AS Value14
                            FROM ObjectLink AS ObjectLink_StickerFile_Language
                                 LEFT JOIN ObjectString AS ObjectString_Value1
                                                        ON ObjectString_Value1.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value1.DescId = zc_ObjectString_Language_Value1()
                                 LEFT JOIN ObjectString AS ObjectString_Value2
                                                        ON ObjectString_Value2.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value2.DescId = zc_ObjectString_Language_Value2()
                                 LEFT JOIN ObjectString AS ObjectString_Value3
                                                        ON ObjectString_Value3.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value3.DescId = zc_ObjectString_Language_Value3()
                                 LEFT JOIN ObjectString AS ObjectString_Value4
                                                        ON ObjectString_Value4.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value4.DescId = zc_ObjectString_Language_Value4()
                                 LEFT JOIN ObjectString AS ObjectString_Value5
                                                        ON ObjectString_Value5.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value5.DescId = zc_ObjectString_Language_Value5()
                                 LEFT JOIN ObjectString AS ObjectString_Value6
                                                        ON ObjectString_Value6.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value6.DescId = zc_ObjectString_Language_Value6()
                                 LEFT JOIN ObjectString AS ObjectString_Value7
                                                        ON ObjectString_Value7.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value7.DescId = zc_ObjectString_Language_Value7()
                                 LEFT JOIN ObjectString AS ObjectString_Value8
                                                        ON ObjectString_Value8.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value8.DescId = zc_ObjectString_Language_Value8()
                                 LEFT JOIN ObjectString AS ObjectString_Value9
                                                        ON ObjectString_Value9.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value9.DescId = zc_ObjectString_Language_Value9()
                                 LEFT JOIN ObjectString AS ObjectString_Value10
                                                        ON ObjectString_Value10.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value10.DescId = zc_ObjectString_Language_Value10()
                                 LEFT JOIN ObjectString AS ObjectString_Value11
                                                        ON ObjectString_Value11.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value11.DescId = zc_ObjectString_Language_Value11()
                                 LEFT JOIN ObjectString AS ObjectString_Value12
                                                        ON ObjectString_Value12.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value12.DescId = zc_ObjectString_Language_Value12()
                                 LEFT JOIN ObjectString AS ObjectString_Value13
                                                        ON ObjectString_Value13.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value13.DescId = zc_ObjectString_Language_Value13()
                                 LEFT JOIN ObjectString AS ObjectString_Value14
                                                        ON ObjectString_Value14.ObjectId = ObjectLink_StickerFile_Language.ChildObjectId
                                                       AND ObjectString_Value14.DescId = zc_ObjectString_Language_Value14()
                            WHERE ObjectLink_StickerFile_Language.ObjectId = vbStickerFileId
                              AND ObjectLink_StickerFile_Language.DescId = zc_ObjectLink_StickerFile_Language()
                           )

       SELECT Object_StickerProperty.Id          AS Id
            , Object_StickerProperty.ObjectCode  AS Code
            , Object_StickerProperty.ValueData   AS Comment

            , ObjectLink_StickerProperty_Sticker.ChildObjectId AS StickerId

            , Object_Goods.Id                    AS GoodsId
            , Object_Goods.ObjectCode            AS GoodsCode
            , Object_Goods.ValueData             AS GoodsName

            , Object_GoodsKind.Id                AS GoodsKindId
            , Object_GoodsKind.ValueData         AS GoodsKindName

            , Object_StickerPack.Id              AS StickerPackId
            , Object_StickerPack.ValueData       AS StickerPackName

            , Object_StickerFile.Id              AS StickerFileId
            , Object_StickerFile.ValueData       AS StickerFileName
            , Object_TradeMark_StickerFile.ValueData  AS TradeMarkName_StickerFile

            , Object_StickerSkin.Id              AS StickerSkinId
            , Object_StickerSkin.ValueData       AS StickerSkinName

            , ObjectBoolean_Fix.ValueData        AS isFix

            , ObjectFloat_Value1.ValueData       AS Value1
            , ObjectFloat_Value2.ValueData       AS Value2
            , ObjectFloat_Value3.ValueData       AS Value3
            , ObjectFloat_Value4.ValueData       AS Value4
            , ObjectFloat_Value5.ValueData       AS Value5
            , ObjectFloat_Value6.ValueData       AS Value6
            , ObjectFloat_Value7.ValueData       AS Value7
            , ObjectString_BarCode.ValueData     AS BarCode

            , Sticker_Value1.ValueData           AS Sticker_Value1
            , Sticker_Value2.ValueData           AS Sticker_Value2
            , Sticker_Value3.ValueData           AS Sticker_Value3
            , Sticker_Value4.ValueData           AS Sticker_Value4
            , Sticker_Value5.ValueData           AS Sticker_Value5

-- [frxDBDHeader."StickerGroupName"] [frxDBDHeader."StickerTypeName"] [frxDBDHeader."StickerTagName"]
-- [frxDBDHeader."StickerSortName"] [frxDBDHeader."StickerNormName"]
-- �����:[frxDBDHeader."Info"]
-- ����� �� ���̲� ���в����� [frxDBDHeader."StickerPackName"]:�� ������� �������� ������ �� [frxDBDHeader."Value1"]% �� [frxDBDHeader."Value2"]%, �� ����������� �� [FormatFloat('+,0.#; -,0.#;0',<frxDBDHeader."Value3">)]� �� [FormatFloat('+,0.#; -,0.#; ',<frxDBDHeader."Value4">)]� �� ���� ��� [frxDBDHeader."Value5"] ��.
-- ������� ֲ�Ͳ��� �� ����в�Ͳ��� � 100��.��������:���� �� ����� [FormatFloat(',0.0; -,0.0; ',<frxDBDHeader."Sticker_Value2">)] ��, ���� �� ����� [FormatFloat(',0.0; -,0.0; ',<frxDBDHeader."Sticker_Value3">)] ��, [FormatFloat(',0.0; -,0.0; ',<frxDBDHeader."Sticker_Value4">)] ����
--
-- [frxDBDHeader."Level1"]
-- [frxDBDHeader."Level2"]
-- [frxDBDHeader."Info"]

              -- Level1
            , (REPEAT (' ', vbAddLeft1)
            || CASE WHEN LENGTH (COALESCE (Object_StickerGroup.ValueData, '') || ' ' || COALESCE (Object_StickerType.ValueData, '') || ' ' || COALESCE (Object_StickerTag.ValueData, '')) > vbParam1
                         THEN COALESCE (Object_StickerGroup.ValueData, '')
                    || ' ' || COALESCE (Object_StickerTag.ValueData, '')
 
                    ELSE COALESCE (Object_StickerGroup.ValueData, '')
               || ' ' || COALESCE (Object_StickerType.ValueData, '')
               || ' ' || COALESCE (Object_StickerTag.ValueData, '')
 
               END) :: TVarChar AS Level1

              -- Level2
            , (REPEAT (' ', vbAddLeft2)
            || CASE WHEN LENGTH (COALESCE (Object_StickerGroup.ValueData, '') || ' ' || COALESCE (Object_StickerType.ValueData, '') || ' ' || COALESCE (Object_StickerTag.ValueData, '')) > vbParam1
                         THEN COALESCE (Object_StickerType.ValueData, '')
                    || ' ' || COALESCE (Object_StickerSort.ValueData, '')
               || CHR (13) || REPEAT (' ', vbAddLeft2)
                           || COALESCE (Object_StickerNorm.ValueData, '')
 
                    WHEN LENGTH (COALESCE (Object_StickerSort.ValueData, '') || ' ' || COALESCE (Object_StickerNorm.ValueData, '')) > vbParam2
                         THEN COALESCE (Object_StickerSort.ValueData, '')
               || CHR (13) || REPEAT (' ', vbAddLeft2)
                           || COALESCE (Object_StickerNorm.ValueData, '')
 
                    ELSE COALESCE (Object_StickerSort.ValueData, '')
               || ' ' || COALESCE (Object_StickerNorm.ValueData, '')
 
               END) :: TVarChar AS Level2

              -- ��� �������� (������)
            , Object_StickerGroup.ValueData   AS StickerGroupName
              -- ������ ������������ ��������
            , Object_StickerType.ValueData    AS StickerTypeName
              -- �������� ��������
            , Object_StickerTag.ValueData     AS StickerTagName
              -- ���������
            , Object_StickerSort.ValueData    AS StickerSortName
              -- �� ��� ����
            , Object_StickerNorm.ValueData    AS StickerNormName
              -- !!!�����!!!
            , zfCalc_Text_parse (vbStickerFileId, Object_TradeMark_StickerFile.Id
                                 -- ������� �������� ������� �����, �.�. ��� ����� ����� - ��������� ����
                               , vbAddLeft2
                                 -- ��� �� ������� � ��������� ����� ��� Level1 ��� Level2, ����� �� ��������� ������� ����� �����
                               , CASE WHEN LENGTH (COALESCE (Object_StickerGroup.ValueData, '') || ' ' || COALESCE (Object_StickerType.ValueData, '') || ' ' || COALESCE (Object_StickerTag.ValueData, '')) > vbParam1
                                        OR LENGTH (COALESCE (Object_StickerSort.ValueData, '') || ' ' || COALESCE (Object_StickerNorm.ValueData, '')) > vbParam2
                                       THEN 1
                                       ELSE 0
                                 END
                               -- , '�����:'
                               , tmpLanguageParam.Value1 ||': '
                              || ObjectBlob_Info.ValueData
                              -- || '����� �� ���̲� ���в�����:' || COALESCE (Object_StickerPack.ValueData, '') || ':'
                              || tmpLanguageParam.Value2 ||': ' || COALESCE (Object_StickerPack.ValueData, '') || ': '
                              || tmpLanguageParam.Value3 ||' ' || zfConvert_FloatToString (COALESCE (ObjectFloat_Value1.ValueData, 0)) || '% '
                              || tmpLanguageParam.Value4 ||' ' || zfConvert_FloatToString (COALESCE (ObjectFloat_Value2.ValueData, 0)) || '% , '
                              || tmpLanguageParam.Value5 ||' ' || zfConvert_FloatToString (COALESCE (ObjectFloat_Value3.ValueData, 0)) || '� '
                              || tmpLanguageParam.Value6 ||' ' || zfConvert_FloatToString (COALESCE (ObjectFloat_Value4.ValueData, 0)) || '� '
                              || tmpLanguageParam.Value7 ||' ' || zfConvert_FloatToString (COALESCE (ObjectFloat_Value5.ValueData, 0)) || tmpLanguageParam.Value14 ||'. '
                              -- || '������� ֲ�Ͳ��� �� ����в�Ͳ��� � 100��.��������:'
                              || tmpLanguageParam.Value8 ||': '
                              ||tmpLanguageParam.Value9  ||' ' || zfConvert_FloatToString (COALESCE (Sticker_Value2.ValueData, 0)) || tmpLanguageParam.Value10 ||', '
                              ||tmpLanguageParam.Value11 ||' ' || zfConvert_FloatToString (COALESCE (Sticker_Value3.ValueData, 0)) || tmpLanguageParam.Value12 ||''
                              ||                    ', ' || zfConvert_FloatToString (COALESCE (Sticker_Value4.ValueData, 0)) ||  tmpLanguageParam.Value13
                               , inIsLength
                               , FALSE -- ������ �� ������������
                                ) AS Info

            , inIsJPG                              :: Boolean   AS isJPG
            , (inIsStartEnd  AND inIsTare = FALSE) :: Boolean   AS isStartEnd
            , inIsTare                             :: Boolean   AS isTara
            , (inIsPartion   AND inIsTare = TRUE)  :: Boolean   AS isPartion
            , (inIsGoodsName AND inIsTare = TRUE)  :: Boolean   AS isGoodsName

            , inDateStart                                                          :: TDateTime AS DateStart
            , (inDateStart + (ObjectFloat_Value5.ValueData ||' DAY') :: INTERVAL)  :: TDateTime AS DateEnd

            , inDateTare          :: TDateTime AS DateTare
            , inDatePack          :: TDateTime AS DatePack
            , inDateProduction    :: TDateTime AS DateProduction
            , inNumPack           :: TFloat    AS NumPack
            , inNumTech           :: TFloat    AS NumTech

       FROM Object AS Object_StickerProperty
             LEFT JOIN Object AS Object_StickerFile ON Object_StickerFile.Id = vbStickerFileId

             LEFT JOIN tmpLanguageParam ON 1 = 1
             
             LEFT JOIN ObjectLink AS ObjectLink_StickerProperty_Sticker
                                  ON ObjectLink_StickerProperty_Sticker.ObjectId = Object_StickerProperty.Id
                                 AND ObjectLink_StickerProperty_Sticker.DescId = zc_ObjectLink_StickerProperty_Sticker()

             LEFT JOIN ObjectLink AS ObjectLink_StickerProperty_GoodsKind
                                  ON ObjectLink_StickerProperty_GoodsKind.ObjectId = Object_StickerProperty.Id
                                 AND ObjectLink_StickerProperty_GoodsKind.DescId = zc_ObjectLink_StickerProperty_GoodsKind()
             LEFT JOIN Object AS Object_GoodsKind ON Object_GoodsKind.Id = ObjectLink_StickerProperty_GoodsKind.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_StickerProperty_StickerPack
                                  ON ObjectLink_StickerProperty_StickerPack.ObjectId = Object_StickerProperty.Id
                                 AND ObjectLink_StickerProperty_StickerPack.DescId = zc_ObjectLink_StickerProperty_StickerPack()
             LEFT JOIN Object AS Object_StickerPack ON Object_StickerPack.Id = ObjectLink_StickerProperty_StickerPack.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_StickerProperty_StickerSkin
                                  ON ObjectLink_StickerProperty_StickerSkin.ObjectId = Object_StickerProperty.Id
                                 AND ObjectLink_StickerProperty_StickerSkin.DescId = zc_ObjectLink_StickerProperty_StickerSkin()
             LEFT JOIN Object AS Object_StickerSkin ON Object_StickerSkin.Id = ObjectLink_StickerProperty_StickerSkin.ChildObjectId

             LEFT JOIN ObjectFloat AS ObjectFloat_Value1
                                   ON ObjectFloat_Value1.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value1.DescId = zc_ObjectFloat_StickerProperty_Value1()

             LEFT JOIN ObjectFloat AS ObjectFloat_Value2
                                   ON ObjectFloat_Value2.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value2.DescId = zc_ObjectFloat_StickerProperty_Value2()

             LEFT JOIN ObjectFloat AS ObjectFloat_Value3
                                   ON ObjectFloat_Value3.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value3.DescId = zc_ObjectFloat_StickerProperty_Value3()

             LEFT JOIN ObjectFloat AS ObjectFloat_Value4
                                   ON ObjectFloat_Value4.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value4.DescId = zc_ObjectFloat_StickerProperty_Value4()

             LEFT JOIN ObjectFloat AS ObjectFloat_Value5
                                   ON ObjectFloat_Value5.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value5.DescId = zc_ObjectFloat_StickerProperty_Value5()

             LEFT JOIN ObjectFloat AS ObjectFloat_Value6
                                   ON ObjectFloat_Value6.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value6.DescId = zc_ObjectFloat_StickerProperty_Value6()

             LEFT JOIN ObjectFloat AS ObjectFloat_Value7
                                   ON ObjectFloat_Value7.ObjectId = Object_StickerProperty.Id
                                  AND ObjectFloat_Value7.DescId = zc_ObjectFloat_StickerProperty_Value7()

             LEFT JOIN ObjectBoolean AS ObjectBoolean_Fix
                                     ON ObjectBoolean_Fix.ObjectId = Object_StickerProperty.Id
                                    AND ObjectBoolean_Fix.DescId = zc_ObjectBoolean_StickerProperty_Fix()
             LEFT JOIN ObjectString AS ObjectString_BarCode
                                    ON ObjectString_BarCode.ObjectId = Object_StickerProperty.Id
                                   AND ObjectString_BarCode.DescId   = zc_ObjectString_StickerProperty_BarCode()

             LEFT JOIN ObjectLink AS ObjectLink_StickerFile_TradeMark
                                  ON ObjectLink_StickerFile_TradeMark.ObjectId = Object_StickerFile.Id
                                 AND ObjectLink_StickerFile_TradeMark.DescId = zc_ObjectLink_StickerFile_TradeMark()
             LEFT JOIN Object AS Object_TradeMark_StickerFile ON Object_TradeMark_StickerFile.Id = ObjectLink_StickerFile_TradeMark.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_Sticker_Goods
                                  ON ObjectLink_Sticker_Goods.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectLink_Sticker_Goods.DescId = zc_ObjectLink_Sticker_Goods()
             LEFT JOIN Object AS Object_Goods ON Object_Goods.Id = ObjectLink_Sticker_Goods.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_Sticker_StickerGroup
                                  ON ObjectLink_Sticker_StickerGroup.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectLink_Sticker_StickerGroup.DescId = zc_ObjectLink_Sticker_StickerGroup()
             LEFT JOIN Object AS Object_StickerGroup ON Object_StickerGroup.Id = ObjectLink_Sticker_StickerGroup.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_Sticker_StickerType
                                  ON ObjectLink_Sticker_StickerType.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectLink_Sticker_StickerType.DescId = zc_ObjectLink_Sticker_StickerType()
             LEFT JOIN Object AS Object_StickerType ON Object_StickerType.Id = ObjectLink_Sticker_StickerType.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_Sticker_StickerTag
                                  ON ObjectLink_Sticker_StickerTag.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectLink_Sticker_StickerTag.DescId = zc_ObjectLink_Sticker_StickerTag()
             LEFT JOIN Object AS Object_StickerTag ON Object_StickerTag.Id = ObjectLink_Sticker_StickerTag.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_Sticker_StickerSort
                                  ON ObjectLink_Sticker_StickerSort.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectLink_Sticker_StickerSort.DescId = zc_ObjectLink_Sticker_StickerSort()
             LEFT JOIN Object AS Object_StickerSort ON Object_StickerSort.Id = ObjectLink_Sticker_StickerSort.ChildObjectId

             LEFT JOIN ObjectLink AS ObjectLink_Sticker_StickerNorm
                                  ON ObjectLink_Sticker_StickerNorm.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectLink_Sticker_StickerNorm.DescId = zc_ObjectLink_Sticker_StickerNorm()
             LEFT JOIN Object AS Object_StickerNorm ON Object_StickerNorm.Id = ObjectLink_Sticker_StickerNorm.ChildObjectId

             LEFT JOIN ObjectBlob AS ObjectBlob_Info
                                  ON ObjectBlob_Info.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                 AND ObjectBlob_Info.DescId = zc_ObjectBlob_Sticker_Info()

             LEFT JOIN ObjectFloat AS Sticker_Value1
                                   ON Sticker_Value1.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                  AND Sticker_Value1.DescId = zc_ObjectFloat_Sticker_Value1()

             LEFT JOIN ObjectFloat AS Sticker_Value2
                                   ON Sticker_Value2.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                  AND Sticker_Value2.DescId = zc_ObjectFloat_Sticker_Value2()

             LEFT JOIN ObjectFloat AS Sticker_Value3
                                   ON Sticker_Value3.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                  AND Sticker_Value3.DescId = zc_ObjectFloat_Sticker_Value3()

             LEFT JOIN ObjectFloat AS Sticker_Value4
                                   ON Sticker_Value4.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                  AND Sticker_Value4.DescId = zc_ObjectFloat_Sticker_Value4()

             LEFT JOIN ObjectFloat AS Sticker_Value5
                                   ON Sticker_Value5.ObjectId = ObjectLink_StickerProperty_Sticker.ChildObjectId
                                  AND Sticker_Value5.DescId = zc_ObjectFloat_Sticker_Value5()

          WHERE Object_StickerProperty.Id = inObjectId
            AND Object_StickerProperty.DescId = zc_Object_StickerProperty()
         ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;

/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 19.12.17         *
 26.10.17         *
*/

-- ����
-- SELECT * FROM gpSelect_Object_StickerProperty_Print (inObjectId:= 1371309, inIsJPG:= TRUE, inIsLength:= FALSE, inIsStartEnd:= FALSE, inIsTare:= FALSE, inIsPartion:= FALSE, inIsGoodsName:= FALSE, inDateStart:= '01.01.2016', inDateTare:= '01.01.2016', inDatePack:= '01.01.2016', inDateProduction:= '01.01.2016', inNumPack:= 1, inNumTech:= 1, inSession:= zfCalc_UserAdmin());
