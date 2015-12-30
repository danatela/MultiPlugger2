object consumptionFilterForm: TconsumptionFilterForm
  Left = 0
  Top = 0
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 337
  ClientWidth = 367
  Color = clBtnFace
  Constraints.MinHeight = 280
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    367
    337)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 291
    Width = 367
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 281
    DesignSize = (
      367
      46)
    object ImportBtn: TBitBtn
      Left = 34
      Top = 8
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      Kind = bkCancel
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 211
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Kind = bkOK
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
  object f_NUM: TLabeledEdit
    Left = 16
    Top = 26
    Width = 129
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 80
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1079#1072#1076#1072#1085#1080#1103':'
    MaxLength = 7
    TabOrder = 0
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 155
    Width = 337
    Height = 58
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' '#1044#1072#1090#1072' '#1079#1072#1076#1072#1085#1080#1103': '
    TabOrder = 2
    ExplicitTop = 145
    object Label6: TLabel
      Left = 35
      Top = 27
      Width = 16
      Height = 13
      Alignment = taRightJustify
      Caption = #1086#1090':'
    end
    object Label7: TLabel
      Left = 178
      Top = 27
      Width = 17
      Height = 13
      Alignment = taRightJustify
      Caption = #1076#1086':'
    end
    object f_ADATE1: TJvDateEdit
      Left = 57
      Top = 24
      Width = 97
      Height = 21
      ShowNullDate = False
      TabOrder = 0
    end
    object f_ADATE2: TJvDateEdit
      Left = 201
      Top = 24
      Width = 97
      Height = 21
      ShowNullDate = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 227
    Width = 337
    Height = 50
    Anchors = [akLeft, akRight, akBottom]
    Caption = ' '#1057#1086#1089#1090#1086#1103#1085#1080#1077': '
    TabOrder = 4
    ExplicitTop = 217
    object f_state: TCheckListBox
      Left = 2
      Top = 15
      Width = 333
      Height = 33
      Align = alClient
      ItemHeight = 13
      Items.Strings = (
        #1087#1086#1083#1085#1086#1089#1090#1100#1102' '#1080#1079#1088#1072#1089#1093#1086#1076#1086#1074#1072#1085#1086
        #1077#1089#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' ('#1084#1072#1090#1077#1088#1080#1072#1083' '#1080#1083#1080' '#1044#1054')')
      TabOrder = 0
    end
  end
  object f_PNUM: TLabeledEdit
    Left = 168
    Top = 26
    Width = 183
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 85
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072':'
    MaxLength = 7
    TabOrder = 1
  end
  object f_FilterBy: TRadioGroup
    Left = 16
    Top = 53
    Width = 335
    Height = 95
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1060#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1087#1086':'
    ItemIndex = 0
    Items.Strings = (
      #1047#1072#1076#1072#1085#1080#1103#1084' '#1085#1072' '#1087#1086#1075#1088#1091#1079#1082#1091
      #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103#1084' '#1087#1072#1089#1087#1086#1088#1090#1086#1074
      #1053#1077' '#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100)
    TabOrder = 5
    OnClick = f_FilterByClick
    ExplicitHeight = 73
  end
end
