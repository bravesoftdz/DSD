inherited Report_RemainsOverGoodsForm: TReport_RemainsOverGoodsForm
  Caption = #1054#1090#1095#1077#1090' <'#1056#1072#1089#1087#1088#1077#1076#1077#1083#1077#1085#1080#1081' '#1080#1079#1083#1080#1096#1082#1086#1074' '#1087#1086' '#1072#1087#1090#1077#1082#1072#1084'>'
  ClientHeight = 557
  ClientWidth = 1066
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  ExplicitLeft = -293
  ExplicitWidth = 1082
  ExplicitHeight = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 61
    Width = 1066
    Height = 496
    TabOrder = 3
    ExplicitTop = 61
    ExplicitWidth = 1066
    ExplicitHeight = 496
    ClientRectBottom = 496
    ClientRectRight = 1066
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 1066
      ExplicitHeight = 496
      inherited cxGrid: TcxGrid
        Width = 1066
        Height = 259
        ExplicitWidth = 1066
        ExplicitHeight = 259
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_to_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_to_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_from_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_from_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = MCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaMCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = MCSValue_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaMCSValue_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_result
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_result
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082': ,0'
              Kind = skCount
              Column = clGoodsName
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_to_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_to_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_from_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_from_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = MCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaMCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = MCSValue_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaMCSValue_Child
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = RemainsMCS_result
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = SummaRemainsMCS_result
            end>
          OptionsData.CancelOnExit = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsView.GroupByBox = True
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          object clGoodsGroupName: TcxGridDBColumn
            Caption = #1043#1088#1091#1087#1087#1072
            DataBinding.FieldName = 'GoodsGroupName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object clGoodsCode: TcxGridDBColumn
            Caption = #1050#1086#1076
            DataBinding.FieldName = 'GoodsCode'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 62
          end
          object clGoodsName: TcxGridDBColumn
            Caption = #1058#1086#1074#1072#1088
            DataBinding.FieldName = 'GoodsName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 150
          end
          object MeasureName: TcxGridDBColumn
            Caption = #1045#1076'. '#1080#1079#1084'.'
            DataBinding.FieldName = 'MeasureName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 55
          end
          object clNDSKindName: TcxGridDBColumn
            Caption = #1053#1044#1057
            DataBinding.FieldName = 'NDSKindName'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 60
          end
          object clIsClose: TcxGridDBColumn
            Caption = #1047#1072#1082#1088#1099#1090' '#1082#1086#1076' '#1087#1086' '#1074#1089#1077#1081' '#1089#1077#1090#1080
            DataBinding.FieldName = 'IsClose'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Options.Editing = False
            Width = 67
          end
          object clIsTop: TcxGridDBColumn
            Caption = #1058#1054#1055
            DataBinding.FieldName = 'IsTop'
            PropertiesClassName = 'TcxCheckBoxProperties'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 37
          end
          object clisFirst: TcxGridDBColumn
            Caption = '1-'#1074#1099#1073#1086#1088
            DataBinding.FieldName = 'isFirst'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Options.Editing = False
            Width = 45
          end
          object clisSecond: TcxGridDBColumn
            Caption = #1053#1077#1087#1088#1080#1086#1088#1080#1090#1077#1090'. '#1074#1099#1073#1086#1088
            DataBinding.FieldName = 'isSecond'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderGlyphAlignmentHorz = taCenter
            Options.Editing = False
            Width = 60
          end
          object clPrice: TcxGridDBColumn
            Caption = #1062#1077#1085#1072' '#1085#1072' '#1076#1072#1090#1091' ('#1080#1089#1090#1086#1088#1080#1103')'
            DataBinding.FieldName = 'Price'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00'
            Properties.MinValue = 0.010000000000000000
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object StartDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1089' ('#1080#1089#1090#1086#1088#1080#1103')'
            DataBinding.FieldName = 'StartDate'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 58
          end
          object EndDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1076#1086' ('#1080#1089#1090#1086#1088#1080#1103')'
            DataBinding.FieldName = 'EndDate'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 71
          end
          object RemainsStart: TcxGridDBColumn
            Caption = #1054#1089#1090'. '#1082#1086#1083'-'#1074#1086' '#1085#1072#1095'.'
            DataBinding.FieldName = 'RemainsStart'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object SummaRemainsStart: TcxGridDBColumn
            Caption = #1054#1089#1090'. '#1089#1091#1084#1084#1072' '#1085#1072#1095'.'
            DataBinding.FieldName = 'SummaRemainsStart'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object RemainsMCS_result: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1082#1086#1083'-'#1074#1086' '#1088#1072#1089#1093#1086#1076
            DataBinding.FieldName = 'RemainsMCS_result'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaRemainsMCS_result: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1089#1091#1084#1084#1072' '#1088#1072#1089#1093#1086#1076
            DataBinding.FieldName = 'SummaRemainsMCS_result'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object MCSValue: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1053#1058#1047
            DataBinding.FieldName = 'MCSValue'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1053#1077#1089#1085#1080#1078#1072#1077#1084#1099#1081' '#1090#1086#1074#1072#1088#1085#1099#1081' '#1079#1072#1087#1072#1089
            Width = 53
          end
          object SummaMCSValue: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1053#1058#1047
            DataBinding.FieldName = 'SummaMCSValue'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object RemainsMCS_from: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' > '#1053#1058#1047
            DataBinding.FieldName = 'RemainsMCS_from'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object SummaRemainsMCS_from: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' > '#1053#1058#1047
            DataBinding.FieldName = 'SummaRemainsMCS_from'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object RemainsMCS_to: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' < '#1053#1058#1047
            DataBinding.FieldName = 'RemainsMCS_to'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 55
          end
          object SummaRemainsMCS_to: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' < '#1053#1058#1047
            DataBinding.FieldName = 'SummaRemainsMCS_to'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object RemainsMCS_from_Child: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1082#1086#1083'-'#1074#1086' > '#1053#1058#1047
            DataBinding.FieldName = 'RemainsMCS_from_Child'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1057#1091#1084#1084#1072' '#1086#1089#1090#1072#1090#1082#1072' '#1089#1074#1077#1088#1093' '#1053#1058#1047
            Options.Editing = False
            Width = 88
          end
          object SummaRemainsMCS_from_Child: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1089#1091#1084#1084#1072' > '#1053#1058#1047
            DataBinding.FieldName = 'SummaRemainsMCS_from_Child'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 86
          end
          object RemainsMCS_to_Child: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1082#1086#1083'-'#1074#1086' < '#1053#1058#1047
            DataBinding.FieldName = 'RemainsMCS_to_Child'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 78
          end
          object SummaRemainsMCS_to_Child: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1089#1091#1084#1084#1072' < '#1053#1058#1047
            DataBinding.FieldName = 'SummaRemainsMCS_to_Child'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 81
          end
          object clisErased: TcxGridDBColumn
            Caption = #1059#1076#1072#1083#1077#1085
            DataBinding.FieldName = 'isErased'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1058#1086#1074#1072#1088' '#1091#1076#1072#1083#1077#1085
            Options.Editing = False
            Width = 27
          end
          object MCSValue_Child: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1082#1086#1083'-'#1074#1086' '#1053#1058#1047
            DataBinding.FieldName = 'MCSValue_Child'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object SummaMCSValue_Child: TcxGridDBColumn
            Caption = #1048#1058#1054#1043#1054' '#1089#1091#1084#1084#1072' '#1053#1058#1047
            DataBinding.FieldName = 'SummaMCSValue_Child'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 264
        Width = 1066
        Height = 232
        Align = alBottom
        PopupMenu = PopupMenu
        TabOrder = 1
        object cxGridDBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = ChildDS
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chMCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaMCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsMCS_result
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsMCS_result
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082': ,0'
              Kind = skCount
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsStart
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsMCS_from
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsMCS_to
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chMCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaMCSValue
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chRemainsMCS_result
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = chSummaRemainsMCS_result
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
          object chUnitName: TcxGridDBColumn
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
            DataBinding.FieldName = 'UnitName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 250
          end
          object chPrice: TcxGridDBColumn
            Caption = #1062#1077#1085#1072' '#1085#1072' '#1076#1072#1090#1091' ('#1080#1089#1090#1086#1088#1080#1103')'
            DataBinding.FieldName = 'Price'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 2
            Properties.DisplayFormat = ',0.00'
            Properties.MinValue = 0.010000000000000000
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object chStartDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1089' ('#1080#1089#1090#1086#1088#1080#1103')'
            DataBinding.FieldName = 'StartDate'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 55
          end
          object chEndDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' '#1076#1086' ('#1080#1089#1090#1086#1088#1080#1103')'
            DataBinding.FieldName = 'EndDate'
            Visible = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 55
          end
          object chRemainsStart: TcxGridDBColumn
            Caption = #1054#1089#1090'. '#1082#1086#1083'-'#1074#1086' '#1085#1072#1095'.'
            DataBinding.FieldName = 'RemainsStart'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object chSummaRemainsStart: TcxGridDBColumn
            Caption = #1054#1089#1090'. '#1089#1091#1084#1084#1072' '#1085#1072#1095'.'
            DataBinding.FieldName = 'SummaRemainsStart'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object chRemainsMCS_result: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1055#1056#1048#1061#1054#1044
            DataBinding.FieldName = 'RemainsMCS_result'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object chSummaRemainsMCS_result: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1055#1056#1048#1061#1054#1044
            DataBinding.FieldName = 'SummaRemainsMCS_result'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 80
          end
          object chMCSValue: TcxGridDBColumn
            AlternateCaption = #1053#1077#1089#1085#1080#1078#1072#1077#1084#1099#1081' '#1090#1086#1074#1072#1088#1085#1099#1081' '#1079#1072#1087#1072#1089
            Caption = #1050#1086#1083'-'#1074#1086' '#1053#1058#1047
            DataBinding.FieldName = 'MCSValue'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1053#1077#1089#1085#1080#1078#1072#1077#1084#1099#1081' '#1090#1086#1074#1072#1088#1085#1099#1081' '#1079#1072#1087#1072#1089
            Width = 70
          end
          object chSummaMCSValue: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1053#1058#1047
            DataBinding.FieldName = 'SummaMCSValue'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 70
          end
          object chRemainsMCS_from: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' > '#1053#1058#1047
            DataBinding.FieldName = 'RemainsMCS_from'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object chSummaRemainsMCS_from: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' > '#1053#1058#1047
            DataBinding.FieldName = 'SummaRemainsMCS_from'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object chRemainsMCS_to: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' < '#1053#1058#1047
            DataBinding.FieldName = 'RemainsMCS_to'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 80
          end
          object chSummaRemainsMCS_to: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' < '#1053#1058#1047
            DataBinding.FieldName = 'SummaRemainsMCS_to'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DecimalPlaces = 4
            Properties.DisplayFormat = ',0.####;-,0.####; ;'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGridDBTableView1
        end
      end
      object cxSplitterChild: TcxSplitter
        Left = 0
        Top = 259
        Width = 1066
        Height = 5
        AlignSplitter = salBottom
        Control = cxGrid1
      end
    end
  end
  inherited Panel: TPanel
    Width = 1066
    Height = 35
    ExplicitWidth = 1066
    ExplicitHeight = 35
    inherited deStart: TcxDateEdit
      Left = 105
      Top = 4
      ExplicitLeft = 105
      ExplicitTop = 4
    end
    inherited deEnd: TcxDateEdit
      Left = 123
      Top = 51
      Visible = False
      ExplicitLeft = 123
      ExplicitTop = 51
    end
    inherited cxLabel1: TcxLabel
      Left = 6
      Top = 5
      Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1076#1072#1090#1091':'
      ExplicitLeft = 6
      ExplicitTop = 5
      ExplicitWidth = 94
    end
    inherited cxLabel2: TcxLabel
      Left = 13
      Top = 52
      Visible = False
      ExplicitLeft = 13
      ExplicitTop = 52
    end
    object cxLabel4: TcxLabel
      Left = 200
      Top = 6
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
    end
    object edUnit: TcxButtonEdit
      Left = 290
      Top = 4
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      TabOrder = 5
      Width = 247
    end
    object cxLabel3: TcxLabel
      Left = 543
      Top = 5
      Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1076#1083#1103' '#1072#1085#1072#1083#1080#1079#1072' '#1053#1058#1047
    end
    object edPeriod: TcxCurrencyEdit
      Left = 700
      Top = 4
      EditValue = 30.000000000000000000
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Properties.MinValue = 1.000000000000000000
      TabOrder = 7
      Width = 46
    end
  end
  object cxLabel5: TcxLabel [2]
    Left = 752
    Top = 6
    Caption = #1057#1090#1088#1072#1093#1086#1074#1086#1081' '#1079#1072#1087#1072#1089' '#1053#1058#1047' '#1076#1083#1103' '#1061' '#1076#1085#1077#1081
  end
  object edDay: TcxCurrencyEdit [3]
    Left = 929
    Top = 5
    EditValue = 12.000000000000000000
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '0'
    Properties.MinValue = 1.000000000000000000
    TabOrder = 7
    Width = 46
  end
  inherited cxPropertiesStore: TcxPropertiesStore
    Components = <
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
        Component = GuidesUnit
        Properties.Strings = (
          'Key'
          'TextValue')
      end
      item
        Component = Owner
        Properties.Strings = (
          'Height'
          'Left'
          'Tag'
          'Width')
      end>
  end
  inherited ActionList: TActionList
    object actOpenPartionReport: TdsdOpenForm
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1072#1088#1090#1080#1103#1084
      ImageIndex = 39
      FormName = 'TReport_GoodsPartionMoveForm'
      FormNameParam.Value = 'TReport_GoodsPartionMoveForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <
        item
          Name = 'UnitId'
          Value = Null
          Component = GuidesUnit
          ComponentItem = 'Key'
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitName'
          Value = Null
          Component = GuidesUnit
          ComponentItem = 'TextValue'
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsId'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'Id'
          MultiSelectSeparator = ','
        end
        item
          Name = 'GoodsName'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'GoodsName'
          MultiSelectSeparator = ','
        end
        item
          Name = 'PartyId'
          Value = Null
          MultiSelectSeparator = ','
        end
        item
          Name = 'PartyName'
          Value = Null
          MultiSelectSeparator = ','
        end
        item
          Name = 'RemainsDate'
          Value = Null
          Component = deStart
          MultiSelectSeparator = ','
        end>
      isShowModal = False
    end
    object actRefreshPartionPrice: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spSelect
      StoredProcList = <
        item
          StoredProc = spSelect
        end>
      Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1080#1079' '#1087#1072#1088#1090#1080#1080' '#1094#1077#1085#1099
      Hint = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actRefreshIsPartion: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spSelect
      StoredProcList = <
        item
          StoredProc = spSelect
        end>
      Caption = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      Hint = #1087#1086' '#1055#1072#1088#1090#1080#1103#1084
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object ExecuteDialog: TExecuteDialog
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 35
      FormName = 'TReport_RemainsOverGoodsDialogForm'
      FormNameParam.Value = 'TReport_RemainsOverGoodsDialogForm'
      FormNameParam.DataType = ftString
      FormNameParam.MultiSelectSeparator = ','
      GuiParams = <
        item
          Name = 'StartDate'
          Value = 41395d
          Component = deStart
          DataType = ftDateTime
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitId'
          Value = ''
          Component = GuidesUnit
          ComponentItem = 'Key'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'UnitName'
          Value = ''
          Component = GuidesUnit
          ComponentItem = 'TextValue'
          DataType = ftString
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inPeriod'
          Value = 'False'
          Component = edPeriod
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'inDay'
          Value = 'False'
          Component = edDay
          DataType = ftFloat
          ParamType = ptInput
          MultiSelectSeparator = ','
        end>
      isShowModal = True
      RefreshDispatcher = RefreshDispatcher
      OpenBeforeShow = True
    end
    object actSend: TdsdExecStoredProc
      Category = 'DSDLib'
      MoveParams = <>
      PostDataSetBeforeExecute = False
      StoredProc = spSend
      StoredProcList = <
        item
          StoredProc = spSend
        end>
      ImageIndex = 41
    end
    object macSend: TMultiAction
      Category = 'DSDLib'
      MoveParams = <>
      ActionList = <
        item
          Action = actSend
        end>
      DataSource = DataSourceDocs
      QuestionBeforeExecute = #1042#1099' '#1091#1074#1077#1088#1077#1085#1099' '#1074' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'>? '
      InfoAfterExecute = #1044#1086#1082#1091#1084#1077#1085#1090#1099' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'> '#1089#1086#1079#1076#1072#1085#1099
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'>'
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'>'
      ImageIndex = 41
    end
    object actSendChild: TdsdExecStoredProc
      Category = 'DSDLib'
      MoveParams = <>
      PostDataSetBeforeExecute = False
      StoredProc = spSendChild
      StoredProcList = <
        item
          StoredProc = spSendChild
        end>
      Caption = 'actSendChild'
      ImageIndex = 41
    end
    object macSendChild: TMultiAction
      Category = 'DSDLib'
      MoveParams = <>
      ActionList = <
        item
          Action = actSendChild
        end>
      View = cxGridDBTableView1
      QuestionBeforeExecute = 
        #1042#1099' '#1091#1074#1077#1088#1077#1085#1099' '#1074' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'> '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1090 +
        #1086#1074#1072#1088#1091'? '
      InfoAfterExecute = #1044#1086#1082#1091#1084#1077#1085#1090#1099' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'> '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1090#1086#1074#1072#1088#1091' '#1089#1086#1079#1076#1072#1085#1099
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'> '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1090#1086#1074#1072#1088#1091' '
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' <'#1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077'> '#1087#1086' '#1090#1077#1082#1091#1097#1077#1084#1091' '#1090#1086#1074#1072#1088#1091' '
      ImageIndex = 41
    end
  end
  inherited MasterDS: TDataSource
    Left = 16
    Top = 160
  end
  inherited MasterCDS: TClientDataSet
    MasterFields = 'GoodsId'
    Left = 272
    Top = 192
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpReport_RemainsOverGoods'
    DataSets = <
      item
        DataSet = MasterCDS
      end
      item
        DataSet = ChildCDS
      end
      item
        DataSet = DataSetDocs
      end>
    OutputType = otMultiDataSet
    Params = <
      item
        Name = 'inUnitId'
        Value = 41395d
        Component = GuidesUnit
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inStartDate'
        Value = 41395d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPeriod'
        Value = Null
        Component = edPeriod
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inDay'
        Value = Null
        Component = edDay
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 80
    Top = 168
  end
  inherited BarManager: TdxBarManager
    Left = 152
    Top = 144
    DockControlHeights = (
      0
      0
      26
      0)
    inherited Bar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbExecuteDialog'
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
          ItemName = 'bbSend'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbGridToExcel'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end>
    end
    object bbGoodsPartyReport: TdxBarButton
      Action = actOpenPartionReport
      Category = 0
    end
    object bbExecuteDialog: TdxBarButton
      Action = ExecuteDialog
      Category = 0
    end
    object bbSend: TdxBarButton
      Action = macSend
      Category = 0
    end
    object bbSendChild: TdxBarButton
      Action = macSendChild
      Category = 0
      Visible = ivNever
      ImageIndex = 30
    end
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    Left = 480
    Top = 224
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 272
    Top = 152
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    ComponentList = <
      item
        Component = GuidesUnit
      end
      item
        Component = deStart
      end>
    Left = 368
    Top = 192
  end
  object GuidesUnit: TdsdGuides
    KeyField = 'Id'
    LookupControl = edUnit
    FormNameParam.Value = 'TUnit_ObjectForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TUnit_ObjectForm'
    PositionDataSet = 'MasterCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = GuidesUnit
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = GuidesUnit
        ComponentItem = 'TextValue'
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    Left = 256
    Top = 8
  end
  object ChildDS: TDataSource
    DataSet = ChildCDS
    Left = 184
    Top = 448
  end
  object ChildCDS: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'GoodsId'
    MasterFields = 'GoodsId'
    MasterSource = MasterDS
    PacketRecords = 0
    Params = <>
    Left = 104
    Top = 448
  end
  object spSend: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_MovementItem_Send_Auto'
    DataSets = <
      item
      end>
    OutputType = otResult
    Params = <
      item
        Name = 'inFromId'
        Value = '0'
        Component = GuidesUnit
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inToId'
        Value = ''
        Component = DataSetDocs
        ComponentItem = 'UnitId'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inOperDate'
        Value = 'NULL'
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inGoodsId'
        Value = ''
        Component = DataSetDocs
        ComponentItem = 'GoodsId'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inRemainsMCS_result'
        Value = Null
        Component = DataSetDocs
        ComponentItem = 'RemainsMCS_result'
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPrice_from'
        Value = Null
        Component = DataSetDocs
        ComponentItem = 'PriceFrom'
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPrice_to'
        Value = Null
        Component = DataSetDocs
        ComponentItem = 'Price'
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inMCSPeriod'
        Value = 0.000000000000000000
        Component = edPeriod
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inMCSDay'
        Value = 0.000000000000000000
        Component = edDay
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 600
    Top = 192
  end
  object DataSetDocs: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    MasterFields = 'GoodsId'
    Params = <>
    Left = 560
    Top = 424
  end
  object DataSourceDocs: TDataSource
    DataSet = DataSetDocs
    Left = 448
    Top = 440
  end
  object spSendChild: TdsdStoredProc
    StoredProcName = 'gpInsertUpdate_MovementItem_Send_Auto'
    DataSets = <
      item
      end>
    OutputType = otResult
    Params = <
      item
        Name = 'inFromId'
        Value = ''
        Component = GuidesUnit
        ComponentItem = 'Key'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inToId'
        Value = Null
        Component = ChildCDS
        ComponentItem = 'UnitId'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inOperDate'
        Value = 42370d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inGoodsId'
        Value = Null
        Component = ChildCDS
        ComponentItem = 'GoodsId'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inRemainsMCS_result'
        Value = Null
        Component = ChildCDS
        ComponentItem = 'RemainsMCS_result'
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPrice_from'
        Value = Null
        Component = MasterCDS
        ComponentItem = 'Price'
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inPrice_to'
        Value = Null
        Component = ChildCDS
        ComponentItem = 'Price'
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inMCSPeriod'
        Value = 30.000000000000000000
        Component = edPeriod
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inMCSDay'
        Value = 12.000000000000000000
        Component = edDay
        DataType = ftFloat
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 736
    Top = 192
  end
end