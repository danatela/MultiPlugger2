object JournalFilterForm: TJournalFilterForm
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1090#1088' '#1085#1072' '#1089#1086#1073#1099#1090#1080#1103
  ClientHeight = 405
  ClientWidth = 451
  Color = clBtnFace
  Constraints.MinHeight = 280
  Constraints.MinWidth = 450
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
    451
    405)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 59
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = #1058#1072#1073#1083#1080#1094#1072':'
  end
  object Label2: TLabel
    Left = 19
    Top = 107
    Width = 76
    Height = 13
    Alignment = taRightJustify
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 359
    Width = 451
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 313
    DesignSize = (
      451
      46)
    object ImportBtn: TBitBtn
      Left = 118
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
      Left = 295
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
  object f_TABLENREC: TLabeledEdit
    Left = 142
    Top = 16
    Width = 100
    Height = 21
    EditLabel.Width = 123
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1079#1072#1087#1080#1089#1080':'
    LabelPosition = lpLeft
    MaxLength = 7
    TabOrder = 0
  end
  object f_TABLENAME: TComboBox
    Left = 73
    Top = 56
    Width = 360
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
  end
  object GroupBox1: TGroupBox
    Left = 21
    Top = 148
    Width = 412
    Height = 61
    Caption = ' '#1047#1072' '#1087#1077#1088#1080#1086#1076': '
    TabOrder = 3
    object Label3: TLabel
      Left = 35
      Top = 27
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = #1086#1090':'
    end
    object Label5: TLabel
      Left = 274
      Top = 27
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = #1076#1086':'
    end
    object f_OPERTIME1: TJvDateEdit
      Left = 57
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object f_OPERTIME2: TJvDateEdit
      Left = 297
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 1
    end
  end
  object f_USERNAME: TComboBox
    Left = 101
    Top = 104
    Width = 332
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
  end
  object f_OPERTYPE: TRadioGroup
    Left = 21
    Top = 226
    Width = 412
    Height = 119
    Caption = ' '#1042#1080#1076#1099' '#1086#1087#1077#1088#1072#1094#1080#1081': '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1083#1102#1073#1099#1077
      #1076#1086#1073#1072#1074#1083#1077#1085#1080#1077
      #1080#1079#1084#1077#1085#1077#1085#1080#1077
      #1091#1076#1072#1083#1077#1085#1080#1077
      #1074#1093#1086#1076' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      #1074#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      #1079#1072#1087#1091#1089#1082' '#1087#1083#1072#1075#1080#1085#1072)
    TabOrder = 5
  end
  object contractorsADOQ: TADOQuery
    Parameters = <>
    Left = 224
    Top = 24
  end
end
