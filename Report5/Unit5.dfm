object Form5: TForm5
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1044#1077#1083#1086#1074#1072#1103' '#1086#1073#1088#1077#1079#1100' '#1089#1086#1088#1090#1086#1074#1086#1075#1086' '#1084#1077#1090#1072#1083#1083#1086#1087#1088#1086#1082#1090#1072
  ClientHeight = 168
  ClientWidth = 313
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
    Left = 8
    Top = 8
    Width = 297
    Height = 97
    Caption = #1042#1099#1073#1086#1088' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 43
      Width = 41
      Height = 13
      Caption = #1053#1072' '#1076#1072#1090#1091
    end
    object DateTimePicker1: TDateTimePicker
      Left = 70
      Top = 40
      Width = 163
      Height = 21
      Date = 42061.573301122680000000
      Time = 42061.573301122680000000
      TabOrder = 0
    end
  end
  object Button1: TButton
    Left = 27
    Top = 128
    Width = 94
    Height = 25
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 128
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA'
    Left = 264
    Top = 112
  end
  object ADOQMain: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 168
    Top = 112
  end
  object ADOQPipe: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 248
    Top = 40
  end
  object ADOQChannel: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 240
    Top = 56
  end
  object ADOQRollFormedS: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 192
    Top = 56
  end
  object ADOQSquare: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 176
    Top = 16
  end
  object ADOQTBeam: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 112
    Top = 64
  end
  object ADOQHBeam: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 40
    Top = 72
  end
  object ADOQAngle: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 72
    Top = 16
  end
  object ADOQCircle: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    Left = 128
    Top = 112
  end
end
