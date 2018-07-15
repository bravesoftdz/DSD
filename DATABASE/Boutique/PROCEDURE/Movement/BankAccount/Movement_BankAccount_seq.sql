DO $$
BEGIN
  IF (SELECT COUNT(*) from pg_statio_all_sequences where relname = 'movement_bankaccount_seq') = 0 THEN 
    CREATE SEQUENCE Movement_bankaccount_seq 
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
    CACHE 1;  
    ALTER TABLE Movement_bankaccount_seq
      OWNER TO postgres;
  END IF;
END $$;


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 12.07.18         *
*/
