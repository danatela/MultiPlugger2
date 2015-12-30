object UserForm: TUserForm
  Left = 270
  Top = 171
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 307
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  DesignSize = (
    430
    307)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 38
    Width = 154
    Height = 13
    Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1043#1072#1083#1072#1082#1090#1080#1082#1080':'
  end
  object Label2: TLabel
    Left = 44
    Top = 62
    Width = 114
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
  end
  object AddButton: TButton
    Left = 266
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = AddButtonClick
  end
  object CancelButton: TButton
    Left = 347
    Top = 274
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object UserName: TLabeledEdit
    Left = 164
    Top = 8
    Width = 145
    Height = 21
    EditLabel.Width = 97
    EditLabel.Height = 13
    EditLabel.Caption = #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103':'
    LabelPosition = lpLeft
    TabOrder = 2
  end
  object ComboBox1: TComboBox
    Left = 163
    Top = 35
    Width = 147
    Height = 21
    TabOrder = 3
    OnDropDown = ComboBox1DropDown
  end
  object ComboBox2: TComboBox
    Left = 164
    Top = 62
    Width = 197
    Height = 21
    TabOrder = 4
    OnDropDown = ComboBox2DropDown
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Left = 48
    Top = 144
  end
  object UsersQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    SQL.Strings = (
      'select XU$LoginName Login, Atl_NRec nRec from gal.x$Users')
    Left = 120
    Top = 144
  end
  object GalUsers: TADOTable
    Connection = ADOConnection
    Left = 184
    Top = 144
  end
  object GroupQuery: TADOQuery
    Connection = ADOConnectionCMK
    Parameters = <>
    SQL.Strings = (
      'select nrec, name from cmknew.usergroups')
    Left = 120
    Top = 200
  end
  object ADOConnectionCMK: TADOConnection
    LoginPrompt = False
    OnWillConnect = ADOConnectionCMKWillConnect
    Left = 48
    Top = 200
  end
  object CMKGroups: TADOTable
    Connection = ADOConnectionCMK
    Left = 184
    Top = 200
  end
  object CMKPersons: TADOTable
    Connection = ADOConnectionCMK
    Left = 240
    Top = 200
  end
end
