object ApproveActForm: TApproveActForm
  Left = 0
  Top = 0
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1040#1082#1090#1086#1074' '#1057#1076#1072#1095#1080
  ClientHeight = 627
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RightPanel: TPanel
    Left = 392
    Top = 0
    Width = 192
    Height = 627
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      192
      627)
    object PrintBitBtn: TBitBtn
      Left = 8
      Top = 520
      Width = 177
      Height = 97
      Anchors = [akLeft, akRight, akBottom]
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
      TabOrder = 0
      OnClick = PrintBitBtnClick
    end
    object DelBitBtn: TBitBtn
      Left = 7
      Top = 216
      Width = 177
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00
        FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00
        FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
        FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
        0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
        FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00
        FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00
        FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 1
      OnClick = DelBitBtnClick
    end
    object EditBitBtn: TBitBtn
      Left = 7
      Top = 113
      Width = 177
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
        0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
        FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
        00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
        000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
        0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
        0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
        000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
        00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
        0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
        000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
        000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
        00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
        0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
        FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
        000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
        FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
      TabOrder = 2
      OnClick = EditBitBtnClick
    end
    object NewBitBtn: TBitBtn
      Left = 7
      Top = 10
      Width = 177
      Height = 97
      Anchors = [akLeft, akTop, akRight]
      Caption = #1053#1086#1074#1099#1081
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
        0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
        0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FFFF
        FF00FF00FF00FF00FF0080808000FFFFFF00FFFFFF0000000000000000000000
        0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF008080
        8000FF00FF00FF00FF008080800000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFF0080808000FFFFFF008080800000000000000000000000
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF008080
        80008080800080808000FFFFFF0000FFFF00FF00FF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FFFF
        FF0000FFFF008080800000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
        FF0000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008080800000FFFF008080800000FFFF008080800000FFFF00000000000000
        00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
        800000FFFF00FF00FF0080808000FFFFFF00FF00FF008080800000FFFF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
        FF00FF00FF00FF00FF008080800000FFFF00FF00FF00FF00FF0080808000FFFF
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 3
      OnClick = NewBitBtnClick
    end
  end
  object ActsDBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 392
    Height = 627
    Align = alClient
    DataSource = ActsDataSource
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    SortLocal = True
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    TitleParams.VertLines = True
    OnDblClick = EditBitBtnClick
    OnKeyDown = ActsDBGridEhKeyDown
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACTNO'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACTDATE'
        Footers = <>
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MASTERFIO'
        Footers = <>
        Width = 144
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTROLLERFIO'
        Footers = <>
        Width = 119
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KD_ORDERNUM'
        Footers = <>
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KD_ORDERNUM2'
        Footers = <>
        Title.TitleButton = True
        Width = 95
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUSTOMER_S'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PIPES'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRESSURE'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RECEIVER_S'
        Footers = <>
      end
      item
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGNED'
        Footers = <>
        ReadOnly = True
        Width = 81
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGNDATE'
        Footers = <>
        ReadOnly = True
        TextEditing = False
        Width = 104
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActsADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    AfterScroll = ActsADOQueryAfterScroll
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      '  FROM cmknew.acts')
    Left = 56
    Top = 32
    object ActsADOQueryID: TFloatField
      FieldName = 'ID'
    end
    object ActsADOQueryACTNO: TFloatField
      DisplayLabel = #1040#1050#1058' '#8470
      FieldName = 'ACTNO'
    end
    object ActsADOQueryMASTER_ID: TFloatField
      FieldName = 'MASTER_ID'
    end
    object ActsADOQueryCONTROLLER_ID: TFloatField
      FieldName = 'CONTROLLER_ID'
    end
    object ActsADOQueryKD_NREC: TFloatField
      FieldName = 'KD_NREC'
      OnChange = ActsADOQueryKD_NRECChange
    end
    object ActsADOQueryCUSTOMER_NREC: TFloatField
      FieldName = 'CUSTOMER_NREC'
    end
    object ActsADOQueryPIPES: TStringField
      DisplayLabel = #1089#1086#1089#1091#1076#1099' '#8470
      FieldName = 'PIPES'
    end
    object ActsADOQueryPRESSURE: TFloatField
      DisplayLabel = #1080#1089#1087#1099#1090#1072#1085#1099' '#1076#1072#1074#1083#1077#1085#1080#1077#1084' '#1074#1086#1076#1099
      FieldName = 'PRESSURE'
    end
    object ActsADOQueryRECEIVER_NREC: TFloatField
      FieldName = 'RECEIVER_NREC'
    end
    object ActsADOQuerySIGNED: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1055#1086#1076#1087#1080#1089#1072#1085
      FieldName = 'SIGNED'
      OnChange = ActsADOQuerySIGNEDChange
    end
    object ActsADOQueryACTDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1072#1082#1090#1072
      FieldName = 'ACTDATE'
    end
    object ActsADOQuerySIGNDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1076#1087#1080#1089#1072#1085#1080#1103
      FieldName = 'SIGNDATE'
    end
    object ActsADOQueryMASTERFIO: TStringField
      DisplayLabel = #1052#1072#1089#1090#1077#1088' '#1062#1052#1050
      FieldKind = fkLookup
      FieldName = 'MASTERFIO'
      LookupDataSet = MasterADOQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'MASTER_ID'
      Size = 92
      Lookup = True
    end
    object ActsADOQueryCONTROLLERFIO: TStringField
      DisplayLabel = #1050#1086#1085#1090#1088#1086#1083#1077#1088' '#1059#1058#1050
      FieldKind = fkLookup
      FieldName = 'CONTROLLERFIO'
      LookupDataSet = ControllerADOQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'FIO'
      KeyFields = 'CONTROLLER_ID'
      Size = 92
      Lookup = True
    end
    object ActsADOQueryCUSTOMER_S: TStringField
      DisplayLabel = #1062#1077#1093'-'#1079#1072#1082#1072#1079#1095#1080#1082
      FieldKind = fkLookup
      FieldName = 'CUSTOMER_S'
      LookupDataSet = ContractorsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      KeyFields = 'CUSTOMER_NREC'
      Lookup = True
    end
    object ActsADOQueryRECEIVER_S: TStringField
      DisplayLabel = #1062#1077#1093'-'#1087#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'RECEIVER_S'
      LookupDataSet = ContractorsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      KeyFields = 'RECEIVER_NREC'
      Lookup = True
    end
    object ActsADOQueryKD_ORDERNUM: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079' '#1059#1043#1052
      FieldKind = fkLookup
      FieldName = 'KD_ORDERNUM'
      LookupDataSet = KDADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ORDNUM'
      KeyFields = 'KD_NREC'
      Size = 18
      Lookup = True
    end
    object ActsADOQueryBRUSHED: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldName = 'BRUSHED'
    end
    object ActsADOQueryKD_ORDERNUM2: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079' '#1062#1052#1050
      FieldKind = fkLookup
      FieldName = 'KD_ORDERNUM2'
      LookupDataSet = KDADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ORDERNUM2'
      KeyFields = 'KD_NREC'
      Size = 7
      Lookup = True
    end
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDAORA.1'
    OnWillConnect = ADOConnectionWillConnect
    Left = 56
    Top = 88
  end
  object ActsDataSource: TDataSource
    DataSet = ActsADOQuery
    Left = 56
    Top = 152
  end
  object MasterADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      
        'select ID, LastName || '#39' '#39' || FirstName || '#39' '#39' || MiddleName FIO' +
        ' from CMKNEW.MRP where Type=1')
    Left = 56
    Top = 280
    object MasterADOQueryFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object MasterADOQueryID: TFloatField
      FieldName = 'ID'
    end
  end
  object ControllerADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      
        'select ID, LastName || '#39' '#39' || FirstName || '#39' '#39' || MiddleName FIO' +
        ' from CMKNEW.MRP where Type=2')
    Left = 56
    Top = 336
    object ControllerADOQueryFIO: TStringField
      FieldName = 'FIO'
      ReadOnly = True
      Size = 92
    end
    object ControllerADOQueryID: TFloatField
      FieldName = 'ID'
    end
  end
  object KDADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      
        'select NREC, ORDERNUM, ORDERNUM2, ORDERNUM || '#39'/'#39' || ORDERNUM2 O' +
        'RDNUM, CCONTRACTOR from CMKNEW.KD')
    Left = 56
    Top = 392
    object KDADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object KDADOQueryORDNUM: TStringField
      FieldName = 'ORDNUM'
      ReadOnly = True
      Size = 18
    end
    object KDADOQueryCCONTRACTOR: TFloatField
      FieldName = 'CCONTRACTOR'
    end
    object KDADOQueryORDERNUM: TStringField
      FieldName = 'ORDERNUM'
      Size = 10
    end
    object KDADOQueryORDERNUM2: TStringField
      FieldName = 'ORDERNUM2'
      Size = 7
    end
  end
  object ContractorsADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.CONTRACTORS'
      'where ACTIVE=1')
    Left = 56
    Top = 456
    object ContractorsADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object ContractorsADOQueryCONTRTYPE: TFloatField
      FieldName = 'CONTRTYPE'
    end
    object ContractorsADOQueryACTIVE: TFloatField
      FieldName = 'ACTIVE'
    end
    object ContractorsADOQueryFREQ: TFloatField
      FieldName = 'FREQ'
    end
    object ContractorsADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ContractorsADOQueryABBR: TStringField
      FieldName = 'ABBR'
    end
    object ContractorsADOQueryCODE: TStringField
      FieldName = 'CODE'
    end
    object ContractorsADOQueryGALNREC: TStringField
      FieldName = 'GALNREC'
      FixedChar = True
      Size = 16
    end
    object ContractorsADOQueryPPONREC: TFloatField
      FieldName = 'PPONREC'
    end
  end
  object MarksADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <
      item
        Name = 'pckd'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select NREC, WEIGHT1*1000 WEIGHT1, ORDN, DRAWING, NAME, QUEUE,'
      'CRECIPIENT'
      'from CMKNEW.MARKS where ckd = :pckd')
    Left = 56
    Top = 224
    object MarksADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object MarksADOQueryWEIGHT1: TFloatField
      FieldName = 'WEIGHT1'
      ReadOnly = True
    end
    object MarksADOQueryORDN: TStringField
      FieldName = 'ORDN'
      Size = 5
    end
    object MarksADOQueryDRAWING: TStringField
      FieldName = 'DRAWING'
      Size = 100
    end
    object MarksADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object MarksADOQueryQUEUE: TStringField
      FieldName = 'QUEUE'
      Size = 100
    end
    object MarksADOQueryCRECIPIENT: TFloatField
      FieldName = 'CRECIPIENT'
    end
  end
  object App: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 400
    Top = 384
  end
  object SpADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <
      item
        Name = 'pid'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'SELECT *'
      '  FROM cmknew.spacts'
      'where acts_id = :pid')
    Left = 56
    Top = 512
    object FloatField9: TFloatField
      DisplayLabel = #1042#1077#1089', '#1082#1075', 1 '#1096#1090'.'
      FieldKind = fkLookup
      FieldName = 'WEIGHT1'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'WEIGHT1'
      KeyFields = 'MARKS_NREC'
      Lookup = True
    end
    object FloatField10: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'QUANTITY'
    end
    object FloatField11: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1073#1097#1080#1081
      FieldName = 'WEIGHT'
    end
    object FloatField12: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
    end
    object FloatField13: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM'
    end
    object StringField2: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldKind = fkLookup
      FieldName = 'NUM'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ORDN'
      KeyFields = 'MARKS_NREC'
      Size = 5
      Lookup = True
    end
    object StringField8: TStringField
      DisplayLabel = #8470' '#1095#1077#1088#1090#1077#1078#1072
      FieldKind = fkLookup
      FieldName = 'DRAWING'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'DRAWING'
      KeyFields = 'MARKS_NREC'
      Lookup = True
    end
    object FloatField14: TFloatField
      FieldName = 'MARKS_NREC'
    end
    object StringField9: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1079#1076#1077#1083#1080#1103
      FieldKind = fkLookup
      FieldName = 'TITLE'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'MARKS_NREC'
      Size = 255
      Lookup = True
    end
    object StringField10: TStringField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100
      FieldKind = fkLookup
      FieldName = 'QUEUE'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'QUEUE'
      KeyFields = 'MARKS_NREC'
      Size = 100
      Lookup = True
    end
    object FloatField15: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldName = 'FIXPRICE'
    end
    object FloatField16: TFloatField
      FieldName = 'ACTS_ID'
    end
    object SpADOQueryID: TFloatField
      FieldName = 'ID'
    end
  end
  object DataSetProvider: TDataSetProvider
    DataSet = SpADOQuery
    Left = 160
    Top = 32
  end
  object ClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider'
    Left = 160
    Top = 88
    object ClientDataSetWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089', '#1082#1075', 1 '#1096#1090'.'
      FieldKind = fkLookup
      FieldName = 'WEIGHT1'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'WEIGHT1'
      KeyFields = 'MARKS_NREC'
      Lookup = True
    end
    object ClientDataSetQUANTITY: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'QUANTITY'
      OnChange = ActsADOQueryQUANTITYChange
    end
    object ClientDataSetWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1073#1097#1080#1081
      FieldName = 'WEIGHT'
    end
    object ClientDataSetPRICE: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      DisplayLabel = #1062#1077#1085#1072
      FieldName = 'PRICE'
      OnChange = ActsADOQueryPRICEChange
    end
    object ClientDataSetSUM: TFloatField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'SUM'
    end
    object ClientDataSetNUM: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldKind = fkLookup
      FieldName = 'NUM'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ORDN'
      KeyFields = 'MARKS_NREC'
      Size = 5
      Lookup = True
    end
    object ClientDataSetDRAWING: TStringField
      DisplayLabel = #8470' '#1095#1077#1088#1090#1077#1078#1072
      FieldKind = fkLookup
      FieldName = 'DRAWING'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'DRAWING'
      KeyFields = 'MARKS_NREC'
      Lookup = True
    end
    object ClientDataSetMARKS_NREC: TFloatField
      FieldName = 'MARKS_NREC'
      OnChange = ActsADOQueryMARKS_NRECChange
    end
    object ClientDataSetTITLE: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1079#1076#1077#1083#1080#1103
      FieldKind = fkLookup
      FieldName = 'TITLE'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'MARKS_NREC'
      Size = 255
      Lookup = True
    end
    object ClientDataSetQUEUE: TStringField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100
      FieldKind = fkLookup
      FieldName = 'QUEUE'
      LookupDataSet = MarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'QUEUE'
      KeyFields = 'MARKS_NREC'
      Size = 100
      Lookup = True
    end
    object ClientDataSetFIXPRICE: TFloatField
      AutoGenerateValue = arDefault
      DefaultExpression = '0'
      FieldName = 'FIXPRICE'
      OnChange = ActsADOQueryPRICEChange
    end
    object ClientDataSetACTS_ID: TFloatField
      FieldName = 'ACTS_ID'
    end
    object ClientDataSetID: TFloatField
      FieldName = 'ID'
    end
  end
  object SpDataSource: TDataSource
    DataSet = ClientDataSet
    Left = 160
    Top = 152
  end
end
