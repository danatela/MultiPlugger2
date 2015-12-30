object LoginForm: TLoginForm
  Left = 309
  Top = 193
  BorderStyle = bsDialog
  Caption = #1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1073#1072#1079#1086#1081
  ClientHeight = 99
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    316
    99)
  PixelsPerInch = 96
  TextHeight = 13
  object LoginEdit: TLabeledEdit
    Left = 112
    Top = 8
    Width = 196
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
    LabelPosition = lpLeft
    TabOrder = 0
    OnKeyPress = LoginEditKeyPress
  end
  object PasswordEdit: TLabeledEdit
    Left = 112
    Top = 35
    Width = 196
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 41
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1072#1088#1086#1083#1100':'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = PasswordEditKeyPress
  end
  object OkButton: TButton
    Left = 152
    Top = 62
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1057#1086#1077#1076#1080#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 233
    Top = 62
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object SaveCredentialsCheckBox: TCheckBox
    Left = 8
    Top = 66
    Width = 138
    Height = 17
    Caption = #1041#1086#1083#1100#1096#1077' '#1085#1077' '#1089#1087#1088#1072#1096#1080#1074#1072#1090#1100
    TabOrder = 4
  end
end
