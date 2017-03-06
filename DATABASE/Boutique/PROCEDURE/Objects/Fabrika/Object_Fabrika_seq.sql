DO $$
BEGIN
  IF (SELECT COUNT(*) from pg_statio_all_sequences where relname = LOWER('Object_Fabrika_seq')) = 0 THEN 
    CREATE SEQUENCE Object_Fabrika_seq 
    INCREMENT 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    START 1
    CACHE 1;  
    ALTER SEQUENCE Object_Fabrika_seq
      OWNER TO postgres;
  END IF;
END $$;


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.   ��������� �.�.
06.03.17                                                          *
*/
