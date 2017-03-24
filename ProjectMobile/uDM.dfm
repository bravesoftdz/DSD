object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 516
  Width = 1059
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 40
    Top = 97
  end
  object qryMeta: TFDMetaInfoQuery
    Connection = conMain
    MetaInfoKind = mkCatalogs
    Left = 120
    Top = 32
  end
  object qryMeta2: TFDMetaInfoQuery
    Connection = conMain
    MetaInfoKind = mkCatalogs
    Left = 184
    Top = 32
  end
  object conMain: TFDConnection
    Params.Strings = (
      
        'Database=C:\POLAK\PROJECT\OUTSORCE\Customers\VisualTax\vtMobile\' +
        'DataBase\vtMobile.sdb'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 272
    Top = 32
  end
  object tblObject_Const: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Const'
    TableName = 'Object_Const'
    Left = 416
    Top = 128
    object tblObject_ConstPaidKindId_First: TIntegerField
      FieldName = 'PaidKindId_First'
    end
    object tblObject_ConstPaidKindName_First: TStringField
      FieldName = 'PaidKindName_First'
      Size = 255
    end
    object tblObject_ConstPaidKindId_Second: TIntegerField
      FieldName = 'PaidKindId_Second'
    end
    object tblObject_ConstPaidKindName_Second: TStringField
      FieldName = 'PaidKindName_Second'
      Size = 255
    end
    object tblObject_ConstStatusId_Complete: TIntegerField
      FieldName = 'StatusId_Complete'
    end
    object tblObject_ConstStatusName_Complete: TStringField
      FieldName = 'StatusName_Complete'
      Size = 255
    end
    object tblObject_ConstStatusId_UnComplete: TIntegerField
      FieldName = 'StatusId_UnComplete'
    end
    object tblObject_ConstStatusName_UnComplete: TStringField
      FieldName = 'StatusName_UnComplete'
      Size = 255
    end
    object tblObject_ConstStatusId_Erased: TIntegerField
      FieldName = 'StatusId_Erased'
    end
    object tblObject_ConstStatusName_Erased: TStringField
      FieldName = 'StatusName_Erased'
      Size = 255
    end
    object tblObject_ConstUnitId: TIntegerField
      FieldName = 'UnitId'
    end
    object tblObject_ConstUnitName: TStringField
      FieldName = 'UnitName'
      Size = 255
    end
    object tblObject_ConstUnitId_ret: TIntegerField
      FieldName = 'UnitId_ret'
    end
    object tblObject_ConstUnitName_ret: TStringField
      FieldName = 'UnitName_ret'
    end
    object tblObject_ConstCashId: TIntegerField
      FieldName = 'CashId'
    end
    object tblObject_ConstCashName: TStringField
      FieldName = 'CashName'
      Size = 255
    end
    object tblObject_ConstMemberId: TIntegerField
      FieldName = 'MemberId'
    end
    object tblObject_ConstMemberName: TStringField
      FieldName = 'MemberName'
      Size = 255
    end
    object tblObject_ConstPersonalId: TIntegerField
      FieldName = 'PersonalId'
    end
    object tblObject_ConstUserId: TIntegerField
      FieldName = 'UserId'
    end
    object tblObject_ConstUserLogin: TStringField
      FieldName = 'UserLogin'
      Size = 255
    end
    object tblObject_ConstUserPassword: TStringField
      FieldName = 'UserPassword'
      Size = 255
    end
    object tblObject_ConstWebService: TStringField
      FieldName = 'WebService'
      Size = 255
    end
    object tblObject_ConstSyncDateIn: TDateTimeField
      FieldName = 'SyncDateIn'
    end
    object tblObject_ConstSyncDateOut: TDateTimeField
      FieldName = 'SyncDateOut'
    end
  end
  object tblObject_Partner: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Partner'
    TableName = 'Object_Partner'
    Left = 416
    Top = 200
    object tblObject_PartnerId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_PartnerObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_PartnerValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_PartnerAddress: TStringField
      FieldName = 'Address'
      Size = 255
    end
    object tblObject_PartnerGPSN: TFloatField
      FieldName = 'GPSN'
    end
    object tblObject_PartnerGPSE: TFloatField
      FieldName = 'GPSE'
    end
    object tblObject_PartnerSchedule: TStringField
      FieldName = 'Schedule'
      Size = 255
    end
    object tblObject_PartnerDebtSum: TFloatField
      FieldName = 'DebtSum'
    end
    object tblObject_PartnerOverSum: TFloatField
      FieldName = 'OverSum'
    end
    object tblObject_PartnerOverDays: TIntegerField
      FieldName = 'OverDays'
    end
    object tblObject_PartnerPrepareDayCount: TIntegerField
      FieldName = 'PrepareDayCount'
    end
    object tblObject_PartnerDocumentDayCount: TFloatField
      FieldName = 'DocumentDayCount'
    end
    object tblObject_PartnerCalcDayCount: TFloatField
      FieldName = 'CalcDayCount'
    end
    object tblObject_PartnerOrderDayCount: TFloatField
      FieldName = 'OrderDayCount'
    end
    object tblObject_PartnerisOperDateOrder: TBooleanField
      FieldName = 'isOperDateOrder'
    end
    object tblObject_PartnerJuridicalId: TIntegerField
      FieldName = 'JuridicalId'
    end
    object tblObject_PartnerRouteId: TIntegerField
      FieldName = 'RouteId'
    end
    object tblObject_PartnerContractId: TIntegerField
      FieldName = 'ContractId'
    end
    object tblObject_PartnerPriceListId: TIntegerField
      FieldName = 'PriceListId'
    end
    object tblObject_PartnerPriceListId_ret: TIntegerField
      FieldName = 'PriceListId_ret'
    end
    object tblObject_PartnerisErased: TBooleanField
      FieldName = 'isErased'
    end
    object tblObject_PartnerisSync: TBooleanField
      FieldName = 'isSync'
    end
  end
  object tblObject_Juridical: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Juridical'
    TableName = 'Object_Juridical'
    Left = 416
    Top = 328
    object tblObject_JuridicalId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_JuridicalObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_JuridicalValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_JuridicalDebtSum: TFloatField
      FieldName = 'DebtSum'
    end
    object tblObject_JuridicalOverSum: TFloatField
      FieldName = 'OverSum'
    end
    object tblObject_JuridicalOverDays: TIntegerField
      FieldName = 'OverDays'
    end
    object tblObject_JuridicalContractId: TIntegerField
      FieldName = 'ContractId'
    end
    object tblObject_JuridicalisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_Route: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Route'
    TableName = 'Object_Route'
    Left = 528
    Top = 128
    object tblObject_RouteId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_RouteObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_RouteValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_RouteisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_GoodsGroup: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_GoodsGroup'
    TableName = 'Object_GoodsGroup'
    Left = 648
    Top = 128
    object tblObject_GoodsGroupId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_GoodsGroupObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_GoodsGroupValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_GoodsGroupisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_Goods: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Goods'
    TableName = 'Object_Goods'
    Left = 648
    Top = 200
    object tblObject_GoodsId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_GoodsObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_GoodsValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_GoodsWeight: TFloatField
      FieldName = 'Weight'
    end
    object tblObject_GoodsGoodsGroupId: TIntegerField
      FieldName = 'GoodsGroupId'
    end
    object tblObject_GoodsMeasureId: TIntegerField
      FieldName = 'MeasureId'
    end
    object tblObject_GoodsisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_GoodsKind: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_GoodsKind'
    TableName = 'Object_GoodsKind'
    Left = 648
    Top = 264
    object tblObject_GoodsKindId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_GoodsKindObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_GoodsKindValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_GoodsKindisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_Measure: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Measure'
    TableName = 'Object_Measure'
    Left = 648
    Top = 392
    object tblObject_MeasureId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_MeasureObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_MeasureValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_MeasureisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_GoodsByGoodsKind: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_GoodsByGoodsKind'
    TableName = 'Object_GoodsByGoodsKind'
    Left = 648
    Top = 328
    object tblObject_GoodsByGoodsKindId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_GoodsByGoodsKindGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object tblObject_GoodsByGoodsKindGoodsKindId: TIntegerField
      FieldName = 'GoodsKindId'
    end
    object tblObject_GoodsByGoodsKindRemains: TFloatField
      FieldName = 'Remains'
    end
    object tblObject_GoodsByGoodsKindForecast: TFloatField
      FieldName = 'Forecast'
    end
    object tblObject_GoodsByGoodsKindisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_Contract: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_Contract'
    TableName = 'Object_Contract'
    Left = 416
    Top = 264
    object tblObject_ContractId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_ContractObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_ContractValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_ContractContractTagName: TStringField
      FieldName = 'ContractTagName'
      Size = 255
    end
    object tblObject_ContractInfoMoneyName: TStringField
      FieldName = 'InfoMoneyName'
      Size = 255
    end
    object tblObject_ContractComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object tblObject_ContractPaidKindId: TIntegerField
      FieldName = 'PaidKindId'
    end
    object tblObject_ContractStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object tblObject_ContractEndDate: TDateTimeField
      FieldName = 'EndDate'
    end
    object tblObject_ContractChangePercent: TFloatField
      FieldName = 'ChangePercent'
    end
    object tblObject_ContractDelayDayCalendar: TFloatField
      FieldName = 'DelayDayCalendar'
    end
    object tblObject_ContractDelayDayBank: TFloatField
      FieldName = 'DelayDayBank'
    end
    object tblObject_ContractisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_PriceList: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_PriceList'
    TableName = 'Object_PriceList'
    Left = 528
    Top = 200
    object tblObject_PriceListId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_PriceListObjectCode: TIntegerField
      FieldName = 'ObjectCode'
    end
    object tblObject_PriceListValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
    object tblObject_PriceListPriceWithVAT: TBooleanField
      FieldName = 'PriceWithVAT'
    end
    object tblObject_PriceListVATPercent: TFloatField
      FieldName = 'VATPercent'
    end
    object tblObject_PriceListisErased: TBooleanField
      FieldName = 'isErased'
    end
  end
  object tblObject_PriceListItems: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_PriceListItems'
    TableName = 'Object_PriceListItems'
    Left = 528
    Top = 264
    object tblObject_PriceListItemsId: TIntegerField
      FieldName = 'Id'
    end
    object tblObject_PriceListItemsGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object tblObject_PriceListItemsPriceListId: TIntegerField
      FieldName = 'PriceListId'
    end
    object tblObject_PriceListItemsStartDate: TDateTimeField
      FieldName = 'OrderStartDate'
    end
    object tblObject_PriceListItemsEndDate: TDateTimeField
      FieldName = 'OrderEndDate'
    end
    object tblObject_PriceListItemsPrice: TFloatField
      FieldName = 'OrderPrice'
    end
    object tblObject_PriceListItemsSaleStartDate: TDateTimeField
      FieldName = 'SaleStartDate'
    end
    object tblObject_PriceListItemsSaleEndDate: TDateTimeField
      FieldName = 'SaleEndDate'
    end
    object tblObject_PriceListItemsSalePrice: TFloatField
      FieldName = 'SalePrice'
    end
  end
  object qryPartner: TFDQuery
    Connection = conMain
    Left = 40
    Top = 176
    object qryPartnerId: TIntegerField
      FieldName = 'Id'
    end
    object qryPartnerName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object qryPartnerAddress: TStringField
      FieldName = 'Address'
      Size = 255
    end
    object qryPartnerSCHEDULE: TStringField
      FieldName = 'SCHEDULE'
    end
    object qryPartnerGPSN: TFloatField
      FieldName = 'GPSN'
    end
    object qryPartnerGPSE: TFloatField
      FieldName = 'GPSE'
    end
    object qryPartnerCONTRACTID: TIntegerField
      FieldName = 'CONTRACTID'
    end
    object qryPartnerContractName: TWideStringField
      FieldName = 'ContractName'
    end
    object qryPartnerPRICELISTID: TIntegerField
      FieldName = 'PRICELISTID'
    end
    object qryPartnerPaidKindId: TIntegerField
      FieldName = 'PaidKindId'
    end
    object qryPartnerChangePercent: TFloatField
      FieldName = 'ChangePercent'
    end
    object qryPartnerPriceWithVAT: TBooleanField
      FieldName = 'PriceWithVAT'
    end
    object qryPartnerVATPercent: TFloatField
      FieldName = 'VATPercent'
    end
    object qryPartnerCalcDayCount: TFloatField
      FieldName = 'CalcDayCount'
    end
    object qryPartnerOrderDayCount: TFloatField
      FieldName = 'OrderDayCount'
    end
    object qryPartnerisOperDateOrder: TBooleanField
      FieldName = 'isOperDateOrder'
    end
  end
  object qryPriceList: TFDQuery
    Connection = conMain
    SQL.Strings = (
      '')
    Left = 40
    Top = 448
    object qryPriceListId: TIntegerField
      FieldName = 'Id'
    end
    object qryPriceListValueData: TStringField
      FieldName = 'ValueData'
      Size = 255
    end
  end
  object qryGoodsForPriceList: TFDQuery
    Connection = conMain
    Left = 128
    Top = 448
    object qryGoodsForPriceListId: TIntegerField
      FieldName = 'Id'
    end
    object qryGoodsForPriceListOBJECTCODE: TIntegerField
      FieldName = 'OBJECTCODE'
    end
    object qryGoodsForPriceListGoodsName: TStringField
      FieldName = 'GoodsName'
      Size = 255
    end
    object qryGoodsForPriceListKindName: TStringField
      FieldName = 'KindName'
      Size = 255
    end
    object qryGoodsForPriceListPrice: TWideStringField
      FieldName = 'Price'
      Size = 200
    end
  end
  object tblMovement_OrderExternal: TFDTable
    Connection = conMain
    FetchOptions.AssignedValues = [evDetailCascade]
    UpdateOptions.UpdateTableName = 'Movement_OrderExternal'
    TableName = 'Movement_OrderExternal'
    Left = 800
    Top = 120
    object tblMovement_OrderExternalId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovement_OrderExternalGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovement_OrderExternalInvNumber: TStringField
      FieldName = 'InvNumber'
      Size = 255
    end
    object tblMovement_OrderExternalOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object tblMovement_OrderExternalStatusId: TIntegerField
      FieldName = 'StatusId'
    end
    object tblMovement_OrderExternalPartnerId: TIntegerField
      FieldName = 'PartnerId'
    end
    object tblMovement_OrderExternalPaidKindId: TIntegerField
      FieldName = 'PaidKindId'
    end
    object tblMovement_OrderExternalContractId: TIntegerField
      FieldName = 'ContractId'
    end
    object tblMovement_OrderExternalPriceListId: TIntegerField
      FieldName = 'PriceListId'
    end
    object tblMovement_OrderExternalPriceWithVAT: TBooleanField
      FieldName = 'PriceWithVAT'
    end
    object tblMovement_OrderExternalVATPercent: TFloatField
      FieldName = 'VATPercent'
    end
    object tblMovement_OrderExternalChangePercent: TFloatField
      FieldName = 'ChangePercent'
    end
    object tblMovement_OrderExternalTotalCountKg: TFloatField
      FieldName = 'TotalCountKg'
    end
    object tblMovement_OrderExternalTotalSumm: TFloatField
      FieldName = 'TotalSumm'
    end
    object tblMovement_OrderExternalInsertDate: TDateTimeField
      FieldName = 'InsertDate'
    end
    object tblMovement_OrderExternalisSync: TBooleanField
      FieldName = 'isSync'
    end
  end
  object tblMovementItem_OrderExternal: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'MovementItem_OrderExternal'
    TableName = 'MovementItem_OrderExternal'
    Left = 800
    Top = 184
    object tblMovementItem_OrderExternalId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovementItem_OrderExternalMovementId: TIntegerField
      FieldName = 'MovementId'
    end
    object tblMovementItem_OrderExternalGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovementItem_OrderExternalGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object tblMovementItem_OrderExternalGoodsKindId: TIntegerField
      FieldName = 'GoodsKindId'
    end
    object tblMovementItem_OrderExternalChangePercent: TFloatField
      FieldName = 'ChangePercent'
    end
    object tblMovementItem_OrderExternalAmount: TFloatField
      FieldName = 'Amount'
    end
    object tblMovementItem_OrderExternalPrice: TFloatField
      FieldName = 'Price'
    end
  end
  object tblMovement_StoreReal: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Movement_StoreReal'
    TableName = 'Movement_StoreReal'
    Left = 800
    Top = 240
    object tblMovement_StoreRealId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovement_StoreRealGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovement_StoreRealInvNumber: TStringField
      FieldName = 'InvNumber'
      Size = 255
    end
    object tblMovement_StoreRealOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object tblMovement_StoreRealStatusId: TIntegerField
      FieldName = 'StatusId'
    end
    object tblMovement_StoreRealPartnerId: TIntegerField
      FieldName = 'PartnerId'
    end
    object tblMovement_StoreRealComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object tblMovement_StoreRealIsSync: TBooleanField
      FieldName = 'IsSync'
    end
  end
  object tblMovementItem_StoreReal: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'MovementItem_StoreReal'
    TableName = 'MovementItem_StoreReal'
    Left = 800
    Top = 304
    object tblMovementItem_StoreRealId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovementItem_StoreRealMovementId: TIntegerField
      FieldName = 'MovementId'
    end
    object tblMovementItem_StoreRealGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovementItem_StoreRealGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object tblMovementItem_StoreRealGoodsKindId: TIntegerField
      FieldName = 'GoodsKindId'
    end
    object tblMovementItem_StoreRealAmount: TFloatField
      FieldName = 'Amount'
    end
  end
  object qryGoodsItems: TFDQuery
    FilterOptions = [foCaseInsensitive]
    Connection = conMain
    SQL.Strings = (
      '')
    Left = 40
    Top = 280
    object qryGoodsItemsGoodsID: TIntegerField
      FieldName = 'GoodsID'
    end
    object qryGoodsItemsKindID: TIntegerField
      FieldName = 'KindID'
    end
    object qryGoodsItemsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object qryGoodsItemsKind: TStringField
      FieldName = 'Kind'
      Size = 255
    end
    object qryGoodsItemsMeasure: TStringField
      FieldName = 'Measure'
      Size = 100
    end
    object qryGoodsItemsPrice: TFloatField
      FieldName = 'Price'
    end
    object qryGoodsItemsRemains: TFloatField
      FieldName = 'Remains'
    end
    object qryGoodsItemsFullInfo: TWideStringField
      FieldName = 'FullInfo'
      Size = 1000
    end
    object qryGoodsItemsPromoPrice: TWideStringField
      FieldName = 'PromoPrice'
      Size = 15
    end
    object qryGoodsItemsSearchName: TWideStringField
      FieldName = 'SearchName'
      Size = 257
    end
  end
  object tblMovement_Visit: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Movement_Visit'
    TableName = 'Movement_Visit'
    Left = 960
    Top = 120
    object tblMovement_VisitId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovement_VisitGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovement_VisitPartnerId: TIntegerField
      FieldName = 'PartnerId'
    end
    object tblMovement_VisitComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object tblMovement_VisitInvNumber: TStringField
      FieldName = 'InvNumber'
      Size = 255
    end
    object tblMovement_VisitOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object tblMovement_VisitStatusId: TIntegerField
      FieldName = 'StatusId'
    end
    object tblMovement_VisitisSync: TBooleanField
      FieldName = 'isSync'
    end
  end
  object tblObject_GoodsListSale: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Object_GoodsListSale'
    TableName = 'Object_GoodsListSale'
    Left = 528
    Top = 328
    object IntegerField1: TIntegerField
      FieldName = 'Id'
    end
    object IntegerField2: TIntegerField
      FieldName = 'GoodsId'
    end
    object IntegerField3: TIntegerField
      FieldName = 'GoodsKindId'
    end
    object tblObject_GoodsListSalePartnerId: TIntegerField
      FieldName = 'PartnerId'
    end
    object tblObject_GoodsListSaleAmountCalc: TFloatField
      FieldName = 'AmountCalc'
    end
    object BooleanField2: TBooleanField
      FieldName = 'isErased'
    end
  end
  object cdsOrderItems: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 224
    Top = 224
    object cdsOrderItemsId: TIntegerField
      FieldName = 'Id'
    end
    object cdsOrderItemsName: TStringField
      FieldName = 'Name'
      Size = 250
    end
    object cdsOrderItemsType: TStringField
      FieldName = 'Type'
      Size = 255
    end
    object cdsOrderItemsPrice: TFloatField
      FieldName = 'Price'
    end
    object cdsOrderItemsWeight: TFloatField
      FieldName = 'Weight'
    end
    object cdsOrderItemsRemains: TFloatField
      FieldName = 'Remains'
    end
    object cdsOrderItemsRecommend: TStringField
      FieldName = 'Recommend'
      Size = 10
    end
    object cdsOrderItemsMeasure: TStringField
      FieldName = 'Measure'
      Size = 100
    end
    object cdsOrderItemsCount: TFloatField
      FieldName = 'Count'
    end
    object cdsOrderItemsGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object cdsOrderItemsKindId: TIntegerField
      FieldName = 'KindId'
    end
    object cdsOrderItemsIsPromo: TStringField
      FieldName = 'IsPromo'
      Size = 50
    end
    object cdsOrderItemsisChangePercent: TBooleanField
      FieldName = 'isChangePercent'
    end
  end
  object cdsOrderExternal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 224
    object cdsOrderExternalid: TIntegerField
      FieldName = 'id'
    end
    object cdsOrderExternalOperDate: TDateField
      FieldName = 'OperDate'
    end
    object cdsOrderExternalName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsOrderExternalPrice: TStringField
      FieldName = 'Price'
      Size = 100
    end
    object cdsOrderExternalWeigth: TStringField
      FieldName = 'Weigth'
      Size = 100
    end
    object cdsOrderExternalStatus: TStringField
      FieldName = 'Status'
      Size = 200
    end
  end
  object tblMovement_RouteMember: TFDTable
    Connection = conMain
    FetchOptions.AssignedValues = [evDetailCascade]
    UpdateOptions.UpdateTableName = 'Movement_RouteMember'
    TableName = 'Movement_RouteMember'
    Left = 888
    Top = 32
    object AutoIncField1: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovement_RouteMemberGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovement_RouteMemberInsertDate: TDateTimeField
      FieldName = 'InsertDate'
    end
    object tblMovement_RouteMemberGPSN: TFloatField
      FieldName = 'GPSN'
    end
    object tblMovement_RouteMemberGPSE: TFloatField
      FieldName = 'GPSE'
    end
    object tblMovement_RouteMemberisSync: TBooleanField
      FieldName = 'isSync'
    end
  end
  object tblMovementItem_Visit: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'MovementItem_Visit'
    TableName = 'MovementItem_Visit'
    Left = 960
    Top = 184
    object tblMovementItem_VisitId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovementItem_VisitMovementId: TIntegerField
      FieldName = 'MovementId'
    end
    object tblMovementItem_VisitGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovementItem_VisitPhoto: TBlobField
      FieldName = 'Photo'
    end
    object tblMovementItem_VisitComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object tblMovementItem_VisitInsertDate: TDateTimeField
      FieldName = 'InsertDate'
    end
  end
  object qryPhotoGroups: TFDQuery
    Connection = conMain
    SQL.Strings = (
      '')
    Left = 40
    Top = 392
    object qryPhotoGroupsId: TIntegerField
      FieldName = 'Id'
    end
    object qryPhotoGroupsComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object qryPhotoGroupsStatusId: TIntegerField
      FieldName = 'StatusId'
    end
  end
  object qryPhotos: TFDQuery
    Connection = conMain
    SQL.Strings = (
      '')
    Left = 128
    Top = 392
    object qryPhotosId: TIntegerField
      FieldName = 'Id'
    end
    object qryPhotosPhoto: TBlobField
      FieldName = 'Photo'
    end
    object qryPhotosComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
  end
  object cdsStoreReals: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 280
    object cdsStoreRealsId: TIntegerField
      FieldName = 'Id'
    end
    object cdsStoreRealsOperDate: TDateField
      FieldName = 'OperDate'
    end
    object cdsStoreRealsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsStoreRealsComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object cdsStoreRealsStatus: TStringField
      FieldName = 'Status'
      Size = 255
    end
  end
  object cdsStoreRealItems: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 280
    object cdsStoreRealItemsId: TIntegerField
      FieldName = 'Id'
    end
    object cdsStoreRealItemsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsStoreRealItemsType: TStringField
      FieldName = 'Type'
      Size = 255
    end
    object cdsStoreRealItemsCount: TFloatField
      FieldName = 'Count'
    end
    object cdsStoreRealItemsMeasure: TStringField
      FieldName = 'Measure'
      Size = 100
    end
    object cdsStoreRealItemsGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object cdsStoreRealItemsKindId: TIntegerField
      FieldName = 'KindId'
    end
  end
  object tblMovement_Promo: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Movement_Promo'
    TableName = 'Movement_Promo'
    Left = 960
    Top = 264
    object tblMovement_PromoId: TIntegerField
      FieldName = 'Id'
    end
    object tblMovement_PromoInvNumber: TStringField
      FieldName = 'InvNumber'
      Size = 255
    end
    object tblMovement_PromoOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object tblMovement_PromoStatusId: TIntegerField
      FieldName = 'StatusId'
    end
    object tblMovement_PromoStartSale: TDateTimeField
      FieldName = 'StartSale'
    end
    object tblMovement_PromoEndSale: TDateTimeField
      FieldName = 'EndSale'
    end
    object tblMovement_PromoisChangePercent: TBooleanField
      FieldName = 'isChangePercent'
    end
    object tblMovement_PromoCommentMain: TStringField
      FieldName = 'CommentMain'
      Size = 255
    end
  end
  object tblMovementItem_PromoPartner: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'MovementItem_PromoPartner'
    TableName = 'MovementItem_PromoPartner'
    Left = 960
    Top = 336
    object tblMovementItem_PromoPartnerId: TIntegerField
      FieldName = 'Id'
    end
    object tblMovementItem_PromoPartnerMovementId: TIntegerField
      FieldName = 'MovementId'
    end
    object tblMovementItem_PromoPartnerContractId: TIntegerField
      FieldName = 'ContractId'
    end
    object tblMovementItem_PromoPartnerPartnerId: TIntegerField
      FieldName = 'PartnerId'
    end
  end
  object tblMovementItem_PromoGoods: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'MovementItem_PromoGoods'
    TableName = 'MovementItem_PromoGoods'
    Left = 960
    Top = 408
    object tblMovementItem_PromoGoodsId: TIntegerField
      FieldName = 'Id'
    end
    object tblMovementItem_PromoGoodsMovementId: TIntegerField
      FieldName = 'MovementId'
    end
    object tblMovementItem_PromoGoodsGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object tblMovementItem_PromoGoodsGoodsKindId: TIntegerField
      FieldName = 'GoodsKindId'
    end
    object tblMovementItem_PromoGoodsPriceWithOutVAT: TFloatField
      FieldName = 'PriceWithOutVAT'
    end
    object tblMovementItem_PromoGoodsPriceWithVAT: TFloatField
      FieldName = 'PriceWithVAT'
    end
    object tblMovementItem_PromoGoodsTaxPromo: TFloatField
      FieldName = 'TaxPromo'
    end
  end
  object tblMovement_ReturnIn: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'Movement_ReturnIn'
    TableName = 'Movement_ReturnIn'
    Left = 800
    Top = 368
    object tblMovement_ReturnInId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovement_ReturnInGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovement_ReturnInInvNumber: TStringField
      FieldName = 'InvNumber'
      Size = 255
    end
    object tblMovement_ReturnInOperDate: TDateTimeField
      FieldName = 'OperDate'
    end
    object tblMovement_ReturnInStatusId: TIntegerField
      FieldName = 'StatusId'
    end
    object tblMovement_ReturnInChecked: TBooleanField
      FieldName = 'Checked'
    end
    object tblMovement_ReturnInPriceWithVAT: TBooleanField
      FieldName = 'PriceWithVAT'
    end
    object tblMovement_ReturnInInsertDate: TDateTimeField
      FieldName = 'InsertDate'
    end
    object tblMovement_ReturnInVATPercent: TFloatField
      FieldName = 'VATPercent'
    end
    object tblMovement_ReturnInChangePercent: TFloatField
      FieldName = 'ChangePercent'
    end
    object tblMovement_ReturnInTotalCountKg: TFloatField
      FieldName = 'TotalCountKg'
    end
    object tblMovement_ReturnInTotalSummPVAT: TFloatField
      FieldName = 'TotalSummPVAT'
    end
    object tblMovement_ReturnInPaidKindId: TIntegerField
      FieldName = 'PaidKindId'
    end
    object tblMovement_ReturnInPartnerId: TIntegerField
      FieldName = 'PartnerId'
    end
    object tblMovement_ReturnInContractId: TIntegerField
      FieldName = 'ContractId'
    end
    object tblMovement_ReturnInComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
    object tblMovement_ReturnInisSync: TBooleanField
      FieldName = 'isSync'
    end
  end
  object tblMovementItem_ReturnIn: TFDTable
    Connection = conMain
    UpdateOptions.UpdateTableName = 'MovementItem_ReturnIn'
    TableName = 'MovementItem_ReturnIn'
    Left = 800
    Top = 424
    object tblMovementItem_ReturnInId: TAutoIncField
      FieldName = 'Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object tblMovementItem_ReturnInMovementId: TIntegerField
      FieldName = 'MovementId'
    end
    object tblMovementItem_ReturnInGUID: TStringField
      FieldName = 'GUID'
      Size = 255
    end
    object tblMovementItem_ReturnInGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object tblMovementItem_ReturnInGoodsKindId: TIntegerField
      FieldName = 'GoodsKindId'
    end
    object tblMovementItem_ReturnInAmount: TFloatField
      FieldName = 'Amount'
    end
    object tblMovementItem_ReturnInPrice: TFloatField
      FieldName = 'Price'
    end
    object tblMovementItem_ReturnInChangePercent: TFloatField
      FieldName = 'ChangePercent'
    end
  end
  object cdsReturnIn: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 336
    object cdsReturnInId: TIntegerField
      FieldName = 'Id'
    end
    object cdsReturnInOperDate: TDateField
      FieldName = 'OperDate'
    end
    object cdsReturnInName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsReturnInPrice: TStringField
      FieldName = 'Price'
      Size = 100
    end
    object cdsReturnInWeigth: TStringField
      FieldName = 'Weigth'
      Size = 100
    end
    object cdsReturnInStatus: TStringField
      FieldName = 'Status'
      Size = 200
    end
    object cdsReturnInComment: TStringField
      FieldName = 'Comment'
      Size = 255
    end
  end
  object cdsReturnInItems: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 336
    object cdsReturnInItemsId: TIntegerField
      FieldName = 'Id'
    end
    object cdsReturnInItemsName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object cdsReturnInItemsType: TStringField
      FieldName = 'Type'
      Size = 255
    end
    object cdsReturnInItemsPrice: TFloatField
      FieldName = 'Price'
    end
    object cdsReturnInItemsWeight: TFloatField
      FieldName = 'Weight'
    end
    object cdsReturnInItemsMeasure: TStringField
      FieldName = 'Measure'
      Size = 100
    end
    object cdsReturnInItemsCount: TFloatField
      FieldName = 'Count'
    end
    object cdsReturnInItemsGoodsId: TIntegerField
      FieldName = 'GoodsId'
    end
    object cdsReturnInItemsKindId: TIntegerField
      FieldName = 'KindId'
    end
  end
  object qryPromoList: TFDQuery
    Connection = conMain
    Left = 232
    Top = 448
    object qryPromoListId: TIntegerField
      FieldName = 'Id'
    end
    object qryPromoListInvNumber: TStringField
      FieldName = 'InvNumber'
      Size = 255
    end
    object qryPromoListStartSale: TDateTimeField
      FieldName = 'StartSale'
    end
    object qryPromoListEndSale: TDateTimeField
      FieldName = 'EndSale'
    end
    object qryPromoListChangePercent: TWideStringField
      FieldName = 'ChangePercent'
      Size = 300
    end
    object qryPromoListCommentMain: TStringField
      FieldName = 'CommentMain'
      Size = 255
    end
    object qryPromoListTermin: TWideStringField
      FieldName = 'Termin'
      Size = 200
    end
  end
  object qryPromoPartners: TFDQuery
    Connection = conMain
    Left = 312
    Top = 448
    object qryPromoPartnersName: TStringField
      FieldName = 'Name'
      Size = 255
    end
    object qryPromoPartnersContractName: TWideStringField
      FieldName = 'ContractName'
      Size = 300
    end
    object qryPromoPartnersAddress: TStringField
      FieldName = 'Address'
      Size = 255
    end
  end
  object qryPromoGoods: TFDQuery
    Connection = conMain
    Left = 400
    Top = 448
    object qryPromoGoodsGoodsName: TStringField
      FieldName = 'GoodsName'
      Size = 255
    end
    object qryPromoGoodsKindName: TStringField
      FieldName = 'KindName'
      Size = 255
    end
    object qryPromoGoodsTax: TWideStringField
      FieldName = 'Tax'
      Size = 100
    end
    object qryPromoGoodsPrice: TWideStringField
      FieldName = 'Price'
      Size = 250
    end
  end
end
