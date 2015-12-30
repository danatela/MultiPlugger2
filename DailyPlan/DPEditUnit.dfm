object DPEditForm: TDPEditForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1057#1091#1090#1086#1095#1085#1086#1075#1086' '#1047#1072#1076#1072#1085#1080#1103
  ClientHeight = 418
  ClientWidth = 583
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object NumLabel: TLabel
    Left = 8
    Top = 11
    Width = 38
    Height = 15
    Caption = #1053#1086#1084#1077#1088
    FocusControl = NumDBEditEh
    Visible = False
  end
  object JDateLabel: TLabel
    Left = 179
    Top = 11
    Width = 25
    Height = 15
    Caption = #1044#1072#1090#1072
    FocusControl = NumDBEditEh
  end
  object OrderNumLabel: TLabel
    Left = 167
    Top = 43
    Width = 57
    Height = 15
    Caption = #1047#1072#1082#1072#1079' '#1059#1043#1052
    FocusControl = OrderNumDBLookupComboboxEh
  end
  object OrderNum2Label: TLabel
    Left = 294
    Top = 43
    Width = 60
    Height = 15
    Caption = #1047#1072#1082#1072#1079' '#1062#1052#1050
    FocusControl = OrderNum2DBLookupComboboxEh
  end
  object OrdNLabel: TLabel
    Left = 421
    Top = 43
    Width = 70
    Height = 15
    Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
    FocusControl = OrdNDBLookupComboboxEh
  end
  object ProletLabel: TLabel
    Left = 8
    Top = 43
    Width = 41
    Height = 15
    Caption = #1055#1088#1086#1083#1105#1090
    FocusControl = ProletDBLookupComboboxEh
  end
  object KolLabel: TLabel
    Left = 352
    Top = 11
    Width = 65
    Height = 15
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    FocusControl = KolDBEditEh
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 377
    Width = 583
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      583
      41)
    object OKBitBtn: TBitBtn
      Left = 367
      Top = 6
      Width = 99
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = OKBitBtnClick
    end
    object CancelBitBtn: TBitBtn
      Left = 472
      Top = 6
      Width = 99
      Height = 25
      Anchors = [akRight, akBottom]
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
    object PrintBitBtn: TBitBtn
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C00000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFF
        FF00C0C0C000C0C0C000000000000000000000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000FF000000FF000000
        FF00C0C0C000C0C0C00000000000C0C0C00000000000FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C000C0C0C0000000000000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000C0C0C00000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000C0C0C00000000000C0C0C0000000000000000000FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000C0C0C00000000000C0C0C00000000000FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FF000000FF000000FF000000FF000000FF00
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 2
      OnClick = PrintBitBtnClick
    end
  end
  object NumDBEditEh: TDBEditEh
    Left = 52
    Top = 8
    Width = 121
    Height = 23
    DataField = 'NUM'
    DataSource = DailyPlanForm.DailyJobsDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 1
    Visible = False
  end
  object JDateDBDateTimeEditEh: TDBDateTimeEditEh
    Left = 210
    Top = 8
    Width = 121
    Height = 23
    DataField = 'JDATE'
    DataSource = DailyPlanForm.DailyJobsDataSource
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
  end
  object OrderNumDBLookupComboboxEh: TDBLookupComboboxEh
    Left = 167
    Top = 64
    Width = 121
    Height = 23
    DynProps = <>
    DataField = 'KD_ORDERNUM'
    DataSource = DailyPlanForm.DailyJobsDataSource
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object ProletDBLookupComboboxEh: TDBLookupComboboxEh
    Left = 8
    Top = 64
    Width = 121
    Height = 23
    DynProps = <>
    DataField = 'PROLET_NAME'
    DataSource = DailyPlanForm.DailyJobsDataSource
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object OrderNum2DBLookupComboboxEh: TDBLookupComboboxEh
    Left = 294
    Top = 64
    Width = 121
    Height = 23
    DynProps = <>
    DataField = 'KD_ORDERNUM2'
    DataSource = DailyPlanForm.DailyJobsDataSource
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object OrdNDBLookupComboboxEh: TDBLookupComboboxEh
    Left = 421
    Top = 64
    Width = 121
    Height = 23
    DynProps = <>
    DataField = 'MARKS_ORDN'
    DataSource = DailyPlanForm.DailyJobsDataSource
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object SpDailyJobsDBGridEh: TDBGridEh
    Left = 8
    Top = 93
    Width = 567
    Height = 278
    Align = alCustom
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = SpDailyJobsDataSource
    DynProps = <>
    EvenRowColor = cl3DLight
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    TabOrder = 7
    OnDrawColumnCell = SpDailyJobsDBGridEhDrawColumnCell
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        Footers = <>
        TextEditing = False
        Title.Caption = #8470
        Width = 20
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPER_NAME'
        Footers = <>
        TextEditing = False
        Width = 135
      end
      item
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACTIVE'
        Footers = <>
        Width = 118
      end
      item
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'COMPLETED'
        Footers = <>
        Width = 91
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Width = 176
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object KolDBEditEh: TDBEditEh
    Left = 421
    Top = 8
    Width = 121
    Height = 23
    DataField = 'QUANTITY'
    DataSource = DailyPlanForm.DailyJobsDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 8
    Visible = True
  end
  object SPDailyJobsADOQuery: TADOQuery
    Connection = DailyPlanForm.ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    Parameters = <
      item
        Name = 'pID'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select * from CMKNEW.SPDAILYJOBS where DAILYJOBS_ID=:pID'
      'Order BY ID')
    Left = 440
    Top = 264
    object SPDailyJobsADOQueryID: TFloatField
      FieldName = 'ID'
    end
    object SPDailyJobsADOQueryDAILYJOBS_ID: TFloatField
      FieldName = 'DAILYJOBS_ID'
    end
    object SPDailyJobsADOQueryOPER_NREC: TFloatField
      FieldName = 'OPER_NREC'
    end
    object SPDailyJobsADOQueryACTIVE: TFMTBCDField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1086
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object SPDailyJobsADOQueryCOMPLETED: TFMTBCDField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1086
      FieldName = 'COMPLETED'
      Precision = 38
      Size = 0
    end
    object SPDailyJobsADOQueryOPER_NAME: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'OPER_NAME'
      LookupDataSet = OperationsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'OPER_NREC'
      ReadOnly = True
      Lookup = True
    end
    object SPDailyJobsADOQueryPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 255
    end
  end
  object SpDailyJobsDataSource: TDataSource
    DataSet = ClientDataSet
    Left = 320
    Top = 320
  end
  object OperationsADOQuery: TADOQuery
    Connection = DailyPlanForm.ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.OPERATIONS')
    Left = 328
    Top = 248
    object OperationsADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object OperationsADOQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object OperationsADOQueryFREQ: TFMTBCDField
      FieldName = 'FREQ'
      Precision = 38
      Size = 0
    end
    object OperationsADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 424
    Top = 320
    object ClientDataSetID: TFloatField
      FieldName = 'ID'
    end
    object ClientDataSetDAILYJOBS_ID: TFloatField
      FieldName = 'DAILYJOBS_ID'
    end
    object ClientDataSetOPER_NREC: TFloatField
      FieldName = 'OPER_NREC'
    end
    object ClientDataSetACTIVE: TFMTBCDField
      DisplayLabel = #1040#1082#1090#1080#1074#1085#1086
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object ClientDataSetCOMPLETED: TFMTBCDField
      DisplayLabel = #1042#1099#1087#1086#1083#1085#1077#1085#1086
      FieldName = 'COMPLETED'
      Precision = 38
      Size = 0
    end
    object ClientDataSetOPER_NAME: TStringField
      DisplayLabel = #1054#1087#1077#1088#1072#1094#1080#1103
      FieldKind = fkLookup
      FieldName = 'OPER_NAME'
      LookupDataSet = OperationsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'OPER_NREC'
      ReadOnly = True
      Lookup = True
    end
    object ClientDataSetPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 255
    end
  end
  object DataSetProvider: TDataSetProvider
    DataSet = SPDailyJobsADOQuery
    Left = 416
    Top = 176
  end
  object App: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 24
    Top = 304
  end
end
