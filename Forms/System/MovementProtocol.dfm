inherited MovementProtocolForm: TMovementProtocolForm
  Caption = #1055#1088#1086#1090#1086#1082#1086#1083
  ClientHeight = 323
  ClientWidth = 782
  AddOnFormData.RefreshAction = nil
  AddOnFormData.isSingle = False
  AddOnFormData.Params = FormParams
  ExplicitWidth = 790
  ExplicitHeight = 357
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 82
    Width = 782
    Height = 241
    ExplicitTop = 82
    ExplicitWidth = 782
    ExplicitHeight = 241
    ClientRectBottom = 241
    ClientRectRight = 782
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 782
      inherited cxGrid: TcxGrid
        Left = 4
        Width = 477
        Align = alLeft
        ExplicitLeft = 4
        ExplicitWidth = 477
        inherited cxGridDBTableView: TcxGridDBTableView
          OptionsView.CellAutoHeight = True
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          object colDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072
            DataBinding.FieldName = 'OperDate'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 83
          end
          object colObjectName: TcxGridDBColumn
            Caption = #8470' '#1044#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'InvNumber'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 101
          end
          object colObjectTypeName: TcxGridDBColumn
            Caption = #1042#1080#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataBinding.FieldName = 'MovementDescName'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 138
          end
          object colUserName: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'UserName'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 144
          end
        end
      end
      object cxGridProtocolData: TcxGrid
        Left = 481
        Top = 0
        Width = 301
        Height = 241
        Align = alClient
        PopupMenu = PopupMenu
        TabOrder = 1
        ExplicitLeft = 448
        ExplicitWidth = 334
        object cxGridViewProtocolData: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = ProtocolDataDS
          DataController.Filter.Options = [fcoCaseInsensitive]
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Images = dmMain.SortImageList
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnHiding = True
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsCustomize.DataRowSizing = True
          OptionsData.CancelOnExit = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupSummaryLayout = gslAlignWithColumns
          OptionsView.HeaderAutoHeight = True
          OptionsView.Indicator = True
          Styles.StyleSheet = dmMain.cxGridTableViewStyleSheet
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = #1048#1084#1103' '#1087#1086#1083#1103
            DataBinding.FieldName = 'FieldName'
            HeaderAlignmentVert = vaCenter
            Width = 127
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            DataBinding.FieldName = 'FieldValue'
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 128
          end
        end
        object cxGridLevelProtocolData: TcxGridLevel
          GridView = cxGridViewProtocolData
        end
      end
      object cxSplitter: TcxSplitter
        Left = 0
        Top = 0
        Width = 4
        Height = 241
        Control = cxGrid
      end
    end
  end
  inherited Panel: TPanel
    Width = 782
    Height = 56
    ExplicitWidth = 782
    ExplicitHeight = 56
    inherited deEnd: TcxDateEdit
      Left = 335
      ExplicitLeft = 335
    end
    object edUser: TcxButtonEdit [3]
      Left = 101
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 4
      Width = 121
    end
    object edMovementDesc: TcxButtonEdit [4]
      Left = 335
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 5
      Width = 121
    end
    object edObject: TcxButtonEdit [5]
      Left = 583
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 6
      Width = 183
    end
    object cxLabel3: TcxLabel [6]
      Left = 21
      Top = 30
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
    end
    inherited cxLabel2: TcxLabel
      Left = 225
      ExplicitLeft = 225
    end
    object cxLabel4: TcxLabel
      Left = 241
      Top = 30
      Caption = #1058#1080#1087' '#1044#1086#1082#1091#1084#1077#1085#1090#1072':'
    end
    object cxLabel5: TcxLabel
      Left = 519
      Top = 30
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090':'
    end
  end
  inherited UserSettingsStorageAddOn: TdsdUserSettingsStorageAddOn
    Left = 59
  end
  inherited ActionList: TActionList
    Left = 103
  end
  inherited MasterDS: TDataSource
    Top = 119
  end
  inherited MasterCDS: TClientDataSet
    Left = 16
    Top = 119
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpSelect_MovementProtocol'
    Params = <
      item
        Name = 'inStartDate'
        Value = 41395d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inEndDate'
        Value = 41395d
        Component = deEnd
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inUserId'
        Value = ''
        Component = UserGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inMovementDescId'
        Value = ''
        Component = MovementDescGuides
        ComponentItem = 'Key'
        ParamType = ptInput
      end
      item
        Name = 'inMovementId'
        Value = ''
        Component = FormParams
        ComponentItem = 'Id'
        ParamType = ptInput
      end>
    Left = 160
    Top = 143
  end
  inherited BarManager: TdxBarManager
    Top = 111
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    Left = 424
    Top = 168
  end
  inherited PopupMenu: TPopupMenu
    Left = 152
    Top = 256
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 120
    Top = 160
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    RefreshAction = nil
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
        Component = deEnd
      end
      item
        Component = deStart
      end>
    Left = 224
    Top = 168
  end
  object UserGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edUser
    FormNameParam.Value = 'TUserForm'
    FormNameParam.DataType = ftString
    FormName = 'TUserForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = UserGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = UserGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 152
    Top = 24
  end
  object MovementDescGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = edMovementDesc
    FormNameParam.Value = 'TMovementDescFormsForm'
    FormNameParam.DataType = ftString
    FormName = 'TMovementDescFormsForm'
    PositionDataSet = 'MainDataCDS'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = MovementDescGuides
        ComponentItem = 'Key'
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = MovementDescGuides
        ComponentItem = 'TextValue'
        DataType = ftString
      end>
    Left = 384
    Top = 24
  end
  object FormParams: TdsdFormParams
    Params = <
      item
        Name = 'Id'
        Value = Null
        ParamType = ptInput
      end>
    Left = 352
    Top = 152
  end
  object dsdXMLTransform: TdsdXMLTransform
    DataSource = MasterDS
    XMLDataFieldName = 'ProtocolData'
    DataSet = ProtocolDataCDS
    Left = 496
    Top = 112
  end
  object ProtocolDataCDS: TClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <>
    Left = 584
    Top = 119
    object ProtocolDataCDSFieldName: TStringField
      FieldName = 'FieldName'
      Size = 100
    end
    object ProtocolDataCDSFieldValue: TStringField
      FieldName = 'FieldValue'
      Size = 255
    end
  end
  object ProtocolDataDS: TDataSource
    DataSet = ProtocolDataCDS
    Left = 648
    Top = 119
  end
end
