object EditActForm: TEditActForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1072#1082#1090#1072
  ClientHeight = 566
  ClientWidth = 432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    432
    566)
  PixelsPerInch = 96
  TextHeight = 13
  object MasterLabel: TLabel
    Left = 8
    Top = 39
    Width = 61
    Height = 13
    Caption = #1084#1072#1089#1090#1077#1088' '#1062#1052#1050
    FocusControl = MasterComboBox
  end
  object ControllerLabel: TLabel
    Left = 8
    Top = 66
    Width = 77
    Height = 13
    Caption = #1082#1086#1085#1090#1088#1086#1083#1077#1088' '#1059#1058#1050
    FocusControl = ControllerComboBox
  end
  object ForLabel: TLabel
    Left = 8
    Top = 162
    Width = 97
    Height = 13
    Caption = #1076#1083#1103' ('#1094#1077#1093' '#1079#1072#1082#1072#1079#1095#1080#1082')'
    FocusControl = ForComboboxEh
  end
  object PipesLabel: TLabel
    Left = 8
    Top = 185
    Width = 53
    Height = 13
    Caption = #1089#1086#1089#1091#1076#1099' '#8470
    FocusControl = PipesDBEditEh
  end
  object PressureLabel: TLabel
    Left = 8
    Top = 208
    Width = 177
    Height = 13
    Caption = #1080#1089#1087#1099#1090#1072#1085#1099' '#1076#1072#1074#1083#1077#1085#1080#1077#1084' '#1074#1086#1076#1099', '#1082#1075'/'#1089#1084#178
    FocusControl = PressureDBEditEh
  end
  object AddressLabel: TLabel
    Left = 8
    Top = 231
    Width = 79
    Height = 13
    Caption = #1072#1076#1088#1077#1089' '#1086#1090#1075#1088#1091#1079#1082#1080
    FocusControl = AddressComboboxEh
  end
  object DrawingLabel: TLabel
    Left = 8
    Top = 254
    Width = 60
    Height = 13
    Caption = #8470' '#1095#1077#1088#1090#1077#1078#1072
    FocusControl = DrawingComboboxEh
  end
  object NameLabel: TLabel
    Left = 8
    Top = 277
    Width = 117
    Height = 13
    Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1080#1079#1076#1077#1083#1080#1103
    FocusControl = NameComboboxEh
  end
  object QueueLabel: TLabel
    Left = 8
    Top = 300
    Width = 43
    Height = 13
    Caption = #1086#1095#1077#1088#1077#1076#1100
    FocusControl = QueueComboboxEh
  end
  object NumLabel: TLabel
    Left = 8
    Top = 139
    Width = 63
    Height = 13
    Caption = #1087#1086#1088#1103#1076#1082#1086#1074#1099#1081
    FocusControl = NumComboboxEh
  end
  object Weight1Label: TLabel
    Left = 8
    Top = 322
    Width = 61
    Height = 13
    Caption = #1074#1077#1089', '#1082#1075' 1 '#1096#1090
    FocusControl = Weight1ComboboxEh
  end
  object QuantityLabel: TLabel
    Left = 8
    Top = 345
    Width = 22
    Height = 13
    Caption = #1082'-'#1074#1086
    FocusControl = QuantityDBEditEh
  end
  object WeightLabel: TLabel
    Left = 8
    Top = 368
    Width = 71
    Height = 13
    Caption = #1074#1077#1089', '#1082#1075' '#1086#1073#1097#1080#1081
    FocusControl = WeightDBEditEh
  end
  object PriceLabel: TLabel
    Left = 8
    Top = 442
    Width = 24
    Height = 13
    Caption = #1094#1077#1085#1072
    FocusControl = PriceDBEditEh
  end
  object SumLabel: TLabel
    Left = 8
    Top = 469
    Width = 29
    Height = 13
    Caption = #1089#1091#1084#1084#1072
    FocusControl = SumDBEditEh
  end
  object ActNoLabel: TLabel
    Left = 8
    Top = 12
    Width = 36
    Height = 13
    Caption = #1040#1050#1058' '#8470
    FocusControl = ActNoDBEditEh
  end
  object Label1: TLabel
    Left = 8
    Top = 414
    Width = 106
    Height = 13
    Caption = #1092#1080#1082#1089#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1094#1077#1085#1072
    FocusControl = FixPriceDBEditEh
  end
  object ZakNoLabel: TLabel
    Left = 8
    Top = 119
    Width = 110
    Height = 13
    Caption = #1079#1072#1082#1072#1079' '#1059#1043#1052'/'#1079#1072#1082#1072#1079' '#1062#1052#1050
    FocusControl = ZakazComboboxEh
  end
  object AddMasterSpeedButton: TSpeedButton
    Tag = 1
    Left = 403
    Top = 35
    Width = 21
    Height = 21
    Flat = True
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      700077777777777770007777700077777000777770C077777000777770C07777
      7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
      7000777770C07777700077777000777770007777777777777000777777777777
      7000}
    OnClick = AddPersonClick
  end
  object AddControllerSpeedButton: TSpeedButton
    Tag = 2
    Left = 403
    Top = 62
    Width = 21
    Height = 21
    Flat = True
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000D0000000D0000000100
      0400000000006800000000000000000000001000000010000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
      700077777777777770007777700077777000777770C077777000777770C07777
      7000770000C000077000770CCCCCCC077000770000C000077000777770C07777
      7000777770C07777700077777000777770007777777777777000777777777777
      7000}
    OnClick = AddPersonClick
  end
  object OKBitBtn: TBitBtn
    Left = 268
    Top = 533
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
  end
  object CancelBitBtn: TBitBtn
    Left = 349
    Top = 533
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object MasterComboBox: TDBLookupComboboxEh
    Left = 88
    Top = 35
    Width = 309
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'MASTERFIO'
    DataSource = ApproveActForm.ActsDataSource
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object ControllerComboBox: TDBLookupComboboxEh
    Left = 88
    Top = 62
    Width = 309
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'CONTROLLERFIO'
    DataSource = ApproveActForm.ActsDataSource
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object ZakazStaticText: TStaticText
    Left = 8
    Top = 92
    Width = 57
    Height = 17
    Caption = #1087#1086' '#1079#1072#1082#1072#1079#1091':'
    TabOrder = 4
  end
  object PipesDBEditEh: TDBEditEh
    Left = 191
    Top = 180
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PIPES'
    DataSource = ApproveActForm.ActsDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object ForComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 158
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'CUSTOMER_S'
    DataSource = ApproveActForm.ActsDataSource
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object PressureDBEditEh: TDBEditEh
    Left = 191
    Top = 204
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PRESSURE'
    DataSource = ApproveActForm.ActsDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 7
    Visible = True
  end
  object AddressComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 227
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'RECEIVER_S'
    DataSource = ApproveActForm.ActsDataSource
    EditButton.Enabled = False
    EditButton.ShortCut = 0
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 8
    Visible = True
  end
  object DrawingComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 250
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'DRAWING'
    DataSource = ApproveActForm.SpDataSource
    EditButton.Enabled = False
    EditButton.ShortCut = 0
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 9
    Visible = True
  end
  object NameComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 273
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'TITLE'
    DataSource = ApproveActForm.SpDataSource
    EditButton.Enabled = False
    EditButton.ShortCut = 0
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 10
    Visible = True
  end
  object QueueComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 296
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'QUEUE'
    DataSource = ApproveActForm.SpDataSource
    EditButton.Enabled = False
    EditButton.ShortCut = 0
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 11
    Visible = True
  end
  object NumComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 136
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'NUM'
    DataSource = ApproveActForm.SpDataSource
    EditButtons = <>
    TabOrder = 12
    Visible = True
  end
  object Weight1ComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 319
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'WEIGHT1'
    DataSource = ApproveActForm.SpDataSource
    EditButton.Enabled = False
    EditButton.ShortCut = 0
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 13
    Visible = True
  end
  object WeightDBEditEh: TDBEditEh
    Left = 191
    Top = 365
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'WEIGHT'
    DataSource = ApproveActForm.SpDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 14
    Visible = True
  end
  object PriceDBEditEh: TDBEditEh
    Left = 191
    Top = 439
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PRICE'
    DataSource = ApproveActForm.SpDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 15
    Visible = True
  end
  object SumDBEditEh: TDBEditEh
    Left = 191
    Top = 466
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SUM'
    DataSource = ApproveActForm.SpDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 16
    Visible = True
  end
  object SignedDBCheckBoxEh: TDBCheckBoxEh
    Left = 8
    Top = 488
    Width = 77
    Height = 17
    Caption = #1055#1086#1076#1087#1080#1089#1072#1085
    DataField = 'SIGNED'
    DataSource = ApproveActForm.ActsDataSource
    DynProps = <>
    TabOrder = 17
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object ActNoDBEditEh: TDBEditEh
    Left = 88
    Top = 8
    Width = 336
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'ACTNO'
    DataSource = ApproveActForm.ActsDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 18
    Visible = True
  end
  object CostStaticText: TStaticText
    Left = 8
    Top = 391
    Width = 85
    Height = 17
    Caption = #1089#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073'.'
    TabOrder = 19
  end
  object QuantityDBEditEh: TDBEditEh
    Left = 191
    Top = 342
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'QUANTITY'
    DataSource = ApproveActForm.SpDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 20
    Visible = True
  end
  object BrushingDBCheckBoxEh: TDBCheckBoxEh
    Left = 8
    Top = 511
    Width = 77
    Height = 17
    Caption = #1055#1086#1082#1088#1072#1089#1082#1072
    DataField = 'BRUSHED'
    DataSource = ApproveActForm.ActsDataSource
    DynProps = <>
    TabOrder = 21
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object FixPriceDBEditEh: TDBEditEh
    Left = 191
    Top = 412
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'FIXPRICE'
    DataSource = ApproveActForm.SpDataSource
    DynProps = <>
    EditButtons = <>
    TabOrder = 22
    Visible = True
  end
  object DBNavigator: TDBNavigator
    Left = 8
    Top = 533
    Width = 240
    Height = 25
    DataSource = ApproveActForm.SpDataSource
    Anchors = [akLeft, akBottom]
    Flat = True
    Kind = dbnHorizontal
    TabOrder = 23
  end
  object ZakazComboboxEh: TDBLookupComboboxEh
    Left = 191
    Top = 115
    Width = 233
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'KD_ORDERNUM'
    DataSource = ApproveActForm.ActsDataSource
    EditButtons = <>
    TabOrder = 24
    Visible = True
  end
end
