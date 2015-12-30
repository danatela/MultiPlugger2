object CorrSpPlanForm: TCorrSpPlanForm
  Left = 207
  Top = 141
  BorderStyle = bsDialog
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' '#1087#1083#1072#1085#1072
  ClientHeight = 432
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object CMK_GroupBox: TGroupBox
    Left = 239
    Top = 8
    Width = 225
    Height = 417
    Caption = #1055#1083#1072#1085' '#1062#1052#1050':'
    TabOrder = 0
    object EditDrawingLabel: TLabel
      Left = 6
      Top = 161
      Width = 82
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1095#1077#1088#1090#1077#1078#1072':'
      FocusControl = EditDrawingDBEdit
    end
    object EditGraphLabel: TLabel
      Left = 6
      Top = 209
      Width = 81
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1075#1088#1072#1092#1080#1082#1072':'
      FocusControl = EditGraphDBEdit
    end
    object OrderNum2Label: TLabel
      Left = 6
      Top = 44
      Width = 61
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1062#1052#1050':'
      FocusControl = OrderNum2DBEdit
    end
    object KolShtLabel: TLabel
      Left = 6
      Top = 105
      Width = 64
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      FocusControl = KolShtDBEdit
    end
    object PrimLabel: TLabel
      Left = 6
      Top = 255
      Width = 65
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
      FocusControl = PrimDBMemo
    end
    object OrderNumLabel: TLabel
      Left = 6
      Top = 17
      Width = 59
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1052#1056#1050':'
      FocusControl = OrderNumDBEdit
    end
    object OrdNLabel: TLabel
      Left = 6
      Top = 71
      Width = 84
      Height = 13
      Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#8470':'
      FocusControl = OrdNDBEdit
    end
    object EditWeight1Label: TLabel
      Left = 6
      Top = 132
      Width = 76
      Height = 13
      Caption = #1042#1077#1089' '#1086#1076#1085#1086#1081' '#1096#1090'.:'
      FocusControl = EditWeight1DBEdit
    end
    object EditDrawingDBEdit: TDBEdit
      Left = 6
      Top = 180
      Width = 212
      Height = 21
      DataField = 'DRAWING'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 0
    end
    object EditGraphDBEdit: TDBEdit
      Left = 6
      Top = 228
      Width = 212
      Height = 21
      DataField = 'GRAPH'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 1
    end
    object OrderNum2DBEdit: TDBEdit
      Left = 97
      Top = 41
      Width = 121
      Height = 21
      DataField = 'ORDERNUM2'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 2
    end
    object KolShtDBEdit: TDBEdit
      Left = 97
      Top = 102
      Width = 121
      Height = 21
      DataField = 'KOLSHT'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 3
      OnKeyPress = CheckCommaCount
    end
    object PrimDBMemo: TDBMemo
      Left = 6
      Top = 274
      Width = 212
      Height = 131
      DataField = 'PRIM'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 4
    end
    object OrderNumDBEdit: TDBEdit
      Left = 97
      Top = 14
      Width = 121
      Height = 21
      DataField = 'ORDERNUM'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 5
    end
    object OrdNDBEdit: TDBEdit
      Left = 97
      Top = 68
      Width = 121
      Height = 21
      DataField = 'ORDN'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 6
    end
    object EditWeight1DBEdit: TDBEdit
      Left = 97
      Top = 129
      Width = 121
      Height = 21
      DataField = 'WEIGHT1'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 7
      OnKeyPress = CheckCommaCount
    end
  end
  object PPU_GroupBox: TGroupBox
    Left = 8
    Top = 8
    Width = 225
    Height = 417
    Caption = #1055#1083#1072#1085' '#1055#1055#1059':'
    TabOrder = 1
    object DrawingLabel: TLabel
      Left = 6
      Top = 161
      Width = 82
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1095#1077#1088#1090#1077#1078#1072':'
      FocusControl = DrawingDBEdit
    end
    object GraphLabel: TLabel
      Left = 6
      Top = 207
      Width = 81
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1075#1088#1072#1092#1080#1082#1072':'
      FocusControl = GraphDBEdit
    end
    object INumLabel: TLabel
      Left = 6
      Top = 44
      Width = 61
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1062#1052#1050':'
      FocusControl = INumDBEdit
    end
    object KolLabel: TLabel
      Left = 6
      Top = 105
      Width = 64
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      FocusControl = KolDBEdit
    end
    object NoteLabel: TLabel
      Left = 6
      Top = 253
      Width = 65
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
      FocusControl = NoteDBMemo
    end
    object NumLabel: TLabel
      Left = 6
      Top = 17
      Width = 59
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1052#1056#1050':'
      FocusControl = NumDBEdit
    end
    object ONumLabel: TLabel
      Left = 6
      Top = 71
      Width = 84
      Height = 13
      Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#8470':'
      FocusControl = ONumDBEdit
    end
    object Weight1Label: TLabel
      Left = 6
      Top = 132
      Width = 76
      Height = 13
      Caption = #1042#1077#1089' '#1086#1076#1085#1086#1081' '#1096#1090'.:'
      FocusControl = Weight1DBEdit
    end
    object DrawingDBEdit: TDBEdit
      Left = 6
      Top = 180
      Width = 212
      Height = 21
      DataField = 'Drawing_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 0
    end
    object GraphDBEdit: TDBEdit
      Left = 6
      Top = 226
      Width = 212
      Height = 21
      DataField = 'Graph_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 1
    end
    object INumDBEdit: TDBEdit
      Left = 97
      Top = 41
      Width = 121
      Height = 21
      DataField = 'OrderNum2_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 2
    end
    object KolDBEdit: TDBEdit
      Left = 97
      Top = 102
      Width = 121
      Height = 21
      DataField = 'KolSht_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 3
    end
    object NoteDBMemo: TDBMemo
      Left = 6
      Top = 272
      Width = 212
      Height = 131
      DataField = 'PRIM_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 4
    end
    object NumDBEdit: TDBEdit
      Left = 97
      Top = 14
      Width = 121
      Height = 21
      DataField = 'OrderNum_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 5
    end
    object ONumDBEdit: TDBEdit
      Left = 97
      Top = 68
      Width = 121
      Height = 21
      DataField = 'Ordn_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 6
    end
    object Weight1DBEdit: TDBEdit
      Left = 97
      Top = 129
      Width = 121
      Height = 21
      DataField = 'Weight1_PPU'
      DataSource = ComparisonSpPlanForm.ComparisonDataSource
      TabOrder = 7
    end
  end
  object OkBitBtn: TBitBtn
    Left = 470
    Top = 20
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
end
