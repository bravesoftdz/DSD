-- Function: lpInsertUpdate_ContainerSumm_Goods (TDateTime, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Boolean, Integer, Integer)

-- DROP FUNCTION lpInsertUpdate_ContainerSumm_Goods (TDateTime, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Boolean, Integer, Integer);

CREATE OR REPLACE FUNCTION lpInsertUpdate_ContainerSumm_Goods (
    IN inOperDate               TDateTime, 
    IN inUnitId                 Integer , 
    IN inPersonalId             Integer , 
    IN inBranchId               Integer , 
    IN inJuridicalId_basis      Integer , 
    IN inBusinessId             Integer , 
    IN inAccountId              Integer , 
    IN inInfoMoneyDestinationId Integer , 
    IN inInfoMoneyId            Integer , 
    IN inInfoMoneyId_Detail     Integer , 
    IN inContainerId_Goods      Integer , 
    IN inGoodsId                Integer , 
    IN inGoodsKindId            Integer , 
    IN inIsPartionSumm          Boolean , 
    IN inPartionGoodsId         Integer , 
    IN inAssetId                Integer
)
  RETURNS Integer
AS
$BODY$
   DECLARE vbContainerId Integer;
BEGIN

     IF inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_10100() -- ������ ����� -- select * from lfSelect_Object_InfoMoney() where inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_10100()
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)������������� 2)����� 3)!������ ������! 4)������ ���������� 5)������ ����������(����������� �/�)
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)��������� (��) 2)����� 3)!������ ������! 4)������ ���������� 5)������ ����������(����������� �/�)
     THEN vbContainerId := lpInsertFind_Container (inContainerDescId   := zc_Container_Summ()
                                                 , inParentId          := inContainerId_Goods
                                                 , inObjectId          := inAccountId
                                                 , inJuridicalId_basis := inJuridicalId_basis
                                                 , inBusinessId        := inBusinessId
                                                 , inObjectCostDescId  := zc_ObjectCost_Basis()
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)!�������������! 5)����� 6)!������ ������! 7)������ ���������� 8)������ ����������(����������� �/�)
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)��������� (��) 5)����� 6)!������ ������! 7)������ ���������� 8)������ ����������(����������� �/�)
                                                 , inObjectCostId      := lpInsertFind_ObjectCost (inObjectCostDescId:= zc_ObjectCost_Basis()
                                                                                                 , inDescId_1   := zc_ObjectCostLink_Goods()
                                                                                                 , inObjectId_1 := inGoodsId
                                                                                                 , inDescId_2   := zc_ObjectCostLink_PartionGoods()
                                                                                                 , inObjectId_2 := CASE WHEN inIsPartionSumm THEN inPartionGoodsId ELSE 0 END
                                                                                                 , inDescId_3   := CASE WHEN inPersonalId <> 0 THEN zc_ObjectCostLink_Personal() ELSE zc_ObjectCostLink_Unit() END
                                                                                                 , inObjectId_3 := CASE WHEN inPersonalId <> 0 AND inOperDate >= zc_DateStart_ObjectCostOnUnit() THEN inPersonalId WHEN inOperDate >= zc_DateStart_ObjectCostOnUnit() THEN inUnitId ELSE 0 END
                                                                                                 , inDescId_4   := zc_ObjectCostLink_InfoMoney()
                                                                                                 , inObjectId_4 := inInfoMoneyId
                                                                                                 , inDescId_5   := zc_ObjectCostLink_InfoMoneyDetail()
                                                                                                 , inObjectId_5 := inInfoMoneyId_Detail
                                                                                                 , inDescId_6   := zc_ObjectCostLink_Branch()
                                                                                                 , inObjectId_6 := inBranchId
                                                                                                 , inDescId_7   := zc_ObjectCostLink_Business()
                                                                                                 , inObjectId_7 := inBusinessId
                                                                                                 , inDescId_8   := zc_ObjectCostLink_JuridicalBasis()
                                                                                                 , inObjectId_8 := inJuridicalId_basis
                                                                                                  )
                                                 , inDescId_1   := CASE WHEN inPersonalId <> 0 THEN zc_ContainerLinkObject_Personal() ELSE zc_ContainerLinkObject_Unit() END
                                                 , inObjectId_1 := CASE WHEN inPersonalId <> 0 THEN inPersonalId ELSE inUnitId END
                                                 , inDescId_2   := zc_ContainerLinkObject_Goods()
                                                 , inObjectId_2 := inGoodsId
                                                 , inDescId_3   := zc_ContainerLinkObject_PartionGoods()
                                                 , inObjectId_3 := CASE WHEN inIsPartionSumm THEN inPartionGoodsId ELSE 0 END
                                                 , inDescId_4   := zc_ContainerLinkObject_InfoMoney()
                                                 , inObjectId_4 := inInfoMoneyId
                                                 , inDescId_5   := zc_ContainerLinkObject_InfoMoneyDetail()
                                                 , inObjectId_5 := inInfoMoneyId_Detail
                                                                   );
     ELSE
     IF inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_20100() -- �������� � ������� -- select * from lfSelect_Object_InfoMoney() where inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_20100()
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)������������� 2)����� 3)�������� ��������(��� �������� ��������� ���) 4)������ ���������� 5)������ ����������(����������� �/�)
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)��������� (��) 2)����� 3)�������� ��������(��� �������� ��������� ���) 4)������ ���������� 5)������ ����������(����������� �/�)
     THEN vbContainerId := lpInsertFind_Container (inContainerDescId   := zc_Container_Summ()
                                                 , inParentId          := inContainerId_Goods
                                                 , inObjectId          := inAccountId
                                                 , inJuridicalId_basis := inJuridicalId_basis
                                                 , inBusinessId        := inBusinessId
                                                 , inObjectCostDescId  := zc_ObjectCost_Basis()
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)!�������������! 5)����� 6)�������� ��������(��� �������� ��������� ���) 7)������ ���������� 8)������ ����������(����������� �/�)
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)��������� (��) 5)����� 6)�������� ��������(��� �������� ��������� ���) 7)������ ���������� 8)������ ����������(����������� �/�)
                                                 , inObjectCostId      := lpInsertFind_ObjectCost (inObjectCostDescId:= zc_ObjectCost_Basis()
                                                                                                 , inDescId_1   := zc_ObjectCostLink_Goods()
                                                                                                 , inObjectId_1 := inGoodsId
                                                                                                 , inDescId_2   := zc_ObjectCostLink_AssetTo()
                                                                                                 , inObjectId_2 := inAssetId
                                                                                                 , inDescId_3   := CASE WHEN inPersonalId <> 0 THEN zc_ObjectCostLink_Personal() ELSE zc_ObjectCostLink_Unit() END
                                                                                                 , inObjectId_3 := CASE WHEN inPersonalId <> 0 AND inOperDate >= zc_DateStart_ObjectCostOnUnit() THEN inPersonalId WHEN inOperDate >= zc_DateStart_ObjectCostOnUnit() THEN inUnitId ELSE 0 END
                                                                                                 , inDescId_4   := zc_ObjectCostLink_InfoMoney()
                                                                                                 , inObjectId_4 := inInfoMoneyId
                                                                                                 , inDescId_5   := zc_ObjectCostLink_InfoMoneyDetail()
                                                                                                 , inObjectId_5 := inInfoMoneyId_Detail
                                                                                                 , inDescId_6   := zc_ObjectCostLink_Branch()
                                                                                                 , inObjectId_6 := inBranchId
                                                                                                 , inDescId_7   := zc_ObjectCostLink_Business()
                                                                                                 , inObjectId_7 := inBusinessId
                                                                                                 , inDescId_8   := zc_ObjectCostLink_JuridicalBasis()
                                                                                                 , inObjectId_8 := inJuridicalId_basis
                                                                                                  )
                                                 , inDescId_1   := CASE WHEN inPersonalId <> 0 THEN zc_ContainerLinkObject_Personal() ELSE zc_ContainerLinkObject_Unit() END
                                                 , inObjectId_1 := CASE WHEN inPersonalId <> 0 THEN inPersonalId ELSE inUnitId END
                                                 , inDescId_2   := zc_ContainerLinkObject_Goods()
                                                 , inObjectId_2 := inGoodsId
                                                 , inDescId_3   := zc_ContainerLinkObject_AssetTo()
                                                 , inObjectId_3 := inAssetId
                                                 , inDescId_4   := zc_ContainerLinkObject_InfoMoney()
                                                 , inObjectId_4 := inInfoMoneyId
                                                 , inDescId_5   := zc_ContainerLinkObject_InfoMoneyDetail()
                                                 , inObjectId_5 := inInfoMoneyId_Detail
                                                  );
     ELSE
     IF inInfoMoneyDestinationId IN (zc_Enum_InfoMoneyDestination_20700()  -- ������    -- select * from lfSelect_Object_InfoMoney() where inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_20700()
                                                    , zc_Enum_InfoMoneyDestination_20900()  -- ����      -- select * from lfSelect_Object_InfoMoney() where inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_20900()
                                                    , zc_Enum_InfoMoneyDestination_30100()) -- ��������� -- select * from lfSelect_Object_InfoMoney() where inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_30100()
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)������������� 2)����� 3)!!!������ ������!!! 4)���� ������� 5)������ ���������� 6)������ ����������(����������� �/�)
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)��������� (��) 2)����� 3)!!!������ ������!!! 4)���� ������� 5)������ ���������� 6)������ ����������(����������� �/�)
     THEN vbContainerId := lpInsertFind_Container (inContainerDescId:= zc_Container_Summ()
                                                 , inParentId          := inContainerId_Goods
                                                 , inObjectId          := inAccountId
                                                 , inJuridicalId_basis := inJuridicalId_basis
                                                 , inBusinessId        := inBusinessId
                                                 , inObjectCostDescId  := zc_ObjectCost_Basis()
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)������������� 5)����� 6)!!!������ ������!!! 7)���� ������� 8)������ ���������� 9)������ ����������(����������� �/�)
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)��������� (��) 5)����� 6)!!!������ ������!!! 7)���� ������� 8)������ ���������� 9)������ ����������(����������� �/�)
                                                 , inObjectCostId      := CASE WHEN inPartionGoodsId <> 0
                                                                                    THEN lpInsertFind_ObjectCost (inObjectCostDescId:= zc_ObjectCost_Basis()
                                                                                                                , inDescId_1   := zc_ObjectCostLink_Goods()
                                                                                                                , inObjectId_1 := inGoodsId
                                                                                                                , inDescId_2   := zc_ObjectCostLink_PartionGoods()
                                                                                                                , inObjectId_2 := inPartionGoodsId
                                                                                                                , inDescId_3   := CASE WHEN inPersonalId <> 0 THEN zc_ObjectCostLink_Personal() ELSE zc_ObjectCostLink_Unit() END
                                                                                                                , inObjectId_3 := CASE WHEN inPersonalId <> 0 THEN inPersonalId ELSE inUnitId END
                                                                                                                , inDescId_4   := zc_ObjectCostLink_InfoMoney()
                                                                                                                , inObjectId_4 := inInfoMoneyId
                                                                                                                , inDescId_5   := zc_ObjectCostLink_InfoMoneyDetail()
                                                                                                                , inObjectId_5 := inInfoMoneyId_Detail
                                                                                                                , inDescId_6   := zc_ObjectCostLink_GoodsKind()
                                                                                                                , inObjectId_6 := inGoodsKindId
                                                                                                                , inDescId_7   := zc_ObjectCostLink_Branch()
                                                                                                                , inObjectId_7 := inBranchId
                                                                                                                , inDescId_8   := zc_ObjectCostLink_Business()
                                                                                                                , inObjectId_8 := inBusinessId
                                                                                                                , inDescId_9   := zc_ObjectCostLink_JuridicalBasis()
                                                                                                                , inObjectId_9 := inJuridicalId_basis
                                                                                                            )
                                                                               ELSE lpInsertFind_ObjectCost (inObjectCostDescId:= zc_ObjectCost_Basis()
                                                                                                           , inDescId_1   := zc_ObjectCostLink_Goods()
                                                                                                           , inObjectId_1 := inGoodsId
                                                                                                           , inDescId_2   := zc_ObjectCostLink_GoodsKind()
                                                                                                           , inObjectId_2 := inGoodsKindId
                                                                                                           , inDescId_3   := CASE WHEN inPersonalId <> 0 THEN zc_ObjectCostLink_Personal() ELSE zc_ObjectCostLink_Unit() END
                                                                                                           , inObjectId_3 := CASE WHEN inPersonalId <> 0 THEN inPersonalId ELSE inUnitId END
                                                                                                           , inDescId_4   := zc_ObjectCostLink_InfoMoney()
                                                                                                           , inObjectId_4 := inInfoMoneyId
                                                                                                           , inDescId_5   := zc_ObjectCostLink_InfoMoneyDetail()
                                                                                                           , inObjectId_5 := inInfoMoneyId_Detail
                                                                                                           , inDescId_6   := zc_ObjectCostLink_Branch()
                                                                                                           , inObjectId_6 := inBranchId
                                                                                                           , inDescId_7   := zc_ObjectCostLink_Business()
                                                                                                           , inObjectId_7 := inBusinessId
                                                                                                           , inDescId_8   := zc_ObjectCostLink_JuridicalBasis()
                                                                                                           , inObjectId_8 := inJuridicalId_basis
                                                                                                            )
                                                                          END
                                                 , inDescId_1   := CASE WHEN inPersonalId <> 0 THEN zc_ContainerLinkObject_Personal() ELSE zc_ContainerLinkObject_Unit() END
                                                 , inObjectId_1 := CASE WHEN inPersonalId <> 0 THEN inPersonalId ELSE inUnitId END
                                                 , inDescId_2   := zc_ContainerLinkObject_Goods()
                                                 , inObjectId_2 := inGoodsId
                                                 , inDescId_3   := zc_ContainerLinkObject_GoodsKind()
                                                 , inObjectId_3 := inGoodsKindId
                                                 , inDescId_4   := zc_ContainerLinkObject_InfoMoney()
                                                 , inObjectId_4 := inInfoMoneyId
                                                 , inDescId_5   := zc_ContainerLinkObject_InfoMoneyDetail()
                                                 , inObjectId_5 := inInfoMoneyId_Detail
                                                 , inDescId_6   := CASE WHEN inPartionGoodsId <> 0 THEN zc_ContainerLinkObject_PartionGoods() ELSE NULL END
                                                 , inObjectId_6 := CASE WHEN inPartionGoodsId <> 0 THEN inPartionGoodsId ELSE 0 END
                                                  );
     ELSE
     IF inInfoMoneyDestinationId IN (zc_Enum_InfoMoneyDestination_20500()) -- 20500; "��������� ����" -- select * from lfSelect_Object_InfoMoney() where inInfoMoneyDestinationId = zc_Enum_InfoMoneyDestination_20500()
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)����� 2)������ ���������� 3)������ ����������(����������� �/�)
     THEN vbContainerId := lpInsertFind_Container (inContainerDescId   := zc_Container_Summ()
                                                 , inParentId          := NULL -- !!!�������� �������� �� ������� � ��������������!!!
                                                 , inObjectId          := inAccountId
                                                 , inJuridicalId_basis := inJuridicalId_basis
                                                 , inBusinessId        := inBusinessId
                                                 , inObjectCostDescId  := zc_ObjectCost_Basis()
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)����� 4)������ ���������� 5)������ ����������(����������� �/�)
                                                 , inObjectCostId      := lpInsertFind_ObjectCost (inObjectCostDescId:= zc_ObjectCost_Basis()
                                                                                                 , inDescId_1   := zc_ObjectCostLink_Goods()
                                                                                                 , inObjectId_1 := inGoodsId
                                                                                                 , inDescId_2   := zc_ObjectCostLink_InfoMoney()
                                                                                                 , inObjectId_2 := inInfoMoneyId
                                                                                                 , inDescId_3   := zc_ObjectCostLink_InfoMoneyDetail()
                                                                                                 , inObjectId_3 := inInfoMoneyId_Detail
                                                                                                 , inDescId_4   := zc_ObjectCostLink_Unit()
                                                                                                 , inObjectId_4 := 0
                                                                                                 , inDescId_5   := zc_ObjectCostLink_Branch()
                                                                                                 , inObjectId_5 := 0
                                                                                                 , inDescId_6   := zc_ObjectCostLink_Business()
                                                                                                 , inObjectId_6 := inBusinessId
                                                                                                 , inDescId_7   := zc_ObjectCostLink_JuridicalBasis()
                                                                                                 , inObjectId_7 := inJuridicalId_basis
                                                                                                  )
                                                 , inDescId_1   := zc_ContainerLinkObject_Unit()
                                                 , inObjectId_1 := 0
                                                 , inDescId_2   := zc_ContainerLinkObject_Goods()
                                                 , inObjectId_2 := inGoodsId
                                                 , inDescId_4   := zc_ContainerLinkObject_InfoMoney()
                                                 , inObjectId_4 := inInfoMoneyId
                                                 , inDescId_5   := zc_ContainerLinkObject_InfoMoneyDetail()
                                                 , inObjectId_5 := inInfoMoneyId_Detail
                                                  );
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)������������� 2)����� 3)������ ���������� 4)������ ����������(����������� �/�)
                           -- 0.1.)���� 0.2.)������� �� ���� 0.3.)������ 1)��������� (��) 2)����� 3)������ ���������� 4)������ ����������(����������� �/�)
     ELSE vbContainerId := lpInsertFind_Container (inContainerDescId:= zc_Container_Summ()
                                                 , inParentId          := inContainerId_Goods
                                                 , inObjectId          := inAccountId
                                                 , inJuridicalId_basis := inJuridicalId_basis
                                                 , inBusinessId        := inBusinessId
                                                 , inObjectCostDescId  := zc_ObjectCost_Basis()
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)!�������������! 5)����� 6)������ ���������� 7)������ ����������(����������� �/�)
                                                                          -- <������� �/�>: 1.)������� �� ���� 2.)������ 3)������ 4)��������� (��) 5)����� 6)������ ���������� 7)������ ����������(����������� �/�)
                                                 , inObjectCostId      := lpInsertFind_ObjectCost (inObjectCostDescId:= zc_ObjectCost_Basis()
                                                                                                 , inDescId_1   := zc_ObjectCostLink_Goods()
                                                                                                 , inObjectId_1 := inGoodsId
                                                                                                 , inDescId_2   := CASE WHEN inPersonalId <> 0 THEN zc_ObjectCostLink_Personal() ELSE zc_ObjectCostLink_Unit() END
                                                                                                 , inObjectId_2 := CASE WHEN inPersonalId <> 0 AND inOperDate >= zc_DateStart_ObjectCostOnUnit() THEN inPersonalId WHEN inOperDate >= zc_DateStart_ObjectCostOnUnit() THEN inUnitId ELSE 0 END
                                                                                                 , inDescId_3   := zc_ObjectCostLink_InfoMoney()
                                                                                                 , inObjectId_3 := inInfoMoneyId
                                                                                                 , inDescId_4   := zc_ObjectCostLink_InfoMoneyDetail()
                                                                                                 , inObjectId_4 := inInfoMoneyId_Detail
                                                                                                 , inDescId_5   := zc_ObjectCostLink_Branch()
                                                                                                 , inObjectId_5 := inBranchId
                                                                                                 , inDescId_6   := zc_ObjectCostLink_Business()
                                                                                                 , inObjectId_6 := inBusinessId
                                                                                                 , inDescId_7   := zc_ObjectCostLink_JuridicalBasis()
                                                                                                 , inObjectId_7 := inJuridicalId_basis
                                                                                                  )
                                                 , inDescId_1   := CASE WHEN inPersonalId <> 0 THEN zc_ContainerLinkObject_Personal() ELSE zc_ContainerLinkObject_Unit() END
                                                 , inObjectId_1 := CASE WHEN inPersonalId <> 0 THEN inPersonalId ELSE inUnitId END
                                                 , inDescId_2   := zc_ContainerLinkObject_Goods()
                                                 , inObjectId_2 := inGoodsId
                                                 , inDescId_3   := zc_ContainerLinkObject_InfoMoney()
                                                 , inObjectId_3 := inInfoMoneyId
                                                 , inDescId_4   := zc_ContainerLinkObject_InfoMoneyDetail()
                                                 , inObjectId_4 := inInfoMoneyId_Detail
                                                  );
     END IF;
     END IF;
     END IF;
     END IF;

     -- ���������� ��������
     RETURN (vbContainerId);

END;
$BODY$
  LANGUAGE plpgsql VOLATILE;
ALTER FUNCTION lpInsertUpdate_ContainerSumm_Goods (TDateTime, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Integer, Boolean, Integer, Integer) OWNER TO postgres;

/*-------------------------------------------------------------------------------*/
/*
 ������� ����������: ����, �����
               ������� �.�.   ������ �.�.   ���������� �.�.
 17.09.13                                        * CASE -> IF
 16.09.13                                        *
*/

-- ����
-- SELECT * FROM lpInsertUpdate_ContainerSumm_Goods ()