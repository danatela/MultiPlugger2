object ArrivalsFilterForm: TArrivalsFilterForm
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 253
  ClientWidth = 367
  Color = clBtnFace
  Constraints.MinHeight = 280
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    367
    253)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 207
    Width = 367
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 451
    DesignSize = (
      367
      46)
    object ImportBtn: TBitBtn
      Left = 34
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
      ExplicitLeft = 118
    end
    object BitBtn1: TBitBtn
      Left = 211
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      ExplicitLeft = 295
    end
  end
  object f_NUM: TLabeledEdit
    Left = 16
    Top = 32
    Width = 129
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 80
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103':'
    MaxLength = 7
    TabOrder = 0
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 71
    Width = 337
    Height = 58
    Caption = ' '#1044#1072#1090#1072' '#1079#1072#1076#1072#1085#1080#1103': '
    TabOrder = 1
    object Label6: TLabel
      Left = 35
      Top = 27
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = #1086#1090':'
    end
    object Label7: TLabel
      Left = 178
      Top = 27
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = #1076#1086':'
    end
    object f_ADATE1: TJvDateEdit
      Left = 57
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object f_ADATE2: TJvDateEdit
      Left = 201
      Top = 24
      Width = 97
      Height = 21
      TabOrder = 1
    end
  end
  object f_ANUM: TLabeledEdit
    Left = 16
    Top = 162
    Width = 337
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 93
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081':'
    MaxLength = 7
    TabOrder = 2
  end
end
