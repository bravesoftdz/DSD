-- View: Object_BankAccount_View

-- DROP VIEW IF EXISTS Object_BankAccount_View;

CREATE OR REPLACE VIEW Object_BankAccount_View AS
         SELECT 
             Object_BankAccount.Id           AS Id
           , Object_BankAccount.ObjectCode   AS Code
           , Object_BankAccount.ValueData    AS Name
          
           , ObjectLink_BankAccount_Bank.ChildObjectId   AS BankId  
           , Object_Bank.ValueData                       AS BankName


       FROM Object AS Object_BankAccount

            LEFT JOIN ObjectLink AS ObjectLink_BankAccount_Bank
                                 ON ObjectLink_BankAccount_Bank.ObjectId = Object_BankAccount.Id
                                AND ObjectLink_BankAccount_Bank.DescId = zc_ObjectLink_BankAccount_Bank()

            LEFT JOIN Object ON Object_Bank.Id = ObjectLink_BankAccount_Bank.ChildObjectId
                                   
       WHERE Object_BankAccount.DescId = zc_Object_BankAccount();


ALTER TABLE Object_BankAccount_View  OWNER TO postgres;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 15.11.13                         *
*/

-- ����
-- SELECT * FROM Object_BankAccount_View
