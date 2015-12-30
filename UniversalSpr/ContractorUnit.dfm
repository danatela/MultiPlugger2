object ContractorForm: TContractorForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  ClientHeight = 220
  ClientWidth = 632
  Color = clBtnFace
  Constraints.MinHeight = 240
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    632
    220)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 174
    Width = 632
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      632
      46)
    object ImportBtn: TBitBtn
      Left = 299
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
      Left = 476
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
  object f_NAME: TLabeledEdit
    Left = 144
    Top = 72
    Width = 465
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 116
    EditLabel.Height = 13
    EditLabel.Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
    LabelPosition = lpLeft
    MaxLength = 255
    TabOrder = 1
  end
  object f_ACTIVE: TCheckBox
    Left = 544
    Top = 147
    Width = 65
    Height = 17
    Caption = #1072#1082#1090#1080#1074#1077#1085
    TabOrder = 4
  end
  object f_ABBR: TLabeledEdit
    Left = 144
    Top = 112
    Width = 186
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = #1040#1073#1073#1088#1077#1074#1080#1072#1090#1091#1088#1072':'
    LabelPosition = lpLeft
    MaxLength = 20
    TabOrder = 2
  end
  object f_CODE: TLabeledEdit
    Left = 448
    Top = 112
    Width = 161
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = #1050#1086#1076':'
    LabelPosition = lpLeft
    MaxLength = 20
    TabOrder = 3
  end
  object f_ContrType: TRadioGroup
    Left = 16
    Top = 8
    Width = 593
    Height = 49
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1058#1080#1087' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072': '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077' '#1047#1040#1054' "'#1052#1056#1050'"'
      #1089#1090#1086#1088#1086#1085#1085#1103#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103)
    TabOrder = 0
  end
end
