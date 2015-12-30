object SelectSpPlansForm: TSelectSpPlansForm
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086#1079#1080#1094#1080#1102' '#1087#1083#1072#1085#1072
  ClientHeight = 608
  ClientWidth = 880
  Color = clBtnFace
  Constraints.MinHeight = 231
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
  object Splitter1: TSplitter
    Left = 0
    Top = 120
    Width = 880
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 442
  end
  object Panel1: TPanel
    Left = 0
    Top = 562
    Width = 880
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      880
      46)
    object ImportBtn: TBitBtn
      Left = 547
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
      Left = 724
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
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
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 123
    Width = 880
    Height = 439
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spplansGrid: TDBGridEh
      Left = 0
      Top = 0
      Width = 880
      Height = 439
      Align = alClient
      AutoFitColWidths = True
      DataSource = spplansDS
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      RowSizingAllowed = True
      ShowHint = True
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnDblClick = spplansGridDblClick
      OnKeyDown = spplansGridKeyDown
      Columns = <
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM'
          Footers = <>
          Title.Caption = #1079#1072#1082#1072#1079' '#8470' '#1052#1056#1050
          Width = 88
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
          Title.Caption = #1079#1072#1082#1072#1079' '#8470' '#1062#1052#1050
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
          Title.Caption = #1085#1086#1084#1077#1088' '#1087#1086#1088#1103#1076#1082#1086#1074#1099#1081
          Width = 81
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'TITLE'
          Footers = <>
          Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 148
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOLSHT'
          Footers = <>
          Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' ('#1096#1090#1091#1082')'
          Width = 79
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'WEIGHT'
          Footers = <>
          Title.Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089
          Width = 77
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PRIM'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 114
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object PlansDBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 880
    Height = 120
    Align = alTop
    DataSource = PlansDS
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 2
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MONTH'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PYEAR'
        Footers = <>
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Width = 596
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object spplansADOQ: TADOQuery
    Parameters = <>
    Left = 336
    Top = 256
  end
  object spplansDS: TDataSource
    DataSet = spplansADOQ
    Left = 448
    Top = 256
  end
  object PlansDS: TDataSource
    DataSet = PlansADOT
    Left = 168
    Top = 64
  end
  object PlansADOT: TADOTable
    CursorType = ctStatic
    AfterScroll = PlansADOTAfterScroll
    OnCalcFields = PlansADOTCalcFields
    IndexFieldNames = 'PYEAR;PMONTH'
    TableDirect = True
    TableName = 'CMKNEW.PLANS'
    Left = 256
    Top = 56
    object PlansADOTNREC: TFloatField
      FieldName = 'NREC'
    end
    object PlansADOTPYEAR: TFMTBCDField
      DisplayLabel = #1043#1086#1076
      FieldName = 'PYEAR'
      Precision = 38
      Size = 0
    end
    object PlansADOTPMONTH: TFMTBCDField
      FieldName = 'PMONTH'
      Precision = 38
      Size = 0
    end
    object PlansADOTPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 255
    end
    object PlansADOTPPONREC: TFloatField
      FieldName = 'PPONREC'
    end
    object PlansADOTORAUSER: TStringField
      FieldName = 'ORAUSER'
    end
    object PlansADOTMONTH: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldKind = fkCalculated
      FieldName = 'MONTH'
      Size = 10
      Calculated = True
    end
  end
end
