object KDGridForm: TKDGridForm
  Left = 218
  Top = 141
  Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1089#1082#1072#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1094#1080#1103
  ClientHeight = 711
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF80
    01FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 300
    Top = 131
    Height = 580
    Align = alRight
    ExplicitLeft = 680
    ExplicitTop = 216
    ExplicitHeight = 100
  end
  object KDGrid1: TDBGridEh
    Left = 8
    Top = 176
    Width = 467
    Height = 170
    AutoFitColWidths = True
    DataSource = KD1Source
    DynProps = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu1
    ReadOnly = True
    RowHeight = 70
    RowSizingAllowed = True
    ShowHint = True
    SortLocal = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = KDEditActionExecute
    OnDrawColumnCell = KDGrid1DrawColumnCell
    Columns = <
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        Footers = <>
        Title.Caption = #1042#1083#1086#1078#1077#1085#1085#1099#1077
        Width = 100
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORDERNUM'
        Footers = <>
        Title.Caption = #1079'-'#1079' '#8470' '#1052#1056#1050
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 127
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORDERNUM2'
        Footers = <>
        Title.Caption = #1079'-'#1079' '#8470' '#1062#1052#1050
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 70
      end
      item
        AutoFitColWidth = False
        DisplayFormat = 'dd/mm/yyyy'
        DynProps = <>
        EditButtons = <>
        FieldName = 'INPUTDATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 120
        WordWrap = True
      end
      item
        AutoFitColWidth = False
        DisplayFormat = 'dd/mm/yyyy'
        DynProps = <>
        EditButtons = <>
        FieldName = 'LUPDDATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 120
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTRACTOR_S'
        Footers = <>
        Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 71
        WordWrap = True
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACTDATE'
        Footers = <>
        Title.Caption = #1040#1082#1090#1091#1072#1083#1077#1085' '#1076#1086
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTROL'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1088#1086#1083#1100
        Width = 130
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object PanelKDL1: TPanel
    Left = 303
    Top = 131
    Width = 126
    Height = 580
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      126
      580)
    object KDEditBtn: TBitBtn
      Left = 16
      Top = 8
      Width = 97
      Height = 73
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1087#1080#1089#1082#1091' '#1084#1072#1088#1086#1082' (F10)'
      Action = KDEditMarksAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1087#1080#1089#1082#1091' '#1084#1072#1088#1086#1082' (F10)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      WordWrap = True
    end
    object BitBtn1: TBitBtn
      Left = 16
      Top = 96
      Width = 97
      Height = 73
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1079#1072#1082#1072#1079' (F7)'
      Action = KDAppendAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1079#1072#1082#1072#1079' (F7)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      WordWrap = True
    end
    object BitBtn2: TBitBtn
      Left = 16
      Top = 184
      Width = 97
      Height = 73
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079' (F4)'
      Action = KDEditAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079' (F4)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      WordWrap = True
    end
    object BitBtn3: TBitBtn
      Left = 16
      Top = 272
      Width = 97
      Height = 73
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079' (Del)'
      Action = KDDelAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079' (Delete)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      WordWrap = True
    end
    object BitBtn13: TBitBtn
      Left = 16
      Top = 360
      Width = 97
      Height = 73
      Action = KD1SetFilterAction
      Caption = #1060#1080#1083#1100#1090#1088' (F2)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      WordWrap = True
    end
    object BitBtn14: TBitBtn
      Left = 16
      Top = 499
      Width = 97
      Height = 73
      Action = KDReportAction
      Anchors = [akLeft, akBottom]
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl-P)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      WordWrap = True
    end
  end
  object PanelKDL2: TPanel
    Left = 429
    Top = 131
    Width = 126
    Height = 580
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object BitBtn4: TBitBtn
      Left = 16
      Top = 8
      Width = 97
      Height = 73
      Action = KD2EditSPAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' (F10)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      WordWrap = True
    end
    object BitBtn5: TBitBtn
      Left = 16
      Top = 184
      Width = 97
      Height = 73
      Action = KD2AppendAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1084#1072#1088#1082#1091' (F7)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      WordWrap = True
    end
    object BitBtn6: TBitBtn
      Left = 16
      Top = 272
      Width = 97
      Height = 73
      Action = KD2EditAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1084#1072#1088#1082#1091' (F4)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      WordWrap = True
    end
    object BitBtn9: TBitBtn
      Left = 16
      Top = 360
      Width = 97
      Height = 73
      Action = KD2ESCAction
      Caption = #1053#1072#1079#1072#1076' '#1082' '#1089#1087#1080#1089#1082#1091' '#1079#1072#1082#1072#1079#1086#1074' (ESC)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      WordWrap = True
    end
    object BitBtn11: TBitBtn
      Left = 16
      Top = 96
      Width = 97
      Height = 73
      Action = KD2EditDetailsAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1086#1087#1080#1089#1072#1085#1080#1102' '#1076#1077#1090#1072#1083#1077#1081' (F12)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      WordWrap = True
    end
    object BitBtn12: TBitBtn
      Left = 16
      Top = 448
      Width = 97
      Height = 73
      Action = KD2DelAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1088#1082#1091' (Delete)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      WordWrap = True
    end
  end
  object PanelKDL3: TPanel
    Left = 555
    Top = 131
    Width = 126
    Height = 580
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object BitBtn7: TBitBtn
      Left = 16
      Top = 8
      Width = 97
      Height = 73
      Action = KD3AppendAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1076#1077#1090#1072#1083#1100' (F7)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      WordWrap = True
    end
    object BitBtn8: TBitBtn
      Left = 16
      Top = 413
      Width = 97
      Height = 73
      Action = KD3EditAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1090#1072#1083#1100' (F4)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      WordWrap = True
    end
    object BitBtn10: TBitBtn
      Left = 16
      Top = 501
      Width = 97
      Height = 73
      Action = KD3ESCAction
      Caption = #1053#1072#1079#1072#1076' '#1082' '#1089#1087#1080#1089#1082#1091' '#1084#1072#1088#1086#1082' (ESC)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
      WordWrap = True
    end
    object BitBtn15: TBitBtn
      Left = 16
      Top = 96
      Width = 97
      Height = 97
      Action = KD3CopyAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1080#1079' '#1076#1088#1091#1075#1086#1081' '#1076#1077#1090#1072#1083#1080' (F9)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      WordWrap = True
    end
    object BitBtn16: TBitBtn
      Left = 16
      Top = 199
      Width = 97
      Height = 97
      Action = KD3LCopyAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1076#1077#1090#1072#1083#1080' (F6)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      WordWrap = True
    end
    object BitBtn17: TBitBtn
      Left = 16
      Top = 302
      Width = 97
      Height = 97
      Action = KD3L1CopyAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1103#1095#1077#1081#1082#1091' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1076#1077#1090#1072#1083#1080' (F3)'
      Layout = blGlyphTop
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      WordWrap = True
    end
  end
  object KDGrid2: TDBGridEh
    Left = 8
    Top = 352
    Width = 467
    Height = 90
    AllowedOperations = [alopUpdateEh]
    DataSource = KD2Source
    DynProps = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu2
    RowHeight = 70
    RowSizingAllowed = True
    ShowHint = True
    SortLocal = True
    TabOrder = 4
    TitleParams.MultiTitle = True
    OnDblClick = KD2EditActionExecute
    OnDrawColumnCell = KDGrid2DrawColumnCell
    OnExit = KDGrid2Exit
    Columns = <
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        Footers = <>
        ReadOnly = True
        TextEditing = False
        Title.Caption = #1042#1083#1086#1078#1077#1085#1085#1099#1077
        Width = 100
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORDN'
        Footers = <>
        Title.Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 60
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'QUEUE'
        Footers = <>
        Title.Caption = #1054#1095#1077#1088#1077#1076#1100
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 47
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MARK'
        Footers = <>
        Title.Caption = #1052#1072#1088#1082#1072
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 57
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 115
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RKOEF'
        Footers = <>
        Title.Caption = #1056#1050
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 36
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MKGROUP_S'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1043#1088#1091#1087#1087#1072' '#1052'/'#1050
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 61
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'WEIGHT1'
        Footers = <>
        Title.Caption = #1042#1077#1089' 1 '#1096#1090'. '#1074' '#1090#1086#1085#1085#1072#1093
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'WEIGHTZ'
        Footers = <>
        Title.Caption = #1042#1077#1089' '#1079#1072#1075#1086#1090#1086#1074#1082#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 54
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DRAWING'
        Footers = <>
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 54
      end
      item
        DisplayFormat = 'dd/mm/yyyy'
        DynProps = <>
        EditButtons = <>
        FieldName = 'INPUTDATE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 115
        WordWrap = True
      end
      item
        DisplayFormat = 'dd/mm/yyyy'
        DynProps = <>
        EditButtons = <>
        FieldName = 'LUPDDATE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 117
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RECIPIENT_S'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 130
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SBORKA_NV'
        Footers = <>
        Title.Caption = #1057#1073#1086#1088#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 51
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SBORKA_PR'
        Footers = <>
        Title.Caption = #1057#1073#1086#1088#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 59
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SVARKA_WE'
        Footers = <>
        Title.Caption = #1057#1074#1072#1088#1082#1072'|'#1042#1077#1089' '#1101#1083#1077#1082#1090#1088#1086#1076#1086#1074
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SVARKA_M'
        Footers = <>
        Title.Caption = #1057#1074#1072#1088#1082#1072'|'#1052#1077#1090#1088#1072#1078
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 51
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownBox.AutoFitColWidths = False
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'T_SVARKA_CEQ'
        Footers = <>
        NotInKeyListIndex = 0
        Title.Caption = #1057#1074#1072#1088#1082#1072'|'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SVARKA_NV'
        Footers = <>
        Title.Caption = #1057#1074#1072#1088#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 48
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownBox.AutoFitColWidths = False
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'T_ZACHIST_CEQ'
        Footers = <>
        Title.Caption = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_ZACHIST_NV'
        Footers = <>
        Title.Caption = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 49
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_GRPOKR_GR'
        Footers = <>
        Title.Caption = #1043#1088#1091#1085#1090#1086#1074#1072#1085#1080#1077'/'#1055#1086#1082#1088#1072#1089#1082#1072'|1'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 56
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_GRPOKR_POKR'
        Footers = <>
        Title.Caption = #1043#1088#1091#1085#1090#1086#1074#1072#1085#1080#1077'/'#1055#1086#1082#1088#1072#1089#1082#1072'|2'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 51
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_GRPOKR_NV'
        Footers = <>
        Title.Caption = #1043#1088#1091#1085#1090#1086#1074#1072#1085#1080#1077'/'#1055#1086#1082#1088#1072#1089#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 51
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownBox.AutoFitColWidths = False
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'T_DOVODKA_CEQ'
        Footers = <>
        Title.Caption = #1044#1086#1074#1086#1076#1082#1072'|'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_DOVODKA_NV'
        Footers = <>
        Title.Caption = #1044#1086#1074#1086#1076#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_DOVODKA_PR'
        Footers = <>
        Title.Caption = #1044#1086#1074#1086#1076#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 65
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTROL'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1088#1086#1083#1100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object KDGrid3: TDBGridEh
    Left = 8
    Top = 448
    Width = 467
    Height = 193
    AllowedOperations = [alopUpdateEh]
    DataSource = KD3Source
    DynProps = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = PopupMenu3
    RowHeight = 70
    RowSizingAllowed = True
    ShowHint = True
    SortLocal = True
    TabOrder = 5
    TitleParams.MultiTitle = True
    OnColEnter = KDGrid3ColEnter
    OnDblClick = KD3EditActionExecute
    OnDrawColumnCell = KDGrid3DrawColumnCell
    OnExit = KDGrid3Exit
    Columns = <
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        Footers = <>
        ReadOnly = True
        TextEditing = False
        Title.Caption = #1042#1083#1086#1078#1077#1085#1085#1099#1077
        Width = 100
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'NUMP'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1076#1077#1090#1072#1083#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 51
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'CGRMATERIALS'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
        Title.ToolTips = True
        ToolTips = True
        Width = 152
        WordWrap = True
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_PROFNUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1087#1088#1086#1092#1080#1083#1103
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 51
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_STEELMARK'
        Footers = <>
        Title.Caption = #1052#1072#1088#1082#1072' '#1089#1090#1072#1083#1080
        Title.ToolTips = True
        ToolTips = True
        Width = 75
        WordWrap = True
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_NORMDOC0'
        Footers = <>
        Title.Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1089#1086#1088#1090#1072#1084#1077#1085#1090#1091
        Title.ToolTips = True
        ToolTips = True
        Width = 68
        WordWrap = True
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_NORMDOC1'
        Footers = <>
        Title.Caption = #1053#1086#1088#1084#1072#1090#1080#1074#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1091
        Title.ToolTips = True
        ToolTips = True
        Width = 70
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_LINEDENS'
        Footers = <>
        Title.Caption = #1051#1080#1085#1077#1081#1085#1072#1103' '#1087#1083#1086#1090#1085#1086#1089#1090#1100' ('#1082#1075'/'#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_PWIDTH1'
        Footers = <>
        Title.Caption = #1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'1 ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_PWIDTH2'
        Footers = <>
        Title.Caption = #1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'2 ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_SIZE1'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1088'1 ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_SIZE2'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1088'2 ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_WTHICK'
        Footers = <>
        Title.Caption = #1058#1086#1083#1097#1080#1085#1072' '#1089#1090#1077#1085#1082#1080' ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_SLENGTH'
        Footers = <>
        Title.Caption = #1044#1083#1080#1085#1072' ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_PROFTYPE'
        Footers = <>
        Title.Caption = #1042#1080#1076
        Title.ToolTips = True
        ToolTips = True
        WordWrap = True
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_FIXTYPE'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1082#1088#1077#1087#1077#1078#1072
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_CARVTYPE'
        Footers = <>
        Title.Caption = #1042#1080#1076' '#1088#1077#1079#1100#1073#1099
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_DIAM'
        Footers = <>
        Title.Caption = #1044#1080#1072#1084#1077#1090#1088' ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_STEP'
        Footers = <>
        Title.Caption = #1064#1072#1075' '#1088#1077#1079#1100#1073#1099
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_SIZE'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1088' ('#1084#1084')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_UW'
        Footers = <>
        Title.Caption = #1059#1076#1077#1083#1100#1085#1099#1081' '#1074#1077#1089' ('#1075'/'#1089#1084'3)'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'PROP_PROFILE'
        Footers = <>
        Title.Caption = #1055#1088#1086#1092#1080#1083#1100
        Title.ToolTips = True
        ToolTips = True
        Width = 75
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_THICK_C'
        Footers = <>
        Title.Caption = #1058#1086#1083#1097#1080#1085#1072
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_WIDTH_C'
        Footers = <>
        Title.Caption = #1064#1080#1088#1080#1085#1072
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PROP_LENGTH_C'
        Footers = <>
        Title.Caption = #1044#1083#1080#1085#1072
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'WEIGHT1'
        Footers = <>
        Title.Caption = #1042#1077#1089' '#1086#1076#1085#1086#1081' '#1096#1090#1091#1082#1080' '#1074' '#1082#1075
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'T_RAZMET_CEQ'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 92
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_RAZMET_NV'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 48
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_RAZMET_PR'
        Footers = <>
        Title.Caption = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 79
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownBox.AutoFitColWidths = False
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'T_REZKA_CEQ'
        Footers = <>
        Title.Caption = #1056#1077#1079#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 83
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_REZKA_M'
        Footers = <>
        Title.Caption = #1056#1077#1079#1082#1072'|'#1052#1077#1090#1088#1072#1078
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_REZKA_NV'
        Footers = <>
        Title.Caption = #1056#1077#1079#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_REZKA_PR'
        Footers = <>
        Title.Caption = #1056#1077#1079#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 80
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        DropDownBox.AutoFitColWidths = False
        DropDownRows = 20
        DropDownShowTitles = True
        DropDownSizing = True
        DropDownWidth = 300
        EditButtons = <>
        FieldName = 'T_ZACHIST_CTYPE'
        Footers = <>
        Title.Caption = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1057#1087#1086#1089#1086#1073
        Width = 116
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_ZACHIST_NV'
        Footers = <>
        Title.Caption = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 54
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_OTVERST_CEQ'
        Footers = <>
        Title.Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1052#1072#1096#1080#1085#1072
        Width = 85
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_OTVERST_DIAM'
        Footers = <>
        Title.Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1044#1080#1072#1084#1077#1090#1088
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 49
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_OTVERST_COUNT'
        Footers = <>
        Title.Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 59
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_OTVERST_NV'
        Footers = <>
        Title.Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 58
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_OTVERST_PR'
        Footers = <>
        Title.Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 73
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_STROZH_CEQ'
        Footers = <>
        Title.Caption = #1057#1090#1088#1086#1078#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 102
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_STROZH_M'
        Footers = <>
        Title.Caption = #1057#1090#1088#1086#1078#1082#1072'|'#1052#1077#1090#1088#1072#1078
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_STROZH_NV'
        Footers = <>
        Title.Caption = #1057#1090#1088#1086#1078#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 59
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_STROZH_PR'
        Footers = <>
        Title.Caption = #1057#1090#1088#1086#1078#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_GIBKA_CEQ'
        Footers = <>
        Title.Caption = #1043#1080#1073#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 102
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_GIBKA_NV'
        Footers = <>
        Title.Caption = #1043#1080#1073#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 54
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_GIBKA_PR'
        Footers = <>
        Title.Caption = #1043#1080#1073#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SHABLON_EQ_MODEL'
        Footers = <>
        Title.Caption = #1064#1072#1073#1083#1086#1085#1080#1088#1086#1074#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 102
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SHABLON_NV'
        Footers = <>
        Title.Caption = #1064#1072#1073#1083#1086#1085#1080#1088#1086#1074#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Width = 54
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_SHABLON_PRIM'
        Footers = <>
        Title.Caption = #1064#1072#1073#1083#1086#1085#1080#1088#1086#1074#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_PRAVKA_EQ_MODEL'
        Footers = <>
        Title.Caption = #1055#1088#1072#1074#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 102
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_PRAVKA_NV'
        Footers = <>
        Title.Caption = #1055#1088#1072#1074#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Width = 54
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_PRAVKA_PRIM'
        Footers = <>
        Title.Caption = #1055#1088#1072#1074#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_VALCOV_EQ_MODEL'
        Footers = <>
        Title.Caption = #1042#1072#1083#1100#1094#1086#1074#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 102
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_VALCOV_NV'
        Footers = <>
        Title.Caption = #1042#1072#1083#1100#1094#1086#1074#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Width = 54
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_VALCOV_PRIM'
        Footers = <>
        Title.Caption = #1042#1072#1083#1100#1094#1086#1074#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_REZKA2_EQ_MODEL'
        Footers = <>
        Title.Caption = #1050#1080#1089#1083'. '#1075#1072#1079#1086#1074#1072#1103' '#1088#1077#1079#1082#1072'|'#1052#1072#1096#1080#1085#1072
        Width = 102
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_REZKA2_NV'
        Footers = <>
        Title.Caption = #1050#1080#1089#1083'. '#1075#1072#1079#1086#1074#1072#1103' '#1088#1077#1079#1082#1072'|'#1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
        Width = 54
      end
      item
        ButtonStyle = cbsNone
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_REZKA2_PRIM'
        Footers = <>
        Title.Caption = #1050#1080#1089#1083'. '#1075#1072#1079#1086#1074#1072#1103' '#1088#1077#1079#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 120
      end
      item
        AutoFitColWidth = False
        DisplayFormat = 'dd/mm/yyyy'
        DynProps = <>
        EditButtons = <>
        FieldName = 'INPUTDATE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 68
        WordWrap = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 74
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTROL'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1088#1086#1083#1100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object InfoPanel2: TPanel
    Left = 0
    Top = 17
    Width = 681
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    DesignSize = (
      681
      57)
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 681
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1057#1087#1080#1089#1086#1082' '#1084#1072#1088#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 92
    end
    object f_ORDERNUM: TLabeledEdit
      Left = 16
      Top = 30
      Width = 89
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = #1079'-'#1079' '#8470' '#1052#1056#1050':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object f_INPUTDATE: TLabeledEdit
      Left = 233
      Top = 30
      Width = 129
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 96
      EditLabel.Height = 13
      EditLabel.Caption = #1076#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object f_CONTRACTOR_S: TLabeledEdit
      Left = 368
      Top = 30
      Width = 140
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = #1079#1072#1082#1072#1079#1095#1080#1082':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object f_ACTDATE: TLabeledEdit
      Left = 538
      Top = 30
      Width = 129
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 78
      EditLabel.Height = 13
      EditLabel.Caption = #1072#1082#1090#1091#1072#1083#1077#1085' '#1076#1086':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object f_ORDERNUM2_: TLabeledEdit
      Left = 119
      Top = 30
      Width = 89
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = #1079'-'#1079' '#8470' '#1062#1052#1050':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object InfoPanel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 7
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 681
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1090#1086#1088#1089#1082#1072#1103' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1094#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 218
    end
  end
  object InfoPanel3: TPanel
    Left = 0
    Top = 74
    Width = 681
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 8
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 681
      Height = 16
      Align = alTop
      Alignment = taCenter
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1077#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 122
    end
    object f_ORDERNUM_: TLabeledEdit
      Left = 16
      Top = 30
      Width = 89
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 64
      EditLabel.Height = 13
      EditLabel.Caption = #1079'-'#1079' '#8470' '#1052#1056#1050':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object f_ORDERNUM2: TLabeledEdit
      Left = 119
      Top = 30
      Width = 89
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = #1079'-'#1079' '#8470' '#1062#1052#1050':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object f_NUMP: TLabeledEdit
      Left = 214
      Top = 30
      Width = 107
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 102
      EditLabel.Height = 13
      EditLabel.Caption = #1058#1077#1082#1091#1097#1072#1103' '#1076#1077#1090#1072#1083#1100':'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -11
      EditLabel.Font.Name = 'Tahoma'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object ActionManager1: TActionManager
    Images = ImageList1
    Left = 568
    Top = 56
    StyleName = 'Platform Default'
    object KD2EditSPAction: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' (F10)'
      ImageIndex = 5
      OnExecute = KD2EditSPActionExecute
    end
    object KD2EditDetailsAction: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1086#1087#1080#1089#1072#1085#1080#1102' '#1076#1077#1090#1072#1083#1077#1081' (F12)'
      ImageIndex = 5
      OnExecute = KD2EditDetailsActionExecute
    end
    object KDEditMarksAction: TAction
      Caption = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1087#1080#1089#1082#1091' '#1084#1072#1088#1086#1082' (F10)'
      ImageIndex = 5
      OnExecute = KDEditMarksActionExecute
    end
    object KD3L1CopyAction: TAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1103#1095#1077#1081#1082#1091' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1076#1077#1090#1072#1083#1080' (F3)'
      ImageIndex = 9
      OnExecute = KD3L1CopyActionExecute
    end
    object KD3LCopyAction: TAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1080#1079' '#1087#1088#1077#1076#1099#1076#1091#1097#1077#1081' '#1076#1077#1090#1072#1083#1080' (F6)'
      ImageIndex = 9
      OnExecute = KD3LCopyActionExecute
    end
    object KD3CopyAction: TAction
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1080#1079' '#1076#1088#1091#1075#1086#1081' '#1076#1077#1090#1072#1083#1080' (F9)'
      ImageIndex = 9
      OnExecute = KD3CopyActionExecute
    end
    object KD3AppendAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1076#1077#1090#1072#1083#1100' (F7)'
      ImageIndex = 6
      OnExecute = KD3AppendActionExecute
    end
    object KD2AppendAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1084#1072#1088#1082#1091' (F7)'
      ImageIndex = 6
      OnExecute = KD2AppendActionExecute
    end
    object KDAppendAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1079#1072#1082#1072#1079' (F7)'
      ImageIndex = 6
      OnExecute = KDAppendActionExecute
    end
    object KD3DelAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080' (Delete)'
      ImageIndex = 4
      OnExecute = KD3DelActionExecute
    end
    object KD2DelAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1088#1082#1091' (Delete)'
      ImageIndex = 4
      OnExecute = KD2DelActionExecute
    end
    object KDDelAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1082#1072#1079' (Delete)'
      ImageIndex = 4
      OnExecute = KDDelActionExecute
    end
    object KD3EditAction: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1090#1072#1083#1100' (F4)'
      ImageIndex = 1
      OnExecute = KD3EditActionExecute
    end
    object KD2EditAction: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1084#1072#1088#1082#1091' (F4)'
      ImageIndex = 1
      OnExecute = KD2EditActionExecute
    end
    object KD3ESCAction: TAction
      Caption = #1053#1072#1079#1072#1076' '#1082' '#1089#1087#1080#1089#1082#1091' '#1084#1072#1088#1086#1082' (ESC)'
      ImageIndex = 7
      OnExecute = KD3ESCActionExecute
    end
    object KD2ESCAction: TAction
      Caption = #1053#1072#1079#1072#1076' '#1082' '#1089#1087#1080#1089#1082#1091' '#1079#1072#1082#1072#1079#1086#1074' (ESC)'
      ImageIndex = 7
      OnExecute = KD2ESCActionExecute
    end
    object KDEditAction: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079' (F4)'
      ImageIndex = 1
      OnExecute = KDEditActionExecute
    end
    object KD1SetFilterAction: TAction
      Caption = #1060#1080#1083#1100#1090#1088' (F2)'
      ImageIndex = 3
      OnExecute = KD1SetFilterActionExecute
    end
    object KDReportAction: TAction
      Caption = #1055#1077#1095#1072#1090#1100' (Ctrl-P)'
      ImageIndex = 0
      OnExecute = KDReportActionExecute
    end
  end
  object KD1Source: TDataSource
    DataSet = KD1ADOQ
    OnDataChange = KD1SourceDataChange
    Left = 608
    Top = 376
  end
  object KD1ADOQ: TADOQuery
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    Left = 664
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 344
    Top = 112
    object F101: TMenuItem
      Action = KDEditMarksAction
    end
    object N1: TMenuItem
      Action = KDAppendAction
    end
    object N2: TMenuItem
      Action = KDEditAction
    end
    object N3: TMenuItem
      Action = KDDelAction
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object F21: TMenuItem
      Action = KD1SetFilterAction
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object CtrlP1: TMenuItem
      Action = KDReportAction
    end
  end
  object KD2ADOQ: TADOQuery
    BeforeOpen = BeforeOpen
    BeforePost = KD2ADOQBeforePost
    EnableBCD = False
    Parameters = <>
    Left = 664
    Top = 432
  end
  object KD2Source: TDataSource
    DataSet = KD2ADOQ
    OnDataChange = KD2SourceDataChange
    Left = 608
    Top = 432
  end
  object KD3ADOQ: TADOQuery
    MarshalOptions = moMarshalModifiedOnly
    BeforeOpen = BeforeOpen
    BeforePost = KD3ADOQBeforePost
    EnableBCD = False
    Parameters = <
      item
        Name = 'CKD'
        DataType = ftFloat
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM CMKNEW.DETAILS'
      'WHERE CKD = :CKD')
    Left = 664
    Top = 488
    object KD3ADOQPROP_STEELMARK: TFloatField
      FieldName = 'PROP_STEELMARK'
    end
    object KD3ADOQPROP_NORMDOC0: TFloatField
      FieldName = 'PROP_NORMDOC0'
    end
    object KD3ADOQPROP_NORMDOC1: TFloatField
      FieldName = 'PROP_NORMDOC1'
    end
    object KD3ADOQPROP_LINEDENS: TFloatField
      FieldName = 'PROP_LINEDENS'
    end
    object KD3ADOQPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object KD3ADOQPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object KD3ADOQPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object KD3ADOQPROP_PROFTYPE: TFloatField
      FieldName = 'PROP_PROFTYPE'
    end
    object KD3ADOQPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object KD3ADOQPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object KD3ADOQPROP_UW: TFloatField
      FieldName = 'PROP_UW'
    end
    object KD3ADOQPROP_PROFILE: TFloatField
      FieldName = 'PROP_PROFILE'
    end
    object KD3ADOQPROP_THICK: TFloatField
      FieldName = 'PROP_THICK'
    end
    object KD3ADOQPROP_WIDTH: TFloatField
      FieldName = 'PROP_WIDTH'
    end
    object KD3ADOQPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object KD3ADOQPROP_LENGTH: TFloatField
      FieldName = 'PROP_LENGTH'
    end
    object KD3ADOQPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object KD3ADOQPROP_SLENGTH: TFloatField
      FieldName = 'PROP_SLENGTH'
    end
    object KD3ADOQCMARK: TFloatField
      FieldName = 'CMARK'
    end
    object KD3ADOQCARRIVAL: TFloatField
      FieldName = 'CARRIVAL'
    end
    object KD3ADOQWEIGHT1: TFloatField
      FieldName = 'WEIGHT1'
    end
    object KD3ADOQT_REZKA_CEQ: TFloatField
      FieldName = 'T_REZKA_CEQ'
    end
    object KD3ADOQT_REZKA_M: TFloatField
      FieldName = 'T_REZKA_M'
    end
    object KD3ADOQT_REZKA_NV: TFloatField
      FieldName = 'T_REZKA_NV'
    end
    object KD3ADOQT_REZKA_PR: TStringField
      FieldName = 'T_REZKA_PR'
      Size = 255
    end
    object KD3ADOQT_ZACHIST_CTYPE: TFloatField
      FieldName = 'T_ZACHIST_CTYPE'
    end
    object KD3ADOQT_ZACHIST_NV: TFloatField
      FieldName = 'T_ZACHIST_NV'
    end
    object KD3ADOQT_OTVERST_CEQ: TFloatField
      FieldName = 'T_OTVERST_CEQ'
    end
    object KD3ADOQT_OTVERST_DIAM: TStringField
      FieldName = 'T_OTVERST_DIAM'
      Size = 100
    end
    object KD3ADOQT_OTVERST_COUNT: TFloatField
      FieldName = 'T_OTVERST_COUNT'
    end
    object KD3ADOQT_OTVERST_NV: TFloatField
      FieldName = 'T_OTVERST_NV'
    end
    object KD3ADOQT_OTVERST_PR: TStringField
      FieldName = 'T_OTVERST_PR'
      Size = 255
    end
    object KD3ADOQT_STROZH_CEQ: TFloatField
      FieldName = 'T_STROZH_CEQ'
    end
    object KD3ADOQT_STROZH_M: TFloatField
      FieldName = 'T_STROZH_M'
    end
    object KD3ADOQT_STROZH_NV: TFloatField
      FieldName = 'T_STROZH_NV'
    end
    object KD3ADOQT_STROZH_PR: TStringField
      FieldName = 'T_STROZH_PR'
      Size = 255
    end
    object KD3ADOQT_GIBKA_CEQ: TFloatField
      FieldName = 'T_GIBKA_CEQ'
    end
    object KD3ADOQT_GIBKA_NV: TFloatField
      FieldName = 'T_GIBKA_NV'
    end
    object KD3ADOQT_GIBKA_PR: TStringField
      FieldName = 'T_GIBKA_PR'
      Size = 255
    end
    object KD3ADOQINPUTDATE: TDateTimeField
      FieldName = 'INPUTDATE'
    end
    object KD3ADOQPRIM: TStringField
      FieldName = 'PRIM'
      Size = 255
    end
    object KD3ADOQPROP_STEELMARK_C: TStringField
      FieldName = 'PROP_STEELMARK_C'
      Size = 50
    end
    object KD3ADOQPROP_NORMDOC0_C: TStringField
      FieldName = 'PROP_NORMDOC0_C'
      Size = 100
    end
    object KD3ADOQPROP_NORMDOC1_C: TStringField
      FieldName = 'PROP_NORMDOC1_C'
      Size = 100
    end
    object KD3ADOQPROP_PROFTYPE_C: TStringField
      FieldName = 'PROP_PROFTYPE_C'
      Size = 255
    end
    object KD3ADOQPROP_PROFILE_C: TStringField
      FieldName = 'PROP_PROFILE_C'
      Size = 100
    end
    object KD3ADOQPROP_THICK_C: TFloatField
      FieldName = 'PROP_THICK_C'
    end
    object KD3ADOQPROP_WIDTH_C: TFloatField
      FieldName = 'PROP_WIDTH_C'
    end
    object KD3ADOQPROP_LENGTH_C: TFloatField
      FieldName = 'PROP_LENGTH_C'
    end
    object KD3ADOQT_REZKA_EQ_S: TStringField
      FieldName = 'T_REZKA_EQ_S'
      Size = 255
    end
    object KD3ADOQT_ZACHIST_TYPE_S: TStringField
      FieldName = 'T_ZACHIST_TYPE_S'
      Size = 255
    end
    object KD3ADOQT_OTVERST_EQ_S: TStringField
      FieldName = 'T_OTVERST_EQ_S'
      Size = 255
    end
    object KD3ADOQT_STROZH_EQ_S: TStringField
      FieldName = 'T_STROZH_EQ_S'
      Size = 255
    end
    object KD3ADOQT_GIBKA_EQ_S: TStringField
      FieldName = 'T_GIBKA_EQ_S'
      Size = 255
    end
    object KD3ADOQPROP_PROFNUM: TStringField
      FieldName = 'PROP_PROFNUM'
    end
    object KD3ADOQCKD: TFloatField
      FieldName = 'CKD'
    end
    object KD3ADOQCGRMATERIALS: TFloatField
      FieldName = 'CGRMATERIALS'
    end
    object KD3ADOQGRMATERIALS_S: TStringField
      FieldName = 'GRMATERIALS_S'
      Size = 255
    end
    object KD3ADOQNUMP: TStringField
      FieldName = 'NUMP'
    end
    object KD3ADOQT_RAZMET_CEQ: TFloatField
      FieldName = 'T_RAZMET_CEQ'
    end
    object KD3ADOQT_RAZMET_EQ_S: TStringField
      FieldName = 'T_RAZMET_EQ_S'
      Size = 255
    end
    object KD3ADOQT_RAZMET_NV: TFloatField
      FieldName = 'T_RAZMET_NV'
    end
    object KD3ADOQT_RAZMET_PR: TStringField
      FieldName = 'T_RAZMET_PR'
      Size = 255
    end
    object KD3ADOQPROP_FIXTYPE: TFloatField
      FieldName = 'PROP_FIXTYPE'
    end
    object KD3ADOQPROP_CARVTYPE: TFloatField
      FieldName = 'PROP_CARVTYPE'
    end
    object KD3ADOQPROP_STEP: TFloatField
      FieldName = 'PROP_STEP'
    end
    object KD3ADOQPROP_FIXTYPE_C: TStringField
      FieldName = 'PROP_FIXTYPE_C'
      Size = 255
    end
    object KD3ADOQPROP_CARVTYPE_C: TStringField
      FieldName = 'PROP_CARVTYPE_C'
      Size = 255
    end
    object KD3ADOQCONTROL: TStringField
      FieldName = 'CONTROL'
      Size = 33
    end
    object KD3ADOQNREC: TFloatField
      AutoGenerateValue = arAutoInc
      FieldName = 'NREC'
    end
    object KD3ADOQT_SHABLON_EQ: TFloatField
      FieldName = 'T_SHABLON_EQ'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_SHABLON_EQ_MODEL: TStringField
      DisplayLabel = #1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_SHABLON_EQ_MODEL'
      LookupDataSet = EquipmentADOQ
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_SHABLON_EQ'
      Size = 255
      Lookup = True
    end
    object KD3ADOQT_SHABLON_NV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'T_SHABLON_NV'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_SHABLON_PRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_SHABLON_PRIM'
      OnChange = LookupFieldChange
      Size = 255
    end
    object KD3ADOQT_PRAVKA_EQ: TFloatField
      FieldName = 'T_PRAVKA_EQ'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_PRAVKA_EQ_MODEL: TStringField
      DisplayLabel = #1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_PRAVKA_EQ_MODEL'
      LookupDataSet = EquipmentADOQ
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_PRAVKA_EQ'
      Size = 255
      Lookup = True
    end
    object KD3ADOQT_PRAVKA_NV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'T_PRAVKA_NV'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_PRAVKA_PRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_PRAVKA_PRIM'
      OnChange = LookupFieldChange
      Size = 255
    end
    object KD3ADOQT_VALCOV_EQ: TFloatField
      FieldName = 'T_VALCOV_EQ'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_VALCOV_EQ_MODEL: TStringField
      DisplayLabel = #1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_VALCOV_EQ_MODEL'
      LookupDataSet = EquipmentADOQ
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_VALCOV_EQ'
      Size = 255
      Lookup = True
    end
    object KD3ADOQT_VALCOV_NV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'T_VALCOV_NV'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_VALCOV_PRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_VALCOV_PRIM'
      OnChange = LookupFieldChange
      Size = 255
    end
    object KD3ADOQT_REZKA2_EQ: TFloatField
      FieldName = 'T_REZKA2_EQ'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_REZKA2_EQ_MODEL: TStringField
      DisplayLabel = #1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_REZKA2_EQ_MODEL'
      LookupDataSet = EquipmentADOQ
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_REZKA2_EQ'
      Size = 255
      Lookup = True
    end
    object KD3ADOQT_REZKA2_NV: TFloatField
      DisplayLabel = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080
      FieldName = 'T_REZKA2_NV'
      OnChange = LookupFieldChange
    end
    object KD3ADOQT_REZKA2_PRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_REZKA2_PRIM'
      OnChange = LookupFieldChange
      Size = 255
    end
  end
  object KD3Source: TDataSource
    DataSet = KD3ADOQ
    OnDataChange = KD3SourceDataChange
    Left = 608
    Top = 488
  end
  object PopupMenu2: TPopupMenu
    Images = ImageList1
    Left = 384
    Top = 112
    object MenuItem1: TMenuItem
      Action = KD2EditDetailsAction
    end
    object MenuItem2: TMenuItem
      Action = KD2AppendAction
    end
    object MenuItem3: TMenuItem
      Action = KD2EditAction
    end
  end
  object PopupMenu3: TPopupMenu
    Images = ImageList1
    Left = 432
    Top = 112
    object F71: TMenuItem
      Action = KD3AppendAction
    end
    object F91: TMenuItem
      Action = KD3CopyAction
    end
    object F61: TMenuItem
      Action = KD3LCopyAction
    end
    object F31: TMenuItem
      Action = KD3L1CopyAction
    end
    object F41: TMenuItem
      Action = KD3EditAction
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Delete1: TMenuItem
      Action = KD3DelAction
    end
  end
  object ImageList1: TImageList
    Left = 288
    Top = 184
    Bitmap = {
      494C01010A000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080008080
      8000808080008080800080808000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00800000008000
      000080000000800000008000000080000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00800000008000
      000080000000800000008000000080000000FFFFFF0000000000800000008000
      00008000000080000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000FFFFFF00800000008000
      000080000000800000008000000080000000FFFFFF0000000000800000008000
      00008000000080000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00800000008000
      0000FFFFFF000000000000000000000000000000000000000000800000008000
      00008000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      00008000000080000000800000008000000000000000FFFFFF00800000008000
      0000FFFFFF0000000000FFFFFF0000FFFF000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080800000000000008000000080000000800000008000
      00008000000080000000800000008000000000000000FFFFFF00FFFFFF0000FF
      FF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF008000000080000000FFFFFF000000
      0000FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      FF00FFFFFF000000000000000000000000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      000080808000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000800000008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000000000000000
      00008080800000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000FFFFFF0080808000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000800000008000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF008080
      800000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000800000008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008080800000FF
      FF008080800000FFFF008080800000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000808080000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008080800000FFFF000000
      000080808000FFFFFF00000000008080800000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      00008080800000FFFF00000000000000000080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000008000808080000000000000000000000000000000
      0000000000000000000000000000808080000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000008000000080008080800000000000000000000000
      0000000000000000000000008000808080000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0
      C00000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000080808000000080000000800000000000000000000000
      0000000000008080800000008000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000FF000000FF000000FF00C0C0C000C0C0
      C00000000000C0C0C0000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000080000000800080808000000000000000
      0000000080000000800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C00000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000808080000000800000008000808080008080
      8000000080000000800000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C00000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000800000008000000080000000
      8000000080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C0000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000008000000080000000
      8000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C0000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000008080000080808000808080000000800000008000000080000000
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000008080000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000800000008000000080000000800000000000000000000000
      8000000080008080800000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000FFFFFF000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      0000000080000000800080808000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      000000000000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000080800000000000000000000000000000000000000000
      0000000000000000800000008000000000000000000000000000000000000000
      0000000000000000000080800000000000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000080800000FFFF
      FF00FFFFFF000000000000000000000000008080000000000000000000000000
      000000000000000000000000000000000000000000000000000080800000FFFF
      FF00FFFFFF000000000000000000000000008080000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFC03F00000000F800001F00000000
      F954000000000000FAA2000000000000F940000000000000FA22000000000000
      F954000000000000FAA2000000000000F140000000000000F022000000000000
      F554000000000000F400000000000000EC00000000000000DE7F000100000000
      873FFC0300000000001FFC0700000000FFFFFFFFF801FFFFFFFCFFFFF801FFFF
      F3FFC000F801FFFFE1F9FFFFF801FFFFE1F3C000F801FFFFF0E3FFFFF801FFE7
      F847C000B001C1F3FC0FFFFFB001C3FBFE1FC000E001C7FBFC0FFFFF8203CBFB
      F84FC0008007DCF3E0E3FFFFC00FFF07C1F1C000927FFFFFC7F8FFFFB33FFFFF
      FFFFFFFFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFC00FFFFFFFFC007FC00FFFFF800
      80032000FCFEF95400010000FC7CFAA200010000FC79F94000010000FE31FA22
      00000000FE03F95400000000FF07FAA280000000F10FF140C0000000F007F022
      E001E000F063F554E007F800F1F1F400F007F000ECF9EC00F003E001DE7FDE7F
      F803C403873F873FFFFFEC07001F001F00000000000000000000000000000000
      000000000000}
  end
  object EquipmentADOQ: TADOQuery
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'Select * from CMKNEW.EQUIPMENT')
    Left = 336
    Top = 528
    object EquipmentADOQNREC: TFloatField
      FieldName = 'NREC'
    end
    object EquipmentADOQACTIVE: TFloatField
      FieldName = 'ACTIVE'
    end
    object EquipmentADOQFREQ: TFloatField
      FieldName = 'FREQ'
    end
    object EquipmentADOQNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object EquipmentADOQINVNUM: TFloatField
      FieldName = 'INVNUM'
    end
    object EquipmentADOQCEHNUM: TStringField
      FieldName = 'CEHNUM'
      Size = 12
    end
    object EquipmentADOQPYEAR: TFloatField
      FieldName = 'PYEAR'
    end
    object EquipmentADOQMODEL: TStringField
      FieldName = 'MODEL'
      Size = 255
    end
    object EquipmentADOQCSITE: TFloatField
      FieldName = 'CSITE'
    end
    object EquipmentADOQOPERATIONS: TStringField
      FieldName = 'OPERATIONS'
      Size = 255
    end
  end
  object OperationsADOQ: TADOQuery
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'Select * from CMKNEW.Operations')
    Left = 336
    Top = 576
    object OperationsADOQNREC: TFloatField
      FieldName = 'NREC'
    end
    object OperationsADOQACTIVE: TFloatField
      FieldName = 'ACTIVE'
    end
    object OperationsADOQFREQ: TFloatField
      FieldName = 'FREQ'
    end
    object OperationsADOQNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
  end
end
