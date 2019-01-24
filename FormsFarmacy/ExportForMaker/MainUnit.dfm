object MainForm: TMainForm
  Left = 0
  Top = 0
  AutoSize = True
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1077#1081
  ClientHeight = 543
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grReportMaker: TcxGrid
    Left = 0
    Top = 235
    Width = 909
    Height = 308
    Align = alClient
    TabOrder = 1
    object grtvMaker: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsReport_Upload
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellTextMaxLineCount = 100
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
    end
    object grReportMakerLevel1: TcxGridLevel
      GridView = grtvMaker
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 31
    Align = alTop
    TabOrder = 0
    object btnSendMail: TButton
      Left = 782
      Top = 0
      Width = 113
      Height = 25
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' Email'
      TabOrder = 0
      OnClick = btnSendMailClick
    end
    object btnExport: TButton
      Left = 263
      Top = 0
      Width = 58
      Height = 25
      Caption = #1069#1082#1089#1087#1086#1088#1090
      TabOrder = 1
      OnClick = btnExportClick
    end
    object btnExecute: TButton
      Left = 167
      Top = 0
      Width = 90
      Height = 25
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = btnExecuteClick
    end
    object btnAll: TButton
      Left = 16
      Top = 0
      Width = 97
      Height = 25
      Caption = #1042#1089#1105' '#1087#1086' '#1074#1089#1077#1084'!'
      TabOrder = 3
      OnClick = btnAllClick
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 31
    Width = 909
    Height = 204
    Align = alTop
    TabOrder = 2
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = ''
    object cxGridDBTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsMaker
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = #1042#1089#1077#1075#1086' '#1089#1090#1088#1086#1082': ,0'
          Kind = skCount
          Column = Name
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsBehavior.IncSearchItem = Name
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 60
      OptionsView.Indicator = True
      object Code: TcxGridDBColumn
        Caption = #1050#1086#1076
        DataBinding.FieldName = 'Code'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 56
      end
      object Name: TcxGridDBColumn
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'Name'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 168
      end
      object CountryName: TcxGridDBColumn
        Caption = #1057#1090#1088#1072#1085#1072
        DataBinding.FieldName = 'CountryName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 147
      end
      object ContactPersonName: TcxGridDBColumn
        Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1086#1077' '#1083#1080#1094#1086
        DataBinding.FieldName = 'ContactPersonName'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 100
      end
      object Phone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085' ('#1082#1086#1085#1090'. '#1083#1080#1094#1086')'
        DataBinding.FieldName = 'Phone'
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 109
      end
      object Mail: TcxGridDBColumn
        Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072' ('#1082#1086#1085#1090'. '#1083#1080#1094#1086')'
        DataBinding.FieldName = 'Mail'
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Width = 114
      end
      object SendPlan: TcxGridDBColumn
        Caption = #1050#1086#1075#1076#1072' '#1087#1083#1072#1085#1080#1088#1091#1077#1084' '#1086#1090#1087#1088#1072#1074#1080#1090#1100' ('#1076#1072#1090#1072'/'#1074#1088#1077#1084#1103')'
        DataBinding.FieldName = 'SendPlan'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderHint = #1050#1086#1075#1076#1072' '#1087#1083#1072#1085#1080#1088#1091#1077#1084' '#1086#1090#1087#1088#1072#1074#1080#1090#1100'('#1076#1072#1090#1072'/'#1074#1088#1077#1084#1103')'
        Options.Editing = False
        Width = 96
      end
      object SendReal: TcxGridDBColumn
        Caption = #1050#1086#1075#1076#1072' '#1091#1089#1087#1077#1096#1085#1086' '#1087#1088#1086#1096#1083#1072' '#1086#1090#1087#1088#1072#1074#1082#1072' ('#1076#1072#1090#1072'/'#1074#1088#1077#1084#1103')'
        DataBinding.FieldName = 'SendReal'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderHint = #1050#1086#1075#1076#1072' '#1091#1089#1087#1077#1096#1085#1086' '#1087#1088#1086#1096#1083#1072' '#1086#1090#1087#1088#1072#1074#1082#1072' ('#1076#1072#1090#1072' / '#1074#1088#1077#1084#1103')'
        Options.Editing = False
        Width = 97
      end
      object isReport1: TcxGridDBColumn
        Caption = #1054#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1086#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084'"'
        DataBinding.FieldName = 'isReport1'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderHint = #1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1086#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084'"'
        Options.Editing = False
        Width = 80
      end
      object isReport2: TcxGridDBColumn
        Caption = #1054#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1086#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1072#1084'"'
        DataBinding.FieldName = 'isReport2'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderHint = #1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1086#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1072#1084'"'
        Options.Editing = False
        Width = 80
      end
      object isReport3: TcxGridDBColumn
        Caption = #1054#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '#1086#1089#1090#1072#1090#1082#1072#1084#1080' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072'"'
        DataBinding.FieldName = 'isReport3'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderHint = #1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1088#1077#1072#1083#1080#1079#1072#1094#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1089' '#1086#1089#1090#1072#1090#1082#1072#1084#1080' '#1085#1072' '#1082#1086#1085#1077#1094' '#1087#1077#1088#1080#1086#1076#1072'"'
        Options.Editing = False
        Width = 132
      end
      object isReport4: TcxGridDBColumn
        Caption = #1054#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1087#1088#1080#1093#1086#1076' '#1088#1072#1089#1093#1086#1076' '#1086#1089#1090#1072#1090#1086#1082'"'
        DataBinding.FieldName = 'isReport4'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderHint = #1086#1090#1087#1088#1072#1074#1083#1103#1090#1100' "'#1087#1088#1080#1093#1086#1076' '#1088#1072#1089#1093#1086#1076' '#1086#1089#1090#1072#1090#1086#1082'"'
        Options.Editing = False
        Width = 80
      end
      object isErased: TcxGridDBColumn
        Caption = #1059#1076#1072#1083#1077#1085
        DataBinding.FieldName = 'isErased'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Width = 53
      end
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridDBTableView
    end
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    Port = 5432
    Protocol = 'postgresql-9'
    Left = 136
    Top = 136
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 48
    Top = 128
  end
  object qryMaker: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select * from gpSelect_Object_Maker( '#39'3'#39') '
      
        'WHERE SendPlan <= CURRENT_TIMESTAMP AND (SendReal < SendPlan OR ' +
        'SendReal IS NULL) AND '
      
        '(COALESCE (isReport1, FALSE) = TRUE OR COALESCE (isReport2, FALS' +
        'E) = TRUE);')
    Params = <>
    Left = 144
    Top = 384
  end
  object dsMaker: TDataSource
    DataSet = qryMaker
    Left = 224
    Top = 384
  end
  object qryMailParam: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'SELECT'
      '    zc_Mail_From() AS Mail_From,'
      '    zc_Mail_Host() AS Mail_Host,'
      '    zc_Mail_Port() AS Mail_Port,'
      '    zc_Mail_User() AS Mail_User,'
      '    zc_Mail_Password() AS Mail_Password')
    Params = <>
    Left = 144
    Top = 328
  end
  object qryReport_Upload: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 556
    Top = 336
  end
  object dsReport_Upload: TDataSource
    DataSet = qryReport_Upload
    Left = 680
    Top = 336
  end
  object pmExecute: TPopupMenu
    Left = 224
    Top = 136
    object N1: TMenuItem
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1080#1093#1086#1076#1072#1084
      OnClick = pmClick
    end
    object N2: TMenuItem
      Tag = 1
      Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1088#1086#1076#1072#1078#1072#1084
      OnClick = pmClick
    end
  end
end