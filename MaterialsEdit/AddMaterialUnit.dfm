object AddMaterialForm: TAddMaterialForm
  Left = 218
  Top = 141
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083
  ClientHeight = 365
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    410
    365)
  PixelsPerInch = 96
  TextHeight = 13
  object CancelButton: TButton
    Left = 327
    Top = 332
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 0
    ExplicitTop = 331
  end
  object OkButton: TButton
    Left = 246
    Top = 332
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Enabled = False
    ModalResult = 1
    TabOrder = 1
    ExplicitTop = 331
  end
  object MaterialNameEdit: TLabeledEdit
    Left = 144
    Top = 8
    Width = 258
    Height = 21
    EditLabel.Width = 134
    EditLabel.Height = 13
    EditLabel.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1072':'
    LabelPosition = lpLeft
    TabOrder = 2
    OnChange = MaterialNameEditChange
    OnKeyPress = MaterialNameEditKeyPress
  end
  object PropGroupBox: TGroupBox
    Left = 8
    Top = 35
    Width = 394
    Height = 290
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1076#1086#1095#1077#1088#1085#1080#1093' '#1101#1083#1077#1084#1077#1085#1090#1086#1074':'
    TabOrder = 3
    DesignSize = (
      394
      290)
    object AvlPropLabel: TLabel
      Left = 16
      Top = 21
      Width = 61
      Height = 13
      Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077':'
    end
    object SelPropLabel: TLabel
      Left = 216
      Top = 21
      Width = 62
      Height = 13
      Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077':'
    end
    object AvlPropListBox: TListBox
      Left = 16
      Top = 40
      Width = 161
      Height = 233
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      MultiSelect = True
      Sorted = True
      TabOrder = 0
    end
    object SelPropListBox: TListBox
      Left = 216
      Top = 40
      Width = 161
      Height = 233
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      MultiSelect = True
      TabOrder = 1
    end
    object AddButton: TButton
      Left = 183
      Top = 72
      Width = 27
      Height = 25
      Caption = '>'
      TabOrder = 2
      OnClick = AddButtonClick
    end
    object AddAllButton: TButton
      Left = 183
      Top = 103
      Width = 27
      Height = 25
      Caption = '>>'
      TabOrder = 3
      OnClick = AddAllButtonClick
    end
    object DelButton: TButton
      Left = 183
      Top = 191
      Width = 27
      Height = 25
      Caption = '<'
      TabOrder = 4
      OnClick = DelButtonClick
    end
    object DelAllButton: TButton
      Left = 183
      Top = 222
      Width = 27
      Height = 25
      Caption = '<<'
      TabOrder = 5
      OnClick = DelAllButtonClick
    end
  end
end
