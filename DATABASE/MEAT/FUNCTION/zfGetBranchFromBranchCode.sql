-- Function: zfGetBranchFromUnitId

DROP FUNCTION IF EXISTS zfGetBranchFromBranchCode (Integer);

CREATE OR REPLACE FUNCTION zfGetBranchFromBranchCode(inUnitId Integer)
RETURNS Integer AS
$BODY$
BEGIN
  CASE inUnitId 
    WHEN    2 THEN Return(8379);  -- ����
    WHEN    8 THEN Return(8378);  -- ������
    WHEN 4481 THEN Return(8377);  -- ������ ���
    WHEN 2994 THEN Return(8376);  -- ����
    WHEN  999 THEN Return(18342); -- ��������
    WHEN 1048 THEN Return(8374);  -- ������
    WHEN 5271 THEN Return(8381);  -- �������
    WHEN 2991 THEN Return(8373);  -- ������-��������
    WHEN 2780 THEN Return(8375);  -- ��������
  END CASE;
END;
$BODY$
  LANGUAGE PLPGSQL IMMUTABLE;
ALTER FUNCTION zfGetBranchFromBranchCode (Integer) OWNER TO postgres;


/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 03.02.14                        *  
*/

-- ����
-- SELECT * FROM zfGetBranchFromUnitId (1)
