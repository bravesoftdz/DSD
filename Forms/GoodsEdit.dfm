﻿inherited GoodsEditForm: TGoodsEditForm
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
  ClientHeight = 361
  ClientWidth = 352
  ExplicitWidth = 360
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  object edName: TcxTextEdit
    Left = 40
    Top = 71
    TabOrder = 0
    Width = 273
  end
  object cxLabel1: TcxLabel
    Left = 40
    Top = 48
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object cxButton1: TcxButton
    Left = 64
    Top = 320
    Width = 75
    Height = 25
    Action = dsdInsertUpdateGuides
    Default = True
    ModalResult = 8
    TabOrder = 2
  end
  object cxButton2: TcxButton
    Left = 192
    Top = 320
    Width = 75
    Height = 25
    Action = dsdFormClose
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 8
    TabOrder = 3
  end
  object Код: TcxLabel
    Left = 40
    Top = 3
    Caption = #1050#1086#1076
  end
  object ceCode: TcxCurrencyEdit
    Left = 40
    Top = 26
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    TabOrder = 5
    Width = 273
  end
  object cxLabel3: TcxLabel
    Left = 40
    Top = 98
    Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074
  end
  object cxLabel4: TcxLabel
    Left = 40
    Top = 214
    Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103
  end
  object cxLabel2: TcxLabel
    Left = 264
    Top = 262
    Caption = #1042#1077#1089
  end
  object ceWeight: TcxCurrencyEdit
    Left = 264
    Top = 285
    Properties.DecimalPlaces = 4
    Properties.DisplayFormat = ',0.####'
    TabOrder = 9
    Width = 49
  end
  object ceParentGroup: TcxButtonEdit
    Left = 40
    Top = 127
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 10
    Width = 273
  end
  object ceMeasure: TcxButtonEdit
    Left = 40
    Top = 237
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 11
    Width = 113
  end
  object сеTradeMark: TcxButtonEdit
    Left = 40
    Top = 183
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 12
    Width = 113
  end
  object cxLabel5: TcxLabel
    Left = 40
    Top = 160
    Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
  end
  object ceInfoMoney: TcxButtonEdit
    Left = 159
    Top = 183
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 14
    Width = 154
  end
  object cxLabel6: TcxLabel
    Left = 159
    Top = 160
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1095#1077#1089#1082#1080#1077' '#1072#1085#1072#1083#1080#1090#1080#1082#1080
  end
  object cxLabel7: TcxLabel
    Left = 159
    Top = 214
    Caption = #1041#1080#1079#1085#1077#1089
  end
  object ceBusiness: TcxButtonEdit
    Left = 159
    Top = 237
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 17
    Width = 154
  end
  object cxLabel8: TcxLabel
    Left = 39
    Top = 262
    Caption = #1042#1080#1076' '#1090#1086#1087#1083#1080#1074#1072
  end
  object edFuel: TcxButtonEdit
    Left = 39
    Top = 285
    Properties.Buttons = <
      item
        Default = True
        Kind = bkEllipsis
      end>
    TabOrder = 19
    Width = 210
  end
  object ActionList: TActionList
    Left = 304
    Top = 80
    object dsdDataSetRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      StoredProc = spGet
      StoredProcList = <
        item
          StoredProc = spGet
        end
        item
        end
        item
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 116
    end
    object dsdFormClose: TdsdFormClose
    end
    object dsdInsertUpdateGuides: TdsdInsertUpdateGuides
      Category = 'DSDLib'
      StoredProc = spInsertUpdate
      StoredProcList = <
        item
          StoredProc = spInsertUpdate
        end>
      Caption = #1054#1082
    end
  end
  object spInsertUpdate: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_Object_Goods'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'ioId'
        Component = dsdFormParams
        ComponentItem = 'Id'
        ParamType = ptInputOutput
      end
      item
        Name = 'inCode'
        Component = ceCode
        ParamType = ptInput
      end
      item
        Name = 'inName'
        Component = edName
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'inWeight'
        Component = ceWeight
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'inGoodsGroupId'
        Component = GoodsGroupGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inMeasureId'
        Component = dsdMeasureGuides
        ParamType = ptInput
      end
      item
        Name = 'inTradeMarkId'
        Component = TradeMarkGuides
        ParamType = ptInput
      end
      item
        Name = 'inInfoMoneyId'
        Component = dsdInfoMoneyGuides
        ParamType = ptInput
      end
      item
        Name = 'inBusinessId'
        Component = BusinessGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inFuelId'
        Component = FuelGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end>
    Left = 232
    Top = 48
  end
  object dsdFormParams: TdsdFormParams
    Params = <
      item
        Name = 'Id'
        ParamType = ptInputOutput
      end>
    Left = 240
  end
  object spGet: TdsdStoredProc
    StoredProcName = 'gpGet_Object_Goods'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'Id'
        Component = dsdFormParams
        ComponentItem = 'Id'
        ParamType = ptInput
      end
      item
        Name = 'Name'
        Component = edName
        DataType = ftString
      end
      item
        Name = 'Code'
        Component = ceCode
      end
      item
        Name = 'GoodsGroupId'
        Component = GoodsGroupGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'GoodsGroupName'
        Component = GoodsGroupGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end
      item
        Name = 'MeasureId'
        Component = dsdMeasureGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'MeasureName'
        Component = dsdMeasureGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end
      item
        Name = 'TradeMarkId'
        Component = TradeMarkGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TradeMarkName'
        Component = TradeMarkGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end
      item
        Name = 'InfoMoneyId'
        Component = dsdInfoMoneyGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'InfoMoneyName'
        Component = dsdInfoMoneyGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end
      item
        Name = 'Weight'
        Component = ceWeight
        DataType = ftCurrency
      end
      item
        Name = 'FuelId'
        Component = FuelGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'FuelName'
        Component = FuelGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end
      item
        Name = 'BusinessId'
        Component = BusinessGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'BusinessName'
        Component = BusinessGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 192
    Top = 88
  end
  object dsdMeasureGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceMeasure
    FormName = 'TMeasureForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Component = dsdMeasureGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Component = dsdMeasureGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 40
    Top = 224
  end
  object TradeMarkGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = сеTradeMark
    FormName = 'TTradeMarkForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Component = TradeMarkGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Component = TradeMarkGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 88
    Top = 176
  end
  object dsdInfoMoneyGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceInfoMoney
    FormName = 'TInfoMoneyForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Component = dsdInfoMoneyGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Component = dsdInfoMoneyGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 224
    Top = 171
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Top'
          'Width')
      end>
    StorageName = 'cxPropertiesStore'
    StorageType = stStream
    Left = 280
    Top = 312
  end
  object dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 8
  end
  object BusinessGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceBusiness
    FormName = 'TBusinessForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Component = BusinessGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Component = BusinessGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 192
    Top = 232
  end
  object FuelGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edFuel
    FormName = 'TFuelForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Component = FuelGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Component = FuelGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 64
    Top = 272
  end
  object GoodsGroupGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceParentGroup
    FormName = 'TGoodsGroupForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Component = GoodsGroupGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Component = GoodsGroupGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 208
    Top = 112
  end
end
