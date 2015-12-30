object Form3: TForm3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1052#1077#1090#1072#1083#1083#1086#1087#1088#1086#1082#1072#1090', '#1087#1086#1089#1090#1091#1087#1080#1074#1096#1080#1081' '#1074' '#1087#1088#1086#1080#1079#1074#1086#1076#1089#1090#1074#1086', '#1085#1086' '#1085#1077' '#1080#1079#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1085#1099#1081
  ClientHeight = 129
  ClientWidth = 298
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 36
    Width = 41
    Height = 13
    Caption = #1053#1072' '#1076#1072#1090#1091
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 11
    Width = 282
    Height = 59
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
    TabOrder = 3
  end
  object Button1: TButton
    Left = 17
    Top = 96
    Width = 89
    Height = 25
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 199
    Top = 96
    Width = 75
    Height = 24
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 83
    Top = 34
    Width = 141
    Height = 21
    Date = 42054.571647303240000000
    Time = 42054.571647303240000000
    TabOrder = 2
  end
  object ADOConnection1: TADOConnection
    Left = 160
    Top = 80
  end
  object ADOQNonExpend: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 80
  end
  object ADOQGrSort: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 240
    Top = 80
  end
end
