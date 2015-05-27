-- Function: gpSelect_Scale_Partner()

DROP FUNCTION IF EXISTS gpSelect_Scale_Partner (Integer, Integer, TVarChar);

CREATE OR REPLACE FUNCTION gpSelect_Scale_Partner(
    IN inInfoMoneyId_income Integer     ,
    IN inInfoMoneyId_sale Integer     ,
    IN inSession     TVarChar      -- ������ ������������
)
RETURNS TABLE (PartnerId     Integer
             , PartnerCode   Integer
             , PartnerName   TVarChar
             , PaidKindId    Integer
             , PaidKindName  TVarChar
             , ContractId    Integer, ContractCode      Integer, ContractNumber    TVarChar, ContractTagName TVarChar
             , InfoMoneyId   Integer
             , InfoMoneyCode Integer
             , InfoMoneyName TVarChar
             , ChangePercent TFloat
             , ChangePercentAmount TFloat

             , isEdiOrdspr   Boolean
             , isEdiInvoice  Boolean
             , isEdiDesadv   Boolean

             , isMovement    Boolean   -- ���������
             , isAccount     Boolean   -- ����
             , isTransport   Boolean   -- ���
             , isQuality     Boolean   -- ������������
             , isPack        Boolean   -- �����������
             , isSpec        Boolean   -- ������������
             , isTax         Boolean   -- ���������
              )
AS
$BODY$
   DECLARE vbUserId Integer;

   DECLARE vbIsConstraint Boolean;
   DECLARE vbObjectId_Constraint Integer;
   DECLARE vbBranchId_Constraint Integer;
