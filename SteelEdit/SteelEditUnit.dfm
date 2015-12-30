object SteelMarksForm: TSteelMarksForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1087#1086' '#1084#1072#1088#1082#1072#1084' '#1089#1090#1072#1083#1080
  ClientHeight = 355
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 199
    Top = 0
    Width = 282
    Height = 356
    TabOrder = 3
    object Label1: TLabel
      Left = 25
      Top = 21
      Width = 106
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1088#1082#1080
    end
    object Label2: TLabel
      Left = 25
      Top = 67
      Width = 109
      Height = 13
      Caption = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089' ('#1075'/'#1089#1084'3)'
    end
    object Label3: TLabel
      Left = 25
      Top = 159
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object Label4: TLabel
      Left = 168
      Top = 67
      Width = 60
      Height = 13
      Caption = #1040#1082#1090#1080#1074#1085#1086#1089#1090#1100
    end
    object Label5: TLabel
      Left = 25
      Top = 113
      Width = 193
      Height = 13
      Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1091
    end
    object Memo1: TMemo
      Left = 25
      Top = 178
      Width = 208
      Height = 63
      Lines.Strings = (
        'Memo1')
      TabOrder = 0
    end
    object CheckBox1: TCheckBox
      Left = 168
      Top = 90
      Width = 97
      Height = 17
      Caption = #1072#1082#1090#1080#1074#1077#1085
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object AddButton: TButton
      Left = 25
      Top = 296
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = AddButtonClick
    end
    object DelButon: TButton
      Left = 168
      Top = 296
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 3
      OnClick = DelButonClick
    end
  end
  object Edit1: TEdit
    Left = 224
    Top = 40
    Width = 211
    Height = 21
    TabOrder = 0
  end
  object Edit3: TEdit
    Left = 224
    Top = 86
    Width = 109
    Height = 21
    TabOrder = 1
  end
  object Edit4: TEdit
    Left = 224
    Top = 132
    Width = 211
    Height = 21
    TabOrder = 2
  end
  object ListBox1: TListBox
    Left = 1
    Top = 0
    Width = 192
    Height = 356
    ItemHeight = 13
    TabOrder = 4
    OnClick = ListBox1Click
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    OnWillConnect = ADOConnectionWillConnect
    Left = 400
    Top = 152
  end
  object SteelMarksTable: TADOTable
    Connection = ADOConnection
    Left = 368
    Top = 184
  end
  object ADODataSet: TADODataSet
    Connection = ADOConnection
    Parameters = <>
    Left = 432
    Top = 208
  end
end
