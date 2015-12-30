object KDWeldingForm: TKDWeldingForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1074#1072#1088#1082#1072
  ClientHeight = 364
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    516
    364)
  PixelsPerInch = 96
  TextHeight = 13
  object EquipmentLabel: TLabel
    Left = 6
    Top = 11
    Width = 77
    Height = 13
    Caption = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077':'
  end
  object f_T_SVARKA_CEQ: TComboBox
    Left = 89
    Top = 8
    Width = 347
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object T_SVARKA_CEQAppendBtn: TBitBtn
    Left = 442
    Top = 4
    Width = 30
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      700077777777777770007777700077777000777770C077777000777770C07777
      7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
      7000777770C07777700077777000777770007777777777777000777777777777
      7000}
    TabOrder = 1
    OnClick = T_SVARKA_CEQAppendBtnClick
  end
  object T_SVARKA_CEQComboUpdateBtn: TBitBtn
    Left = 478
    Top = 4
    Width = 30
    Height = 25
    Anchors = [akTop, akRight]
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DA0000000000
      000AAD0FFFFFFFFFFF0DDA0FFFFF2FFFFF0AAD0FFFF22FFFFF0DDA0FFF22222F
      FF0AAD0FFFF22FF2FF0DDA0FFFFF2FF2FF0AAD0FF2FFFFF2FF0DDA0FF2FF2FFF
      FF0AAD0FF2FF22FFFF0DDA0FFF22222FFF0AAD0FFFFF22FFFF0DDA0FFFFF2FF0
      000AAD0FFFFFFFF0F0ADDA0FFFFFFFF00ADAAD0000000000ADAD}
    TabOrder = 2
    OnClick = T_SVARKA_CEQComboUpdateBtnClick
  end
  object WeldingDBGridEh: TDBGridEh
    Left = 8
    Top = 35
    Width = 502
    Height = 290
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = SpWeldingDataSource
    DynProps = <>
    EvenRowColor = clCream
    FooterRowCount = 1
    IndicatorOptions = [gioShowRowIndicatorEh]
    SumList.Active = True
    TabOrder = 3
    OnKeyDown = WeldingDBGridEhKeyDown
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'TLS'
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 88
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'FOOTAGE'
        Footer.ValueType = fvtSum
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'WEIGHT'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 94
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NV'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 86
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NVZ'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 127
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object OKBitBtn: TBitBtn
    Left = 307
    Top = 331
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = OKBitBtnClick
  end
  object CancelBitBtn: TBitBtn
    Left = 410
    Top = 331
    Width = 98
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object SpWeldingADOQuery: TADOQuery
    ConnectionString = 
      'Provider=MSDAORA.1;Password=b6118616479;User ID=Emanton;Data Sou' +
      'rce=server1571;Persist Security Info=True'
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pcMark'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select * from cmknew.spwelding'
      'where cmark = :pcMark')
    Left = 128
    Top = 56
    object SpWeldingADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object SpWeldingADOQueryCMARK: TFloatField
      FieldName = 'CMARK'
    end
    object SpWeldingADOQueryFOOTAGE: TFloatField
      DisplayLabel = #1052#1077#1090#1088#1072#1078
      FieldName = 'FOOTAGE'
    end
    object SpWeldingADOQueryWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089' '#1101#1083#1077#1082#1090#1088#1086#1076#1086#1074
      FieldName = 'WEIGHT'
    end
    object SpWeldingADOQueryNV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'NV'
    end
    object SpWeldingADOQueryNVZ: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1085#1072' '#1079#1072#1095#1080#1089#1090#1082#1091
      FieldName = 'NVZ'
    end
    object SpWeldingADOQueryTLS: TStringField
      FieldName = 'TLS'
      Size = 10
    end
  end
  object SpWeldingDataSource: TDataSource
    DataSet = SpWeldingClientDataSet
    Left = 128
    Top = 208
  end
  object SpWeldingClientDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'SpWeldingDataSetProvider'
    AfterInsert = SpWeldingClientDataSetAfterInsert
    Left = 128
    Top = 152
    object SpWeldingClientDataSetNREC: TFloatField
      FieldName = 'NREC'
    end
    object SpWeldingClientDataSetCMARK: TFloatField
      FieldName = 'CMARK'
    end
    object SpWeldingClientDataSetFOOTAGE: TFloatField
      DisplayLabel = #1052#1077#1090#1088#1072#1078
      FieldName = 'FOOTAGE'
    end
    object SpWeldingClientDataSetWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089' '#1101#1083#1077#1082#1090#1088#1086#1076#1086#1074
      FieldName = 'WEIGHT'
    end
    object SpWeldingClientDataSetNV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'NV'
    end
    object SpWeldingClientDataSetNVZ: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080' '#1085#1072' '#1079#1072#1095#1080#1089#1090#1082#1091
      FieldName = 'NVZ'
    end
    object SpWeldingClientDataSetTLS: TStringField
      DisplayLabel = #1058#1080#1087' '#1082#1072#1090#1077#1090#1072' '#1096#1074#1072
      FieldName = 'TLS'
      Size = 10
    end
  end
  object SpWeldingDataSetProvider: TDataSetProvider
    DataSet = SpWeldingADOQuery
    Left = 128
    Top = 104
  end
end
