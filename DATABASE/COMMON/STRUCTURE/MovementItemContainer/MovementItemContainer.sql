/*
  �������� 
    - ������� MovementItemContainer (�����������)
    - ������
    - ��������
*/
/*-------------------------------------------------------------------------------*/

CREATE TABLE MovementItemContainer(
   Id             SERIAL NOT NULL PRIMARY KEY, 
   DescId         INTEGER,
   MovementId     INTEGER,
   ContainerId    INTEGER,
   Amount         TFloat, 
   OperDate       TDateTime,
   MovementItemId Integer,
   ParentId       Integer,
   isActive       Boolean,  

   CONSTRAINT fk_MovementItemContainer_DescId FOREIGN KEY(DescId) REFERENCES MovementItemContainerDesc(Id),
   CONSTRAINT fk_MovementItemContainer_MovementId FOREIGN KEY(MovementId) REFERENCES Movement(Id),
   CONSTRAINT fk_MovementItemContainer_ContainerId FOREIGN KEY(ContainerId) REFERENCES Container(Id),
   CONSTRAINT fk_MovementItemContainer_ParentId FOREIGN KEY(ParentId) REFERENCES MovementItemContainer(Id),
   CONSTRAINT fk_MovementItemContainer_MovementItemId FOREIGN KEY (MovementItemId) REFERENCES MovementItem(id)
);

/*-------------------------------------------------------------------------------*/

/*                                  �������                                      */

CREATE INDEX idx_MovementItemContainer_MovementId_DescId ON MovementItemContainer(MovementId, DescId);
-- CREATE INDEX idx_MovementItemContainer_ContainerId_DescId_OperDate_Amount ON MovementItemContainer(ContainerId, DescId, OperDate, Amount);
CREATE INDEX idx_MovementItemContainer_ContainerId_OperDate_DescId ON MovementItemContainer(ContainerId, OperDate, DescId);
CREATE INDEX idx_MovementItemContainer_ContainerId_DescId_OperDate ON MovementItemContainer(ContainerId, DescId, OperDate);
CREATE INDEX idx_MovementItemContainer_ParentId ON MovementItemContainer(ParentId);
CREATE INDEX idx_MovementItemContainer_MovementItemId ON MovementItemContainer(MovementItemId);
                                                                         
DO $$ 
    BEGIN

      IF       (EXISTS(SELECT c.relname 
                       FROM pg_catalog.pg_class AS c 
                  LEFT JOIN pg_catalog.pg_namespace AS n ON n.oid = c.relnamespace
                      WHERE c.relkind = 'i' AND n.nspname NOT IN ('pg_catalog', 'pg_toast')
                        AND c.relname = lower('idx_movementitemcontainer_containerid_descid_operdate_amount'))) THEN
             DROP INDEX idx_movementitemcontainer_containerid_descid_operdate_amount;
      END IF;
    END;
$$;
   
/*-------------------------------------------------------------------------------*/


/*-------------------------------------------------------------------------------
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 26.10.14                                        * add index idx_MovementItemContainer_ContainerId_OperDate_DescId AND idx_MovementItemContainer_ContainerId_DescId_OperDate
 26.10.14                                        * add index ???idx_MovementItemContainer_MovementItemId???
 26.10.14                                        * drop index idx_movementitemcontainer_containerid_descid_operdate_amount
 30.08.13                                        * 1251Cyr
*/
