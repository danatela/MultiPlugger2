object GrMaterialsForm: TGrMaterialsForm
  Left = 0
  Top = 0
  Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  ClientHeight = 762
  ClientWidth = 800
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
    Top = 716
    Width = 800
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      800
      46)
    object ImportBtn: TBitBtn
      Left = 467
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
      Left = 644
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 800
    Height = 716
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1075#1088#1091#1087#1087#1099
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object PropGroupBox: TGroupBox
        Left = 0
        Top = 43
        Width = 792
        Height = 645
        Align = alClient
        TabOrder = 0
        DesignSize = (
          792
          645)
        object f_PROP_PROFNUMLabel: TLabel
          Left = 183
          Top = 27
          Width = 81
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1084#1077#1088' '#1087#1088#1086#1092#1080#1083#1103':'
        end
        object f_PROP_STEELMARKLabel: TLabel
          Left = 198
          Top = 54
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = #1084#1072#1088#1082#1072' '#1089#1090#1072#1083#1080':'
        end
        object f_PROP_NORMDOC0Label: TLabel
          Left = 63
          Top = 83
          Width = 201
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1089#1086#1088#1090#1072#1084#1077#1085#1090#1091':'
        end
        object f_PROP_NORMDOC1Label: TLabel
          Left = 68
          Top = 112
          Width = 196
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1091':'
        end
        object f_PROP_LINEDENSLabel: TLabel
          Left = 124
          Top = 139
          Width = 140
          Height = 13
          Alignment = taRightJustify
          Caption = #1083#1080#1085#1077#1081#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1100' ('#1082#1075'/'#1084'):'
          FocusControl = f_PROP_LINEDENS
        end
        object f_PROP_PWIDTH1Label: TLabel
          Left = 160
          Top = 166
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Caption = #1096#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'1 ('#1084#1084'):'
          FocusControl = f_PROP_PWIDTH1
        end
        object f_PROP_PWIDTH2Label: TLabel
          Left = 160
          Top = 193
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Caption = #1096#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'2 ('#1084#1084'):'
          FocusControl = f_PROP_PWIDTH2
        end
        object f_PROP_SIZE1Label: TLabel
          Left = 196
          Top = 220
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = #1088#1072#1079#1084#1077#1088'1 ('#1084#1084'):'
          FocusControl = f_PROP_SIZE1
        end
        object f_PROP_SIZE2Label: TLabel
          Left = 196
          Top = 247
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = #1088#1072#1079#1084#1077#1088'2 ('#1084#1084'):'
          FocusControl = f_PROP_SIZE2
        end
        object f_PROP_WTHICKLabel: TLabel
          Left = 154
          Top = 274
          Width = 110
          Height = 13
          Alignment = taRightJustify
          Caption = #1090#1086#1083#1097#1080#1085#1072' '#1089#1090#1077#1085#1082#1080' ('#1084#1084'):'
          FocusControl = f_PROP_WTHICK
        end
        object f_PROP_SLENGTHLabel: TLabel
          Left = 206
          Top = 301
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = #1076#1083#1080#1085#1072' ('#1084#1084'):'
          FocusControl = f_PROP_SLENGTH
        end
        object f_PROP_PROFTYPELabel: TLabel
          Left = 194
          Top = 328
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = #1074#1080#1076' '#1087#1088#1086#1092#1080#1083#1103':'
        end
        object f_PROP_DIAMLabel: TLabel
          Left = 194
          Top = 355
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = #1076#1080#1072#1084#1077#1090#1088' ('#1084#1084'):'
          FocusControl = f_PROP_DIAM
        end
        object f_PROP_SIZELabel: TLabel
          Left = 202
          Top = 382
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = #1088#1072#1079#1084#1077#1088' ('#1084#1084'):'
          FocusControl = f_PROP_SIZE
        end
        object f_PROP_UWLabel: TLabel
          Left = 152
          Top = 409
          Width = 112
          Height = 13
          Alignment = taRightJustify
          Caption = #1091#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089' ('#1075'/'#1089#1084'3):'
          FocusControl = f_PROP_UW
        end
        object f_PROP_PROFILELabel: TLabel
          Left = 216
          Top = 436
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = #1087#1088#1086#1092#1080#1083#1100':'
        end
        object f_PROP_THICKLabel: TLabel
          Left = 215
          Top = 465
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = #1090#1086#1083#1097#1080#1085#1072':'
        end
        object f_PROP_WIDTHLabel: TLabel
          Left = 222
          Top = 492
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = #1096#1080#1088#1080#1085#1072':'
        end
        object f_PROP_LENGTHLabel: TLabel
          Left = 229
          Top = 521
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = #1076#1083#1080#1085#1072':'
        end
        object f_PROP_FIXTYPELabel: TLabel
          Left = 194
          Top = 556
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = #1074#1080#1076' '#1082#1088#1077#1087#1077#1078#1072':'
        end
        object f_PROP_CARVTYPELabel: TLabel
          Left = 201
          Top = 585
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = #1074#1080#1076' '#1088#1077#1079#1100#1073#1099':'
        end
        object f_PROP_STEPLabel: TLabel
          Left = 201
          Top = 612
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = #1096#1072#1075' '#1088#1077#1079#1100#1073#1099':'
          FocusControl = f_PROP_STEP
        end
        object f_PROP_STEELMARK: TComboBox
          Left = 270
          Top = 51
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object PROP_STEELMARKComboUpdateBtn: TBitBtn
          Left = 759
          Top = 47
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
          TabOrder = 3
          OnClick = PROP_STEELMARKComboUpdateBtnClick
        end
        object f_PROP_NORMDOC0: TComboBox
          Left = 270
          Top = 80
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
        end
        object PROP_NORMDOC0ComboUpdateBtn: TBitBtn
          Left = 759
          Top = 78
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
          TabOrder = 6
          OnClick = PROP_NORMDOC0ComboUpdateBtnClick
        end
        object f_PROP_NORMDOC1: TComboBox
          Left = 270
          Top = 109
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
        end
        object PROP_NORMDOC1ComboUpdateBtn: TBitBtn
          Left = 759
          Top = 107
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
          TabOrder = 9
        end
        object f_PROP_LINEDENS: TJvCalcEdit
          Left = 270
          Top = 136
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 10
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_PWIDTH1: TJvCalcEdit
          Left = 270
          Top = 163
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 11
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_PWIDTH2: TJvCalcEdit
          Left = 270
          Top = 190
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 12
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SIZE1: TJvCalcEdit
          Left = 270
          Top = 217
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 13
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SIZE2: TJvCalcEdit
          Left = 270
          Top = 244
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 14
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_WTHICK: TJvCalcEdit
          Left = 270
          Top = 271
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 15
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SLENGTH: TJvCalcEdit
          Left = 270
          Top = 298
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 16
          DecimalPlacesAlwaysShown = False
        end
        object PROP_PROFTYPEComboUpdateBtn: TBitBtn
          Left = 759
          Top = 323
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
          TabOrder = 19
          OnClick = PROP_PROFTYPEComboUpdateBtnClick
        end
        object f_PROP_PROFTYPE: TComboBox
          Left = 270
          Top = 325
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 17
        end
        object f_PROP_DIAM: TJvCalcEdit
          Left = 270
          Top = 352
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 20
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SIZE: TJvCalcEdit
          Left = 270
          Top = 379
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 21
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_UW: TJvCalcEdit
          Left = 270
          Top = 406
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 22
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_PROFILE: TComboBox
          Left = 270
          Top = 433
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 23
        end
        object PROP_PROFILEComboUpdateBtn: TBitBtn
          Left = 759
          Top = 431
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
          TabOrder = 24
          OnClick = PROP_PROFILEComboUpdateBtnClick
        end
        object f_PROP_THICK: TComboBox
          Left = 270
          Top = 462
          Width = 114
          Height = 21
          TabOrder = 25
        end
        object PROP_THICKComboUpdateBtn: TBitBtn
          Left = 426
          Top = 460
          Width = 30
          Height = 25
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DA0000000000
            000AAD0FFFFFFFFFFF0DDA0FFFFF2FFFFF0AAD0FFFF22FFFFF0DDA0FFF22222F
            FF0AAD0FFFF22FF2FF0DDA0FFFFF2FF2FF0AAD0FF2FFFFF2FF0DDA0FF2FF2FFF
            FF0AAD0FF2FF22FFFF0DDA0FFF22222FFF0AAD0FFFFF22FFFF0DDA0FFFFF2FF0
            000AAD0FFFFFFFF0F0ADDA0FFFFFFFF00ADAAD0000000000ADAD}
          TabOrder = 26
          OnClick = PROP_THICKComboUpdateBtnClick
        end
        object f_PROP_WIDTH: TComboBox
          Left = 270
          Top = 489
          Width = 114
          Height = 21
          TabOrder = 27
        end
        object PROP_WIDTHComboUpdateBtn: TBitBtn
          Left = 426
          Top = 491
          Width = 30
          Height = 25
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DA0000000000
            000AAD0FFFFFFFFFFF0DDA0FFFFF2FFFFF0AAD0FFFF22FFFFF0DDA0FFF22222F
            FF0AAD0FFFF22FF2FF0DDA0FFFFF2FF2FF0AAD0FF2FFFFF2FF0DDA0FF2FF2FFF
            FF0AAD0FF2FF22FFFF0DDA0FFF22222FFF0AAD0FFFFF22FFFF0DDA0FFFFF2FF0
            000AAD0FFFFFFFF0F0ADDA0FFFFFFFF00ADAAD0000000000ADAD}
          TabOrder = 28
          OnClick = PROP_WIDTHComboUpdateBtnClick
        end
        object f_PROP_LENGTH: TComboBox
          Left = 270
          Top = 518
          Width = 114
          Height = 21
          TabOrder = 29
        end
        object PROP_LENGTHComboUpdateBtn: TBitBtn
          Left = 426
          Top = 520
          Width = 30
          Height = 25
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            04000000000080000000120B0000120B00001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DA0000000000
            000AAD0FFFFFFFFFFF0DDA0FFFFF2FFFFF0AAD0FFFF22FFFFF0DDA0FFF22222F
            FF0AAD0FFFF22FF2FF0DDA0FFFFF2FF2FF0AAD0FF2FFFFF2FF0DDA0FF2FF2FFF
            FF0AAD0FF2FF22FFFF0DDA0FFF22222FFF0AAD0FFFFF22FFFF0DDA0FFFFF2FF0
            000AAD0FFFFFFFF0F0ADDA0FFFFFFFF00ADAAD0000000000ADAD}
          TabOrder = 30
          OnClick = PROP_LENGTHComboUpdateBtnClick
        end
        object PROP_STEELMARKAppendBtn: TBitBtn
          Left = 723
          Top = 49
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
          TabOrder = 2
          OnClick = PROP_STEELMARKAppendBtnClick
        end
        object PROP_NORMDOC0AppendBtn: TBitBtn
          Left = 723
          Top = 78
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
          TabOrder = 5
          OnClick = PROP_NORMDOC0AppendBtnClick
        end
        object PROP_NORMDOC1AppendBtn: TBitBtn
          Left = 723
          Top = 109
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
          TabOrder = 8
          OnClick = PROP_NORMDOC1AppendBtnClick
        end
        object PROP_PROFTYPEAppendBtn: TBitBtn
          Left = 723
          Top = 323
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
          TabOrder = 18
          OnClick = PROP_PROFTYPEAppendBtnClick
        end
        object PROP_PROFILEAppendBtn: TBitBtn
          Left = 723
          Top = 427
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
          TabOrder = 31
          OnClick = PROP_PROFILEAppendBtnClick
        end
        object PROP_THICKAppendBtn: TBitBtn
          Left = 398
          Top = 460
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
          TabOrder = 32
          OnClick = PROP_THICKAppendBtnClick
        end
        object PROP_WIDTHAppendBtn: TBitBtn
          Left = 398
          Top = 491
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
          TabOrder = 33
          OnClick = PROP_WIDTHAppendBtnClick
        end
        object PROP_LENGTHAppendBtn: TBitBtn
          Left = 398
          Top = 522
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
          TabOrder = 34
          OnClick = PROP_LENGTHAppendBtnClick
        end
        object f_PROP_PROFNUM: TEdit
          Left = 270
          Top = 24
          Width = 114
          Height = 21
          MaxLength = 20
          TabOrder = 0
        end
        object f_PROP_FIXTYPE: TComboBox
          Left = 270
          Top = 553
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 35
        end
        object PROP_FIXTYPEComboUpdateBtn: TBitBtn
          Left = 759
          Top = 551
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
          TabOrder = 36
          OnClick = PROP_FIXTYPEComboUpdateBtnClick
        end
        object PROP_FIXTYPEAppendBtn: TBitBtn
          Left = 723
          Top = 551
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
          TabOrder = 37
          OnClick = PROP_FIXTYPEAppendBtnClick
        end
        object f_PROP_CARVTYPE: TComboBox
          Left = 270
          Top = 582
          Width = 447
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 38
        end
        object PROP_CARVTYPEComboUpdateBtn: TBitBtn
          Left = 759
          Top = 580
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
          TabOrder = 39
          OnClick = PROP_CARVTYPEComboUpdateBtnClick
        end
        object PROP_CARVTYPEAppendBtn: TBitBtn
          Left = 723
          Top = 580
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
          TabOrder = 40
          OnClick = PROP_CARVTYPEAppendBtnClick
        end
        object f_PROP_STEP: TJvCalcEdit
          Left = 270
          Top = 609
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 41
          DecimalPlacesAlwaysShown = False
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 792
        Height = 43
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          792
          43)
        object f_ACTIVE: TCheckBox
          Left = 571
          Top = 13
          Width = 73
          Height = 17
          Anchors = [akRight, akBottom]
          Caption = #1072#1082#1090#1080#1074#1077#1085
          TabOrder = 1
        end
        object f_NAME: TLabeledEdit
          Left = 96
          Top = 10
          Width = 457
          Height = 21
          EditLabel.Width = 77
          EditLabel.Height = 13
          EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 0
        end
        object MaterialsBtn: TBitBtn
          Left = 650
          Top = 10
          Width = 135
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
          TabOrder = 2
          OnClick = MaterialsBtnClick
        end
      end
    end
  end
  object PROP_LENGTHADOQ: TADOQuery
    Parameters = <>
    Left = 392
    Top = 32
  end
  object PROP_STEELMARKADOQ: TADOQuery
    Parameters = <>
    Left = 360
    Top = 32
  end
  object PROP_WIDTHADOQ: TADOQuery
    Parameters = <>
    Left = 328
    Top = 32
  end
  object PROP_PROFTYPEADOQ: TADOQuery
    Parameters = <>
    Left = 296
    Top = 32
  end
  object PROP_THICKADOQ: TADOQuery
    Parameters = <>
    Left = 264
    Top = 32
  end
  object PROP_NORMDOC1ADOQ: TADOQuery
    Parameters = <>
    Left = 232
    Top = 32
  end
  object PROP_NORMDOC0ADOQ: TADOQuery
    Parameters = <>
    Left = 200
    Top = 32
  end
  object PROP_PROFILEADOQ: TADOQuery
    Parameters = <>
    Left = 168
    Top = 32
  end
  object PROP_FIXTYPEADOQ: TADOQuery
    Parameters = <>
    Left = 432
    Top = 32
  end
  object PROP_CARVTYPEADOQ: TADOQuery
    Parameters = <>
    Left = 472
    Top = 32
  end
end
