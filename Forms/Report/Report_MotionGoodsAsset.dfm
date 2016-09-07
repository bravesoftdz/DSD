object Report_MotionGoodsAssetForm: TReport_MotionGoodsAssetForm
  Left = 0
  Top = 0
  Caption = #1054#1090#1095#1077#1090' <'#1044#1074#1080#1078#1077#1085#1080#1077' '#1054#1057'>'
  ClientHeight = 545
  ClientWidth = 1344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  AddOnFormData.RefreshAction = actRefresh
  AddOnFormData.isSingle = False
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  AddOnFormData.Params = FormParams
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 80
    Width = 1344
    Height = 465
    Align = alClient
    TabOrder = 0
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = MasterDS
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountStart
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummStart
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountIncome
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummIncome
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSale
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummReturnOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummReturnIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountLoss
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummLoss
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountInventory
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummInventory
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountEnd
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummEnd
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPriceIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPriceOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummProductionIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummProductionOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummTotalIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummTotalOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSale_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSale_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummReturnIn_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummInventory_RePrice
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountStart_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountEnd_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountIncome_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_10500_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_40208_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn_40208_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountLoss_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountInventory_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPrice_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPrice_40200
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPrice_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPrice_10500_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn_40200
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn_40200_Weight
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountStart
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummStart
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountEnd
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummEnd
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountIncome
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummIncome
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSale
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummReturnOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummReturnIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountLoss
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummLoss
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountInventory
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummInventory
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPriceIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPriceOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummProductionIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummProductionOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummTotalIn
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummTotalOut
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSale_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSale_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummReturnIn_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummInventory_RePrice
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn_40208
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountStart_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountEnd_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountIncome_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_10500_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSale_40208_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountReturnIn_40208_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountLoss_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountInventory_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountProductionOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalIn_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountTotalOut_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPrice_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = SummSendOnPrice_40200
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPrice_10500
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPrice_10500_Weight
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn_40200
        end
        item
          Format = ',0.####'
          Kind = skSum
          Column = CountSendOnPriceIn_40200_Weight
        end>
      DataController.Summary.SummaryGroups = <>
      Images = dmMain.SortImageList
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupSummaryLayout = gslAlignWithColumns
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Styles.StyleSheet = dmMain.cxGridTableViewStyleSheet
      object AccountCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1089#1095'.'
        DataBinding.FieldName = 'AccountCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 50
      end
      object AccountName_All: TcxGridDBColumn
        Caption = #1057#1095#1077#1090
        DataBinding.FieldName = 'AccountName_All'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object LocationDescName: TcxGridDBColumn
        Caption = #1069#1083#1077#1084#1077#1085#1090' '#1084#1077#1089#1090#1072' '#1091#1095#1077#1090#1072
        DataBinding.FieldName = 'LocationDescName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 55
      end
      object LocationCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1084#1077#1089#1090#1072' '#1091#1095'.'
        DataBinding.FieldName = 'LocationCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object LocationName: TcxGridDBColumn
        Caption = #1052#1077#1089#1090#1086' '#1091#1095#1077#1090#1072
        DataBinding.FieldName = 'LocationName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 55
      end
      object AssetToCode: TcxGridDBColumn
        Caption = #1050#1086#1076' ('#1076#1083#1103' '#1054#1057')'
        DataBinding.FieldName = 'AssetToCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 40
      end
      object AssetToName: TcxGridDBColumn
        Caption = #1044#1083#1103' '#1054#1057
        DataBinding.FieldName = 'AssetToName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 126
      end
      object GoodsGroupNameFull: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1072' ('#1074#1089#1077')'
        DataBinding.FieldName = 'GoodsGroupNameFull'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object GoodsGroupName: TcxGridDBColumn
        Caption = #1043#1088#1091#1087#1087#1072' ('#1058#1086#1074#1072#1088'/'#1054#1057'/'#1059#1089#1083#1091#1075#1080')'
        DataBinding.FieldName = 'GoodsGroupName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object GoodsCode: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'GoodsCode'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 55
      end
      object GoodsName: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1058#1086#1074#1072#1088'/'#1054#1057'/'#1059#1089#1083#1091#1075#1080')'
        DataBinding.FieldName = 'GoodsName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 150
      end
      object GoodsDescName: TcxGridDBColumn
        Caption = #1069#1083#1077#1084#1077#1085#1090
        DataBinding.FieldName = 'GoodsDescName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PartionGoodsName: TcxGridDBColumn
        Caption = #1048#1085#1074'. '#1085#1086#1084#1077#1088
        DataBinding.FieldName = 'PartionGoodsName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 60
      end
      object MovementPartionGoods_InvNumber: TcxGridDBColumn
        Caption = #8470' '#1076#1086#1082'. '#1087#1072#1088#1090#1080#1080
        DataBinding.FieldName = 'MovementPartionGoods_InvNumber'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object StorageName: TcxGridDBColumn
        Caption = #1052#1077#1089#1090#1086' '#1093#1088#1072#1085#1077#1085#1080#1103
        DataBinding.FieldName = 'StorageName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object clUnitCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1087#1086#1076#1088#1072#1079#1076'.'
        DataBinding.FieldName = 'UnitCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object clUnitName: TcxGridDBColumn
        Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
        DataBinding.FieldName = 'UnitName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 150
      end
      object MeasureName: TcxGridDBColumn
        Caption = #1045#1076'. '#1080#1079#1084'.'
        DataBinding.FieldName = 'MeasureName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 35
      end
      object Weight: TcxGridDBColumn
        Caption = #1042#1077#1089
        DataBinding.FieldName = 'Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 30
      end
      object CountStart: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1085#1072#1095'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountStart'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 60
      end
      object CountStart_Weight: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1085#1072#1095'. '#1074#1077#1089
        DataBinding.FieldName = 'CountStart_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceStart: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1086#1089#1090'.'#1085'.'
        DataBinding.FieldName = 'PriceStart'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummStart: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1085#1072#1095'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummStart'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountIncome: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountIncome'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 55
      end
      object CountIncome_Weight: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097'. '#1074#1077#1089
        DataBinding.FieldName = 'CountIncome_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceIncome: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1086#1089#1090'.'
        DataBinding.FieldName = 'PriceIncome'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 35
      end
      object SummIncome: TcxGridDBColumn
        Caption = #1055#1086#1089#1090#1072#1074#1097'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummIncome'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountReturnOut: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088'. '#1087#1086#1089#1090'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountReturnOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 60
      end
      object CountReturnOut_Weight: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088'. '#1087#1086#1089#1090'. '#1074#1077#1089
        DataBinding.FieldName = 'CountReturnOut_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceReturnOut: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1074'.'#1087#1086#1089#1090'.'
        DataBinding.FieldName = 'PriceReturnOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 35
      end
      object SummReturnOut: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088'. '#1087#1086#1089#1090'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummReturnOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendIn: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1087#1088#1080#1093'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountSendIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 60
      end
      object CountSendIn_Weight: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1087#1088#1080#1093'. '#1074#1077#1089
        DataBinding.FieldName = 'CountSendIn_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceSendIn: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088#1080#1093'.'#1087'. '
        DataBinding.FieldName = 'PriceSendIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 40
      end
      object SummSendIn: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1087#1088#1080#1093'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummSendIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendOut: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1088#1072#1089#1093'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountSendOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 60
      end
      object CountSendOut_Weight: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1088#1072#1089#1093'. '#1074#1077#1089
        DataBinding.FieldName = 'CountSendOut_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceSendOut: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1088#1072#1089#1093'. '#1087'.'
        DataBinding.FieldName = 'PriceSendOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummSendOut: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1088#1072#1089#1093'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummSendOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendOnPriceIn: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1092#1080#1083'. '#1087#1088#1080#1093'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountSendOnPriceIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountSendOnPriceIn_Weight: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1092#1080#1083'. '#1087#1088#1080#1093'. '#1074#1077#1089
        DataBinding.FieldName = 'CountSendOnPriceIn_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceSendOnPriceIn: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088#1080#1093'. '#1092'. '
        DataBinding.FieldName = 'PriceSendOnPriceIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummSendOnPriceIn: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1092#1080#1083'. '#1087#1088#1080#1093'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummSendOnPriceIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object SummSendOnPrice_10500: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072' '#1089#1091#1084#1084#1072' ('#1087#1088#1080' '#1087#1077#1088#1077#1084'. '#1085#1072' '#1092#1080#1083'.)'
        DataBinding.FieldName = 'SummSendOnPrice_10500'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendOnPrice_10500: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072' '#1082#1086#1083'. ('#1087#1088#1080' '#1087#1077#1088#1077#1084'. '#1085#1072' '#1092#1080#1083'.)'
        DataBinding.FieldName = 'CountSendOnPrice_10500'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendOnPrice_10500_Weight: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072' '#1074#1077#1089' ('#1087#1088#1080' '#1087#1077#1088#1077#1084'. '#1085#1072' '#1092#1080#1083'.)'
        DataBinding.FieldName = 'CountSendOnPrice_10500_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object SummSendOnPrice_40200: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1089#1091#1084#1084#1072'  ('#1087#1088#1080' '#1087#1077#1088#1077#1084'. '#1085#1072' '#1092#1080#1083'.)'
        DataBinding.FieldName = 'SummSendOnPrice_40200'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendOnPriceIn_40200: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1082#1086#1083'. ('#1087#1088#1080' '#1087#1077#1088#1077#1084'. '#1085#1072' '#1092#1080#1083'.)'
        DataBinding.FieldName = 'CountSendOnPrice_40200'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountSendOnPriceIn_40200_Weight: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084'  '#1074#1077#1089'  ('#1087#1088#1080' '#1087#1077#1088#1077#1084'. '#1085#1072' '#1092#1080#1083'.)'
        DataBinding.FieldName = 'CountSendOnPrice_40200_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountProductionIn: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074'. '#1087#1088#1080#1093'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountProductionIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object CountProductionIn_Weight: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074'. '#1087#1088#1080#1093'. '#1074#1077#1089
        DataBinding.FieldName = 'CountProductionIn_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object PriceProductionIn: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088'.'#1087#1088#1080#1093'.'
        DataBinding.FieldName = 'PriceProductionIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 45
      end
      object SummProductionIn: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074'. '#1087#1088#1080#1093'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummProductionIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 75
      end
      object CountSendOnPriceOut: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1092#1080#1083'. '#1088#1072#1089#1093'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountSendOnPriceOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object CountSendOnPriceOut_Weight: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1092#1080#1083'. '#1088#1072#1089#1093'. '#1074#1077#1089
        DataBinding.FieldName = 'CountSendOnPriceOut_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object PriceSendOnPriceOut: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1088#1072#1089#1093'.'#1092'. '
        DataBinding.FieldName = 'PriceSendOnPriceOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 45
      end
      object SummSendOnPriceOut: TcxGridDBColumn
        Caption = #1055#1077#1088#1077#1084'. '#1092#1080#1083'. '#1088#1072#1089#1093'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummSendOnPriceOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 75
      end
      object CountSale: TcxGridDBColumn
        Caption = #1055#1088#1086#1076#1072#1078#1072' '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountSale'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountSale_Weight: TcxGridDBColumn
        Caption = #1055#1088#1086#1076#1072#1078#1072' '#1074#1077#1089
        DataBinding.FieldName = 'CountSale_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountSale_10500: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072', '#1082#1086#1083'. ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
        DataBinding.FieldName = 'CountSale_10500'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 80
      end
      object CountSale_10500_Weight: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072', '#1074#1077#1089' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
        DataBinding.FieldName = 'CountSale_10500_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountSale_40208: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1082#1086#1083'. ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
        DataBinding.FieldName = 'CountSale_40208'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object CountSale_40208_Weight: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1074#1077#1089' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
        DataBinding.FieldName = 'CountSale_40208_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object PriceSale: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088#1086#1076'.'
        DataBinding.FieldName = 'PriceSale'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummSale: TcxGridDBColumn
        Caption = #1055#1088#1086#1076#1072#1078#1072' '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummSale'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object SummSale_10500: TcxGridDBColumn
        Caption = #1057#1082#1080#1076#1082#1072' '#1089#1091#1084#1084#1072' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
        DataBinding.FieldName = 'SummSale_10500'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object SummSale_40208: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1089#1091#1084#1084#1072' ('#1087#1088#1080' '#1087#1088#1086#1076'.)'
        DataBinding.FieldName = 'SummSale_40208'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 80
      end
      object CountReturnIn: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088'. '#1087#1086#1082'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountReturnIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountReturnIn_Weight: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088'. '#1087#1086#1082'. '#1074#1077#1089
        DataBinding.FieldName = 'CountReturnIn_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountReturnIn_40208: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1082#1086#1083'. ('#1087#1088#1080' '#1074'.'#1087#1086#1082'.)'
        DataBinding.FieldName = 'CountReturnIn_40208'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 100
      end
      object CountReturnIn_40208_Weight: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1074#1077#1089' ('#1087#1088#1080' '#1074'.'#1087#1086#1082'.)'
        DataBinding.FieldName = 'CountReturnIn_40208_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object PriceReturnIn: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1074'.'#1087#1086#1082'. '
        DataBinding.FieldName = 'PriceReturnIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummReturnIn: TcxGridDBColumn
        Caption = #1042#1086#1079#1074#1088'. '#1087#1086#1082'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummReturnIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object SummReturnIn_40208: TcxGridDBColumn
        Caption = '(-)'#1055#1086#1090#1077#1088#1080' (+)'#1069#1082#1086#1085#1086#1084' '#1089#1091#1084#1084#1072' ('#1087#1088#1080' '#1074'.'#1087#1086#1082'.)'
        DataBinding.FieldName = 'SummReturnIn_40208'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object CountLoss: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountLoss'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 60
      end
      object CountLoss_Weight: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1074#1077#1089
        DataBinding.FieldName = 'CountLoss_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
      end
      object PriceLoss: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1089#1087#1080#1089'.'
        DataBinding.FieldName = 'PriceLoss'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummLoss: TcxGridDBColumn
        Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummLoss'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountProductionOut: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074'. '#1088#1072#1089#1093'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountProductionOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object CountProductionOut_Weight: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074'. '#1088#1072#1089#1093'. '#1074#1077#1089
        DataBinding.FieldName = 'CountProductionOut_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 70
      end
      object PriceProductionOut: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088'.'#1088#1072#1089#1093'. '
        DataBinding.FieldName = 'PriceProductionOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 45
      end
      object SummProductionOut: TcxGridDBColumn
        Caption = #1055#1088#1086#1080#1079#1074'. '#1088#1072#1089#1093'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummProductionOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 75
      end
      object CountInventory: TcxGridDBColumn
        Caption = #1050#1086#1083'. (-)'#1091#1073#1099#1083#1100' (+)'#1101#1082#1086#1085#1086#1084'.'
        DataBinding.FieldName = 'CountInventory'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountInventory_Weight: TcxGridDBColumn
        Caption = #1042#1077#1089' (-)'#1091#1073#1099#1083#1100' (+)'#1101#1082#1086#1085#1086#1084'.'
        DataBinding.FieldName = 'CountInventory_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceInventory: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1091#1073'.,'#1101#1082'.'
        DataBinding.FieldName = 'PriceInventory'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummInventory: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072' (-)'#1091#1073#1099#1083#1100' (+)'#1101#1082#1086#1085#1086#1084'. '
        DataBinding.FieldName = 'SummInventory'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object SummInventory_RePrice: TcxGridDBColumn
        Caption = #1057#1091#1084#1084#1072'  (-) (+) '#1087#1077#1088#1077#1086#1094#1077#1085#1082#1072
        DataBinding.FieldName = 'SummInventory_RePrice'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 80
      end
      object CountEnd: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1082#1086#1085#1077#1095'. '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountEnd'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountEnd_Weight: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1082#1086#1085#1077#1095'. '#1074#1077#1089
        DataBinding.FieldName = 'CountEnd_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceEnd: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1086#1089#1090'.'#1082'. '
        DataBinding.FieldName = 'PriceEnd'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object SummEnd: TcxGridDBColumn
        Caption = #1054#1089#1090'. '#1082#1086#1085#1077#1095'. '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummEnd'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountTotalIn: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1087#1088#1080#1093#1086#1076' '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountTotalIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountTotalIn_Weight: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1087#1088#1080#1093#1086#1076' '#1074#1077#1089
        DataBinding.FieldName = 'CountTotalIn_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceTotalIn: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1080#1090'.'#1087#1088#1080#1093'.'
        DataBinding.FieldName = 'PriceTotalIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 55
      end
      object SummEnd_calc: TcxGridDBColumn
        DataBinding.FieldName = 'SummEnd_calc'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object SummTotalIn: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1087#1088#1080#1093#1086#1076' '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummTotalIn'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object CountTotalOut: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1088#1072#1089#1093#1086#1076' '#1082#1086#1083'.'
        DataBinding.FieldName = 'CountTotalOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object CountTotalOut_Weight: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1088#1072#1089#1093#1086#1076' '#1074#1077#1089
        DataBinding.FieldName = 'CountTotalOut_Weight'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceTotalOut: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1080#1090'.'#1088#1072#1089#1093'.'
        DataBinding.FieldName = 'PriceTotalOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 55
      end
      object SummTotalOut: TcxGridDBColumn
        Caption = #1048#1090#1086#1075#1086' '#1088#1072#1089#1093#1086#1076' '#1089#1091#1084#1084#1072
        DataBinding.FieldName = 'SummTotalOut'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object PriceListStart: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088#1072#1081#1089' '#1085#1072#1095'.'
        DataBinding.FieldName = 'PriceListStart'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object PriceListEnd: TcxGridDBColumn
        Caption = #1094#1077#1085#1072' '#1087#1088#1072#1081#1089' '#1082#1086#1085#1077#1095'.'
        DataBinding.FieldName = 'PriceListEnd'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 4
        Properties.DisplayFormat = ',0.00##;-,0.00##; ;'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 75
      end
      object InfoMoneyCode: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1059#1055
        DataBinding.FieldName = 'InfoMoneyCode'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object InfoMoneyGroupName: TcxGridDBColumn
        Caption = #1059#1055' '#1075#1088#1091#1087#1087#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'InfoMoneyGroupName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object InfoMoneyDestinationName: TcxGridDBColumn
        Caption = #1059#1055' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'InfoMoneyDestinationName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object InfoMoneyName: TcxGridDBColumn
        Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'InfoMoneyName'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 80
      end
      object InfoMoneyName_all: TcxGridDBColumn
        Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103
        DataBinding.FieldName = 'InfoMoneyName_all'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 200
      end
      object ContainerId_Summ: TcxGridDBColumn
        Caption = 'Id'
        DataBinding.FieldName = 'ContainerId_Summ'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object InfoMoneyCode_Detail: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1059#1055' ('#1076#1077#1090#1072#1083#1100#1085#1086')'
        DataBinding.FieldName = 'InfoMoneyCode_Detail'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 45
      end
      object InfoMoneyGroupName_Detail: TcxGridDBColumn
        Caption = #1059#1055' '#1075#1088#1091#1087#1087#1072' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103'  ('#1076#1077#1090#1072#1083#1100#1085#1086')'
        DataBinding.FieldName = 'InfoMoneyGroupName_Detail'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object InfoMoneyDestinationName_Detail: TcxGridDBColumn
        Caption = #1059#1055' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077'  ('#1076#1077#1090#1072#1083#1100#1085#1086')'
        DataBinding.FieldName = 'InfoMoneyDestinationName_Detail'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 70
      end
      object InfoMoneyName_Detail: TcxGridDBColumn
        Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103'  ('#1076#1077#1090#1072#1083#1100#1085#1086')'
        DataBinding.FieldName = 'InfoMoneyName_Detail'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 80
      end
      object InfoMoneyName_all_Detail: TcxGridDBColumn
        Caption = #1059#1055' '#1089#1090#1072#1090#1100#1103' ('#1076#1077#1090#1072#1083#1100#1085#1086')'
        DataBinding.FieldName = 'InfoMoneyName_all_Detail'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 200
      end
      object LineNum: TcxGridDBColumn
        DataBinding.FieldName = 'LineNum'
        Visible = False
        Options.Editing = False
        Width = 60
      end
      object CountEnd_calc: TcxGridDBColumn
        DataBinding.FieldName = 'CountEnd_calc'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountEnd_calc_Weight: TcxGridDBColumn
        DataBinding.FieldName = 'CountEnd_calc_Weight'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountProductionIn_by: TcxGridDBColumn
        DataBinding.FieldName = 'CountProductionIn_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountProductionIn_by_Weight: TcxGridDBColumn
        DataBinding.FieldName = 'CountProductionIn_by_Weight'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object SummProductionIn_by: TcxGridDBColumn
        DataBinding.FieldName = 'SummProductionIn_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountIn_by: TcxGridDBColumn
        DataBinding.FieldName = 'CountIn_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountIn_by_Weight: TcxGridDBColumn
        DataBinding.FieldName = 'CountIn_by_Weight'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object SummIn_by: TcxGridDBColumn
        DataBinding.FieldName = 'SummIn_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountOtherIn_by: TcxGridDBColumn
        DataBinding.FieldName = 'CountOtherIn_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountOtherIn_by_Weight: TcxGridDBColumn
        DataBinding.FieldName = 'CountOtherIn_by_Weight'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object SummOtherIn_by: TcxGridDBColumn
        DataBinding.FieldName = 'SummOtherIn_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountOut_by: TcxGridDBColumn
        DataBinding.FieldName = 'CountOut_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountOut_by_Weight: TcxGridDBColumn
        DataBinding.FieldName = 'CountOut_by_Weight'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object SummOut_by: TcxGridDBColumn
        DataBinding.FieldName = 'SummOut_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountOtherOut_by: TcxGridDBColumn
        DataBinding.FieldName = 'CountOtherOut_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object CountOtherOut_by_Weight: TcxGridDBColumn
        DataBinding.FieldName = 'CountOtherOut_by_Weight'
        Visible = False
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
      object SummOtherOut_by: TcxGridDBColumn
        DataBinding.FieldName = 'SummOtherOut_by'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        VisibleForCustomization = False
        Width = 55
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1344
    Height = 54
    Align = alTop
    TabOrder = 1
    object edGoodsGroup: TcxButtonEdit
      Left = 853
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 192
    end
    object deStart: TcxDateEdit
      Left = 60
      Top = 5
      EditValue = 42614d
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 85
    end
    object deEnd: TcxDateEdit
      Left = 60
      Top = 30
      EditValue = 42614d
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 85
    end
    object edUnitGroup: TcxButtonEdit
      Left = 555
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 203
    end
    object cxLabel3: TcxLabel
      Left = 427
      Top = 6
      Caption = #1043#1088#1091#1087#1087#1072' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1081':'
    end
    object cxLabel1: TcxLabel
      Left = 762
      Top = 6
      Caption = #1043#1088#1091#1087#1087#1072' '#1090#1086#1074#1072#1088#1086#1074':'
    end
    object edGoods: TcxButtonEdit
      Left = 853
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 6
      Width = 192
    end
    object edLocation: TcxButtonEdit
      Left = 555
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 7
      Width = 203
    end
    object cxLabel4: TcxLabel
      Left = 481
      Top = 31
      Caption = #1052#1077#1089#1090#1086' '#1091#1095#1077#1090#1072':'
    end
    object cxLabel5: TcxLabel
      Left = 13
      Top = 6
      Caption = #1044#1072#1090#1072' '#1089' :'
    end
    object cxLabel6: TcxLabel
      Left = 6
      Top = 31
      Caption = #1044#1072#1090#1072' '#1087#1086' :'
    end
    object cxLabel7: TcxLabel
      Left = 788
      Top = 32
      Caption = #1054#1057' / '#1058#1086#1074#1072#1088':'
    end
    object ceAccountGroup: TcxButtonEdit
      Left = 221
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 12
      Width = 200
    end
    object cxLabel2: TcxLabel
      Left = 148
      Top = 6
      Caption = #1057#1095#1077#1090' '#1075#1088#1091#1087#1087#1072':'
    end
    object cbInfoMoney: TcxCheckBox
      Left = 221
      Top = 30
      Action = actIsInfoMoney
      Properties.ReadOnly = False
      TabOrder = 14
      Width = 166
    end
    object cxLabel8: TcxLabel
      Left = 1052
      Top = 6
      Caption = #1043#1088#1091#1087#1087#1072' '#1087#1086#1076#1088#1072#1079#1076'. ***:'
    end
    object cxLabel9: TcxLabel
      Left = 1074
      Top = 31
      Caption = #1052#1077#1089#1090#1086' '#1091#1095#1077#1090#1072' ***:'
    end
    object edUnitGroup_by: TcxButtonEdit
      Left = 1169
      Top = 5
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 17
      Width = 189
    end
    object edLocation_by: TcxButtonEdit
      Left = 1169
      Top = 30
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 18
      Width = 189
    end
  end
  object cbGoodsKind: TcxCheckBox
    Left = 97
    Top = 87
    Caption = #1087#1086' '#1042#1080#1076#1072#1084' '#1090#1086#1074#1072#1088#1072
    Properties.ReadOnly = False
    TabOrder = 2
    Width = 114
  end
  object cbPartionGoods: TcxCheckBox
    Left = 217
    Top = 87
    Caption = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
    Properties.ReadOnly = False
    TabOrder = 3
    Width = 88
  end
  object cbAmount: TcxCheckBox
    Left = 309
    Top = 87
    Caption = #1090#1086#1083#1100#1082#1086' '#1050#1086#1083'-'#1074#1086
    Properties.ReadOnly = False
    TabOrder = 8
    Width = 102
  end
  object MasterDS: TDataSource
    DataSet = MasterCDS
    Left = 48
    Top = 248
  end
  object MasterCDS: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 88
    Top = 200
  end
  object cxPropertiesStore: TcxPropertiesStore
    Components = <
      item
        Component = cbAmount
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbGoodsKind
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbInfoMoney
        Properties.Strings = (
          'Checked')
      end
      item
        Component = cbPartionGoods
        Properties.Strings = (
          'Checked')
      end
      item
        Component = deEnd
        Properties.Strings = (
          'Date')
      end
      item
        Component = deStart
        Properties.Strings = (
          'Date')
      end
      item
        Component = GuidesAccountGroup
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesGoods
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesGoodsGroup
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesLocation
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesUnitGroup
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = GuidesUnitGroup_by
        Properties.Strings = (
          'Key'
          'TextValue')
      end
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
    Left = 312
    Top = 232
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmMain.ImageList
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 128
    Top = 264
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManagerBar1: TdxBar
      Caption = 'Custom'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 2
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbDialogForm'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbGoodsKind'
        end
        item
          Visible = True
          ItemName = 'bbPartionGoods'
        end
        item
          Visible = True
          ItemName = 'bbAmount'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbPrintBy_Goods'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbToExcel'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object bbRefresh: TdxBarButton
      Action = actRefresh
      Category = 0
    end
    object bbToExcel: TdxBarButton
      Action = actExportToExcel
      Category = 0
    end
    object bbDialogForm: TdxBarButton
      Action = ExecuteDialog
      Category = 0
    end
    object bbPrintBy_Goods: TdxBarButton
      Action = actPrint
      Category = 0
    end
    object dxBarStatic: TdxBarStatic
      Caption = '   '
      Category = 0
      Hint = '   '
      Visible = ivAlways
    end
    object bbGoodsKind: TdxBarControlContainerItem
      Caption = #1087#1086' '#1042#1080#1076#1072#1084
      Category = 0
      Hint = #1087#1086' '#1042#1080#1076#1072#1084
      Visible = ivAlways
      Control = cbGoodsKind
    end
    object bbPartionGoods: TdxBarControlContainerItem
      Caption = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      Category = 0
      Hint = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      Visible = ivAlways
      Control = cbPartionGoods
    end
    object bbAmount: TdxBarControlContainerItem
      Caption = #1090#1086#1083#1100#1082#1086' '#1050#1086#1083'-'#1074#1086
      Category = 0
      Hint = #1090#1086#1083#1100#1082#1086' '#1050#1086#1083'-'#1074#1086
      Visible = ivAlways
      Control = cbAmount
    end
    object bbPrint2: TdxBarButton
      Action = actPrint_GP
      Category = 0
      Visible = ivNever
    end
    object bbPrint3: TdxBarButton
      Action = actPrint_Remains
      Category = 0
      Visible = ivNever
    end
    object bbPrint_Loss: TdxBarButton
      Action = actPrint_Loss
      Category = 0
      Visible = ivNever
    end
    object bbPrint_Inventory: TdxBarButton
      Action = actPrint_Inventory
      Category = 0
      Visible = ivNever
    end
  end
  object ActionList: TActionList
    Images = dmMain.ImageList
    Left = 256
    Top = 232
    object actRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spReport
      StoredProcList = <
        item
          StoredProc = spReport
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 4
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actExportToExcel: TdsdGridToExcel
      Category = 'DSDLib'
      MoveParams = <>
      Grid = cxGrid
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      ImageIndex = 6
      ShortCut = 16472
    end
    object ExecuteDialog: TExecuteDialog
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 35
      FormName = 'TReport_MotionGoodsAssetDialogForm'
      FormNameParam.Value = 'TReport_MotionGoodsAssetDialogForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsId'
          Value = ''
          Component = GuidesGoods
          ComponentItem = 'Key'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = GuidesGoods
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupId'
          Value = ''
          Component = GuidesGoodsGroup
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          Component = GuidesGoodsGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupId'
          Value = ''
          Component = GuidesUnitGroup
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationId'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'AccountGroupId'
          Value = Null
          Component = GuidesAccountGroup
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'AccountGroupName'
          Value = Null
          Component = GuidesAccountGroup
          ComponentItem = 'TextValue'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'isInfoMoney'
          Value = Null
          Component = cbInfoMoney
          DataType = ftBoolean
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupId_by'
          Value = Null
          Component = GuidesUnitGroup_by
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName_by'
          Value = Null
          Component = GuidesUnitGroup_by
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationId_by'
          Value = Null
          Component = GuidesLocation_by
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName_by'
          Value = Null
          Component = GuidesLocation_by
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end>
      isShowModal = True
      RefreshDispatcher = RefreshDispatcher
      OpenBeforeShow = True
    end
    object actPrint: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1054#1057
      Hint = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1054#1057
      ImageIndex = 3
      ShortCut = 16464
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'AssetToName;GoodsGroupNameFull;GoodsGroupName;GoodsName;PartionG' +
            'oodsName;MovementPartionGoods_InvNumber;InfoMoneyName_all;InfoMo' +
            'neyName_all_Detail'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = Null
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupName'
          Value = Null
          Component = GuidesGoodsGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = Null
          Component = GuidesGoods
          ComponentItem = 'TextValue'
          MultiSelectSeparator = ','
        end
        item
          Name = 'isGoodsKind'
          Value = Null
          Component = cbGoodsKind
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isPartionGoods'
          Value = Null
          Component = cbPartionGoods
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isAmount'
          Value = Null
          Component = cbAmount
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isInfoMoney'
          Value = Null
          Component = cbInfoMoney
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1054#1057
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1054#1057
      ReportNameParam.DataType = ftString
      ReportNameParam.MultiSelectSeparator = ','
    end
    object SaleJournal: TdsdOpenForm
      Category = 'DSDLib'
      MoveParams = <>
      Caption = 'SaleJournal'
      FormName = 'TMovementGoodsJournalForm'
      FormNameParam.Value = 'TMovementGoodsJournalForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 41640d
          Component = deStart
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsKindId'
          Value = 0
          Component = MasterCDS
          ComponentItem = 'GoodsKindId'
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsKindName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'GoodsKindName'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'GoodsId'
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = MasterCDS
          ComponentItem = 'GoodsName'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'PartionGoodsId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'PartionGoodsId'
          MultiSelectSeparator = ','
        end
        item
          Name = 'PartionGoodsName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'PartionGoodsName'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'LocationId'
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = MasterCDS
          ComponentItem = 'LocationName'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'AccountGroupId'
          Value = Null
          Component = GuidesAccountGroup
          ComponentItem = 'Key'
          MultiSelectSeparator = ','
        end
        item
          Name = 'AccountGroupName'
          Value = Null
          Component = GuidesAccountGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'InfoMoneyId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'InfoMoneyId_Detail'
          MultiSelectSeparator = ','
        end
        item
          Name = 'InfoMoneyName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'InfoMoneyName_Detail'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupId'
          Value = Null
          Component = GuidesUnitGroup
          ComponentItem = 'Key'
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = Null
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'DescSet'
          Value = Null
          Component = FormParams
          ComponentItem = 'SaleDesc'
          DataType = ftString
          MultiSelectSeparator = ','
        end>
      isShowModal = False
    end
    object actIsInfoMoney: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spReport
      StoredProcList = <
        item
          StoredProc = spReport
        end>
      Caption = #1044#1077#1090#1072#1083#1100#1085#1086' '#1087#1086' '#1059#1055' '#1089#1090#1072#1090#1100#1103#1084
      Hint = #1044#1077#1090#1072#1083#1100#1085#1086' '#1087#1086' '#1059#1055' '#1089#1090#1072#1090#1100#1103#1084
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actPrint_GP: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1089#1082#1083#1072#1076' '#1043#1055')'
      Hint = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1089#1082#1083#1072#1076' '#1043#1055')'
      ImageIndex = 18
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 42005d
          Component = deStart
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 42005d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          Component = GuidesGoodsGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = GuidesGoods
          ComponentItem = 'TextValue'
          MultiSelectSeparator = ','
        end
        item
          Name = 'isGoodsKind'
          Value = 'False'
          Component = cbGoodsKind
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isPartionGoods'
          Value = 'False'
          Component = cbPartionGoods
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isAmount'
          Value = 'False'
          Component = cbAmount
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isInfoMoney'
          Value = 'False'
          Component = cbInfoMoney
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName_by'
          Value = Null
          Component = GuidesUnitGroup_by
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName_by'
          Value = Null
          Component = GuidesLocation_by
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1089#1082#1083#1072#1076' '#1043#1055')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1089#1082#1083#1072#1076' '#1043#1055')'
      ReportNameParam.DataType = ftString
      ReportNameParam.MultiSelectSeparator = ','
    end
    object actPrint_Remains: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1076#1072#1090#1091')'
      Hint = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1076#1072#1090#1091')'
      ImageIndex = 19
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 42005d
          Component = deStart
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 42005d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          Component = GuidesGoodsGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = GuidesGoods
          ComponentItem = 'TextValue'
          MultiSelectSeparator = ','
        end
        item
          Name = 'isGoodsKind'
          Value = 'False'
          Component = cbGoodsKind
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isPartionGoods'
          Value = 'False'
          Component = cbPartionGoods
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isAmount'
          Value = 'False'
          Component = cbAmount
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isInfoMoney'
          Value = 'False'
          Component = cbInfoMoney
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1076#1074#1080#1078#1077#1085#1080#1077' '#1087#1086' '#1090#1086#1074#1072#1088#1091' ('#1086#1089#1090#1072#1090#1086#1082')'
      ReportNameParam.DataType = ftString
      ReportNameParam.MultiSelectSeparator = ','
    end
    object actPrint_Loss: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' <% '#1089#1087#1080#1089#1072#1085#1080#1103'>'
      Hint = #1054#1090#1095#1077#1090' <% '#1089#1087#1080#1089#1072#1085#1080#1103'>'
      ImageIndex = 17
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 42005d
          Component = deStart
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 42005d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          Component = GuidesGoodsGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = GuidesGoods
          ComponentItem = 'TextValue'
          MultiSelectSeparator = ','
        end
        item
          Name = 'isGoodsKind'
          Value = 'False'
          Component = cbGoodsKind
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isPartionGoods'
          Value = 'False'
          Component = cbPartionGoods
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isAmount'
          Value = 'False'
          Component = cbAmount
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isInfoMoney'
          Value = 'False'
          Component = cbInfoMoney
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName_by'
          Value = ''
          Component = GuidesUnitGroup_by
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName_by'
          Value = ''
          Component = GuidesLocation_by
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'isLoss'
          Value = True
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1090#1086#1074#1072#1088#1072' ('#1087#1088#1086#1094#1077#1085#1090' '#1089#1087#1080#1089#1072#1085#1080#1103')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1090#1086#1074#1072#1088#1072' ('#1087#1088#1086#1094#1077#1085#1090' '#1089#1087#1080#1089#1072#1085#1080#1103')'
      ReportNameParam.DataType = ftString
      ReportNameParam.MultiSelectSeparator = ','
    end
    object actPrint_Inventory: TdsdPrintAction
      Category = 'DSDLib'
      MoveParams = <>
      StoredProcList = <>
      Caption = #1054#1090#1095#1077#1090' <'#1040#1082#1090' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080'>'
      Hint = #1054#1090#1095#1077#1090' <'#1040#1082#1090' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080'>'
      ImageIndex = 17
      DataSets = <
        item
          UserName = 'frxDBDMaster'
          IndexFieldNames = 
            'GoodsGroupNameFull;GoodsGroupName;GoodsName;GoodsKindName;Partio' +
            'nGoodsName;AssetToName;InfoMoneyName_all;InfoMoneyName_all_Detai' +
            'l'
          GridView = cxGridDBTableView
        end>
      Params = <
        item
          Name = 'StartDate'
          Value = 42005d
          Component = deStart
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'EndDate'
          Value = 42005d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName'
          Value = ''
          Component = GuidesUnitGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName'
          Value = ''
          Component = GuidesLocation
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsGroupName'
          Value = ''
          Component = GuidesGoodsGroup
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = ''
          Component = GuidesGoods
          ComponentItem = 'TextValue'
          MultiSelectSeparator = ','
        end
        item
          Name = 'isGoodsKind'
          Value = 'False'
          Component = cbGoodsKind
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isPartionGoods'
          Value = 'False'
          Component = cbPartionGoods
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isAmount'
          Value = 'False'
          Component = cbAmount
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'isInfoMoney'
          Value = 'False'
          Component = cbInfoMoney
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitGroupName_by'
          Value = ''
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'LocationName_by'
          Value = ''
          ComponentItem = 'TextValue'
          DataType = ftString
          MultiSelectSeparator = ','
        end
        item
          Name = 'isLoss'
          Value = False
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end>
      ReportName = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1090#1086#1074#1072#1088#1072' ('#1087#1088#1086#1094#1077#1085#1090' '#1089#1087#1080#1089#1072#1085#1080#1103')'
      ReportNameParam.Value = #1054#1090#1095#1077#1090' '#1087#1086' '#1086#1089#1090#1072#1090#1082#1072#1084' '#1090#1086#1074#1072#1088#1072' ('#1087#1088#1086#1094#1077#1085#1090' '#1089#1087#1080#1089#1072#1085#1080#1103')'
      ReportNameParam.DataType = ftString
      ReportNameParam.MultiSelectSeparator = ','
    end
  end
  object spReport: TdsdStoredProc
    StoredProcName = 'gpReport_MotionGoods_Asset'
    DataSet = MasterCDS
    DataSets = <
      item
        DataSet = MasterCDS
      end>
    Params = <
      item
        Name = 'inStartDate'
        Value = 41640d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inEndDate'
        Value = 41640d
        Component = deEnd
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inAccountGroupId'
        Value = Null
        Component = GuidesAccountGroup
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inUnitGroupId'
        Value = ''
        Component = GuidesUnitGroup
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inLocationId'
        Value = ''
        Component = GuidesLocation
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inGoodsGroupId'
        Value = ''
        Component = GuidesGoodsGroup
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inGoodsId'
        Value = ''
        Component = GuidesGoods
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inUnitGroupId_by'
        Value = Null
        Component = GuidesUnitGroup_by
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inLocationId_by'
        Value = Null
        Component = GuidesLocation_by
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inIsInfoMoney'
        Value = Null
        Component = cbInfoMoney
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 256
    Top = 176
  end
  object DBViewAddOn: TdsdDBViewAddOn
    ErasedFieldName = 'isErased'
    View = cxGridDBTableView
    OnDblClickActionList = <>
    ActionItemList = <>
    SortImages = dmMain.SortImageList
    OnlyEditingCellOnEnter = False
    ColorRuleList = <>
    ColumnAddOnList = <
      item
        Column = SummSale
        Action = SaleJournal
        onExitColumn.Active = False
        onExitColumn.AfterEmptyValue = False
      end>
    ColumnEnterList = <>
    SummaryItemList = <>
    Left = 456
    Top = 392
  end
  object dsdUserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 344
    Top = 288
  end
  object GuidesGoodsGroup: TdsdGuides
    KeyField = 'Id'
    LookupControl = edGoodsGroup
    FormNameParam.Value = 'TGoodsGroup_ObjectForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TGoodsGroup_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesGoodsGroup
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesGoodsGroup
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 968
  end
  object GuidesLocation: TdsdGuides
    KeyField = 'Id'
    LookupControl = edLocation
    FormNameParam.Value = 'TStoragePlace_ObjectForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TStoragePlace_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesLocation
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesLocation
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 664
    Top = 24
  end
  object PeriodChoice: TPeriodChoice
    DateStart = deStart
    DateEnd = deEnd
    Left = 176
    Top = 176
  end
  object GuidesUnitGroup: TdsdGuides
    KeyField = 'Id'
    LookupControl = edUnitGroup
    FormNameParam.Value = 'TUnitTreeForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TUnitTreeForm'
    PositionDataSet = 'ClientDataSet'
    ParentDataSet = 'TreeDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesUnitGroup
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesUnitGroup
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 600
  end
  object GuidesGoods: TdsdGuides
    KeyField = 'Id'
    LookupControl = edGoods
    FormNameParam.Value = 'TAssetGoodsPlaceForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TAssetGoodsPlaceForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesGoods
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesGoods
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 904
    Top = 27
  end
  object RefreshDispatcher: TRefreshDispatcher
    IdParam.Value = Null
    IdParam.MultiSelectSeparator = ','
    RefreshAction = actRefresh
    ShowDialogAction = ExecuteDialog
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
        Component = GuidesAccountGroup
      end
      item
        Component = GuidesUnitGroup
      end
      item
        Component = GuidesLocation
      end
      item
        Component = GuidesGoodsGroup
      end
      item
        Component = GuidesGoods
      end
      item
        Component = GuidesUnitGroup_by
      end
      item
        Component = GuidesLocation_by
      end>
    Left = 144
    Top = 344
  end
  object GuidesAccountGroup: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceAccountGroup
    FormNameParam.Value = 'TAccountGroup_ObjectDescForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TAccountGroup_ObjectDescForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesAccountGroup
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesAccountGroup
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inDescCode'
        Value = 'zc_Object_Goods'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    Left = 392
    Top = 5
  end
  object FormParams: TdsdFormParams
    Params = <
      item
        Name = 'IncomeDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ReturnOutDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'SaleDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ReturnInDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'MoneyDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ServiceDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'SendDebtDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'OtherDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'SaleRealDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ReturnInRealDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'TransferDebtDesc'
        Value = Null
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    Left = 424
    Top = 224
  end
  object spGetDescSets: TdsdStoredProc
    StoredProcName = 'gpGetDescSets'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'IncomeDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'IncomeDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ReturnOutDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ReturnOutDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'SaleDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'SaleDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ReturnInDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ReturnInDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'MoneyDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'MoneyDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ServiceDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ServiceDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'SendDebtDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'SendDebtDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'OtherDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'OtherDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'SaleRealDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'SaleRealDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ReturnInRealDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ReturnInRealDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'TransferDebtDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'TransferDebtDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'PriceCorrectiveDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'PriceCorrectiveDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ServiceRealDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ServiceRealDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end
      item
        Name = 'ChangeCurrencyDesc'
        Value = Null
        Component = FormParams
        ComponentItem = 'ChangeCurrencyDesc'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 528
    Top = 272
  end
  object GuidesUnitGroup_by: TdsdGuides
    KeyField = 'Id'
    LookupControl = edUnitGroup_by
    FormNameParam.Value = 'TUnitTreeForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TUnitTreeForm'
    PositionDataSet = 'ClientDataSet'
    ParentDataSet = 'TreeDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesUnitGroup_by
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesUnitGroup_by
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 1192
    Top = 65528
  end
  object GuidesLocation_by: TdsdGuides
    KeyField = 'Id'
    LookupControl = edLocation_by
    FormNameParam.Value = 'TStoragePlace_ObjectForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TStoragePlace_ObjectForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesLocation_by
        ComponentItem = 'Key'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesLocation_by
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 1248
    Top = 24
  end
end