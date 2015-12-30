object EquipmentForm: TEquipmentForm
  Left = 0
  Top = 0
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 468
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 632
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 225
    Width = 632
    Height = 197
    Align = alClient
    Caption = ' '#1054#1087#1077#1088#1072#1094#1080#1080': '
    TabOrder = 1
    object f_OperationsCLB: TCheckListBox
      Left = 2
      Top = 15
      Width = 628
      Height = 180
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      632
      225)
    object f_CSITELabel: TLabel
      Left = 21
      Top = 132
      Width = 109
      Height = 13
      Alignment = taRightJustify
      Caption = #1054#1090#1076#1077#1083#1077#1085#1080#1077', '#1091#1095#1072#1089#1090#1086#1082':'
    end
    object f_NAME: TLabeledEdit
      Left = 177
      Top = 16
      Width = 440
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 153
      EditLabel.Height = 13
      EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103':'
      LabelPosition = lpLeft
      MaxLength = 255
      TabOrder = 0
    end
    object f_INVNUM: TLabeledEdit
      Left = 129
      Top = 56
      Width = 89
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 106
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1085#1099#1081' '#1085#1086#1084#1077#1088':'
      LabelPosition = lpLeft
      MaxLength = 12
      TabOrder = 1
    end
    object f_CSITE: TComboBox
      Left = 136
      Top = 129
      Width = 409
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
    object CSITEAppendBtn: TBitBtn
      Left = 551
      Top = 127
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
      TabOrder = 6
      OnClick = CSITEAppendBtnClick
    end
    object f_CSITEComboUpdateBtn: TBitBtn
      Left = 587
      Top = 127
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
      OnClick = f_CSITEComboUpdateBtnClick
    end
    object f_ACTIVE: TCheckBox
      Left = 548
      Top = 200
      Width = 73
      Height = 17
      Caption = #1072#1082#1090#1080#1074#1085#1086
      TabOrder = 9
    end
    object f_CEHNUM: TLabeledEdit
      Left = 328
      Top = 56
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 81
      EditLabel.Height = 13
      EditLabel.Caption = #1062#1077#1093#1086#1074#1086#1081' '#1085#1086#1084#1077#1088':'
      LabelPosition = lpLeft
      MaxLength = 12
      TabOrder = 2
    end
    object f_PYEAR: TLabeledEdit
      Left = 560
      Top = 56
      Width = 57
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 69
      EditLabel.Height = 13
      EditLabel.Caption = #1043#1086#1076' '#1074#1099#1087#1091#1089#1082#1072':'
      LabelPosition = lpLeft
      MaxLength = 4
      TabOrder = 3
    end
    object f_MODEL: TLabeledEdit
      Left = 177
      Top = 100
      Width = 440
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 156
      EditLabel.Height = 13
      EditLabel.Caption = #1052#1072#1088#1082#1072' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103', '#1084#1086#1076#1077#1083#1100':'
      LabelPosition = lpLeft
      MaxLength = 255
      TabOrder = 4
    end
    object f_OPERATIONS: TLabeledEdit
      Left = 192
      Top = 165
      Width = 425
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 168
      EditLabel.Height = 13
      EditLabel.Caption = #1054#1087#1077#1088#1072#1094#1080#1080' ('#1090#1077#1082#1089#1090#1086#1074#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077'):'
      LabelPosition = lpLeft
      MaxLength = 200
      TabOrder = 8
    end
  end
  object SITESADOQ: TADOQuery
    Parameters = <>
    Left = 456
    Top = 8
  end
  object OADOQ: TADOQuery
    Parameters = <>
    Left = 520
    Top = 8
  end
end
