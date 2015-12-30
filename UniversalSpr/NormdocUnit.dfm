object NormdocForm: TNormdocForm
  Left = 0
  Top = 0
  Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1072#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1094#1080#1103
  ClientHeight = 167
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 180
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    632
    167)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 121
    Width = 632
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 230
    DesignSize = (
      632
      46)
    object ImportBtn: TBitBtn
      Left = 299
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
      Left = 476
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
  object f_NAME: TLabeledEdit
    Left = 136
    Top = 16
    Width = 481
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 113
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1043#1054#1057#1058#1072':'
    LabelPosition = lpLeft
    MaxLength = 100
    TabOrder = 0
  end
  object f_ACTIVE: TCheckBox
    Left = 552
    Top = 93
    Width = 65
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1072#1082#1090#1080#1074#1085#1086
    TabOrder = 2
  end
  object f_PRIM: TLabeledEdit
    Left = 88
    Top = 57
    Width = 529
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 65
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    LabelPosition = lpLeft
    MaxLength = 255
    TabOrder = 1
  end
end
