inherited CheckJournalForm: TCheckJournalForm
  Caption = #1050#1072#1089#1089#1086#1074#1099#1077' '#1095#1077#1082#1080
  ClientHeight = 554
  ClientWidth = 831
  AddOnFormData.RefreshAction = actRefreshStart
  AddOnFormData.ExecuteDialogAction = ExecuteDialog
  ExplicitWidth = 847
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Top = 77
    Width = 831
    Height = 477
    TabOrder = 3
    ExplicitTop = 77
    ExplicitWidth = 831
    ExplicitHeight = 477
    ClientRectBottom = 477
    ClientRectRight = 831
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 831
      ExplicitHeight = 477
      inherited cxGrid: TcxGrid
        Width = 831
        Height = 477
        ExplicitWidth = 831
        ExplicitHeight = 477
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.DefaultGroupSummaryItems = <
            item
              Format = ',0.####'
              Kind = skSum
              Column = clTotalSummChangePercent
            end>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = colTotalSumm
            end
            item
              Format = ',0.####'
              Kind = skSum
              Column = clTotalSummChangePercent
            end>
          OptionsView.GroupByBox = True
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          inherited colStatus: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
          end
          inherited colInvNumber: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 99
          end
          inherited colOperDate: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
          end
          object colUnitName: TcxGridDBColumn
            Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
            DataBinding.FieldName = 'UnitName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 111
          end
          object colCashNumber: TcxGridDBColumn
            Caption = #1050#1072#1089#1089#1072
            DataBinding.FieldName = 'CashRegisterName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 74
          end
          object colTotalCount: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'TotalCount'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 72
          end
          object colTotalSumm: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072
            DataBinding.FieldName = 'TotalSumm'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 79
          end
          object clTotalSummChangePercent: TcxGridDBColumn
            Caption = #1048#1090#1086#1075#1086' '#1089#1091#1084#1084#1072' '#1089#1082#1080#1076#1082#1080
            DataBinding.FieldName = 'TotalSummChangePercent'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 98
          end
          object coPaidTypeName: TcxGridDBColumn
            Caption = #1058#1080#1087' '#1086#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'PaidTypeName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 70
          end
          object colBayer: TcxGridDBColumn
            Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'Bayer'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 87
          end
          object BayerPhone: TcxGridDBColumn
            Caption = #1058#1077#1083'. ('#1087#1086#1082#1091#1087#1072#1090#1077#1083#1103')'
            DataBinding.FieldName = 'BayerPhone'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085' ('#1055#1086#1082#1091#1087#1072#1090#1077#1083#1103')'
            Options.Editing = False
            Width = 102
          end
          object colCashMember: TcxGridDBColumn
            Caption = #1052#1077#1085#1077#1076#1078#1077#1088
            DataBinding.FieldName = 'CashMember'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 91
          end
          object colFiscalCheckNumber: TcxGridDBColumn
            Caption = #8470' '#1092#1080#1089#1082#1072#1083#1100#1085#1086#1075#1086' '#1095#1077#1082#1072
            DataBinding.FieldName = 'FiscalCheckNumber'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 103
          end
          object colNotMCS: TcxGridDBColumn
            Caption = #1053#1077' '#1076#1083#1103' '#1053#1058#1047
            DataBinding.FieldName = 'NotMCS'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 51
          end
          object DiscountExternalName: TcxGridDBColumn
            Caption = #1055#1088#1086#1077#1082#1090
            DataBinding.FieldName = 'DiscountExternalName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1055#1088#1086#1077#1082#1090' ('#1076#1080#1089#1082#1086#1085#1090#1085#1099#1077' '#1082#1072#1088#1090#1099')'
            Options.Editing = False
            Width = 120
          end
          object clDiscountCardName: TcxGridDBColumn
            Caption = #8470' '#1082#1072#1088#1090#1099
            DataBinding.FieldName = 'DiscountCardName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 100
          end
          object IsDeferred: TcxGridDBColumn
            Caption = #1054#1090#1083#1086#1078#1077#1085
            DataBinding.FieldName = 'IsDeferred'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 65
          end
          object InvNumberOrder: TcxGridDBColumn
            Caption = #8470' '#1079#1072#1082#1072#1079#1072' ('#1089#1072#1081#1090')'
            DataBinding.FieldName = 'InvNumberOrder'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072' ('#1089' '#1089#1072#1081#1090#1072')'
            Options.Editing = False
            Width = 90
          end
          object ConfirmedKindName: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
            DataBinding.FieldName = 'ConfirmedKindName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072' ('#1057#1086#1089#1090#1086#1103#1085#1080#1077' VIP-'#1095#1077#1082#1072')'
            Options.Editing = False
            Width = 80
          end
          object ConfirmedKindClientName: TcxGridDBColumn
            Caption = #1057#1090#1072#1090#1091#1089' '#1057#1052#1057
            DataBinding.FieldName = 'ConfirmedKindClientName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            HeaderHint = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072' ('#1054#1090#1087#1088#1072#1074#1083#1077#1085' '#1082#1083#1080#1077#1085#1090#1091')'
            Options.Editing = False
            Width = 102
          end
          object CommentError: TcxGridDBColumn
            Caption = #1054#1096#1080#1073#1082#1072' '#1086#1089#1090#1072#1090#1086#1082' - '#1058#1086#1074#1072#1088'/'#1088#1072#1089#1095'/'#1092#1072#1082#1090' '#1082#1086#1083'-'#1074#1086
            DataBinding.FieldName = 'CommentError'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 200
          end
          object clInsertName: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' ('#1089#1086#1079#1076'.)'
            DataBinding.FieldName = 'InsertName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 101
          end
          object clInsertDate: TcxGridDBColumn
            Caption = #1044#1072#1090#1072' ('#1089#1086#1079#1076'.)'
            DataBinding.FieldName = 'InsertDate'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Width = 78
          end
        end
      end
    end
  end
  inherited Panel: TPanel
    Width = 831
    Height = 51
    ExplicitWidth = 831
    ExplicitHeight = 51
    inherited deStart: TcxDateEdit
      EditValue = 42370d
    end
    inherited deEnd: TcxDateEdit
      EditValue = 42370d
    end
    object ceUnit: TcxButtonEdit
      Left = 107
      Top = 29
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.Nullstring = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077'>'
      Properties.ReadOnly = True
      Properties.UseNullString = True
      TabOrder = 4
      Text = '<'#1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077'>'
      Width = 288
    end
    object cxLabel3: TcxLabel
      Left = 10
      Top = 29
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077':'
    end
  end
  inherited ActionList: TActionList
    inherited actInsert: TdsdInsertUpdateAction
      Enabled = False
      FormName = 'TCheckForm'
      FormNameParam.Value = 'TCheckForm'
    end
    inherited actInsertMask: TdsdInsertUpdateAction
      Enabled = False
    end
    inherited actUpdate: TdsdInsertUpdateAction
      FormName = 'TCheckForm'
      FormNameParam.Value = 'TCheckForm'
      GuiParams = <
        item
          Name = 'Id'
          Value = Null
          Component = MasterCDS
          ComponentItem = 'Id'
          ParamType = ptInput
          MultiSelectSeparator = ','
        end
        item
          Name = 'ShowAll'
          Value = False
          DataType = ftBoolean
          MultiSelectSeparator = ','
        end
        item
          Name = 'inOperDate'
          Value = 41640d
          Component = deEnd
          DataType = ftDateTime
          MultiSelectSeparator = ','
        end>
    end
    inherited actUnComplete: TdsdChangeMovementStatus
      Enabled = False
    end
    inherited actComplete: TdsdChangeMovementStatus
      Enabled = False
    end
    inherited actSetErased: TdsdChangeMovementStatus
      Enabled = False
    end
    inherited actReCompleteList: TMultiAction
      Enabled = False
    end
    inherited actCompleteList: TMultiAction
      Enabled = False
    end
    inherited actUnCompleteList: TMultiAction
      Enabled = False
    end
    inherited actSetErasedList: TMultiAction
      Enabled = False
    end
    inherited spCompete: TdsdExecStoredProc
      Enabled = False
    end
    inherited spUncomplete: TdsdExecStoredProc
      Enabled = False
    end
    inherited spErased: TdsdExecStoredProc
      Enabled = False
    end
    inherited actSimpleCompleteList: TMultiAction
      Enabled = False
    end
    inherited actSimpleUncompleteList: TMultiAction
      Enabled = False
    end
    inherited actSimpleReCompleteList: TMultiAction
      QuestionBeforeExecute = #1053#1072#1095#1072#1090#1100' '#1087#1088#1086#1094#1077#1076#1091#1088#1091' '#1087#1077#1088#1077#1087#1088#1086#1074#1077#1076#1077#1085#1080#1103' '#1086#1090#1086#1073#1088#1072#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074'?'
    end
    inherited actSimpleErased: TMultiAction
      Enabled = False
    end
    object actGet_UserUnit: TdsdExecStoredProc
      Category = 'DSDLib'
      MoveParams = <>
      PostDataSetBeforeExecute = False
      StoredProc = spGet_UserUnit
      StoredProcList = <
        item
          StoredProc = spGet_UserUnit
        end>
      Caption = 'actGet_UserUnit'
    end
    object actRefreshStart: TdsdDataSetRefresh
      Category = 'DSDLib'
      MoveParams = <>
      StoredProc = spGet_UserUnit
      StoredProcList = <
        item
          StoredProc = spGet_UserUnit
        end
        item
          StoredProc = spSelect
        end>
      Caption = #1055#1077#1088#1077#1095#1080#1090#1072#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 116
      RefreshOnTabSetChanges = False
    end
    object actShowMessage: TShowMessageAction
      Category = 'DSDLib'
      MoveParams = <>
    end
    object ExecuteDialog: TExecuteDialog
      Category = 'DSDLib'
      MoveParams = <>
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1095#1077#1090#1072
      ImageIndex = 35
      FormName = 'TMovement_PeriodDialogForm'
      FormNameParam.Value = 'TMovement_PeriodDialogForm'
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
        end>
      isShowModal = True
      RefreshDispatcher = RefreshDispatcher
      OpenBeforeShow = True
    end
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpSelect_Movement_Check'
    Params = <
      item
        Name = 'inStartDate'
        Value = 41640d
        Component = deStart
        DataType = ftDateTime
        ParamType = ptInputOutput
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
        Name = 'inIsErased'
        Value = False
        Component = actShowErased
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inUnitId'
        Value = Null
        Component = FormParams
        ComponentItem = 'UnitId'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      26
      0)
    inherited Bar: TdxBar
      ItemLinks = <
        item
          Visible = True
          ItemName = 'bbEdit'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbShowErased'
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
          ItemName = 'bbMovementItemContainer'
        end
        item
          Visible = True
          ItemName = 'dxBarStatic'
        end
        item
          Visible = True
          ItemName = 'bbMovementProtocol'
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
    inherited bbInsert: TdxBarButton
      Visible = ivNever
    end
    inherited bbInsertMask: TdxBarButton
      Visible = ivNever
    end
    inherited bbComplete: TdxBarButton
      Visible = ivNever
    end
    inherited bbUnComplete: TdxBarButton
      Visible = ivNever
    end
    inherited bbDelete: TdxBarButton
      Visible = ivNever
    end
  end
  inherited PopupMenu: TPopupMenu
    object N13: TMenuItem [11]
      Action = actSimpleReCompleteList
    end
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    RefreshAction = actRefreshStart
    ComponentList = <
      item
        Component = PeriodChoice
      end
      item
      end>
  end
  inherited spMovementComplete: TdsdStoredProc
    Left = 88
    Top = 296
  end
  inherited spMovementUnComplete: TdsdStoredProc
    Left = 88
    Top = 344
  end
  inherited spMovementSetErased: TdsdStoredProc
    Left = 88
    Top = 448
  end
  inherited FormParams: TdsdFormParams
    Params = <
      item
        Name = 'Id'
        Value = Null
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end
      item
        Name = 'Key'
        Value = Null
        DataType = ftString
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'ShowAll'
        Value = False
        DataType = ftBoolean
        ParamType = ptInputOutput
        MultiSelectSeparator = ','
      end
      item
        Name = 'UnitId'
        Value = Null
        Component = UnitGuides
        ComponentItem = 'Key'
        MultiSelectSeparator = ','
      end>
  end
  inherited spMovementReComplete: TdsdStoredProc
    StoredProcName = 'gpReComplete_Movement_Check'
    Params = <
      item
        Name = 'inMovementId'
        Component = MasterCDS
        ComponentItem = 'Id'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'outMessageText'
        Value = Null
        Component = actShowMessage
        ComponentItem = 'MessageText'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    Left = 88
    Top = 392
  end
  object UnitGuides: TdsdGuides
    KeyField = 'Id'
    LookupControl = ceUnit
    FormNameParam.Value = 'TUnitTreeForm'
    FormNameParam.DataType = ftString
    FormNameParam.MultiSelectSeparator = ','
    FormName = 'TUnitTreeForm'
    PositionDataSet = 'ClientDataSet'
    Params = <
      item
        Name = 'Key'
        Value = ''
        Component = UnitGuides
        ComponentItem = 'Key'
        MultiSelectSeparator = ','
      end
      item
        Name = 'TextValue'
        Value = ''
        Component = UnitGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    Left = 336
    Top = 24
  end
  object rdUnit: TRefreshDispatcher
    IdParam.Value = Null
    IdParam.MultiSelectSeparator = ','
    RefreshAction = actRefresh
    ComponentList = <
      item
        Component = UnitGuides
      end>
    Left = 296
    Top = 24
  end
  object spGet_UserUnit: TdsdStoredProc
    StoredProcName = 'gpGet_UserUnit'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'UnitId'
        Value = Null
        Component = UnitGuides
        ComponentItem = 'Key'
        MultiSelectSeparator = ','
      end
      item
        Name = 'UnitName'
        Value = Null
        Component = UnitGuides
        ComponentItem = 'TextValue'
        DataType = ftString
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 432
    Top = 424
  end
  object dsdStoredProc1: TdsdStoredProc
    StoredProcName = 'gpReComplete_Movement_Income'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inMovementId'
        Value = Null
        ComponentItem = 'Id'
        ParamType = ptInput
        MultiSelectSeparator = ','
      end
      item
        Name = 'inIsLastComplete'
        Value = 'True'
        DataType = ftBoolean
        ParamType = ptInput
        MultiSelectSeparator = ','
      end>
    PackSize = 1
    Left = 761
    Top = 178
  end
end
