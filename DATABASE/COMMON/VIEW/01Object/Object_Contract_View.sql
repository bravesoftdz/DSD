-- View: Object_Contract_View

CREATE OR REPLACE VIEW Object_Contract_View AS
  SELECT Object_Contract_InvNumber_View.ContractId
       , Object_Contract_InvNumber_View.ContractCode  
       , Object_Contract_InvNumber_View.InvNumber
       , Object_Contract_InvNumber_View.isErased
       , ObjectDate_Start.ValueData                  AS StartDate
       , ObjectDate_End.ValueData                    AS EndDate
       , CASE WHEN ObjectLink_Contract_ContractTermKind.ChildObjectId = zc_Enum_ContractTermKind_Long()
                   THEN zc_DateEnd()
              WHEN ObjectLink_Contract_ContractTermKind.ChildObjectId = zc_Enum_ContractTermKind_Month() AND ObjectFloat_Term.ValueData > 0
                   THEN ObjectDate_End.ValueData + ((ObjectFloat_Term.ValueData :: Integer) :: TVarChar || ' MONTH') :: INTERVAL
              ELSE ObjectDate_End.ValueData
         END :: TDateTime AS EndDate_Term

       , ObjectLink_Contract_Juridical.ChildObjectId         AS JuridicalId
       , ObjectLink_Contract_JuridicalBasis.ChildObjectId    AS JuridicalBasisId
       , ObjectLink_Contract_PaidKind.ChildObjectId          AS PaidKindId
       , Object_Contract_InvNumber_View.InfoMoneyId

       , Object_Contract_InvNumber_View.ContractStateKindId
       , Object_Contract_InvNumber_View.ContractStateKindCode
       , Object_Contract_InvNumber_View.ContractStateKindName

       , Object_Contract_InvNumber_View.ContractTagGroupId
       , Object_Contract_InvNumber_View.ContractTagGroupCode
       , Object_Contract_InvNumber_View.ContractTagGroupName

       , Object_Contract_InvNumber_View.ContractTagId
       , Object_Contract_InvNumber_View.ContractTagCode
       , Object_Contract_InvNumber_View.ContractTagName

       , Object_ContractKind.Id              AS ContractKindId
       , Object_ContractKind.ObjectCode      AS ContractKindCode
       , Object_ContractKind.ValueData       AS ContractKindName

       , COALESCE (ObjectFloat_Term.ValueData, 0) :: TFloat AS Term
       , ObjectLink_Contract_ContractTermKind.ChildObjectId AS ContractTermKindId

         -- !!!�������� �����������!!!
       -- , ObjectFloat_ChangePercent.ValueData         AS ChangePercent
       -- , ObjectFloat_ChangePrice.ValueData           AS ChangePrice
       , View_ContractCondition_Value.ChangePercent
       , View_ContractCondition_Value.ChangePercentPartner
       , View_ContractCondition_Value.ChangePrice

       , View_ContractCondition_Value.DayCalendar
       , View_ContractCondition_Value.DayBank
       , View_ContractCondition_Value.DelayDay
       
  FROM Object_Contract_InvNumber_View
       LEFT JOIN Object_ContractCondition_ValueView AS View_ContractCondition_Value ON View_ContractCondition_Value.ContractId = Object_Contract_InvNumber_View.ContractId

       LEFT JOIN ObjectDate AS ObjectDate_Start
                            ON ObjectDate_Start.ObjectId = Object_Contract_InvNumber_View.ContractId
                           AND ObjectDate_Start.DescId = zc_ObjectDate_Contract_Start()
                           AND Object_Contract_InvNumber_View.InvNumber <> '-'
       LEFT JOIN ObjectDate AS ObjectDate_End
                            ON ObjectDate_End.ObjectId = Object_Contract_InvNumber_View.ContractId
                           AND ObjectDate_End.DescId = zc_ObjectDate_Contract_End()
                           AND Object_Contract_InvNumber_View.InvNumber <> '-'
       LEFT JOIN ObjectLink AS ObjectLink_Contract_ContractKind
                            ON ObjectLink_Contract_ContractKind.ObjectId = Object_Contract_InvNumber_View.ContractId 
                           AND ObjectLink_Contract_ContractKind.DescId = zc_ObjectLink_Contract_ContractKind()
                           AND Object_Contract_InvNumber_View.InvNumber <> '-'
       LEFT JOIN Object AS Object_ContractKind ON Object_ContractKind.Id = ObjectLink_Contract_ContractKind.ChildObjectId

       LEFT JOIN ObjectLink AS ObjectLink_Contract_Juridical
                            ON ObjectLink_Contract_Juridical.ObjectId = Object_Contract_InvNumber_View.ContractId 
                           AND ObjectLink_Contract_Juridical.DescId = zc_ObjectLink_Contract_Juridical()
       LEFT JOIN ObjectLink AS ObjectLink_Contract_JuridicalBasis
                            ON ObjectLink_Contract_JuridicalBasis.ObjectId = Object_Contract_InvNumber_View.ContractId 
                           AND ObjectLink_Contract_JuridicalBasis.DescId = zc_ObjectLink_Contract_JuridicalBasis()

       LEFT JOIN ObjectLink AS ObjectLink_Contract_PaidKind
                            ON ObjectLink_Contract_PaidKind.ObjectId = Object_Contract_InvNumber_View.ContractId
                           AND ObjectLink_Contract_PaidKind.DescId = zc_ObjectLink_Contract_PaidKind()

       LEFT JOIN ObjectFloat AS ObjectFloat_Term
                             ON ObjectFloat_Term.ObjectId = Object_Contract_InvNumber_View.ContractId
                            AND ObjectFloat_Term.DescId = zc_ObjectFloat_Contract_Term()
       LEFT JOIN ObjectLink AS ObjectLink_Contract_ContractTermKind
                            ON ObjectLink_Contract_ContractTermKind.ObjectId = Object_Contract_InvNumber_View.ContractId
                           AND ObjectLink_Contract_ContractTermKind.DescId = zc_ObjectLink_Contract_ContractTermKind()

       -- !!!�������� �����������!!!
       /*LEFT JOIN ObjectFloat AS ObjectFloat_ChangePercent
                             ON ObjectFloat_ChangePercent.ObjectId = Object_Contract_InvNumber_View.ContractId
                            AND ObjectFloat_ChangePercent.DescId = zc_ObjectFloat_Contract_ChangePercent()  
       LEFT JOIN ObjectFloat AS ObjectFloat_ChangePrice
                             ON ObjectFloat_ChangePrice.ObjectId = Object_Contract_InvNumber_View.ContractId
                            AND ObjectFloat_ChangePrice.DescId = zc_ObjectFloat_Contract_ChangePrice()*/
  ;


ALTER TABLE Object_Contract_View  OWNER TO postgres;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 20.05.14                                        * add InvNumber <> '-'
 20.05.14                                        * add ContractKind...
 26.04.14                                        * del ContractKeyId
 25.04.14                                        * add ContractKeyId
 24.04.14                                        * all
 13.02.14                                        * add Object_ContractStateKind...
 14.01.14                                        * add Object_Contract_InvNumber_View_InvNumber_View
 08.01.14                        * 
 18.11.13                                        * !!!�������� �����������!!!
 14.11.13         * add ContractCode      
 20.10.13                                        *
*/

-- ����
-- SELECT * FROM Object_Contract_View
