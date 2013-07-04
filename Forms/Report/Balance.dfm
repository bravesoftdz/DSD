inherited BalanceForm: TBalanceForm
  Caption = #1041#1072#1083#1072#1085#1089
  ClientHeight = 376
  ClientWidth = 1329
  ExplicitWidth = 1337
  ExplicitHeight = 403
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 26
    Width = 1329
    Height = 350
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 754
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          Column = cxGridDBTableViewColumn6
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGridDBTableViewColumn7
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGridDBTableViewColumn8
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGridDBTableViewColumn9
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGridDBTableViewColumn10
        end
        item
          Kind = skSum
          Position = spFooter
          Column = cxGridDBTableViewColumn11
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = cxGridDBTableViewColumn6
        end
        item
          Kind = skSum
          Column = cxGridDBTableViewColumn7
        end
        item
          Kind = skSum
          Column = cxGridDBTableViewColumn8
        end
        item
          Kind = skSum
          Column = cxGridDBTableViewColumn9
        end
        item
          Kind = skSum
          Column = cxGridDBTableViewColumn10
        end
        item
          Kind = skSum
          Column = cxGridDBTableViewColumn11
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderAutoHeight = True
      object cxGridDBTableViewColumn1: TcxGridDBColumn
        Caption = #1040'-'#1055
        DataBinding.FieldName = 'RootName'
        Width = 50
      end
      object cxGridDBTableViewColumn2: TcxGridDBColumn
        Caption = #1057#1095#1077#1090' - '#1075#1088#1091#1087#1087#1072
        DataBinding.FieldName = 'AccountGroupName'
        Width = 100
      end
      object cxGridDBTableViewColumn3: TcxGridDBColumn
        Caption = #1057#1095#1077#1090' - '#1085#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        DataBinding.FieldName = 'AccountDirectionName'
        Width = 100
      end
      object cxGridDBTableViewColumn4: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1057#1095#1077#1090#1072
        DataBinding.FieldName = 'AccountCode'
        Width = 50
      end
      object cxGridDBTableViewColumn5: TcxGridDBColumn
        Caption = #1057#1095#1077#1090' - '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1077
        DataBinding.FieldName = 'AccountName'
        Width = 100
      end
      object cxGridDBTableViewColumn12: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1089#1090'. '#1085#1072#1079#1085#1072#1095'.'
        DataBinding.FieldName = 'InfoMoneyCode'
        Width = 60
      end
      object cxGridDBTableViewColumn13: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1100#1080' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103
        DataBinding.FieldName = 'InfoMoneyName'
        Width = 80
      end
      object cxGridDBTableViewColumn14: TcxGridDBColumn
        Caption = #1050#1086#1076' '#1089#1090'. '#1085#1072#1079#1085#1072#1095'.'#1076#1077#1090'.'
        DataBinding.FieldName = 'InfoMoneyCode_Detail'
        Width = 60
      end
      object cxGridDBTableViewColumn15: TcxGridDBColumn
        Caption = #1057#1090#1072#1090#1100#1080' '#1085#1072#1079#1085#1072#1095#1077#1085#1080#1103' '#1076#1077#1090#1072#1083#1100#1085#1086
        DataBinding.FieldName = 'InfoMoneyName_Detail'
        Width = 100
      end
      object cxGridDBTableViewColumn6: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090' '#1085#1072#1095#1072#1083#1100#1085#1099#1081
        DataBinding.FieldName = 'AmountDebetStart'
        Width = 75
      end
      object cxGridDBTableViewColumn7: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090' '#1085#1072#1095#1072#1083#1100#1085#1099#1081
        DataBinding.FieldName = 'AmountKreditStart'
        Width = 75
      end
      object cxGridDBTableViewColumn8: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090' '#1086#1073#1086#1088#1086#1090
        DataBinding.FieldName = 'AmountDebet'
        Width = 75
      end
      object cxGridDBTableViewColumn9: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090' '#1086#1073#1086#1088#1086#1090
        DataBinding.FieldName = 'AmountKredit'
        Width = 75
      end
      object cxGridDBTableViewColumn10: TcxGridDBColumn
        Caption = #1044#1077#1073#1077#1090' '#1082#1086#1085#1077#1095#1085#1099#1081
        DataBinding.FieldName = 'AmountDebetEnd'
        Width = 75
      end
      object cxGridDBTableViewColumn11: TcxGridDBColumn
        Caption = #1050#1088#1077#1076#1080#1090' '#1082#1086#1085#1077#1095#1085#1099#1081
        DataBinding.FieldName = 'AmountKreditEnd'
        Width = 75
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object DataSource: TDataSource
    DataSet = ClientDataSet
    Left = 96
    Top = 96
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 144
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
      end
      item
        Component = cxGridDBTableViewColumn1
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn2
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn3
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn4
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn5
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn6
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn7
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end
      item
        Component = cxGridDBTableViewColumn8
        Properties.Strings = (
          'SortIndex'
          'SortOrder'
          'Visible'
          'Width')
      end>
    StorageName = 'cxPropertiesStore'
    StorageType = stStream
    Left = 232
    Top = 96
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = dmMain.ImageList
    PopupMenuLinks = <>
    ShowShortCutInHint = True
    UseSystemFont = True
    Left = 152
    Top = 88
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManagerBar1: TdxBar
      Caption = 'Custom'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 671
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'bbToExcel'
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
  end
  object ActionList: TActionList
    Images = dmMain.ImageList
    Left = 232
    Top = 144
    object actRefresh: TdsdDataSetRefresh
      Category = 'DSDLib'
      StoredProc = dsdStoredProc
      StoredProcList = <
        item
          StoredProc = dsdStoredProc
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 4
      ShortCut = 116
    end
    object actExportToExcel: TdsdGridToExcel
      Category = 'DSDLib'
      Grid = cxGrid
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      Hint = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      ImageIndex = 6
      ShortCut = 16472
    end
  end
  object dsdStoredProc: TdsdStoredProc
    StoredProcName = 'gpReport_Balance'
    DataSet = ClientDataSet
    DataSets = <
      item
        DataSet = ClientDataSet
      end>
    Params = <
      item
        Name = 'inStartDate'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 41275d
      end
      item
        Name = 'inEndDate'
        DataType = ftDateTime
        ParamType = ptInput
        Value = 41640d
      end>
    Left = 152
    Top = 152
  end
end
