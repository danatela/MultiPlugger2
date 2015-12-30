object LoginForm: TLoginForm
  Left = 453
  Top = 108
  BorderStyle = bsDialog
  Caption = #1042#1093#1086#1076' '#1074' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
  ClientHeight = 141
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 285
    Height = 90
    Align = alClient
    TabOrder = 0
    object login: TLabeledEdit
      Left = 112
      Top = 16
      Width = 161
      Height = 21
      EditLabel.Width = 99
      EditLabel.Height = 13
      EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
      LabelPosition = lpLeft
      TabOrder = 0
    end
    object psw: TLabeledEdit
      Left = 112
      Top = 48
      Width = 161
      Height = 21
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 96
    Width = 291
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 161
      Top = 12
      Width = 115
      Height = 25
      Caption = #1042#1086#1081#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Kind = bkOK
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 17
      Top = 12
      Width = 113
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
    end
  end
end
