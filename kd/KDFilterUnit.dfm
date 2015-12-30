object KDFilterForm: TKDFilterForm
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 253
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
    253)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 59
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = #1047#1072#1082#1072#1079#1095#1080#1082':'
  end
  object Panel1: TPanel
    Left = 0
    Top = 207
    Width = 451
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
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
  object f_ORDERNUM: TLabeledEdit
    Left = 73
    Top = 16
    Width = 100
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = #1079'-'#1079' '#8470' '#1052#1056#1050':'
    LabelPosition = lpLeft
    MaxLength = 10
    TabOrder = 0
  end
  object f_CCONTRACTOR: TComboBox
    Left = 73
    Top = 56
    Width = 360
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 19
    Top = 100
    Width = 198
    Height = 85
    Caption = ' '#1040#1082#1090#1091#1072#1083#1077#1085' '#1076#1086': '
    TabOrder = 4
    object Label3: TLabel
      Left = 35
      Top = 27
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = #1086#1090':'
    end
    object Label5: TLabel
      Left = 34
      Top = 54
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = #1076#1086':'
    end
    object f_ACTDATE1: TJvDateEdit
      Left = 57
      Top = 24
      Width = 97
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
    object f_ACTDATE2: TJvDateEdit
      Left = 57
      Top = 51
      Width = 97
      Height = 21
      ShowNullDate = False
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 235
    Top = 100
    Width = 198
    Height = 85
    Caption = ' '#1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103': '
    TabOrder = 5
    object Label6: TLabel
      Left = 35
      Top = 27
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = #1086#1090':'
    end
    object Label7: TLabel
      Left = 34
      Top = 54
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = #1076#1086':'
    end
    object f_INPUTDATE1: TJvDateEdit
      Left = 57
      Top = 24
      Width = 97
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
    object f_INPUTDATE2: TJvDateEdit
      Left = 57
      Top = 51
      Width = 97
      Height = 21
      ShowNullDate = False
      TabOrder = 1
    end
  end
  object f_ORDERNUM2: TLabeledEdit
    Left = 333
    Top = 16
    Width = 100
    Height = 21
    Anchors = [akTop, akRight]
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = #1079'-'#1079' '#8470' '#1062#1052#1050':'
    LabelPosition = lpLeft
    MaxLength = 7
    TabOrder = 1
  end
  object contractorsADOQ: TADOQuery
    Parameters = <>
    Left = 224
    Top = 24
  end
end
