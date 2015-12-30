object Spr1JvCalcEditForm: TSpr1JvCalcEditForm
  Left = 0
  Top = 0
  ClientHeight = 121
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    362
    121)
  PixelsPerInch = 96
  TextHeight = 13
  object f_NAMELabel: TLabel
    Left = 76
    Top = 21
    Width = 140
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight]
    Caption = #1083#1080#1085#1077#1081#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1100' ('#1082#1075'/'#1084'):'
    FocusControl = f_NAME
  end
  object Panel1: TPanel
    Left = 0
    Top = 75
    Width = 362
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 57
    DesignSize = (
      362
      46)
    object ImportBtn: TBitBtn
      Left = 29
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
      Left = 206
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
  object f_NAME: TJvCalcEdit
    Left = 222
    Top = 18
    Width = 114
    Height = 21
    DecimalPlaces = 8
    DisplayFormat = '0.########'
    Anchors = [akTop, akRight]
    TabOrder = 0
    DecimalPlacesAlwaysShown = False
  end
  object f_ACTIVE: TCheckBox
    Left = 263
    Top = 52
    Width = 73
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1072#1082#1090#1080#1074#1085#1086
    TabOrder = 1
  end
end