BEGIN
   -- �������� ���� ������������ �� ����� ���������
   -- vbUserId:= lpCheckRight (inSession, zc_Enum_Process_Select_Scale_Partner());
   vbUserId:= lpGetUserBySession (inSession);


   -- ������������ ������� �������
   vbObjectId_Constraint:= COALESCE ((SELECT Object_RoleAccessKeyGuide_View.JuridicalGroupId FROM Object_RoleAccessKeyGuide_View WHERE Object_RoleAccessKeyGuide_View.UserId = vbUserId AND Object_RoleAccessKeyGuide_View.JuridicalGroupId <> 0 GROUP BY Object_RoleAccessKeyGuide_View.JuridicalGroupId), 0);
   vbBranchId_Constraint:= COALESCE ((SELECT Object_RoleAccessKeyGuide_View.BranchId FROM Object_RoleAccessKeyGuide_View WHERE Object_RoleAccessKeyGuide_View.UserId = vbUserId AND Object_RoleAccessKeyGuide_View.BranchId <> 0 GROUP BY Object_RoleAccessKeyGuide_View.BranchId), 0);
   vbIsConstraint:= vbObjectId_Constraint > 0 OR vbBranchId_Constraint > 0;


    -- ���������
    RETURN QUERY
       WITH tmpInfoMoney AS (SELECT View_InfoMoney_find.InfoMoneyId
                                  , View_InfoMoney_find.InfoMoneyGroupId
                             FROM Object_InfoMoney_View AS View_InfoMoney
                                  LEFT JOIN Object_InfoMoney_View AS View_InfoMoney_find ON View_InfoMoney_find.InfoMoneyDestinationId = View_InfoMoney.InfoMoneyDestinationId
                             WHERE View_InfoMoney.InfoMoneyId = inInfoMoneyId_income
                            UNION
                             SELECT View_InfoMoney_find.InfoMoneyId
                                  , View_InfoMoney_find.InfoMoneyGroupId
                             FROM Object_InfoMoney_View AS View_InfoMoney_find
                             WHERE View_InfoMoney_find.InfoMoneyId IN (/*inInfoMoneyId_income,*/ inInfoMoneyId_sale)
                            )
         , tmpContractPartner AS (SELECT ObjectLink_ContractPartner_Contract.ChildObjectId AS ContractId
                                       , ObjectLink_ContractPartner_Partner.ChildObjectId  AS PartnerId
                                       , ObjectLink_Partner_Juridical.ChildObjectId        AS JuridicalId
                                  FROM ObjectLink AS ObjectLink_ContractPartner_Partner
                                       INNER JOIN Object AS Object_ContractPartner ON Object_ContractPartner.Id = ObjectLink_ContractPartner_Partner.ObjectId
                                                                                  AND Object_ContractPartner.isErased = FALSE
                                       INNER JOIN ObjectLink AS ObjectLink_ContractPartner_Contract
                                                             ON ObjectLink_ContractPartner_Contract.ObjectId = Object_ContractPartner.Id
                                                            AND ObjectLink_ContractPartner_Contract.DescId = zc_ObjectLink_ContractPartner_Contract()
                                                            AND ObjectLink_ContractPartner_Contract.ChildObjectId >0
                                       LEFT JOIN ObjectLink AS ObjectLink_Partner_Juridical
                                                            ON ObjectLink_Partner_Juridical.ObjectId = ObjectLink_ContractPartner_Partner.ChildObjectId
                                                           AND ObjectLink_Partner_Juridical.DescId = zc_ObjectLink_Partner_Juridical()
                                  WHERE ObjectLink_ContractPartner_Partner.DescId = zc_ObjectLink_ContractPartner_Partner()
                                    AND ObjectLink_ContractPartner_Partner.ChildObjectId >0
                                 )
          , tmpPartner AS (SELECT Object_Partner.Id         AS PartnerId
                                , Object_Partner.ObjectCode AS PartnerCode
                                , Object_Partner.ValueData  AS PartnerName
                                , View_Contract.JuridicalId AS JuridicalId
                                , View_Contract.PaidKindId  AS PaidKindId
                                  /*-- ��������������, �.�. � ����� ����� ������ ��� ��� ��-������, ��� ��-����������
                                , CASE WHEN tmpInfoMoney.InfoMoneyGroupId = zc_Enum_InfoMoneyGroup_10000() -- �������� �����
                                            THEN zc_Enum_InfoMoney_10101() -- �������� ����� + ������ ����� + ����� ���
                                       WHEN tmpInfoMoney.InfoMoneyGroupId = zc_Enum_InfoMoneyGroup_30000() -- ������ !!!�� ������, �.�. ���� ����� ������������ OR!!!
                                        AND tmpInfoMoney.InfoMoneyId = zc_Enum_InfoMoney_30101() -- ������ + ��������� + ������� ���������
                                            THEN zc_Enum_InfoMoney_30101()
                                       ELSE tmpInfoMoney.InfoMoneyId
                                  END AS InfoMoneyId*/
                                , tmpInfoMoney.InfoMoneyId
                                , MAX (View_Contract.ContractId) AS ContractId
                           FROM tmpInfoMoney
                                LEFT JOIN Object_Contract_View AS View_Contract ON View_Contract.InfoMoneyId = tmpInfoMoney.InfoMoneyId
                                                                               AND View_Contract.isErased = FALSE
                                LEFT JOIN tmpContractPartner ON tmpContractPartner.ContractId = View_Contract.ContractId
                                                            AND tmpContractPartner.JuridicalId = View_Contract.JuridicalId
                                LEFT JOIN ObjectLink AS ObjectLink_Partner_Juridical
                                                     ON ObjectLink_Partner_Juridical.ChildObjectId = View_Contract.JuridicalId
                                                    AND ObjectLink_Partner_Juridical.DescId = zc_ObjectLink_Partner_Juridical()
                                                    AND tmpContractPartner.ContractId IS NULL
                                LEFT JOIN Object AS Object_Partner ON Object_Partner.Id = COALESCE (tmpContractPartner.PartnerId, ObjectLink_Partner_Juridical.ObjectId)

                                LEFT JOIN ObjectLink AS ObjectLink_Juridical_JuridicalGroup
                                                     ON ObjectLink_Juridical_JuridicalGroup.ObjectId = ObjectLink_Partner_Juridical.ChildObjectId
                                                    AND ObjectLink_Juridical_JuridicalGroup.DescId = zc_ObjectLink_Juridical_JuridicalGroup()

                                LEFT JOIN ObjectLink AS ObjectLink_Partner_PersonalTrade
                                                     ON ObjectLink_Partner_PersonalTrade.ObjectId = Object_Partner.Id 
                                                    AND ObjectLink_Partner_PersonalTrade.DescId = zc_ObjectLink_Partner_PersonalTrade()
                                LEFT JOIN ObjectLink AS ObjectLink_PersonalTrade_Unit
                                                     ON ObjectLink_PersonalTrade_Unit.ObjectId = ObjectLink_Partner_PersonalTrade.ChildObjectId
                                                    AND ObjectLink_PersonalTrade_Unit.DescId = zc_ObjectLink_Personal_Unit()
                                LEFT JOIN ObjectLink AS ObjectLink_Unit_Branch_PersonalTrade
                                                     ON ObjectLink_Unit_Branch_PersonalTrade.ObjectId = ObjectLink_PersonalTrade_Unit.ChildObjectId
                                                    AND ObjectLink_Unit_Branch_PersonalTrade.DescId = zc_ObjectLink_Unit_Branch()

                           WHERE Object_Partner.IsErased = FALSE
                             AND (ObjectLink_Juridical_JuridicalGroup.ChildObjectId = vbObjectId_Constraint
                                  OR ObjectLink_Unit_Branch_PersonalTrade.ChildObjectId = vbBranchId_Constraint
                                  OR vbIsConstraint = FALSE
                                 )
                           GROUP BY Object_Partner.Id
                                  , Object_Partner.ObjectCode
                                  , Object_Partner.ValueData
                                  , View_Contract.JuridicalId
                                  , View_Contract.PaidKindId
                                  , tmpInfoMoney.InfoMoneyId
                          )
          , tmpPrintKindItem AS (SELECT tmp.Id, tmp.isMovement, tmp.isAccount, tmp.isTransport, tmp.isQuality, tmp.isPack, tmp.isSpec, tmp.isTax FROM lpSelect_Object_PrintKindItem() AS tmp)

       SELECT tmpPartner.PartnerId
            , tmpPartner.PartnerCode
            , tmpPartner.PartnerName
            , Object_PaidKind.Id                   AS PaidKindId
            , Object_PaidKind.ValueData            AS PaidKindName

            , Object_Contract_View.ContractId      AS ContractId
            , Object_Contract_View.ContractCode    AS ContractCode
            , Object_Contract_View.InvNumber       AS ContractNumber
            , Object_Contract_View.ContractTagName AS ContractTagName

            , tmpPartner.InfoMoneyId
            , View_InfoMoney.InfoMoneyCode
            , View_InfoMoney.InfoMoneyName

            , Object_ContractCondition_PercentView.ChangePercent :: TFloat AS ChangePercent
            , CASE WHEN tmpPartner.PartnerCode = 1 THEN 1 WHEN tmpPartner.PartnerCode = 3 THEN 1 ELSE 1 END :: TFloat AS ChangePercentAmount

            , COALESCE (ObjectBoolean_Partner_EdiOrdspr.ValueData, FALSE)  :: Boolean AS isEdiOrdspr
            , COALESCE (ObjectBoolean_Partner_EdiInvoice.ValueData, FALSE) :: Boolean AS isEdiInvoice
            , COALESCE (ObjectBoolean_Partner_EdiDesadv.ValueData, FALSE)  :: Boolean AS isEdiDesadv

            , COALESCE (tmpPrintKindItem.isMovement, FALSE)  :: Boolean AS isMovement
            , COALESCE (tmpPrintKindItem.isAccount, FALSE)   :: Boolean AS isAccount
            , COALESCE (tmpPrintKindItem.isTransport, FALSE) :: Boolean AS isTransport
            , COALESCE (tmpPrintKindItem.isQuality, FALSE)   :: Boolean AS isQuality
            , COALESCE (tmpPrintKindItem.isPack, FALSE)      :: Boolean AS isPack
            , COALESCE (tmpPrintKindItem.isSpec, FALSE)      :: Boolean AS isSpec
            , COALESCE (tmpPrintKindItem.isTax, FALSE)       :: Boolean AS isTax

       FROM tmpPartner
            LEFT JOIN ObjectLink AS ObjectLink_Juridical_Retail
                                 ON ObjectLink_Juridical_Retail.ObjectId = tmpPartner.JuridicalId
                                AND ObjectLink_Juridical_Retail.DescId = zc_ObjectLink_Juridical_Retail()
            LEFT JOIN ObjectLink AS ObjectLink_Retail_PrintKindItem
                                 ON ObjectLink_Retail_PrintKindItem.ObjectId = ObjectLink_Juridical_Retail.ChildObjectId
                                AND ObjectLink_Retail_PrintKindItem.DescId = zc_ObjectLink_Retail_PrintKindItem()
            LEFT JOIN ObjectLink AS ObjectLink_Juridical_PrintKindItem
                                 ON ObjectLink_Juridical_PrintKindItem.ObjectId = tmpPartner.JuridicalId
                                AND ObjectLink_Juridical_PrintKindItem.DescId = zc_ObjectLink_Juridical_PrintKindItem()
            LEFT JOIN tmpPrintKindItem ON tmpPrintKindItem.Id = COALESCE (ObjectLink_Retail_PrintKindItem.ChildObjectId, ObjectLink_Juridical_PrintKindItem.ChildObjectId)

            LEFT JOIN Object_InfoMoney_View AS View_InfoMoney ON View_InfoMoney.InfoMoneyId = tmpPartner.InfoMoneyId
            LEFT JOIN Object_ContractCondition_PercentView ON Object_ContractCondition_PercentView.ContractId = tmpPartner.ContractId

            LEFT JOIN Object_Contract_View ON Object_Contract_View.ContractId = tmpPartner.ContractId
            LEFT JOIN Object AS Object_PaidKind ON Object_PaidKind.Id = tmpPartner.PaidKindId

            LEFT JOIN Object AS Object_Juridical ON Object_Juridical.Id = tmpPartner.JuridicalId

            LEFT JOIN ObjectBoolean AS ObjectBoolean_Partner_EdiOrdspr
                                    ON ObjectBoolean_Partner_EdiOrdspr.ObjectId =  tmpPartner.PartnerId
                                   AND ObjectBoolean_Partner_EdiOrdspr.DescId = zc_ObjectBoolean_Partner_EdiOrdspr()
                                   AND 1=0 -- �����, �.�. �������� �� ����� ������ � EDI
            LEFT JOIN ObjectBoolean AS ObjectBoolean_Partner_EdiInvoice
                                    ON ObjectBoolean_Partner_EdiInvoice.ObjectId =  tmpPartner.PartnerId
                                   AND ObjectBoolean_Partner_EdiInvoice.DescId = zc_ObjectBoolean_Partner_EdiInvoice()
                                   AND 1=0 -- �����, �.�. �������� �� ����� ������ � EDI
            LEFT JOIN ObjectBoolean AS ObjectBoolean_Partner_EdiDesadv
                                    ON ObjectBoolean_Partner_EdiDesadv.ObjectId =  tmpPartner.PartnerId
                                   AND ObjectBoolean_Partner_EdiDesadv.DescId = zc_ObjectBoolean_Partner_EdiDesadv()
                                   AND 1=0 -- �����, �.�. �������� �� ����� ������ � EDI
       ORDER BY Object_Juridical.ValueData
              , tmpPartner.PartnerName
              , tmpPartner.PartnerCode
              , View_InfoMoney.InfoMoneyCode
              , Object_Contract_View.ContractCode
      ;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION gpSelect_Scale_Partner (Integer, Integer, TVarChar) OWNER TO postgres;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ������ �.�.
 21.01.15                                        *
*/

-- ����
-- SELECT * FROM gpSelect_Scale_Partner (zc_Enum_InfoMoney_10101(), zc_Enum_InfoMoney_30101(), zfCalc_UserAdmin())
