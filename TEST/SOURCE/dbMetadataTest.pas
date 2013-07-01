﻿unit dbMetaDataTest;

interface

uses TestFramework, ZConnection, ZDataset;

type
  TdbMetaDataTest = class (TTestCase)
  private
    ZConnection: TZConnection;
    ZQuery: TZQuery;
  protected
    // подготавливаем данные для тестирования
    procedure SetUp; override;
    // возвращаем данные для тестирования
    procedure TearDown; override;
  published
    procedure CreateContainerDescFunction;
    procedure InsertContainerDesc;
    procedure CreateObjectDescFunction;
    procedure InsertObjectDesc;
    procedure CreateObjectHistoryDescFunction;
    procedure InsertObjectHistoryDesc;
    procedure CreateMovementDescFunction;
    procedure InsertMovementDesc;
    procedure CreateMovementItemDescFunction;
    procedure InsertMovementItemDesc;
    procedure CreateMovementItemContainerFunction;
    procedure InsertMovementItemContainerDesc;
  end;

var
  MetadataPath: string = '..\DATABASE\COMMON\METADATA\';

implementation

uses zLibUtil;

{ TdbMetaDataTest }

procedure TdbMetaDataTest.InsertObjectDesc;
begin
  ExecFile(MetadataPath + 'Object\InsertObjectDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\InsertObjectStringDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\InsertObjectBLOBDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\InsertObjectFloatDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\InsertObjectBooleanDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\InsertObjectLinkDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\InsertObjectDateDesc.sql', ZQuery);
end;

procedure TdbMetaDataTest.InsertObjectHistoryDesc;
begin
  ExecFile(MetadataPath + 'ObjectHistory\InsertObjectHistoryDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'ObjectHistory\InsertObjectHistoryFloatDesc.sql', ZQuery);
end;

procedure TdbMetaDataTest.InsertContainerDesc;
begin
  ExecFile(MetadataPath + 'Container\InsertContainerDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Container\InsertContainerLinkObjectDesc.sql', ZQuery);
end;

procedure TdbMetaDataTest.CreateContainerDescFunction;
begin
  ExecFile(MetadataPath + 'Container\CreateContainerDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Container\CreateContainerLinkObjectDescFunction.sql', ZQuery);
end;

procedure TdbMetaDataTest.InsertMovementDesc;
begin
  ExecFile(MetadataPath + 'Movement\InsertMovementDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\InsertMovementLinkObjectDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\InsertMovementFloatDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\InsertMovementDateDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\InsertMovementBooleanDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\InsertMovementStringDesc.sql', ZQuery);
end;

procedure TdbMetaDataTest.CreateMovementDescFunction;
begin
  ExecFile(MetadataPath + 'Movement\CreateMovementDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\CreateMovementLinkObjectDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\CreateMovementFloatDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\CreateMovementDateDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\CreateMovementBooleanDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Movement\CreateMovementStringDescFunction.sql', ZQuery);
end;

procedure TdbMetaDataTest.CreateMovementItemContainerFunction;
begin
  ExecFile(MetadataPath + 'MovementItemContainer\CreateMovementItemContainerDescFunction.sql', ZQuery);
end;

procedure TdbMetaDataTest.CreateMovementItemDescFunction;
begin
  ExecFile(MetadataPath + 'MovementItem\CreateMovementItemDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\CreateMovementItemLinkObjectDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\CreateMovementItemFloatDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\CreateMovementItemBooleanDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\CreateMovementItemStringDescFunction.sql', ZQuery);
end;

procedure TdbMetaDataTest.InsertMovementItemContainerDesc;
begin
  ExecFile(MetadataPath + 'MovementItemContainer\InsertMovementItemContainerDesc.sql', ZQuery);
end;

procedure TdbMetaDataTest.InsertMovementItemDesc;
begin
  ExecFile(MetadataPath + 'MovementItem\InsertMovementItemDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\InsertMovementItemLinkObjectDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\InsertMovementItemFloatDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\InsertMovementItemBooleanDesc.sql', ZQuery);
  ExecFile(MetadataPath + 'MovementItem\InsertMovementItemStringDesc.sql', ZQuery);
end;

procedure TdbMetaDataTest.CreateObjectDescFunction;
begin
  ExecFile(MetadataPath + 'Object\CreateObjectDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\CreateObjectStringDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\CreateObjectLinkDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\CreateObjectBLOBDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\CreateObjectFloatDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\CreateObjectBooleanDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'Object\CreateObjectDateDescFunction.sql', ZQuery);
end;

procedure TdbMetaDataTest.CreateObjectHistoryDescFunction;
begin
  ExecFile(MetadataPath + 'ObjectHistory\CreateObjectHistoryDescFunction.sql', ZQuery);
  ExecFile(MetadataPath + 'ObjectHistory\CreateObjectHistoryFloatDescFunction.sql', ZQuery);
end;

procedure TdbMetaDataTest.SetUp;
begin
  inherited;
  ZConnection := TConnectionFactory.GetConnection;
  ZQuery := TZQuery.Create(nil);
  ZQuery.Connection := ZConnection;
end;

procedure TdbMetaDataTest.TearDown;
begin
  inherited;
  ZConnection.Free;
  ZQuery.Free;
end;

initialization
  TestFramework.RegisterTest('Метаданные', TdbMetaDataTest.Suite);

end.
