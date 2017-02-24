inherited MainForm: TMainForm
  Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1079#1072#1082#1072#1079#1072#1084#1080
  ClientHeight = 280
  ClientWidth = 666
  KeyPreview = True
  ExplicitWidth = 682
  ExplicitHeight = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited ActionList: TActionList
    Left = 336
    Top = 8
    inherited actAbout: TAction
      Category = 'but'
    end
    object actUser: TdsdOpenForm [4]
      Category = 'but'
      MoveParams = <>
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      FormName = 'TUserForm'
      FormNameParam.Value = 'TUserForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actForms: TdsdOpenForm [8]
      Category = 'but'
      MoveParams = <>
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1086#1081
      Hint = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1086#1081' '#1089#1080#1089#1090#1077#1084#1086#1081
      FormName = 'TFormsForm'
      FormNameParam.Value = 'TFormsForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actRole: TdsdOpenForm [9]
      Category = 'but'
      MoveParams = <>
      Caption = #1056#1086#1083#1080
      FormName = 'TRoleForm'
      FormNameParam.Value = 'TRoleForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    inherited actProtocol: TdsdOpenForm
      Category = 'but'
    end
    inherited actInfoMoneyGroup: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actInfoMoneyDestination: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actInfoMoney: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actAccountGroup: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actAccountDirection: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actProfitLossGroup: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actProfitLossDirection: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actAccount: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    inherited actProfitLoss: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    object actMeasure: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1045#1076#1080#1085#1080#1094#1099' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
      FormName = 'TMeasureForm'
      FormNameParam.Value = 'TMeasureForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actCompositionGroup: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1043#1088#1091#1087#1087#1072' '#1076#1083#1103' '#1089#1086#1089#1090#1072#1074#1072' '#1090#1086#1074#1072#1088#1072
      FormName = 'TCompositionGroupForm'
      FormNameParam.Value = 'TCompositionGroupForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actComposition: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1057#1086#1089#1090#1072#1074' '#1090#1086#1074#1072#1088#1072
      FormName = 'TCompositionForm'
      FormNameParam.Value = 'TCompositionForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actCountryBrand: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1057#1090#1088#1072#1085#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      FormName = 'TCountryBrandForm'
      FormNameParam.Value = 'TCountryBrandForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actBrand: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
      FormName = 'TBrandForm'
      FormNameParam.Value = 'TBrandForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actFabrika: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1060#1072#1073#1088#1080#1082#1072' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      FormName = 'TFabrikaForm'
      FormNameParam.Value = 'TFabrikaForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actLineFabrica: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1051#1080#1085#1080#1103' '#1082#1086#1083#1083#1077#1082#1094#1080#1080
      FormName = 'TLineFabricaForm'
      FormNameParam.Value = 'TLineFabricaForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actGoodsInfo: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
      FormName = 'TGoodsInfoForm'
      FormNameParam.Value = 'TGoodsInfoForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actGoodsSize: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1056#1072#1079#1084#1077#1088' '#1090#1086#1074#1072#1088#1072
      FormName = 'TGoodsSizeForm'
      FormNameParam.Value = 'TGoodsSizeForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actGoodsGroup: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1043#1088#1091#1087#1087#1099' '#1090#1086#1074#1072#1088#1086#1074
      FormName = 'TGoodsGroupForm'
      FormNameParam.Value = 'TGoodsGroupForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actKassa: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1050#1072#1089#1089#1072
      FormName = 'TKassaForm'
      FormNameParam.Value = 'TKassaForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actValuta: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1042#1072#1083#1102#1090#1072
      FormName = 'TValutaForm'
      FormNameParam.Value = 'TValutaForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actMember: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
      FormName = 'TMemberForm'
      FormNameParam.Value = 'TMemberForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actPeriod: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1055#1077#1088#1080#1086#1076
      FormName = 'TPeriodForm'
      FormNameParam.Value = 'TPeriodForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actDiscount: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1053#1072#1079#1074#1072#1085#1080#1103' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1100#1085#1099#1093' '#1089#1082#1080#1076#1086#1082
      FormName = 'TDiscountForm'
      FormNameParam.Value = 'TDiscountForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actDiscountTools: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1086#1094#1077#1085#1090#1086#1074' '#1087#1086' '#1085#1072#1082#1086#1087#1080#1090#1077#1083#1100#1085#1099#1084' '#1089#1082#1080#1076#1082#1072#1084
      FormName = 'TDiscountToolsForm'
      FormNameParam.Value = 'TDiscountToolsForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
    object actPartner: TdsdOpenForm
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      MoveParams = <>
      Caption = #1055#1086'c'#1090#1072#1074#1097#1080#1082#1080
      FormName = 'TPartnerForm'
      FormNameParam.Value = 'TPartnerForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <>
      isShowModal = False
    end
  end
  inherited UserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 152
    Top = 8
  end
  inherited StoredProc: TdsdStoredProc
    Left = 48
    Top = 8
  end
  inherited ClientDataSet: TClientDataSet
    Left = 48
    Top = 56
  end
  inherited frxXMLExport: TfrxXMLExport
    Left = 152
    Top = 56
  end
  inherited cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Top'
          'Width')
      end>
    Left = 48
    Top = 112
  end
  inherited MainMenu: TMainMenu
    Left = 272
    Top = 8
    inherited miGuides: TMenuItem
      object N4: TMenuItem
        Action = actCompositionGroup
      end
      object N5: TMenuItem
        Action = actComposition
      end
      object N7: TMenuItem
        Action = actCountryBrand
      end
      object N8: TMenuItem
        Action = actBrand
      end
      object N9: TMenuItem
        Action = actFabrika
      end
      object N17: TMenuItem
        Action = actLineFabrica
      end
      object N10: TMenuItem
        Action = actGoodsInfo
      end
      object N11: TMenuItem
        Action = actGoodsSize
      end
      object N1: TMenuItem
        Action = actMeasure
      end
      object N12: TMenuItem
        Action = actGoodsGroup
      end
      object N16: TMenuItem
        Action = actPeriod
      end
      object N13: TMenuItem
        Action = actKassa
      end
      object N14: TMenuItem
        Action = actValuta
      end
      object N15: TMenuItem
        Action = actMember
      end
      object N18: TMenuItem
        Action = actDiscount
      end
      object N19: TMenuItem
        Action = actDiscountTools
      end
      object c1: TMenuItem
        Action = actPartner
      end
    end
    inherited miService: TMenuItem
      inherited N221: TMenuItem
        object N20: TMenuItem [0]
          Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1095#1077#1089#1082#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
          object N21: TMenuItem
            Action = actAccountGroup
          end
          object N22: TMenuItem
            Action = actAccountDirection
          end
          object N23: TMenuItem
            Action = actAccount
          end
          object N24: TMenuItem
            Caption = '-'
          end
          object N25: TMenuItem
            Action = actInfoMoneyGroup
          end
          object N26: TMenuItem
            Action = actInfoMoneyDestination
          end
          object N27: TMenuItem
            Action = actInfoMoney
          end
          object N28: TMenuItem
            Caption = '-'
          end
          object N29: TMenuItem
            Action = actProfitLossGroup
          end
          object N30: TMenuItem
            Action = actProfitLossDirection
          end
          object N31: TMenuItem
            Action = actProfitLoss
          end
        end
        object N6: TMenuItem [1]
          Caption = '-'
        end
        object N74: TMenuItem [2]
          Action = actForms
        end
      end
      object miUser: TMenuItem [1]
        Action = actUser
      end
      object miRole: TMenuItem [2]
        Action = actRole
      end
      object miImportExportLink: TMenuItem [3]
        Action = actImportExportLink
      end
    end
  end
  inherited frxXLSExport: TfrxXLSExport
    Left = 152
    Top = 112
  end
end
