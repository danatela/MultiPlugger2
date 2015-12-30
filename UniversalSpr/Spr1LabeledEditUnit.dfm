object Spr1LabeledEditForm: TSpr1LabeledEditForm
  Left = 0
  Top = 0
  ClientHeight = 139
  ClientWidth = 632
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
    632
    139)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 93
    Width = 632
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
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
    Left = 177
    Top = 16
    Width = 440
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 149
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1088#1082#1080':'
    LabelPosition = lpLeft
    MaxLength = 200
    TabOrder = 0
  end
  object f_ACTIVE: TCheckBox
    Left = 551
    Top = 60
    Width = 73
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1072#1082#1090#1080#1074#1085#1086
    TabOrder = 1
  end
end
