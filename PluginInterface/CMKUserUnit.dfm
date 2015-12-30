object CMKUserForm: TCMKUserForm
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 213
  ClientWidth = 717
  Color = clBtnFace
  Constraints.MinHeight = 240
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  DesignSize = (
    717
    213)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 29
    Top = 99
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = #1043#1088#1091#1087#1087#1072':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 167
    Width = 717
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 9
    DesignSize = (
      717
      46)
    object ImportBtn: TBitBtn
      Left = 384
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
      Left = 561
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
  object f_ORAUSER: TLabeledEdit
    Left = 73
    Top = 16
    Width = 144
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = #1051#1086#1075#1080#1085':'
    LabelPosition = lpLeft
    MaxLength = 20
    TabOrder = 0
  end
  object f_CUSERGROUPS: TComboBox
    Left = 75
    Top = 96
    Width = 591
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 6
  end
  object f_LNAME: TLabeledEdit
    Left = 73
    Top = 56
    Width = 144
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103':'
    LabelPosition = lpLeft
    MaxLength = 60
    TabOrder = 3
  end
  object f_FNAME: TLabeledEdit
    Left = 260
    Top = 56
    Width = 141
    Height = 21
    EditLabel.Width = 23
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103':'
    LabelPosition = lpLeft
    MaxLength = 60
    TabOrder = 4
  end
  object f_MNAME: TLabeledEdit
    Left = 469
    Top = 56
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086':'
    LabelPosition = lpLeft
    MaxLength = 60
    TabOrder = 5
  end
  object CUSERGROUPSComboUpdateBtn: TBitBtn
    Left = 672
    Top = 94
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
    TabOrder = 7
    OnClick = CUSERGROUPSComboUpdateBtnClick
  end
  object f_ACTIVE: TCheckBox
    Left = 447
    Top = 136
    Width = 177
    Height = 17
    Caption = #1074#1093#1086#1076' '#1074' '#1089#1080#1089#1090#1077#1084#1091' '#1088#1072#1079#1088#1077#1096#1077#1085
    TabOrder = 8
  end
  object f_passw: TLabeledEdit
    Left = 299
    Top = 16
    Width = 144
    Height = 21
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 1
  end
  object f_PCHANGE: TCheckBox
    Left = 455
    Top = 18
    Width = 247
    Height = 17
    Caption = #1080#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100' '#1087#1088#1080' '#1089#1083#1077#1076#1091#1102#1097#1077#1084' '#1074#1093#1086#1076#1077
    TabOrder = 2
  end
  object USERGROUPSADOQ: TADOQuery
    Parameters = <>
    Left = 328
    Top = 152
  end
end
