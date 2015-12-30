object KD2Form: TKD2Form
  Left = 0
  Top = 0
  Caption = #1052#1072#1088#1082#1072
  ClientHeight = 593
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinHeight = 620
  Constraints.MinWidth = 800
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
    792
    593)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 99
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = #1075#1088#1091#1087#1087#1072' '#1052'/'#1050':'
  end
  object Label2: TLabel
    Left = 224
    Top = 523
    Width = 85
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103':'
    ExplicitTop = 503
  end
  object Label4: TLabel
    Left = 8
    Top = 523
    Width = 86
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1044#1072#1090#1072' '#1080#1079#1084#1077#1085#1077#1085#1080#1103':'
    ExplicitTop = 403
  end
  object f_INPUTDATE: TLabel
    Left = 315
    Top = 523
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 503
  end
  object f_LUPDDATE: TLabel
    Left = 99
    Top = 523
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 403
  end
  object Label3: TLabel
    Left = 8
    Top = 139
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = #1074#1077#1089' 1 '#1096#1090' '#1074' '#1090':'
    FocusControl = f_WEIGHT1
  end
  object Label5: TLabel
    Left = 213
    Top = 139
    Width = 76
    Height = 13
    Alignment = taRightJustify
    Caption = #1074#1077#1089' '#1079#1072#1075#1086#1090#1086#1074#1082#1080':'
    FocusControl = f_WEIGHTZ
  end
  object Label6: TLabel
    Left = 5
    Top = 179
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = #1087#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
  end
  object Label17: TLabel
    Left = 663
    Top = 59
    Width = 21
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = #1056'/'#1050':'
    FocusControl = f_RKOEF
  end
  object Panel1: TPanel
    Left = 0
    Top = 547
    Width = 792
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 20
    DesignSize = (
      792
      46)
    object CancelBtn: TBitBtn
      Left = 459
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
    object OKBtn: TBitBtn
      Left = 636
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
      Left = 11
      Top = 8
      Width = 169
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
  object f_CMKGROUP: TComboBox
    Left = 73
    Top = 96
    Width = 636
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
  end
  object f_ORDN: TLabeledEdit
    Left = 96
    Top = 16
    Width = 65
    Height = 21
    EditLabel.Width = 67
    EditLabel.Height = 13
    EditLabel.Caption = #1087#1086#1088#1103#1076#1082#1086#1074#1099#1081':'
    LabelPosition = lpLeft
    MaxLength = 5
    TabOrder = 0
  end
  object f_QUEUE: TLabeledEdit
    Left = 244
    Top = 16
    Width = 96
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = #1086#1095#1077#1088#1077#1076#1100':'
    LabelPosition = lpLeft
    MaxLength = 100
    TabOrder = 1
  end
  object f_MARK: TLabeledEdit
    Left = 408
    Top = 16
    Width = 373
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = #1084#1072#1088#1082#1072':'
    LabelPosition = lpLeft
    MaxLength = 100
    TabOrder = 2
  end
  object f_NAME: TLabeledEdit
    Left = 96
    Top = 56
    Width = 545
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    LabelPosition = lpLeft
    MaxLength = 255
    TabOrder = 3
  end
  object f_WEIGHT1: TJvCalcEdit
    Left = 79
    Top = 136
    Width = 114
    Height = 21
    DecimalPlaces = 8
    DisplayFormat = '0.########'
    TabOrder = 8
    DecimalPlacesAlwaysShown = False
  end
  object f_WEIGHTZ: TJvCalcEdit
    Left = 295
    Top = 136
    Width = 114
    Height = 21
    DecimalPlaces = 8
    DisplayFormat = '0.########'
    TabOrder = 9
    DecimalPlacesAlwaysShown = False
  end
  object f_DRAWING: TLabeledEdit
    Left = 500
    Top = 136
    Width = 284
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 42
    EditLabel.Height = 13
    EditLabel.Caption = #1095#1077#1088#1090#1077#1078':'
    LabelPosition = lpLeft
    MaxLength = 100
    TabOrder = 10
  end
  object f_CRECIPIENT: TComboBox
    Left = 73
    Top = 176
    Width = 636
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 11
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 205
    Width = 201
    Height = 97
    Caption = ' '#1057#1073#1086#1088#1082#1072': '
    TabOrder = 14
    object f_T_SBORKA_NVLabel: TLabel
      Left = 19
      Top = 23
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
      FocusControl = f_T_SBORKA_NV
    end
    object f_T_SBORKA_NV: TJvCalcEdit
      Left = 104
      Top = 20
      Width = 81
      Height = 21
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      TabOrder = 0
      DecimalPlacesAlwaysShown = False
    end
    object f_T_SBORKA_PR: TLabeledEdit
      Left = 19
      Top = 64
      Width = 166
      Height = 21
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
      MaxLength = 255
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 218
    Top = 205
    Width = 566
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1057#1074#1072#1088#1082#1072': '
    TabOrder = 15
    OnDblClick = GroupBox2DblClick
    DesignSize = (
      566
      97)
    object Label8: TLabel
      Left = 14
      Top = 23
      Width = 84
      Height = 13
      Alignment = taRightJustify
      Caption = #1074#1077#1089' '#1101#1083#1077#1082#1090#1088#1086#1076#1086#1074':'
      FocusControl = f_T_SVARKA_WE
    end
    object Label12: TLabel
      Left = 208
      Top = 23
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = #1084#1077#1090#1088#1072#1078':'
      FocusControl = f_T_SVARKA_M
    end
    object f_T_SVARKA_NVLabel: TLabel
      Left = 363
      Top = 23
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
      FocusControl = f_T_SVARKA_NV
    end
    object Label14: TLabel
      Left = 14
      Top = 49
      Width = 77
      Height = 13
      Caption = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077':'
    end
    object f_T_SVARKA_WE: TJvCalcEdit
      Left = 104
      Top = 20
      Width = 81
      Height = 21
      DecimalPlaces = 8
      DisplayFormat = '0.########'
      TabOrder = 0
      DecimalPlacesAlwaysShown = False
    end
    object f_T_SVARKA_M: TJvCalcEdit
      Left = 256
      Top = 20
      Width = 81
      Height = 21
      DecimalPlaces = 8
      DisplayFormat = '0.########'
      TabOrder = 1
      DecimalPlacesAlwaysShown = False
    end
    object f_T_SVARKA_NV: TJvCalcEdit
      Left = 448
      Top = 20
      Width = 105
      Height = 21
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
    end
    object f_T_SVARKA_CEQ: TComboBox
      Left = 13
      Top = 64
      Width = 468
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object T_SVARKA_CEQComboUpdateBtn: TBitBtn
      Left = 520
      Top = 60
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
      OnClick = T_SVARKA_CEQComboUpdateBtnClick
    end
    object T_SVARKA_CEQAppendBtn: TBitBtn
      Left = 484
      Top = 60
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
      OnClick = T_SVARKA_CEQAppendBtnClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 11
    Top = 308
    Width = 345
    Height = 97
    Caption = ' '#1047#1072#1095#1080#1089#1090#1082#1072': '
    TabOrder = 16
    DesignSize = (
      345
      97)
    object f_T_ZACHIST_NVLabel: TLabel
      Left = 19
      Top = 66
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
      FocusControl = f_T_ZACHIST_NV
    end
    object Label15: TLabel
      Left = 17
      Top = 18
      Width = 77
      Height = 13
      Caption = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077':'
    end
    object f_T_ZACHIST_NV: TJvCalcEdit
      Left = 104
      Top = 63
      Width = 81
      Height = 21
      TabOrder = 3
      DecimalPlacesAlwaysShown = False
    end
    object T_ZACHIST_CEQComboUpdateBtn: TBitBtn
      Left = 299
      Top = 34
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
      OnClick = T_ZACHIST_CEQComboUpdateBtnClick
    end
    object f_T_ZACHIST_CEQ: TComboBox
      Left = 19
      Top = 36
      Width = 238
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object T_ZACHIST_CEQAppendBtn: TBitBtn
      Left = 263
      Top = 34
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
      OnClick = T_ZACHIST_CEQAppendBtnClick
    end
  end
  object GroupBox4: TGroupBox
    Left = 362
    Top = 308
    Width = 422
    Height = 97
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1043#1088#1091#1085#1090#1086#1074#1082#1072'/'#1055#1086#1082#1088#1072#1089#1082#1072': '
    TabOrder = 17
    DesignSize = (
      422
      97)
    object f_T_GRPOKR_NVLabel: TLabel
      Left = 243
      Top = 39
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
      FocusControl = f_T_GRPOKR_NV
    end
    object f_T_GRPOKR_NV: TJvCalcEdit
      Left = 328
      Top = 36
      Width = 81
      Height = 21
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      Anchors = [akTop, akRight]
      TabOrder = 2
      DecimalPlacesAlwaysShown = False
    end
    object f_T_GRPOKR_GR: TLabeledEdit
      Left = 80
      Top = 24
      Width = 145
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = #1086' '#1075#1088#1091#1085#1090#1086#1074#1082#1077':'
      LabelPosition = lpLeft
      MaxLength = 255
      TabOrder = 0
    end
    object f_T_GRPOKR_POKR: TLabeledEdit
      Left = 80
      Top = 51
      Width = 145
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = #1086' '#1087#1086#1082#1088#1072#1089#1082#1077':'
      LabelPosition = lpLeft
      MaxLength = 255
      TabOrder = 1
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 411
    Width = 773
    Height = 86
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1044#1086#1074#1086#1076#1082#1072': '
    TabOrder = 18
    DesignSize = (
      773
      86)
    object f_T_DOVODKA_NVLabel: TLabel
      Left = 19
      Top = 55
      Width = 79
      Height = 13
      Alignment = taRightJustify
      Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
      FocusControl = f_T_DOVODKA_NV
    end
    object Label16: TLabel
      Left = 19
      Top = 20
      Width = 77
      Height = 13
      Caption = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077':'
    end
    object f_T_DOVODKA_NV: TJvCalcEdit
      Left = 104
      Top = 52
      Width = 81
      Height = 21
      DecimalPlaces = 3
      DisplayFormat = '0.###'
      TabOrder = 3
      DecimalPlacesAlwaysShown = False
    end
    object f_T_DOVODKA_PR: TLabeledEdit
      Left = 280
      Top = 52
      Width = 477
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
      LabelPosition = lpLeft
      MaxLength = 255
      TabOrder = 4
    end
    object T_DOVODKA_CEQComboUpdateBtn: TBitBtn
      Left = 727
      Top = 13
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
      OnClick = T_DOVODKA_CEQComboUpdateBtnClick
    end
    object f_T_DOVODKA_CEQ: TComboBox
      Left = 104
      Top = 17
      Width = 581
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
    end
    object T_DOVODKA_CEQAppendBtn: TBitBtn
      Left = 691
      Top = 13
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
      OnClick = T_DOVODKA_CEQAppendBtnClick
    end
  end
  object f_PRIM: TLabeledEdit
    Left = 520
    Top = 520
    Width = 261
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    EditLabel.Width = 64
    EditLabel.Height = 13
    EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    LabelPosition = lpLeft
    MaxLength = 255
    TabOrder = 19
  end
  object CMKGROUPComboUpdateBtn: TBitBtn
    Left = 751
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
    OnClick = MkGroupsSprBtnClick
  end
  object CRECIPIENTComboUpdateBtn: TBitBtn
    Left = 751
    Top = 174
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
    TabOrder = 13
    OnClick = CRECIPIENTComboUpdateBtnClick
  end
  object f_RKOEF: TJvCalcEdit
    Left = 690
    Top = 56
    Width = 94
    Height = 21
    DecimalPlaces = 8
    DisplayFormat = '0.########'
    Anchors = [akTop, akRight]
    TabOrder = 4
    DecimalPlacesAlwaysShown = False
  end
  object CMKGROUPAppendBtn: TBitBtn
    Left = 715
    Top = 94
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
    OnClick = CMKGROUPAppendBtnClick
  end
  object CRECIPIENTAppendBtn: TBitBtn
    Left = 715
    Top = 174
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
    TabOrder = 12
    OnClick = CRECIPIENTAppendBtnClick
  end
  object MKGROUPADOQ: TADOQuery
    Parameters = <>
    Left = 280
    Top = 312
  end
  object RECIPIENTADOQ: TADOQuery
    Parameters = <>
    Left = 352
    Top = 312
  end
  object T_SVARKA_EQADOQ: TADOQuery
    Parameters = <>
    Left = 432
    Top = 312
  end
  object T_ZACHIST_EQADOQ: TADOQuery
    Parameters = <>
    Left = 504
    Top = 312
  end
  object T_DOVODKA_EQADOQ: TADOQuery
    Parameters = <>
    Left = 576
    Top = 312
  end
end
