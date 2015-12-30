object SteelMarkForm: TSteelMarkForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080
  ClientHeight = 228
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 240
  Constraints.MinWidth = 640
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
    632
    228)
  PixelsPerInch = 96
  TextHeight = 13
  object f_CNORMDOCLabel: TLabel
    Left = 13
    Top = 84
    Width = 197
    Height = 13
    Alignment = taRightJustify
    Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1091':'
  end
  object f_PROP_UWLabel: TLabel
    Left = 98
    Top = 49
    Width = 112
    Height = 13
    Alignment = taRightJustify
    Caption = #1091#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089' ('#1075'/'#1089#1084'3):'
    FocusControl = f_UW
  end
  object Panel1: TPanel
    Left = 0
    Top = 182
    Width = 632
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    DesignSize = (
      632
      46)
    object ImportBtn: TBitBtn
      Left = 299
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
      Left = 476
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
  end
  object f_CNORMDOC: TComboBox
    Left = 216
    Top = 81
    Width = 321
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object CNORMDOCComboUpdateBtn: TBitBtn
    Left = 579
    Top = 79
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
    OnClick = CNORMDOCComboUpdateBtnClick
  end
  object f_ACTIVE: TCheckBox
    Left = 512
    Top = 157
    Width = 112
    Height = 17
    Caption = #1084#1072#1088#1082#1072' '#1072#1082#1090#1080#1074#1085#1072
    TabOrder = 6
  end
  object f_SHORTNAME: TLabeledEdit
    Left = 216
    Top = 8
    Width = 393
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 110
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1088#1082#1080':'
    LabelPosition = lpLeft
    MaxLength = 50
    TabOrder = 0
  end
  object f_UW: TJvCalcEdit
    Left = 216
    Top = 46
    Width = 114
    Height = 21
    TabOrder = 1
    DecimalPlacesAlwaysShown = False
  end
  object f_PRIM: TLabeledEdit
    Left = 80
    Top = 121
    Width = 529
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    LabelPosition = lpLeft
    MaxLength = 200
    TabOrder = 5
  end
  object CNORMDOCAppendBtn: TBitBtn
    Left = 543
    Top = 79
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
    OnClick = CNORMDOCAppendBtnClick
  end
  object NORMDOCADOQ: TADOQuery
    Parameters = <>
    Left = 456
    Top = 8
  end
end
