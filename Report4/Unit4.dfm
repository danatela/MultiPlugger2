object Form4: TForm4
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1044#1077#1083#1086#1074#1072#1103' '#1086#1073#1088#1077#1079#1100' '#1083#1080#1089#1090#1086#1074#1086#1075#1086' '#1084#1077#1090#1072#1083#1083#1086#1087#1088#1086#1082#1072#1090#1072
  ClientHeight = 165
  ClientWidth = 296
  Color = clWindow
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
    Left = 2
    Top = 8
    Width = 287
    Height = 81
    Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 30
      Width = 41
      Height = 13
      Caption = #1053#1072' '#1076#1072#1090#1091
    end
    object DateTimePicker1: TDateTimePicker
      Left = 91
      Top = 30
      Width = 158
      Height = 21
      Date = 42061.349151481480000000
      Time = 42061.349151481480000000
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 24
    Top = 120
    Width = 89
    Height = 25
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 198
    Top = 120
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOConnection1: TADOConnection
    Left = 200
    Top = 80
  end
  object ADOQMain: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 152
    Top = 80
  end
  object ADOQSteelMark: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 88
    Top = 80
  end
end
