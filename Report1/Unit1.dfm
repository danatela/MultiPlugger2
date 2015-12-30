object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1086' '#1089#1076#1072#1095#1077' '#1075#1086#1090#1086#1074#1086#1081' '#1087#1088#1086#1076#1091#1082#1094#1080#1080
  ClientHeight = 142
  ClientWidth = 280
  Color = clWindow
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 273
    Height = 73
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
    TabOrder = 2
    object Label1: TLabel
      Left = 10
      Top = 27
      Width = 5
      Height = 13
      Caption = #1089
    end
    object Label2: TLabel
      Left = 144
      Top = 26
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 24
    Width = 97
    Height = 21
    Date = 42027.345410416670000000
    Time = 42027.345410416670000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 168
    Top = 24
    Width = 97
    Height = 21
    Date = 42027.345452916670000000
    Time = 42027.345452916670000000
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 112
    Width = 89
    Height = 25
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 190
    Top = 112
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 4
    OnClick = Button2Click
  end
  object ADOQActs: TADOQuery
    Parameters = <>
    Left = 296
    Top = 72
  end
  object Excel: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 48
    Top = 64
  end
end
