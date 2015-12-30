object KD3Form: TKD3Form
  Left = 0
  Top = 0
  Caption = #1044#1077#1090#1072#1083#1100
  ClientHeight = 882
  ClientWidth = 792
  Color = clBtnFace
  Constraints.MinHeight = 550
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 836
    Width = 792
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
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
      Left = 4
      Top = 6
      Width = 222
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 792
    Height = 836
    ActivePage = TabSheet2
    Align = alClient
    Images = ImageList1
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
      object PropGroupBox: TGroupBox
        Left = 0
        Top = 129
        Width = 784
        Height = 618
        Align = alClient
        Caption = ' '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1077#1090#1072#1083#1080': '
        TabOrder = 0
        DesignSize = (
          784
          618)
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
        object f_PROP_STEPLabel: TLabel
          Left = 201
          Top = 612
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = #1096#1072#1075' '#1088#1077#1079#1100#1073#1099':'
          FocusControl = f_PROP_STEP
        end
        object f_PROP_CARVTYPELabel: TLabel
          Left = 201
          Top = 585
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = #1074#1080#1076' '#1088#1077#1079#1100#1073#1099':'
        end
        object f_PROP_FIXTYPELabel: TLabel
          Left = 194
          Top = 556
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = #1074#1080#1076' '#1082#1088#1077#1087#1077#1078#1072':'
        end
        object f_PROP_STEELMARK: TComboBox
          Left = 270
          Top = 51
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          OnChange = f_CGRMATERIALSChange
        end
        object PROP_STEELMARKComboUpdateBtn: TBitBtn
          Left = 743
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
          TabOrder = 4
          OnClick = PROP_STEELMARKComboUpdateBtnClick
        end
        object f_PROP_NORMDOC0: TComboBox
          Left = 270
          Top = 80
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          OnChange = f_CGRMATERIALSChange
        end
        object PROP_NORMDOC0ComboUpdateBtn: TBitBtn
          Left = 743
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
          TabOrder = 7
          OnClick = PROP_NORMDOC0ComboUpdateBtnClick
        end
        object f_PROP_NORMDOC1: TComboBox
          Left = 270
          Top = 109
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 8
          OnChange = f_CGRMATERIALSChange
        end
        object PROP_NORMDOC1ComboUpdateBtn: TBitBtn
          Left = 743
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
          TabOrder = 10
          OnClick = PROP_NORMDOC1ComboUpdateBtnClick
        end
        object f_PROP_LINEDENS: TJvCalcEdit
          Left = 270
          Top = 136
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 11
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_PWIDTH1: TJvCalcEdit
          Left = 270
          Top = 163
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 12
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_PWIDTH2: TJvCalcEdit
          Left = 270
          Top = 190
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 13
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SIZE1: TJvCalcEdit
          Left = 270
          Top = 217
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 14
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SIZE2: TJvCalcEdit
          Left = 270
          Top = 244
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 15
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_WTHICK: TJvCalcEdit
          Left = 270
          Top = 271
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 16
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SLENGTH: TJvCalcEdit
          Left = 270
          Top = 298
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 17
          DecimalPlacesAlwaysShown = False
        end
        object PROP_PROFTYPEComboUpdateBtn: TBitBtn
          Left = 743
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
          TabOrder = 20
          OnClick = PROP_PROFTYPEComboUpdateBtnClick
        end
        object f_PROP_PROFTYPE: TComboBox
          Left = 270
          Top = 325
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 18
          OnChange = f_CGRMATERIALSChange
        end
        object f_PROP_DIAM: TJvCalcEdit
          Left = 270
          Top = 352
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 21
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_SIZE: TJvCalcEdit
          Left = 270
          Top = 379
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 22
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_UW: TJvCalcEdit
          Left = 270
          Top = 406
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 23
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_PROFILE: TComboBox
          Left = 270
          Top = 433
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 24
          OnChange = f_CGRMATERIALSChange
        end
        object PROP_PROFILEComboUpdateBtn: TBitBtn
          Left = 743
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
          TabOrder = 26
          OnClick = PROP_PROFILEComboUpdateBtnClick
        end
        object PROP_STEELMARKAppendBtn: TBitBtn
          Left = 707
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
          TabOrder = 3
          OnClick = PROP_STEELMARKAppendBtnClick
        end
        object PROP_NORMDOC0AppendBtn: TBitBtn
          Left = 707
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
          TabOrder = 6
          OnClick = PROP_NORMDOC0AppendBtnClick
        end
        object PROP_NORMDOC1AppendBtn: TBitBtn
          Left = 707
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
          TabOrder = 9
          OnClick = PROP_NORMDOC1AppendBtnClick
        end
        object PROP_PROFTYPEAppendBtn: TBitBtn
          Left = 707
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
          TabOrder = 19
          OnClick = PROP_PROFTYPEAppendBtnClick
        end
        object PROP_PROFILEAppendBtn: TBitBtn
          Left = 707
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
          TabOrder = 25
          OnClick = PROP_PROFILEAppendBtnClick
        end
        object f_PROP_THICK: TJvCalcEdit
          Left = 270
          Top = 465
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 27
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_WIDTH: TJvCalcEdit
          Left = 270
          Top = 492
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 28
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_LENGTH: TJvCalcEdit
          Left = 270
          Top = 519
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 29
          DecimalPlacesAlwaysShown = False
        end
        object PropCopyBtn: TBitBtn
          Left = 390
          Top = 18
          Width = 383
          Height = 25
          Anchors = [akTop, akRight]
          Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1080#1079' '#1075#1088#1091#1087#1087#1099' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888844444444488888884FFFFFFF488888884F0000
            0F480000004FFFFFFF480FFFFF4F00000F480F00004FFFFFFF480FFFFF4F00F4
            44480F00004FFFF4F4880FFFFF4FFFF448880F00F044444488880FFFF0F08888
            88880FFFF0088888888800000088888888888888888888888888}
          TabOrder = 0
          OnClick = PropCopyBtnClick
        end
        object f_PROP_PROFNUM: TEdit
          Left = 270
          Top = 24
          Width = 114
          Height = 21
          MaxLength = 20
          TabOrder = 1
        end
        object f_PROP_FIXTYPE: TComboBox
          Left = 270
          Top = 553
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 30
        end
        object PROP_CARVTYPEComboUpdateBtn: TBitBtn
          Left = 743
          Top = 582
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
          TabOrder = 31
          OnClick = PROP_CARVTYPEComboUpdateBtnClick
        end
        object PROP_FIXTYPEComboUpdateBtn: TBitBtn
          Left = 743
          Top = 553
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
          TabOrder = 32
          OnClick = PROP_FIXTYPEComboUpdateBtnClick
        end
        object PROP_CARVTYPEAppendBtn: TBitBtn
          Left = 707
          Top = 582
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
          OnClick = PROP_CARVTYPEAppendBtnClick
        end
        object PROP_FIXTYPEAppendBtn: TBitBtn
          Left = 707
          Top = 553
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
          OnClick = PROP_FIXTYPEAppendBtnClick
        end
        object f_PROP_STEP: TJvCalcEdit
          Left = 270
          Top = 609
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 35
          DecimalPlacesAlwaysShown = False
        end
        object f_PROP_CARVTYPE: TComboBox
          Left = 270
          Top = 582
          Width = 431
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 36
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 747
        Width = 784
        Height = 60
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          784
          60)
        object Label2: TLabel
          Left = 20
          Top = 23
          Width = 85
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103':'
        end
        object f_INPUTDATE: TLabel
          Left = 111
          Top = 23
          Width = 3
          Height = 13
          Anchors = [akLeft, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object f_PRIM: TLabeledEdit
          Left = 367
          Top = 23
          Width = 410
          Height = 21
          Anchors = [akLeft, akRight, akBottom]
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 129
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          784
          129)
        object Label18: TLabel
          Left = 18
          Top = 59
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = #1075#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074':'
        end
        object Label3: TLabel
          Left = 583
          Top = 19
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1074#1077#1089' 1 '#1096#1090' '#1074' '#1082#1075':'
          FocusControl = f_WEIGHT1
        end
        object f_NUMP: TLabeledEdit
          Left = 91
          Top = 16
          Width = 81
          Height = 21
          EditLabel.Width = 74
          EditLabel.Height = 13
          EditLabel.Caption = #1085#1086#1084#1077#1088' '#1076#1077#1090#1072#1083#1080':'
          LabelPosition = lpLeft
          MaxLength = 20
          TabOrder = 0
        end
        object f_CGRMATERIALS: TComboBox
          Left = 328
          Top = 56
          Width = 373
          Height = 21
          AutoDropDown = True
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          OnChange = f_CGRMATERIALSChange
        end
        object CGRMATERIALSComboUpdateBtn: TBitBtn
          Left = 743
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
          OnClick = CGRMATERIALSComboUpdateBtnClick
        end
        object f_WEIGHT1: TJvCalcEdit
          Left = 659
          Top = 16
          Width = 114
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          Anchors = [akTop, akRight]
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
        end
        object f_CPMATERIAL: TComboBox
          Left = 126
          Top = 56
          Width = 196
          Height = 21
          AutoDropDown = True
          DropDownCount = 13
          TabOrder = 2
          OnChange = f_CPMATERIALChange
        end
        object CGRMATERIALSAppendBtn: TBitBtn
          Left = 707
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
          OnClick = CGRMATERIALSAppendBtnClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1058#1077#1093#1085#1086#1083#1086#1075#1080#1103
      ImageIndex = 1
      DesignSize = (
        784
        807)
      object GroupBox5: TGroupBox
        Left = 402
        Top = 325
        Width = 377
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1043#1080#1073#1082#1072': '
        TabOrder = 1
        DesignSize = (
          377
          97)
        object f_T_GIBKA_NVLabel: TLabel
          Left = 19
          Top = 55
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
          FocusControl = f_T_GIBKA_NV
        end
        object Label16: TLabel
          Left = 19
          Top = 20
          Width = 77
          Height = 13
          Caption = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077':'
        end
        object f_T_GIBKA_NV: TJvCalcEdit
          Left = 104
          Top = 52
          Width = 81
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
        end
        object f_T_GIBKA_PR: TLabeledEdit
          Left = 280
          Top = 52
          Width = 81
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 3
        end
        object T_GIBKA_CEQComboUpdateBtn: TBitBtn
          Left = 331
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
          TabOrder = 1
          OnClick = T_GIBKA_CEQComboUpdateBtnClick
        end
        object f_T_GIBKA_CEQ: TComboBox
          Left = 104
          Top = 17
          Width = 185
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object T_GIBKA_CEQAppendBtn: TBitBtn
          Left = 295
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
          TabOrder = 4
          OnClick = T_GIBKA_CEQAppendBtnClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 3
        Top = 325
        Width = 393
        Height = 97
        Caption = ' '#1057#1090#1088#1086#1078#1082#1072': '
        TabOrder = 2
        DesignSize = (
          393
          97)
        object f_T_STROZH_NVLabel: TLabel
          Left = 19
          Top = 67
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
          FocusControl = f_T_STROZH_NV
        end
        object Label10: TLabel
          Left = 17
          Top = 18
          Width = 42
          Height = 13
          Caption = #1084#1072#1096#1080#1085#1072':'
        end
        object Label17: TLabel
          Left = 301
          Top = 18
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = #1084#1077#1090#1088#1072#1078':'
          FocusControl = f_T_STROZH_M
        end
        object f_T_STROZH_NV: TJvCalcEdit
          Left = 104
          Top = 64
          Width = 81
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
        end
        object f_T_STROZH_PR: TLabeledEdit
          Left = 264
          Top = 64
          Width = 118
          Height = 21
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 1
        end
        object f_T_STROZH_CEQ: TComboBox
          Left = 19
          Top = 36
          Width = 195
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object T_STROZH_CEQComboUpdateBtn: TBitBtn
          Left = 256
          Top = 33
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
          OnClick = T_STROZH_CEQComboUpdateBtnClick
        end
        object f_T_STROZH_M: TJvCalcEdit
          Left = 301
          Top = 36
          Width = 81
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
        end
        object T_STROZH_CEQAppendBtn: TBitBtn
          Left = 220
          Top = 33
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
          OnClick = T_STROZH_CEQAppendBtnClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 222
        Width = 776
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1054#1090#1074#1077#1088#1089#1090#1080#1103': '
        TabOrder = 3
        OnDblClick = GroupBox2DblClick
        DesignSize = (
          776
          97)
        object Label8: TLabel
          Left = 15
          Top = 64
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = #1076#1080#1072#1084#1077#1090#1088':'
          FocusControl = f_T_OTVERST_DIAM
        end
        object Label12: TLabel
          Left = 187
          Top = 64
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = #1082#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
          FocusControl = f_T_OTVERST_COUNT
        end
        object f_T_OTVERST_NVLabel: TLabel
          Left = 363
          Top = 64
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
          FocusControl = f_T_OTVERST_NV
        end
        object Label14: TLabel
          Left = 13
          Top = 19
          Width = 42
          Height = 13
          Caption = #1084#1072#1096#1080#1085#1072':'
        end
        object f_T_OTVERST_DIAM: TJvCalcEdit
          Left = 68
          Top = 61
          Width = 81
          Height = 21
          DecimalPlaces = 8
          DisplayFormat = '0.########'
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
        end
        object f_T_OTVERST_COUNT: TJvCalcEdit
          Left = 256
          Top = 61
          Width = 81
          Height = 21
          DecimalPlaces = 0
          DisplayFormat = '0'
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
        end
        object f_T_OTVERST_NV: TJvCalcEdit
          Left = 448
          Top = 61
          Width = 81
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
        end
        object f_T_OTVERST_CEQ: TComboBox
          Left = 12
          Top = 34
          Width = 675
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object T_OTVERST_CEQComboUpdateBtn: TBitBtn
          Left = 729
          Top = 30
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
        object f_T_OTVERST_PR: TLabeledEdit
          Left = 616
          Top = 61
          Width = 144
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 5
        end
        object T_OTVERST_CEQAppendBtn: TBitBtn
          Left = 693
          Top = 30
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
          OnClick = T_OTVERST_CEQAppendBtnClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 402
        Top = 119
        Width = 377
        Height = 97
        Caption = ' '#1047#1072#1095#1080#1089#1090#1082#1072': '
        TabOrder = 4
        DesignSize = (
          377
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
          Width = 38
          Height = 13
          Caption = #1089#1087#1086#1089#1086#1073':'
        end
        object f_T_ZACHIST_NV: TJvCalcEdit
          Left = 104
          Top = 63
          Width = 81
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          TabOrder = 3
          DecimalPlacesAlwaysShown = False
        end
        object T_ZACHIST_CTYPEComboUpdateBtn: TBitBtn
          Left = 339
          Top = 33
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
          OnClick = T_ZACHIST_CTYPEComboUpdateBtnClick
        end
        object f_T_ZACHIST_CTYPE: TComboBox
          Left = 19
          Top = 36
          Width = 278
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object T_ZACHIST_CTYPEAppendBtn: TBitBtn
          Left = 303
          Top = 33
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
          OnClick = T_ZACHIST_CTYPEAppendBtnClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 119
        Width = 393
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1056#1077#1079#1082#1072': '
        TabOrder = 5
        DesignSize = (
          393
          97)
        object f_T_REZKA_NVLabel: TLabel
          Left = 19
          Top = 67
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
          FocusControl = f_T_REZKA_NV
        end
        object Label1: TLabel
          Left = 17
          Top = 18
          Width = 42
          Height = 13
          Caption = #1084#1072#1096#1080#1085#1072':'
        end
        object Label5: TLabel
          Left = 301
          Top = 18
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = #1084#1077#1090#1088#1072#1078':'
          FocusControl = f_T_REZKA_M
        end
        object f_T_REZKA_NV: TJvCalcEdit
          Left = 104
          Top = 64
          Width = 81
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          TabOrder = 0
          DecimalPlacesAlwaysShown = False
        end
        object f_T_REZKA_PR: TLabeledEdit
          Left = 264
          Top = 64
          Width = 118
          Height = 21
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 1
        end
        object f_T_REZKA_CEQ: TComboBox
          Left = 19
          Top = 36
          Width = 195
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object T_REZKA_CEQComboUpdateBtn: TBitBtn
          Left = 256
          Top = 33
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
          OnClick = T_REZKA_CEQComboUpdateBtnClick
        end
        object f_T_REZKA_M: TJvCalcEdit
          Left = 301
          Top = 36
          Width = 81
          Height = 21
          TabOrder = 4
          DecimalPlacesAlwaysShown = False
        end
        object T_REZKA_CEQAppendBtn: TBitBtn
          Left = 220
          Top = 33
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
          OnClick = T_REZKA_CEQAppendBtnClick
        end
      end
      object GroupBox6: TGroupBox
        Left = 3
        Top = 16
        Width = 776
        Height = 97
        Anchors = [akLeft, akTop, akRight]
        Caption = ' '#1056#1072#1079#1084#1077#1090#1082#1072': '
        TabOrder = 0
        DesignSize = (
          776
          97)
        object f_T_RAZMET_NVLabel: TLabel
          Left = 19
          Top = 55
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = #1085#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080':'
          FocusControl = f_T_RAZMET_NV
        end
        object Label20: TLabel
          Left = 19
          Top = 20
          Width = 77
          Height = 13
          Caption = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077':'
        end
        object f_T_RAZMET_NV: TJvCalcEdit
          Left = 104
          Top = 52
          Width = 81
          Height = 21
          DecimalPlaces = 3
          DisplayFormat = '0.###'
          TabOrder = 2
          DecimalPlacesAlwaysShown = False
        end
        object f_T_RAZMET_PR: TLabeledEdit
          Left = 280
          Top = 52
          Width = 480
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          EditLabel.Width = 64
          EditLabel.Height = 13
          EditLabel.Caption = #1087#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          LabelPosition = lpLeft
          MaxLength = 255
          TabOrder = 3
        end
        object T_RAZMET_CEQComboUpdateBtnClick: TBitBtn
          Left = 730
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
          TabOrder = 1
          OnClick = T_RAZMET_CEQComboUpdateBtnClickClick
        end
        object f_T_RAZMET_CEQ: TComboBox
          Left = 104
          Top = 17
          Width = 584
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object T_RAZMET_CEQAppendBtn: TBitBtn
          Left = 694
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
          TabOrder = 4
          OnClick = T_RAZMET_CEQAppendBtnClick
        end
      end
    end
  end
  object GRMATERIALSADOQ: TADOQuery
    Parameters = <>
    Left = 96
    Top = 168
  end
  object PROP_STEELMARKADOQ: TADOQuery
    Parameters = <>
    Left = 400
    Top = 32
  end
  object PROP_PROFILEADOQ: TADOQuery
    Parameters = <>
    Left = 168
    Top = 32
  end
  object PROP_NORMDOC0ADOQ: TADOQuery
    Parameters = <>
    Left = 200
    Top = 32
  end
  object PROP_PROFTYPEADOQ: TADOQuery
    Parameters = <>
    Left = 296
    Top = 32
  end
  object PROP_NORMDOC1ADOQ: TADOQuery
    Parameters = <>
    Left = 232
    Top = 32
  end
  object T_REZKA_EQADOQ: TADOQuery
    Parameters = <>
    Left = 40
    Top = 184
  end
  object T_ZACHIST_TYPEADOQ: TADOQuery
    Parameters = <>
    Left = 32
    Top = 24
  end
  object T_OTVERST_EQADOQ: TADOQuery
    Parameters = <>
    Left = 56
    Top = 16
  end
  object T_STROZH_EQADOQ: TADOQuery
    Parameters = <>
    Left = 80
    Top = 16
  end
  object T_GIBKA_EQADOQ: TADOQuery
    Parameters = <>
    Left = 40
    Top = 264
  end
  object PMATERIALADOQ: TADOQuery
    Parameters = <>
    Left = 48
    Top = 144
  end
  object ImageList1: TImageList
    Left = 528
    Top = 160
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
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
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
      000000000000000000000000FFFFFF00FFFFFFFF00000000000F07C100000000
      000F07C100000000000F07C100000000000F06C100000000000FDD7700000000
      000FDAB700000000000FC54700000000008FFABF000000001144FD7F00000000
      0AB8FEFF00000000057CF83F00000000FAFCF83F00000000FDF8F83F00000000
      FE04F83F00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object T_RAZMET_EQADOQ: TADOQuery
    Parameters = <>
    Left = 80
    Top = 264
  end
  object PROP_CARVTYPEADOQ: TADOQuery
    Parameters = <>
    Left = 472
    Top = 32
  end
  object PROP_FIXTYPEADOQ: TADOQuery
    Parameters = <>
    Left = 432
    Top = 32
  end
end
