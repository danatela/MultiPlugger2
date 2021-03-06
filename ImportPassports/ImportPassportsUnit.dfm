object ImportPassportsForm: TImportPassportsForm
  Left = 0
  Top = 0
  Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1072#1089#1087#1086#1088#1090#1086#1074
  ClientHeight = 495
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 493
    Top = 0
    Height = 495
    Align = alRight
    ExplicitLeft = 232
    ExplicitTop = 192
    ExplicitHeight = 100
  end
  object Panel: TPanel
    Left = 496
    Top = 0
    Width = 174
    Height = 495
    Margins.Left = 8
    Margins.Top = 8
    Margins.Right = 8
    Margins.Bottom = 8
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 0
    object OpenBitBtn: TBitBtn
      Left = 0
      Top = 8
      Width = 174
      Height = 129
      Action = FileOpen
      Caption = '&'#1054#1090#1082#1088#1099#1090#1100'...'
      TabOrder = 0
    end
    object ImportBitBtn: TBitBtn
      Left = 0
      Top = 143
      Width = 174
      Height = 129
      Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
      Enabled = False
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00808080008080800080808000808080008080800080808000808080008080
        8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
        FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
        000080808000808080008080800080808000808080008080800000000000FFFF
        FF00800000008000000080000000800000008000000080000000FFFFFF000000
        000000000000000000000000000000000000000000000000000000000000FFFF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
        0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
        FF00800000008000000080000000800000008000000080000000FFFFFF000000
        000080000000800000008000000080000000FFFFFF00000000000000000000FF
        FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
        FF00800000008000000080000000800000008000000080000000FFFFFF000000
        000080000000800000008000000080000000FFFFFF000000000000000000FFFF
        FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
        0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
        FF008000000080000000FFFFFF00000000000000000000000000000000000000
        000080000000800000008000000000000000FFFFFF00000000000000000000FF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
        0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
        FF008000000080000000FFFFFF0000000000FFFFFF0000FFFF00000000000000
        0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
        FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
        FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
        00000000000000000000000000000000000000000000FFFFFF00800000008000
        0000FFFFFF0000000000FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF0000FF
        FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
      TabOrder = 1
      OnClick = ImportBitBtnClick
    end
    object SaveBitBtn: TBitBtn
      Left = 0
      Top = 278
      Width = 174
      Height = 129
      Action = FileSaveAs
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082'...'
      TabOrder = 2
    end
  end
  object PassportsDBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 493
    Height = 495
    Align = alClient
    DataSource = DataSource
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnKeyDown = PassportsDBGridEhKeyDown
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'KOLT'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_DIAM'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_THICK_C'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_WIDTH_C'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_LENGTH_C'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MARKIR'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MARKIR_PARENT'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DATEF'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'TRIMTYPE'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'STEELMARK_S'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PASPNUM'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'COMMENT'
        Footers = <>
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    BeforeConnect = ADOConnectionBeforeConnect
    Left = 48
    Top = 8
  end
  object PreviewClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 56
    object PreviewClientDataSetKOLT: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'KOLT'
    end
    object PreviewClientDataSetPROP_DIAM: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1088#1099'|'#1044#1080#1072#1084#1077#1090#1088
      FieldName = 'PROP_DIAM'
    end
    object PreviewClientDataSetPROP_THICK_C: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1088#1099'|'#1058#1086#1083#1097#1080#1085#1072
      FieldName = 'PROP_THICK_C'
    end
    object PreviewClientDataSetPROP_WIDTH_C: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1088#1099'|'#1064#1080#1088#1080#1085#1072
      FieldName = 'PROP_WIDTH_C'
    end
    object PreviewClientDataSetPROP_LENGTH_C: TFloatField
      DisplayLabel = #1056#1072#1079#1084#1077#1088#1099'|'#1044#1083#1080#1085#1072
      FieldName = 'PROP_LENGTH_C'
    end
    object PreviewClientDataSetNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 255
    end
    object PreviewClientDataSetMARKIR: TStringField
      DisplayLabel = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072' '#1044#1054
      FieldName = 'MARKIR'
      Size = 16
    end
    object PreviewClientDataSetDATEF: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1103
      FieldName = 'DATEF'
    end
    object PreviewClientDataSetTRIMTYPE: TFloatField
      DisplayLabel = #1058#1080#1087' '#1086#1073#1088#1077#1079#1080
      FieldName = 'TRIMTYPE'
    end
    object PreviewClientDataSetMARKIR_PARENT: TStringField
      DisplayLabel = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072' '#1083#1080#1089#1090#1072
      FieldName = 'MARKIR_PARENT'
      Size = 16
    end
    object PreviewClientDataSetSHORTNAME: TStringField
      DisplayLabel = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080
      FieldKind = fkLookup
      FieldName = 'STEELMARK_S'
      LookupDataSet = SteelMarksADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'SHORTNAME'
      KeyFields = 'CSTEELMARK'
      Size = 50
      Lookup = True
    end
    object PreviewClientDataSetNUM: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
      FieldName = 'PASPNUM'
      Size = 16
    end
    object PreviewClientDataSetCSTEELMARK: TFloatField
      FieldName = 'CSTEELMARK'
    end
    object PreviewClientDataSetStringField: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'COMMENT'
      Size = 255
    end
  end
  object BackingADOQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    AfterPost = RefreshRecord
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.PASSPORTS')
    Left = 48
    Top = 216
    object BackingADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object BackingADOQueryCSPARRIVALS: TFloatField
      FieldName = 'CSPARRIVALS'
    end
    object BackingADOQueryNUM: TStringField
      FieldName = 'NUM'
      Size = 16
    end
    object BackingADOQuerySPENT: TFloatField
      FieldName = 'SPENT'
    end
  end
  object DataSource: TDataSource
    DataSet = PreviewClientDataSet
    OnDataChange = DataSourceDataChange
    Left = 48
    Top = 112
  end
  object BackingSpADOQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    AfterInsert = BackingSpADOQueryAfterInsert
    AfterPost = RefreshRecord
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.SPPASSPORTS')
    Left = 48
    Top = 168
    object BackingSpADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object BackingSpADOQueryKOLT: TFloatField
      FieldName = 'KOLT'
    end
    object BackingSpADOQueryPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object BackingSpADOQueryPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object BackingSpADOQueryPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object BackingSpADOQueryPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object BackingSpADOQueryPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object BackingSpADOQueryPROP_SLENGTH: TFloatField
      FieldName = 'PROP_SLENGTH'
    end
    object BackingSpADOQueryPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object BackingSpADOQueryPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object BackingSpADOQueryPROP_THICK_C: TFloatField
      FieldName = 'PROP_THICK_C'
    end
    object BackingSpADOQueryPROP_WIDTH_C: TFloatField
      FieldName = 'PROP_WIDTH_C'
    end
    object BackingSpADOQueryPROP_LENGTH_C: TFloatField
      FieldName = 'PROP_LENGTH_C'
    end
    object BackingSpADOQueryCPASSPORTS: TFloatField
      FieldName = 'CPASSPORTS'
    end
    object BackingSpADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object BackingSpADOQueryMARKIR: TStringField
      FieldName = 'MARKIR'
      Size = 16
    end
    object BackingSpADOQueryCSPPASSPORTS: TFloatField
      FieldName = 'CSPPASSPORTS'
    end
    object BackingSpADOQueryDATEF: TDateTimeField
      FieldName = 'DATEF'
    end
    object BackingSpADOQueryPROP_A: TFloatField
      FieldName = 'PROP_A'
    end
    object BackingSpADOQueryPROP_B: TFloatField
      FieldName = 'PROP_B'
    end
    object BackingSpADOQueryPROP_C: TFloatField
      FieldName = 'PROP_C'
    end
    object BackingSpADOQueryPROP_D: TFloatField
      FieldName = 'PROP_D'
    end
    object BackingSpADOQueryTRIMTYPE: TFloatField
      FieldName = 'TRIMTYPE'
    end
    object BackingSpADOQueryPROP_SQUARE: TFloatField
      FieldName = 'PROP_SQUARE'
    end
    object BackingSpADOQueryISLOM: TFMTBCDField
      FieldName = 'ISLOM'
      Precision = 38
      Size = 0
    end
    object BackingSpADOQueryLOMDATE: TDateTimeField
      FieldName = 'LOMDATE'
    end
    object BackingSpADOQueryLOMPERSON: TFloatField
      FieldName = 'LOMPERSON'
    end
    object BackingSpADOQueryLOMCOMMENT: TStringField
      FieldName = 'LOMCOMMENT'
      Size = 255
    end
  end
  object ActionManager: TActionManager
    Images = ImageList
    Left = 208
    Top = 24
    StyleName = 'Platform Default'
    object FileOpen: TFileOpen
      Category = 'File'
      Caption = '&'#1054#1090#1082#1088#1099#1090#1100'...'
      Dialog.Filter = 
        'Excel Files|*.xls;*.xlsx;*.xlsm|DataSet Files|*.xml;*.cds|All Fi' +
        'les|*.*'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 0
      ShortCut = 16463
      OnAccept = FileOpenAccept
    end
    object FileSaveAs: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Filter = 'XML Data Packet|*.xml|Client DataSet|*.cds|Any File|*.*'
      Enabled = False
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 1
      OnAccept = FileSaveAsAccept
    end
  end
  object ImageList: TImageList
    Left = 208
    Top = 72
    Bitmap = {
      494C010102000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000C0C0C0000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000C0C0C0000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000000000000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008080000080800000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000080800000000000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFF7E00000000FFFFBFFF00000000
      001FF00300000000000FE003000000000007E003000000000003E00300000000
      0001E003000000000000200300000000001FE00200000000001FE00300000000
      001FE003000000008FF1E00300000000FFF9E00300000000FF75FFFF00000000
      FF8FBF7D00000000FFFF7F7E0000000000000000000000000000000000000000
      000000000000}
  end
  object App: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 208
    Top = 128
  end
  object SteelMarksADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.STEELMARKS'
      'where Active = 1')
    Left = 48
    Top = 280
    object SteelMarksADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object SteelMarksADOQueryUW: TFloatField
      FieldName = 'UW'
    end
    object SteelMarksADOQueryACTIVE: TFloatField
      FieldName = 'ACTIVE'
    end
    object SteelMarksADOQueryFREQ: TFloatField
      FieldName = 'FREQ'
    end
    object SteelMarksADOQueryPRIM: TStringField
      FieldName = 'PRIM'
      Size = 255
    end
    object SteelMarksADOQueryGALNREC: TStringField
      FieldName = 'GALNREC'
      FixedChar = True
      Size = 16
    end
    object SteelMarksADOQuerySHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 50
    end
    object SteelMarksADOQueryCNORMDOC: TFloatField
      FieldName = 'CNORMDOC'
    end
  end
end
