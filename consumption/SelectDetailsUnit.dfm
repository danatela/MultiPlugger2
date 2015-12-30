object SelectDetailsForm: TSelectDetailsForm
  Left = 0
  Top = 0
  Caption = #1059#1082#1072#1078#1080#1090#1077' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1085#1099#1077' '#1076#1077#1090#1072#1083#1080
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
  WindowState = wsMaximized
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
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
    Top = 0
    Width = 880
    Height = 562
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spplansGrid: TDBGridEh
      Left = 0
      Top = 0
      Width = 880
      Height = 562
      Align = alClient
      AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
      AutoFitColWidths = True
      DataSource = DS
      DynProps = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterParams.Color = clWindow
      IndicatorOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      ParentShowHint = False
      RowSizingAllowed = True
      ShowHint = True
      SortLocal = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnKeyDown = spplansGridKeyDown
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATEIZG'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
          Width = 81
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'pmonth'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1083#1072#1085'|'#1084#1077#1089#1103#1094
          Width = 50
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'pyear'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1083#1072#1085'|'#1075#1086#1076
          Width = 50
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1079#1072#1082#1072#1079' '#8470' '#1052#1056#1050
          Width = 88
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1079#1072#1082#1072#1079' '#8470' '#1062#1052#1050
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1085#1086#1084#1077#1088' '#1087#1086#1088#1103#1076#1082#1086#1074#1099#1081
          Width = 81
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MARK_S'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1052#1072#1088#1082#1072'|'#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          Width = 148
        end
        item
          Alignment = taCenter
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'SPPLKOLSHT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1052#1072#1088#1082#1072'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' ('#1096#1090#1091#1082')'
          Width = 79
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = 'NUMP'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1053#1086#1084#1077#1088' '#1076#1077#1090#1072#1083#1080
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'DETAILS_S'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
        end
        item
          Alignment = taRightJustify
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOLSHTP'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1083#1072#1085#1086#1074#1086#1077
        end
        item
          Alignment = taRightJustify
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOLSHTF'
          Footers = <>
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077
        end
        item
          Alignment = taCenter
          DisplayFormat = '0.000'
          DynProps = <>
          EditButtons = <>
          FieldName = 'WEIGHT1'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1058#1077#1086#1088'.'#1074#1077#1089' 1 '#1096#1090'.'
        end
        item
          Alignment = taRightJustify
          DisplayFormat = '0.00000000'
          DynProps = <>
          EditButtons = <>
          FieldName = 'WEIGHT1F'
          Footers = <>
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1060#1072#1082#1090'.'#1074#1077#1089' 1 '#1096#1090'.'
        end
        item
          Alignment = taRightJustify
          DisplayFormat = '0.00000000'
          DynProps = <>
          EditButtons = <>
          FieldName = 'WEIGHT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1077#1090#1072#1083#1100'|'#1054#1073#1097#1080#1081' '#1074#1077#1089' '#1076#1077#1090#1072#1083#1077#1081
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object DS: TDataSource
    DataSet = MTE
    Left = 680
    Top = 24
  end
  object MTE: TMemTableEh
    Params = <>
    BeforePost = MTEBeforePost
    Left = 624
    Top = 128
  end
end
