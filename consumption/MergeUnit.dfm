object MergeForm: TMergeForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1083#1080#1103#1085#1080#1077' '#1087#1072#1089#1087#1086#1088#1090#1086#1074
  ClientHeight = 94
  ClientWidth = 258
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ResultLabel: TLabel
    Left = 8
    Top = 8
    Width = 239
    Height = 13
    Caption = #1057#1083#1080#1090#1100' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1077' '#1087#1072#1089#1087#1086#1088#1090#1072' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082':'
  end
  object ResultComboBox: TComboBox
    Left = 8
    Top = 27
    Width = 239
    Height = 21
    Style = csDropDownList
    TabOrder = 0
  end
  object OkBitBtn: TBitBtn
    Left = 88
    Top = 54
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object CancelBitBtn: TBitBtn
    Left = 175
    Top = 54
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end
