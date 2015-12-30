object KDForm: TKDForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1089#1082#1072#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1094#1080#1103
  ClientHeight = 225
  ClientWidth = 526
  Color = clBtnFace
  Constraints.MinHeight = 231
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    526
    225)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 59
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082':'
  end
  object Label2: TLabel
    Left = 16
    Top = 99
    Width = 85
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103':'
  end
  object Label3: TLabel
    Left = 346
    Top = 19
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = #1040#1082#1090#1091#1072#1083#1077#1085' '#1076#1086':'
  end
  object Label4: TLabel
    Left = 16
    Top = 131
    Width = 86
    Height = 13
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
  end
  object f_INPUTDATE: TLabel
    Left = 107
    Top = 99
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object f_LUPDDATE: TLabel
    Left = 107
    Top = 131
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 179
    Width = 526
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      526
      46)
    object ImportBtn: TBitBtn
      Left = 193
      Top = 8
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 370
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object InclFileBtn: TBitBtn
      Left = 16
      Top = 8
      Width = 154
      Height = 25
      Caption = #1042#1083#1086#1078#1077#1085#1085#1099#1081' '#1092#1072#1081#1083
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
        7777700000007000000000000000700000007077770770770770700000007007
        7077077077007000000070707777770770707000000070770770707707707000
        0000707770770700777070000000707777007777777070000000707777777777
        7770700000007077777777700770700000007077777777077070700000007077
        7777770770707000000070777777777007707000000070777777777777707000
        0000700000000000000070000000777777777777777770000000777777777777
        777770000000}
      TabOrder = 2
      OnClick = InclFileBtnClick
    end
  end
  object f_ORDERNUM: TLabeledEdit
    Left = 73
    Top = 16
    Width = 112
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = #1079'-'#1079' '#8470' '#1052#1056#1050':'
    LabelPosition = lpLeft
    MaxLength = 10
    TabOrder = 0
  end
  object f_CCONTRACTOR: TComboBox
    Left = 73
    Top = 56
    Width = 373
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  object f_ACTDATE: TJvDateEdit
    Left = 421
    Top = 16
    Width = 97
    Height = 21
    Anchors = [akTop, akRight]
    ShowNullDate = False
    TabOrder = 2
  end
  object CCONTRACTORComboUpdateBtn: TBitBtn
    Left = 488
    Top = 54
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
    TabOrder = 5
    OnClick = CCONTRACTORComboUpdateBtnClick
  end
  object CCONTRACTORAppendBtn: TBitBtn
    Left = 452
    Top = 54
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
    TabOrder = 4
    OnClick = CCONTRACTORAppendBtnClick
  end
  object f_ORDERNUM2: TLabeledEdit
    Left = 256
    Top = 16
    Width = 74
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = #1079'-'#1079' '#8470' '#1062#1052#1050':'
    LabelPosition = lpLeft
    MaxLength = 10
    TabOrder = 1
  end
  object f_CONTROL: TLabeledEdit
    Left = 73
    Top = 160
    Width = 445
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1085#1090#1088#1086#1083#1100':'
    LabelPosition = lpLeft
    MaxLength = 33
    TabOrder = 7
  end
  object contractorsADOQ: TADOQuery
    Parameters = <>
    Left = 432
    Top = 88
  end
end
