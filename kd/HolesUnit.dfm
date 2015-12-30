object HolesForm: THolesForm
  Left = 0
  Top = 0
  Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103
  ClientHeight = 364
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    450
    364)
  PixelsPerInch = 96
  TextHeight = 15
  object MachineLabel: TLabel
    Left = 8
    Top = 8
    Width = 49
    Height = 15
    Caption = #1084#1072#1096#1080#1085#1072':'
  end
  object CancelBitBtn: TBitBtn
    Left = 344
    Top = 331
    Width = 98
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 0
  end
  object OKBitBtn: TBitBtn
    Left = 241
    Top = 331
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = OKBitBtnClick
  end
  object f_T_OTVERST_CEQ: TComboBox
    Left = 56
    Top = 8
    Width = 314
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object T_OTVERST_CEQAppendBtn: TBitBtn
    Left = 376
    Top = 8
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
    TabOrder = 3
    OnClick = T_OTVERST_CEQAppendBtnClick
  end
  object T_OTVERST_CEQComboUpdateBtn: TBitBtn
    Left = 412
    Top = 8
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
    TabOrder = 4
    OnClick = T_OTVERST_CEQComboUpdateBtnClick
  end
  object HolesDBGridEh: TDBGridEh
    Left = 8
    Top = 35
    Width = 434
    Height = 290
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = HolesDataSource
    DynProps = <>
    FooterRowCount = 1
    IndicatorOptions = [gioShowRowIndicatorEh]
    SumList.Active = True
    TabOrder = 5
    OnKeyDown = OtverstDBGridEhKeyDown
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIAM'
        Footer.Value = #1048#1090#1086#1075#1086':'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Width = 54
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 78
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NV'
        Footer.ValueType = fvtSum
        Footers = <>
        Width = 97
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Width = 184
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object HolesDataSource: TDataSource
    DataSet = HolesClientDataSet
    Left = 64
    Top = 240
  end
  object HolesClientDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'HolesDataSetProvider'
    StoreDefs = True
    AfterInsert = ClientDataSetAfterInsert
    Left = 64
    Top = 192
    object HolesClientDataSetNREC: TFloatField
      FieldName = 'NREC'
    end
    object HolesClientDataSetCDETAIL: TFloatField
      FieldName = 'CDETAIL'
    end
    object HolesClientDataSetDIAM: TStringField
      DisplayLabel = #1044#1080#1072#1084#1077#1090#1088
      DisplayWidth = 20
      FieldName = 'DIAM'
      Size = 100
    end
    object HolesClientDataSetCNT: TFMTBCDField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'CNT'
      Precision = 38
      Size = 0
    end
    object HolesClientDataSetNV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'NV'
    end
    object HolesClientDataSetPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 50
      FieldName = 'PRIM'
      Size = 255
    end
  end
  object HolesDataSetProvider: TDataSetProvider
    DataSet = HolesADOQuery
    Left = 64
    Top = 144
  end
  object HolesADOQuery: TADOQuery
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pDetail'
        DataType = ftFloat
        Size = 1
        Value = 0.000000000000000000
      end>
    SQL.Strings = (
      'select * from cmknew.otverst '
      'where cdetail = :pDetail')
    Left = 64
    Top = 96
    object HolesADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object HolesADOQueryCDETAIL: TFloatField
      FieldName = 'CDETAIL'
    end
    object HolesADOQueryDIAM: TStringField
      FieldName = 'DIAM'
      Size = 100
    end
    object HolesADOQueryCNT: TFMTBCDField
      FieldName = 'CNT'
      Precision = 38
      Size = 0
    end
    object HolesADOQueryNV: TFloatField
      FieldName = 'NV'
    end
    object HolesADOQueryPRIM: TStringField
      FieldName = 'PRIM'
      Size = 255
    end
  end
end
