object EditPlanForm: TEditPlanForm
  Left = 207
  Top = 142
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1087#1083#1072#1085#1072
  ClientHeight = 122
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object YearLabel: TLabel
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = #1043#1086#1076':'
    FocusControl = YearEdit
  end
  object MonthLabel: TLabel
    Left = 8
    Top = 53
    Width = 35
    Height = 13
    Caption = #1052#1077#1089#1103#1094':'
    FocusControl = MonthComboBox
  end
  object YearEdit: TDBEdit
    Left = 8
    Top = 27
    Width = 121
    Height = 21
    DataField = 'PYEAR'
    DataSource = ImportPlanForm.EditPlansDataSource
    TabOrder = 0
  end
  object MonthComboBox: TComboBox
    Left = 8
    Top = 72
    Width = 145
    Height = 21
    TabOrder = 1
    Items.Strings = (
      #1103#1085#1074#1072#1088#1100
      #1092#1077#1074#1088#1072#1083#1100
      #1084#1072#1088#1090
      #1072#1087#1088#1077#1083#1100
      #1084#1072#1081
      #1080#1102#1085#1100
      #1080#1102#1083#1100
      #1072#1074#1075#1091#1089#1090
      #1089#1077#1085#1090#1103#1073#1088#1100
      #1086#1082#1090#1103#1073#1088#1100
      #1085#1086#1103#1073#1088#1100
      #1076#1077#1082#1072#1073#1088#1100)
  end
  object OkBitBtn: TBitBtn
    Left = 259
    Top = 25
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object CancelBitBtn: TBitBtn
    Left = 259
    Top = 56
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 3
  end
end
