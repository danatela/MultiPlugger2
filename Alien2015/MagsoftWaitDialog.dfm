object MyWait: TMyWait
  Left = 585
  Top = 115
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 180
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 240
    Height = 180
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TextLabel: TLabel
      Left = 8
      Top = 12
      Width = 224
      Height = 43
      Alignment = taCenter
      AutoSize = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Gauge2: TGauge
      Left = 7
      Top = 80
      Width = 224
      Height = 20
      Hint = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080
      Color = clWhite
      Enabled = False
      ForeColor = clHighlight
      ParentColor = False
      ParentShowHint = False
      Progress = 0
      ShowHint = True
      Visible = False
    end
    object ProgressLabel: TLabel
      Left = 8
      Top = 61
      Width = 224
      Height = 13
      Alignment = taCenter
      AutoSize = False
    end
    object Label4: TLabel
      Left = 11
      Top = 106
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1055#1088#1086#1096#1083#1086' '#1074#1088#1077#1084#1077#1085#1080':'
    end
    object Label6: TLabel
      Left = 121
      Top = 106
      Width = 3
      Height = 13
      Hint = #1042#1088#1077#1084#1103', '#1087#1088#1086#1096#1077#1076#1096#1077#1077' '#1089' '#1085#1072#1095#1072#1083#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
      ParentShowHint = False
      ShowHint = True
    end
    object Label7: TLabel
      Left = 121
      Top = 125
      Width = 3
      Height = 13
      Hint = #1055#1088#1080#1073#1083#1080#1079#1080#1090#1077#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103', '#1086#1089#1090#1072#1074#1096#1077#1077#1089#1103' '#1076#1086' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080
      ParentShowHint = False
      ShowHint = True
    end
    object Label5: TLabel
      Left = 11
      Top = 125
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1074#1088#1077#1084#1077#1085#1080':'
    end
    object gauge1: TJvSpecialProgress
      Left = 7
      Top = 80
      Width = 224
      Height = 20
      Hint = #1055#1088#1086#1094#1077#1085#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1086#1087#1077#1088#1072#1094#1080#1080
      BorderStyle = bsSingle
      EndColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ShowHint = True
      Solid = True
      StartColor = clSkyBlue
      TextCentered = True
      TextOption = toPercent
    end
    object BreakButton: TBitBtn
      Left = 8
      Top = 144
      Width = 223
      Height = 25
      Hint = 
        #1053#1072#1078#1084#1080#1090#1077' '#1101#1090#1091' '#1082#1085#1086#1087#1082#1091' '#1076#1083#1103' '#1086#1089#1090#1072#1085#1086#1074#1082#1080' '#1074#1099#1087#1086#1083#1085#1103#1077#1084#1086#1081' '#1086#1087#1077#1088#1072#1094#1080#1080' ('#1085#1077' '#1088#1077#1082#1086#1084#1077 +
        #1085#1076#1091#1077#1090#1089#1103'!)'
      Caption = #1055#1088#1077#1088#1074#1072#1090#1100' '#1086#1087#1077#1088#1072#1094#1080#1102
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ModalResult = 3
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BreakButtonClick
    end
    object Button1: TButton
      Left = 8
      Top = 136
      Width = 225
      Height = 0
      Default = True
      TabOrder = 0
    end
  end
end
