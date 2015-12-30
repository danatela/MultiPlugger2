object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1056#1072#1079#1085#1080#1094#1072' '#1084#1072#1089#1089#1099' '#1088#1072#1089#1095#1077#1090#1085#1086#1081' '#1080' '#1087#1086' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1091
  ClientHeight = 152
  ClientWidth = 326
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
    Top = 8
    Width = 318
    Height = 73
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103' '#1086#1090#1095#1077#1090#1072
    TabOrder = 0
    object Label1: TLabel
      Left = 21
      Top = 27
      Width = 5
      Height = 13
      Caption = #1089
    end
    object Label2: TLabel
      Left = 159
      Top = 27
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object DateTimePicker1: TDateTimePicker
      Left = 37
      Top = 24
      Width = 105
      Height = 21
      Date = 42031.577523912030000000
      Time = 42031.577523912030000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 180
      Top = 24
      Width = 117
      Height = 21
      Date = 42031.577600949080000000
      Time = 42031.577600949080000000
      TabOrder = 1
    end
  end
  object Button1: TButton
    Left = 21
    Top = 104
    Width = 92
    Height = 25
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 104
    Width = 89
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOConnection1: TADOConnection
    Left = 152
    Top = 88
  end
  object ADOQRep: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 272
    Top = 48
  end
end
