inherited PaymentJournalForm: TPaymentJournalForm
  Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1083#1072#1090
  ClientHeight = 374
  ClientWidth = 663
  AddOnFormData.AddOnFormRefresh.SelfList = 'Payment'
  AddOnFormData.AddOnFormRefresh.DataSet = MasterCDS
  AddOnFormData.AddOnFormRefresh.KeyField = 'Id'
  AddOnFormData.AddOnFormRefresh.KeyParam = 'inMovementId'
  AddOnFormData.AddOnFormRefresh.GetStoredProc = spGet_Movement_Payment
  ExplicitWidth = 679
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl: TcxPageControl
    Width = 663
    Height = 317
    TabOrder = 3
    ExplicitWidth = 663
    ExplicitHeight = 317
    ClientRectBottom = 317
    ClientRectRight = 663
    inherited tsMain: TcxTabSheet
      ExplicitWidth = 663
      ExplicitHeight = 317
      inherited cxGrid: TcxGrid
        Width = 663
        Height = 317
        ExplicitWidth = 663
        ExplicitHeight = 317
        inherited cxGridDBTableView: TcxGridDBTableView
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00'
              Kind = skSum
              Column = colTotalSumm
            end
            item
              Format = ',0.00'
              Kind = skSum
            end>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          Styles.Content = nil
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Footer = nil
          Styles.Header = nil
          object colId: TcxGridDBColumn [0]
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
            DataBinding.FieldName = 'Id'
            Visible = False
          end
          inherited colStatus: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Width = 49
          end
          inherited colInvNumber: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Width = 71
          end
          inherited colOperDate: TcxGridDBColumn
            HeaderAlignmentHorz = taCenter
            Width = 62
          end
          object colJuridicalName: TcxGridDBColumn
            Caption = #1070#1088'.'#1083#1080#1094#1086' '#1087#1083#1072#1090#1077#1083#1100#1097#1080#1082
            DataBinding.FieldName = 'JuridicalName'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 278
          end
          object colTotalCount: TcxGridDBColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
            DataBinding.FieldName = 'TotalCount'
            PropertiesClassName = 'TcxCalcEditProperties'
            Properties.DisplayFormat = ',0'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 85
          end
          object colTotalSumm: TcxGridDBColumn
            Caption = #1057#1091#1084#1084#1072' '#1086#1087#1083#1072#1090#1099
            DataBinding.FieldName = 'TotalSumm'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Width = 86
          end
        end
      end
    end
  end
  inherited Panel: TPanel
    Width = 663
    ExplicitWidth = 663
  end
  inherited ActionList: TActionList
    Left = 55
    Top = 154
    inherited actInsert: TdsdInsertUpdateAction
      FormName = 'TPaymentForm'
      FormNameParam.Value = 'TPaymentForm'
      GuiParams = <
        item
          Name = 'Id'
          Value = Null
        end
        item
          Name = 'ShowAll'
          Value = True
          DataType = ftBoolean
        end
        item
          Value = Null
        end>
    end
    inherited actUpdate: TdsdInsertUpdateAction
      FormName = 'TPaymentForm'
      FormNameParam.Value = 'TPaymentForm'
    end
  end
  inherited spSelect: TdsdStoredProc
    StoredProcName = 'gpSelect_Movement_Payment'
  end
  inherited BarManager: TdxBarManager
    DockControlHeights = (
      0
      0
      26
      0)
  end
  inherited DBViewAddOn: TdsdDBViewAddOn
    Left = 488
    Top = 304
  end
  inherited PopupMenu: TPopupMenu
    Left = 8
    Top = 152
  end
  inherited PeriodChoice: TPeriodChoice
    Left = 424
    Top = 8
  end
  inherited RefreshDispatcher: TRefreshDispatcher
    Left = 456
    Top = 8
  end
  inherited spMovementComplete: TdsdStoredProc
    StoredProcName = 'gpComplete_Movement_Payment'
  end
  inherited spMovementUnComplete: TdsdStoredProc
    StoredProcName = 'gpUnComplete_Movement_Payment'
    Left = 384
    Top = 264
  end
  inherited spMovementSetErased: TdsdStoredProc
    StoredProcName = 'gpSetErased_Movement_Payment'
    Left = 384
    Top = 216
  end
  inherited FormParams: TdsdFormParams
    Left = 40
    Top = 296
  end
  inherited spMovementReComplete: TdsdStoredProc
    StoredProcName = 'gpReComplete_Movement_Payment'
    Left = 384
    Top = 120
  end
  object spGet_Movement_Payment: TdsdStoredProc
    StoredProcName = 'gpGet_Movement_Payment'
    DataSets = <>
    OutputType = otResult
    Params = <
      item
        Name = 'inMovementId'
        Value = 41640d
        ParamType = ptInputOutput
      end
      item
        Name = 'inDateStart'
        Value = 42005d
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'inDateEnd'
        Value = 42005d
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Id'
        Value = False
      end
      item
        Name = 'InvNumber'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'OperDate'
        Value = Null
        DataType = ftDateTime
      end
      item
        Name = 'StatusCode'
        Value = Null
      end
      item
        Name = 'StatusName'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'TotalCount'
        Value = Null
        DataType = ftFloat
      end
      item
        Name = 'TotalSumm'
        Value = Null
        DataType = ftFloat
      end
      item
        Name = 'JuridicalId'
        Value = Null
      end
      item
        Name = 'JuridicalName'
        Value = Null
        DataType = ftString
      end
      item
        Name = 'DateStart'
        Value = Null
        DataType = ftDateTime
      end
      item
        Name = 'DateEnd'
        Value = Null
        DataType = ftDateTime
      end>
    PackSize = 1
    Left = 168
    Top = 99
  end
end