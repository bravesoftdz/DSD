/*
  �������� 
    - ������� MovementItemContainerDesc (������ �����������)
    - c�����
    - ��������
*/

/*-------------------------------------------------------------------------------*/

CREATE TABLE MovementItemContainerDesc(
   Id                    SERIAL NOT NULL PRIMARY KEY, 
   Code                  TVarChar NOT NULL UNIQUE,
   ItemName              TVarChar);


/*-------------------------------------------------------------------------------*/

/*                                  �������                                      */



/*-------------------------------------------------------------------------------
 ����������:
 ������� ����������:
 ����         �����
 ----------------
                 ���������� �.�.   ������ �.�.   
 29.06.13             * SERIAL
*/