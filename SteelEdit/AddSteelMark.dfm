object NewSteelMark: TNewSteelMark
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1072#1103' '#1084#1072#1088#1082#1072' '#1089#1090#1072#1083#1080
  ClientHeight = 288
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 2
    Width = 377
    Height = 282
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 8
      Width = 106
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1088#1082#1080
    end
    object Label2: TLabel
      Left = 24
      Top = 60
      Width = 172
      Height = 13
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1088#1082#1080
    end
    object Label3: TLabel
      Left = 233
      Top = 60
      Width = 72
      Height = 13
      Caption = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089
    end
    object Label4: TLabel
      Left = 24
      Top = 122
      Width = 193
      Height = 13
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1091
    end
    object Label5: TLabel
      Left = 24
      Top = 176
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object Edit1: TEdit
      Left = 24
      Top = 27
      Width = 330
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 24
      Top = 79
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 233
      Top = 79
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 24
      Top = 140
      Width = 330
      Height = 21
      TabOrder = 3
      Text = 'Edit4'
    end
    object Memo1: TMemo
      Left = 24
      Top = 195
      Width = 185
      Height = 62
      Lines.Strings = (
        'Memo1')
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Left = 255
      Top = 192
      Width = 96
      Height = 17
      Caption = #1072#1082#1090#1080#1074#1085#1086#1089#1090#1100
      TabOrder = 5
    end
    object AddSteel: TButton
      Left = 255
      Top = 232
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 6
      OnClick = AddSteelClick
    end
  end
end
