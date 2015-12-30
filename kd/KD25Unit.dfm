object KD25Form: TKD25Form
  Left = 0
  Top = 0
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103
  ClientHeight = 372
  ClientWidth = 747
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 747
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      747
      46)
    object BitBtn1: TBitBtn
      Left = 591
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'OK'
      Default = True
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
  end
  object InfoPanel3: TPanel
    Left = 0
    Top = 0
    Width = 747
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      747
      57)
    object f_ORDERNUM: TLabeledEdit
      Left = 16
      Top = 19
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
      Top = 19
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
    object f_ORDN: TLabeledEdit
      Left = 214
      Top = 19
      Width = 83
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 77
      EditLabel.Height = 13
      EditLabel.Caption = #1087#1086#1088#1103#1076#1082#1086#1074#1099#1081':'
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
    object f_MARK: TLabeledEdit
      Left = 303
      Top = 19
      Width = 106
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #1084#1072#1088#1082#1072':'
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
    object f_NAME: TLabeledEdit
      Left = 415
      Top = 19
      Width = 103
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 86
      EditLabel.Height = 13
      EditLabel.Caption = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
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
    object f_WEIGHT1: TLabeledEdit
      Left = 524
      Top = 19
      Width = 75
      Height = 21
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 75
      EditLabel.Height = 13
      EditLabel.Caption = #1074#1077#1089' 1 '#1096#1090'. '#1074' '#1090':'
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
      TabOrder = 5
    end
    object f_DRAWING: TLabeledEdit
      Left = 616
      Top = 19
      Width = 120
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      EditLabel.Width = 49
      EditLabel.Height = 13
      EditLabel.Caption = #1095#1077#1088#1090#1077#1078':'
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
      TabOrder = 6
    end
  end
  object SPGrid: TDBGridEh
    Left = 0
    Top = 57
    Width = 747
    Height = 244
    Align = alClient
    AutoFitColWidths = True
    DataSource = DMARKSDS
    DynProps = <>
    FooterRowCount = 1
    FooterParams.Color = clWindow
    IndicatorOptions = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghColumnResize, dghColumnMove, dghExtendVertLines]
    PopupMenu = DMarksPopupMenu
    SortLocal = True
    SumList.Active = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    Columns = <
      item
        Alignment = taCenter
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'NUMP'
        Footer.DisplayFormat = '0'
        Footer.FieldName = 'NUM'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '#1087#1086#1088#1103#1076#1082#1086#1074#1099#1081
        Width = 113
      end
      item
        Alignment = taCenter
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'NUMCOUNT'
        Footer.DisplayFormat = '0'
        Footer.FieldName = 'NUMCOUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 85
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'WEIGHT1'
        Footer.FieldName = 'WEIGHT1'
        Footer.ToolTips = True
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1042#1077#1089' 1 '#1096#1090'. '#1074' '#1082#1075
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 67
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'WEIGHT'
        Footer.FieldName = 'WEIGHT'
        Footer.ToolTips = True
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089' '#1074' '#1082#1075
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 68
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'INPUTDATE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103
        Width = 169
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 324
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 301
    Width = 747
    Height = 25
    DataSource = DMARKSDS
    Align = alBottom
    Kind = dbnHorizontal
    TabOrder = 3
  end
  object DMARKSADOQ: TADOQuery
    BeforePost = DMARKSADOQBeforePost
    Parameters = <>
    Left = 488
    Top = 224
  end
  object DMARKSDS: TDataSource
    DataSet = DMARKSADOQ
    Left = 552
    Top = 224
  end
  object DMarksPopupMenu: TPopupMenu
    OnPopup = DMarksPopupMenuPopup
    Left = 64
    Top = 8
    object Freeze: TMenuItem
      Caption = #1047#1072#1084#1086#1088#1086#1079#1080#1090#1100
      OnClick = FreezeClick
    end
    object Defrost: TMenuItem
      Caption = #1056#1072#1079#1084#1086#1088#1086#1079#1080#1090#1100
      OnClick = DefrostClick
    end
  end
end
