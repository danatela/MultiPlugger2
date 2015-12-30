object PasswordChangeForm: TPasswordChangeForm
  Left = 0
  Top = 0
  ClientHeight = 142
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 349
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      349
      46)
    object ImportBtn: TBitBtn
      Left = 16
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
      Left = 193
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
  object f_PASSWORD1: TLabeledEdit
    Left = 123
    Top = 16
    Width = 198
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100':'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 0
  end
  object f_PASSWORD2: TLabeledEdit
    Left = 123
    Top = 56
    Width = 198
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100':'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 1
  end
end
