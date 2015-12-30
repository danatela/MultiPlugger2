object ImportPlanForm: TImportPlanForm
  Left = 221
  Top = 142
  Caption = #1048#1084#1087#1086#1088#1090' '#1087#1083#1072#1085#1086#1074
  ClientHeight = 564
  ClientWidth = 636
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LevelDockTabSet: TDockTabSet
    Left = 0
    Top = 0
    Width = 636
    Height = 21
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    SoftTop = True
    Style = tsModernTabs
    Tabs.Strings = (
      #1048#1084#1087#1086#1088#1090
      #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1087#1083#1072#1085)
    TabIndex = 2
    TabPosition = tpTop
    OnChange = LevelDockTabSetChange
  end
  object EnhPlanPanel: TPanel
    Left = 0
    Top = 21
    Width = 636
    Height = 543
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object RightEPPanel: TPanel
      Left = 445
      Top = 0
      Width = 191
      Height = 543
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BackBitBtn: TBitBtn
        Left = 6
        Top = 32
        Width = 179
        Height = 88
        Caption = #1050' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1102' (Esc)'
        TabOrder = 0
        OnClick = GoBack
      end
      object FillPlanBitBtn: TBitBtn
        Left = 6
        Top = 126
        Width = 179
        Height = 89
        Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1077' '#1087#1083#1072#1085#1072
        TabOrder = 1
        OnClick = FillPlanBitBtnClick
      end
      object EnhPlanCoolBar: TCoolBar
        Left = 0
        Top = 0
        Width = 191
        Height = 22
        AutoSize = True
        BandBorderStyle = bsNone
        Bands = <
          item
            Control = EnhPlanToolBar
            ImageIndex = -1
            MinHeight = 22
            Width = 189
          end>
        EdgeInner = esNone
        EdgeOuter = esNone
        object EnhPlanToolBar: TToolBar
          Left = 11
          Top = 0
          Width = 180
          Height = 22
          Caption = 'EditToolBar'
          Images = IPImageList
          TabOrder = 0
          object EPSumToolButton: TToolButton
            Left = 0
            Top = 0
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = False
            Style = tbsCheck
            OnClick = EPSumToolButtonClick
          end
        end
      end
    end
    object ClientEPPanel: TPanel
      Left = 0
      Top = 0
      Width = 445
      Height = 543
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object EPSplitter: TSplitter
        Left = 0
        Top = 221
        Width = 445
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = -6
        ExplicitTop = 47
        ExplicitWidth = 466
      end
      object DMarksDBGridEh: TDBGridEh
        Left = 0
        Top = 224
        Width = 445
        Height = 298
        Align = alClient
        DataSource = DMarksDataSource
        DynProps = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        FooterRowCount = 1
        FooterParams.Color = clWindow
        IndicatorOptions = [gioShowRowIndicatorEh]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        RowHeight = 50
        SortLocal = True
        STFilter.Local = True
        STFilter.Location = stflInTitleFilterEh
        STFilter.Visible = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDERNUM2'
            Footer.Value = #1050#1086#1083'-'#1074#1086':'
            Footer.ValueType = fvtStaticText
            Footers = <>
            TextEditing = False
            Title.TitleButton = True
            Width = 62
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NUMP'
            Footer.ValueType = fvtCount
            Footers = <>
            TextEditing = False
            Title.TitleButton = True
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GRMATERIALS_S'
            Footer.Value = #1048#1090#1086#1075#1080':'
            Footer.ValueType = fvtStaticText
            Footers = <>
            TextEditing = False
            Width = 147
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NUMCOUNT'
            Footer.ValueType = fvtSum
            Footers = <>
            TextEditing = False
            Width = 70
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WEIGHT1'
            Footer.ValueType = fvtAvg
            Footers = <>
            TextEditing = False
            Title.Caption = #1042#1077#1089' '#1074' '#1082#1075'|1'#1096#1090
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WEIGHT'
            Footer.ValueType = fvtSum
            Footers = <>
            TextEditing = False
            Title.Caption = #1042#1077#1089' '#1074' '#1082#1075'|'#1086#1073#1097'.'
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_STEELMARK_C'
            Footers = <>
            TextEditing = False
            Width = 97
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            DynProps = <>
            EditButtons = <>
            FieldName = 'RAZMET'
            Footers = <>
            Title.Caption = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1086#1087#1080#1089#1072#1085#1080#1077
            OnEditButtonClick = EditButtonClick
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RAZMETDATE'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RAZMETPERSON'
            Footers = <>
            Width = 124
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RAZMETKOL'
            Footers = <>
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            DynProps = <>
            EditButtons = <>
            FieldName = 'REZKA'
            Footers = <>
            Tag = 1
            Title.Caption = #1056#1077#1079#1082#1072'|'#1086#1087#1080#1089#1072#1085#1080#1077
            Width = 130
            OnEditButtonClick = EditButtonClick
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TRIMDATE'
            Footers = <>
            Tag = 1
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TRIMMED'
            Footers = <>
            Tag = 1
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PUT'
            Footers = <>
            Tag = 1
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TRIMDUTY'
            Footers = <>
            Tag = 1
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PERSON'
            Footers = <>
            Tag = 1
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PASSPORT'
            Footers = <>
            Tag = 1
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            DynProps = <>
            EditButtons = <>
            FieldName = 'ZACHIST'
            Footers = <>
            Tag = 2
            Title.Caption = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1086#1087#1080#1089#1072#1085#1080#1077
            Width = 124
            OnEditButtonClick = EditButtonClick
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ZACHISTDATE'
            Footers = <>
            Tag = 2
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ZACHISTPERSON'
            Footers = <>
            Tag = 2
            Width = 124
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ZACHISTKOL'
            Footers = <>
            Tag = 2
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            DynProps = <>
            EditButtons = <>
            FieldName = 'STROZH'
            Footers = <>
            Tag = 3
            Title.Caption = #1057#1090#1088#1086#1078#1082#1072'|'#1086#1087#1080#1089#1072#1085#1080#1077
            Width = 124
            OnEditButtonClick = EditButtonClick
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'STROZHDATE'
            Footers = <>
            Tag = 3
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'STROZHPERSON'
            Footers = <>
            Tag = 3
            Width = 124
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'STROZHKOL'
            Footers = <>
            Tag = 3
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            DynProps = <>
            EditButtons = <>
            FieldName = 'OTVERST'
            Footers = <>
            Tag = 4
            Title.Caption = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1086#1087#1080#1089#1072#1085#1080#1077
            Width = 124
            OnEditButtonClick = EditButtonClick
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOLESDATE'
            Footers = <>
            Tag = 4
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOLESPERSON'
            Footers = <>
            Tag = 4
            Width = 124
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOLESKOL'
            Footers = <>
            Tag = 4
          end
          item
            AlwaysShowEditButton = True
            ButtonStyle = cbsEllipsis
            DynProps = <>
            EditButtons = <>
            FieldName = 'GIBKA'
            Footers = <>
            Tag = 5
            Title.Caption = #1043#1080#1073#1082#1072'|'#1086#1087#1080#1089#1072#1085#1080#1077
            Width = 124
            OnEditButtonClick = EditButtonClick
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'BENDINGDATE'
            Footers = <>
            Tag = 5
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'BENDINGPERSON'
            Footers = <>
            Tag = 5
            Width = 124
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'BENDINGKOL'
            Footers = <>
            Tag = 5
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            TextEditing = False
            Width = 637
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object TopEPPanel: TPanel
        Left = 0
        Top = 0
        Width = 445
        Height = 221
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object PlanMarksSplitter: TSplitter
          Left = 260
          Top = 0
          Height = 221
          Align = alRight
          ExplicitLeft = 284
        end
        object PlanMarksTotalDBGridEh: TDBGridEh
          Left = 263
          Top = 0
          Width = 182
          Height = 221
          Align = alRight
          DataSource = PlanMarksTotalDataSource
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDN'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Width = 150
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUM(SPPLANS.KOLSHT)'
              Footers = <>
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'AVG(MARKS.WEIGHT1)'
              Footers = <>
              Width = 70
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SUM(SPPLANS.WEIGHT1)'
              Footers = <>
              Width = 70
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object PlanMarksDBGridEh: TDBGridEh
          Left = 0
          Top = 0
          Width = 260
          Height = 221
          Align = alClient
          DataSource = PlanMarksDataSource
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          TabOrder = 0
          OnDrawDataCell = PlanMarksDBGridEhDrawDataCell
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'CONTRACTOR_S'
              Footers = <>
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'RECIPIENT_S'
              Footers = <>
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDERNUM'
              Footers = <>
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDERNUM2'
              Footers = <>
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDN'
              Footers = <>
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Width = 200
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KOLSHT'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'WEIGHT1'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'WEIGHT1_1'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SBORKA'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'SVARKA'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ZACHIST'
              Footers = <>
              Width = 59
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'GRPOKR'
              Footers = <>
              Width = 123
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DOVODKA'
              Footers = <>
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'RELDATE'
              Footers = <>
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object DMarksTabSet: TTabSet
        Left = 0
        Top = 522
        Width = 445
        Height = 21
        Align = alBottom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        SoftTop = True
        Style = tsSoftTabs
        Tabs.Strings = (
          #1044#1077#1090#1072#1083#1080' '#1085#1072' '#1074#1077#1089#1100' '#1087#1083#1072#1085
          #1044#1077#1090#1072#1083#1080' '#1085#1072' '#1074#1077#1089#1100' '#1079#1072#1082#1072#1079
          #1044#1077#1090#1072#1083#1080' '#1085#1072' '#1076#1072#1085#1085#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1087#1083#1072#1085#1072)
        TabIndex = 0
        OnChange = DMarksTabSetChange
      end
    end
  end
  object EditPanel: TPanel
    Left = 0
    Top = 21
    Width = 636
    Height = 543
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object RightEditPanel: TPanel
      Left = 439
      Top = 0
      Width = 197
      Height = 543
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        197
        543)
      object AddHeaderBitBtn: TBitBtn
        Left = 6
        Top = 32
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1085
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FFFF
          FF00FF00FF00FF00FF0080808000FFFFFF00FFFFFF0000000000000000000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF008080
          8000FF00FF00FF00FF008080800000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FFFFFF0080808000FFFFFF008080800000000000000000000000
          0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF008080
          80008080800080808000FFFFFF0000FFFF00FF00FF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FFFF
          FF0000FFFF008080800000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008080800000FFFF008080800000FFFF008080800000FFFF00000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
          800000FFFF00FF00FF0080808000FFFFFF00FF00FF008080800000FFFF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          FF00FF00FF00FF00FF008080800000FFFF00FF00FF00FF00FF0080808000FFFF
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 0
        OnClick = AddHeaderBitBtnClick
      end
      object AddSpecifBitBtn: TBitBtn
        Left = 6
        Top = 63
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF0000000000000000000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FFFF
          FF00FF00FF00FF00FF0080808000FFFFFF00FFFFFF0000000000000000000000
          0000000000000000000000000000FFFFFF0000000000FF00FF00FF00FF008080
          8000FF00FF00FF00FF008080800000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FFFFFF0080808000FFFFFF008080800000000000000000000000
          0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF008080
          80008080800080808000FFFFFF0000FFFF00FF00FF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FFFF
          FF0000FFFF008080800000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
          FF0000FFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF008080800000FFFF008080800000FFFF008080800000FFFF00000000000000
          00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008080
          800000FFFF00FF00FF0080808000FFFFFF00FF00FF008080800000FFFF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000FF
          FF00FF00FF00FF00FF008080800000FFFF00FF00FF00FF00FF0080808000FFFF
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 1
        OnClick = AddSpecifBitBtnClick
      end
      object GoToImportBitBtn: TBitBtn
        Left = 6
        Top = 509
        Width = 187
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1050' '#1080#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1085#1080#1102' (Esc)'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FFFFFF00FF00
          FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FFFFFF00FF00FF00FFFF
          FF00FF00FF00000000000000000000000000FF00FF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FFFFFF00FF00
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF0000000000000000000000
          0000FF00FF00000000000000000000000000FF00FF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FFFFFF00FF00
          FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FF00FF00FFFFFF00FF00FF00FFFF
          FF00FF00FF00000000000000000000000000FF00FF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FF00FF00FFFFFF00FF00
          FF00FFFFFF0000000000FFFFFF0000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF0000000000808000000000000000000000000000000000
          0000FF00FF00000000000000000000000000FF00FF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FF00FF0000000000FF00FF00FFFFFF00FF00
          FF00FFFFFF00FF00FF00FFFFFF00FF00FF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FF00FF000000000080000000800000008000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF008080000000000000800000008000
          0000800000008000000080000000800000008000000080000000FF00FF00FF00
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF008080000000000000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000
          000080800000FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00808000000000
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 2
        OnClick = GoBack
      end
      object DeleteHeaderBitBtn: TBitBtn
        Left = 6
        Top = 102
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1072#1085
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
          FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
          0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
          FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 3
        OnClick = DeleteHeaderBitBtnClick
      end
      object DeleteSpecifBitBtn: TBitBtn
        Left = 6
        Top = 133
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
          FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000000000000000
          0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00000000000000000000000000FFFFFF00FF00
          FF0000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00
          FF0000000000000000000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00
          FF000000000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 4
        OnClick = DeleteSpecifBitBtnClick
      end
      object EditPlanBitBtn: TBitBtn
        Tag = 1
        Left = 6
        Top = 173
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1085
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
          00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
          00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        TabOrder = 5
        OnClick = EditPlanBitBtnClick
      end
      object EditSpecifBitBtn: TBitBtn
        Tag = 1
        Left = 6
        Top = 204
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1102
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
          00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
          00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        TabOrder = 6
        OnClick = EditSpecifBitBtnClick
      end
      object CorrSpPlanBitBtn: TBitBtn
        Left = 6
        Top = 243
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1085
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00808080008080800080808000808080008080800080808000808080008080
          8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
          000080808000808080008080800080808000808080008080800000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000080000000800000008000000080000000FFFFFF00000000000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000080000000800000008000000080000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF008000000080000000FFFFFF00000000000000000000000000000000000000
          000080000000800000008000000000000000FFFFFF00000000000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
          FF008000000080000000FFFFFF0000000000FFFFFF0000FFFF00000000000000
          0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00800000008000
          0000FFFFFF0000000000FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        TabOrder = 7
        OnClick = CorrSpPlanBitBtnClick
      end
      object ImportIntoKDBitBtn: TBitBtn
        Left = 6
        Top = 283
        Width = 187
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1048#1084#1087#1086#1088#1090' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' '#1074' '#1050#1044
        TabOrder = 8
        OnClick = ImportIntoKDBitBtnClick
      end
      object GoToEnhPlanBitBtn: TBitBtn
        Left = 6
        Top = 328
        Width = 187
        Height = 25
        Caption = #1050' '#1088#1072#1089#1096#1080#1088#1077#1085#1085#1086#1084#1091' '#1087#1083#1072#1085#1091' (F10)'
        TabOrder = 9
        OnClick = GoNext
      end
      object PrintRepBtn: TBitBtn
        Left = 6
        Top = 376
        Width = 187
        Height = 25
        Caption = #1055#1077#1095#1072#1090#1100' '#1086#1090#1095#1105#1090#1072' (Ctrl+P)'
        TabOrder = 10
        OnClick = PrintRepBtnClick
      end
      object EditCoolBar: TCoolBar
        Left = 0
        Top = 0
        Width = 197
        Height = 22
        AutoSize = True
        BandBorderStyle = bsNone
        Bands = <
          item
            Control = EditToolBar
            ImageIndex = -1
            MinHeight = 22
            Width = 195
          end>
        EdgeInner = esNone
        EdgeOuter = esNone
        object EditToolBar: TToolBar
          Left = 11
          Top = 0
          Width = 186
          Height = 22
          Caption = 'EditToolBar'
          Images = IPImageList
          TabOrder = 0
          object AccountingToolButton: TToolButton
            Left = 0
            Top = 0
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = False
            Style = tbsCheck
            OnClick = AccountingSpeedButtonClick
          end
        end
      end
    end
    object ClientEditPanel: TPanel
      Left = 0
      Top = 0
      Width = 439
      Height = 543
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object EditSplitter: TSplitter
        Left = 0
        Top = 218
        Width = 439
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitLeft = 8
        ExplicitTop = 259
        ExplicitWidth = 450
      end
      object EditSpPlansDBGridEh: TDBGridEh
        Left = 0
        Top = 221
        Width = 439
        Height = 297
        Align = alClient
        DataSource = EditSpPlansDataSource
        DynProps = <>
        FooterRowCount = 2
        FooterParams.Color = clWindow
        IndicatorOptions = [gioShowRowIndicatorEh]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDrawColumnCell = EditSpPlansDBGridEhDrawColumnCell
        OnKeyUp = EditSpPlansDBGridEhKeyUp
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ARTICLE'
            Footers = <>
          end
          item
            AutoDropDown = True
            Checkboxes = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTRACTOR_S'
            Footers = <>
          end
          item
            AutoDropDown = True
            Checkboxes = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'RECIPIENT_S'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDERNUM'
            Footers = <>
            Title.TitleButton = True
            Width = 61
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOP'
            Footers = <>
            Title.TitleButton = True
            Width = 108
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDERNUM2'
            Footers = <>
            Title.TitleButton = True
            Width = 60
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ORDN'
            Footers = <>
            Title.TitleButton = True
            Width = 73
          end
          item
            AutoDropDown = True
            Checkboxes = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'MARK_S'
            Footers = <>
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TITLE'
            Footers = <
              item
                FieldName = 'Title'
                Value = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
                ValueType = fvtStaticText
              end
              item
                Value = #1057#1091#1084#1084#1072':'
                ValueType = fvtStaticText
              end>
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'KOLSHT'
            Footers = <
              item
                FieldName = 'KOLSHT'
                ValueType = fvtCount
              end
              item
                FieldName = 'KOLSHT'
                ValueType = fvtSum
              end>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'MATERIAL'
            Footers = <>
            Width = 124
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WEIGHT1'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WEIGHT'
            Footers = <
              item
                FieldName = 'WEIGHT'
                ValueType = fvtCount
              end
              item
                FieldName = 'RES_WEIGHT'
                ValueType = fvtSum
              end>
          end
          item
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERVICE'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUEUE'
            Footers = <>
            Width = 54
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DRAWING'
            Footers = <>
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GRAPH'
            Footers = <>
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RELDATE'
            Footers = <>
            Title.TitleButton = True
            Width = 106
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ISSUEDATE'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'UPDATED'
            Footers = <>
            ReadOnly = True
            Title.TitleButton = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'IMPORTED'
            Footers = <>
            ReadOnly = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'UPDATED_US'
            Footers = <>
            ReadOnly = True
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'KOEF'
            Footers = <>
            Width = 79
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RKOEF'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TONKOEF'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TONCALC'
            Footers = <>
          end
          item
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'MAVERICK'
            Footers = <>
          end
          item
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'DRAWINGEXISTANCE'
            Footers = <>
            Width = 96
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PRIM_PRB'
            Footers = <>
            Width = 150
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'SCHAB'
            Footers = <>
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PRIM'
            Footers = <>
            Width = 200
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object SpPlansDBNavigator: TDBNavigator
        Left = 0
        Top = 518
        Width = 439
        Height = 25
        DataSource = EditSpPlansDataSource
        Align = alBottom
        Flat = True
        Kind = dbnHorizontal
        TabOrder = 1
      end
      object EditPlanPanel: TPanel
        Left = 0
        Top = 0
        Width = 439
        Height = 218
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object PlansDBNavigator: TDBNavigator
          Left = 0
          Top = 193
          Width = 439
          Height = 25
          DataSource = EditPlansDataSource
          Align = alBottom
          Flat = True
          Kind = dbnHorizontal
          TabOrder = 1
        end
        object EditPlansDBGrid: TDBGridEh
          Left = 0
          Top = 0
          Width = 439
          Height = 193
          Align = alClient
          DataSource = EditPlansDataSource
          DynProps = <>
          IndicatorOptions = [gioShowRowIndicatorEh]
          TabOrder = 0
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object ImportPanel: TPanel
    Left = 0
    Top = 21
    Width = 636
    Height = 543
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ClientImportPanel: TPanel
      Left = 0
      Top = 0
      Width = 477
      Height = 543
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object ImportSplitter: TSplitter
        Left = 0
        Top = 185
        Width = 477
        Height = 3
        Cursor = crVSplit
        Align = alTop
        ExplicitWidth = 239
      end
      object SpPlansDBGrid: TDBGridEh
        Left = 0
        Top = 188
        Width = 477
        Height = 355
        Align = alClient
        AllowedOperations = []
        DataSource = SpPlansDataSource
        DynProps = <>
        FooterRowCount = 2
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        STFilter.Local = True
        STFilter.Visible = True
        TabOrder = 0
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ARTICLE_TITLE'
            Footers = <>
            TextEditing = False
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NUM'
            Footers = <>
            TextEditing = False
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'INUM'
            Footers = <>
            TextEditing = False
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ONUM'
            Footers = <>
            TextEditing = False
            Width = 50
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DRAWING'
            Footers = <>
            TextEditing = False
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'TITLE'
            Footers = <>
            TextEditing = False
            Width = 150
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'MATERIAL_TITLE'
            Footers = <
              item
                Value = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
                ValueType = fvtStaticText
              end
              item
                Value = #1057#1091#1084#1084#1072
                ValueType = fvtStaticText
              end>
            TextEditing = False
            Width = 200
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NUM_OF'
            Footers = <
              item
                ValueType = fvtCount
              end
              item
                ValueType = fvtSum
              end>
            TextEditing = False
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'WEIGHT'
            Footers = <>
            TextEditing = False
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'CALC_WEIGHT'
            Footers = <
              item
                ValueType = fvtCount
              end
              item
                FieldName = 'RES_WEIGHT'
                ValueType = fvtSum
              end>
          end
          item
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERVICE'
            Footers = <>
            Width = 72
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'QNUM'
            Footers = <>
            TextEditing = False
            Width = 74
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PRODUCER_TITLE'
            Footers = <>
            TextEditing = False
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'CADEP_TITLE'
            Footers = <>
            TextEditing = False
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'GRAPH'
            Footers = <>
            TextEditing = False
            Width = 150
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTE'
            Footers = <>
            TextEditing = False
            Width = 200
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'UPDATED'
            Footers = <>
            TextEditing = False
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'RELDATE'
            Footers = <>
            TextEditing = False
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'PEREGRUZ'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object PlansDBGrid: TDBGridEh
        Left = 0
        Top = 0
        Width = 477
        Height = 185
        Align = alTop
        AllowedOperations = []
        DataSource = PlansDataSource
        DynProps = <>
        IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        TabOrder = 1
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'MONTH'
            Footers = <>
            TextEditing = False
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'YEAR'
            Footers = <>
            TextEditing = False
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'OPEN'
            Footers = <>
            TextEditing = False
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object RightImportPanel: TPanel
      Left = 477
      Top = 0
      Width = 159
      Height = 543
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        159
        543)
      object ImportBitBtn: TBitBtn
        Left = 6
        Top = 28
        Width = 147
        Height = 57
        Anchors = [akLeft, akTop, akRight]
        Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00808080008080800080808000808080008080800080808000808080008080
          8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
          000080808000808080008080800080808000808080008080800000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000080000000800000008000000080000000FFFFFF00000000000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000080000000800000008000000080000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF008000000080000000FFFFFF00000000000000000000000000000000000000
          000080000000800000008000000000000000FFFFFF00000000000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
          FF008000000080000000FFFFFF0000000000FFFFFF0000FFFF00000000000000
          0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00800000008000
          0000FFFFFF0000000000FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        TabOrder = 0
        WordWrap = True
        OnClick = ImportBitBtnClick
      end
      object GoToEditingBitBtn: TBitBtn
        Left = 6
        Top = 470
        Width = 147
        Height = 66
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1050' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1102
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
          FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
          00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
          00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
          0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
          000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
          000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
          0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
          000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
          FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
          FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        TabOrder = 1
        OnClick = GoNext
      end
      object ImportSpecifBitBtn: TBitBtn
        Left = 6
        Top = 91
        Width = 147
        Height = 57
        Anchors = [akLeft, akTop, akRight]
        Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1079#1080#1094#1080#1080' '#1087#1083#1072#1085#1086#1074
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00808080008080800080808000808080008080800080808000808080008080
          8000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
          000080808000808080008080800080808000808080008080800000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000080000000800000008000000080000000FFFFFF00000000000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
          FF00800000008000000080000000800000008000000080000000FFFFFF000000
          000080000000800000008000000080000000FFFFFF000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000
          0000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
          FF008000000080000000FFFFFF00000000000000000000000000000000000000
          000080000000800000008000000000000000FFFFFF00000000000000000000FF
          FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
          0000FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000000000000000000FFFF
          FF008000000080000000FFFFFF0000000000FFFFFF0000FFFF00000000000000
          0000FFFFFF00000000000000000000000000000000000000000000000000FFFF
          FF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFF
          FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
          00000000000000000000000000000000000000000000FFFFFF00800000008000
          0000FFFFFF0000000000FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF0000FF
          FF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
          0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
        TabOrder = 2
        WordWrap = True
        OnClick = ImportSpecifBitBtnClick
      end
      object ImportCoolBar: TCoolBar
        Left = 0
        Top = 0
        Width = 159
        Height = 22
        AutoSize = True
        BandBorderStyle = bsNone
        Bands = <
          item
            Control = ImportToolBar
            ImageIndex = -1
            MinHeight = 22
            Width = 157
          end>
        EdgeInner = esNone
        EdgeOuter = esNone
        object ImportToolBar: TToolBar
          Left = 11
          Top = 0
          Width = 148
          Height = 22
          Caption = 'EditToolBar'
          Images = IPImageList
          TabOrder = 0
          object SumToolButton: TToolButton
            Left = 0
            Top = 0
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = False
            Style = tbsCheck
            OnClick = SumToolButtonClick
          end
        end
      end
    end
  end
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDAORA.1;Password=b6118616479;User ID=Danatela;Data So' +
      'urce=server1571;Persist Security Info=True'
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    OnWillConnect = ADOConnectionWillConnect
    Left = 32
    Top = 24
  end
  object PlansDataSource: TDataSource
    DataSet = PlansQuery
    Left = 136
    Top = 96
  end
  object SpPlansDataSource: TDataSource
    DataSet = SpPlansQuery
    Left = 32
    Top = 264
  end
  object PlansQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    AfterScroll = PlansQueryAfterScroll
    EnableBCD = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select id, month month_num,'
      ' case month'
      '      when 1 then '#39#1103#1085#1074#1072#1088#1100#39
      '      when 2 then '#39#1092#1077#1074#1088#1072#1083#1100#39
      '      when 3 then '#39#1084#1072#1088#1090#39
      '      when 4 then '#39#1072#1087#1088#1077#1083#1100#39
      '      when 5 then '#39#1084#1072#1081#39
      '      when 6 then '#39#1080#1102#1085#1100#39
      '      when 7 then '#39#1080#1102#1083#1100#39
      '      when 8 then '#39#1072#1074#1075#1091#1089#1090#39
      '      when 9 then '#39#1089#1077#1085#1090#1103#1073#1088#1100#39
      '      when 10 then '#39#1086#1082#1090#1103#1073#1088#1100#39
      '      when 11 then '#39#1085#1086#1103#1073#1088#1100#39
      '      when 12 then '#39#1076#1077#1082#1072#1073#1088#1100#39
      
        ' end month, year, case open when 1 then '#39#1086#1090#1082#1088#1099#1090#39' else '#39#1079#1072#1082#1088#1099#1090#39' e' +
        'nd open from ppu_plan.tplan_cmk@GAL'
      'order by year, month_num')
    Left = 104
    Top = 24
    object PlansQueryID: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      DisplayWidth = 15
      FieldName = 'ID'
      ReadOnly = True
    end
    object PlansQueryMONTH: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      DisplayWidth = 20
      FieldName = 'MONTH'
      ReadOnly = True
      FixedChar = True
      Size = 32
    end
    object PlansQueryYEAR: TFloatField
      DisplayLabel = #1043#1086#1076
      DisplayWidth = 15
      FieldName = 'YEAR'
      ReadOnly = True
    end
    object PlansQueryOPEN: TStringField
      DisplayLabel = #1057#1086#1089#1090#1086#1103#1085#1080#1077
      DisplayWidth = 20
      FieldName = 'OPEN'
      ReadOnly = True
      FixedChar = True
      Size = 32
    end
    object PlansQueryMONTH_NUM: TFloatField
      FieldName = 'MONTH_NUM'
      ReadOnly = True
      Visible = False
    end
  end
  object SpPlansQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    AfterScroll = SpPlansQueryAfterScroll
    OnCalcFields = SpPlansQueryCalcFields
    DataSource = PlansDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'id'
        DataType = ftFloat
        Value = 607.000000000000000000
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT tp.NUM_OF*tp.WEIGHT CALC_WEIGHT, tp.*'
      '  FROM ppu_plan.tporder_cmk@GAL tp'
      'WHERE tp.plan_id = :id')
    Left = 32
    Top = 304
    object SpPlansQueryNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
      ReadOnly = True
    end
    object SpPlansQueryINUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1062#1052#1050
      FieldName = 'INUM'
      ReadOnly = True
    end
    object SpPlansQueryONUM: TFloatField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'ONUM'
      ReadOnly = True
    end
    object SpPlansQueryDRAWING: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1095#1077#1088#1090#1077#1078#1072
      FieldName = 'DRAWING'
      ReadOnly = True
      Size = 50
    end
    object SpPlansQueryTITLE: TStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      FieldName = 'TITLE'
      ReadOnly = True
      Size = 200
    end
    object SpPlansQueryPRODUCER: TFloatField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      FieldName = 'PRODUCER'
      ReadOnly = True
    end
    object SpPlansQueryGRAPH: TStringField
      DisplayLabel = #1043#1088#1072#1092#1080#1082
      FieldName = 'GRAPH'
      ReadOnly = True
      Size = 200
    end
    object SpPlansQueryNOTE: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTE'
      ReadOnly = True
      Size = 1024
    end
    object SpPlansQueryUPDATED: TDateTimeField
      DisplayLabel = #1054#1073#1085#1086#1074#1083#1105#1085
      FieldName = 'UPDATED'
      ReadOnly = True
    end
    object SpPlansQueryRELDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'RELDATE'
      ReadOnly = True
    end
    object SpPlansQueryID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object SpPlansQueryNUM_OF: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'NUM_OF'
      ReadOnly = True
      Visible = False
    end
    object SpPlansQueryWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'WEIGHT'
      ReadOnly = True
    end
    object SpPlansQueryCALC_WEIGHT: TFloatField
      DisplayLabel = #1054#1073#1097#1080#1081' '#1074#1077#1089
      FieldName = 'CALC_WEIGHT'
      ReadOnly = True
    end
    object SpPlansQueryRES_WEIGHT: TFloatField
      DisplayLabel = #1056#1072#1089#1095#1105#1090#1085#1099#1081' '#1074#1077#1089
      FieldKind = fkCalculated
      FieldName = 'RES_WEIGHT'
      ReadOnly = True
      Calculated = True
    end
    object SpPlansQueryORDER_ID: TFloatField
      FieldName = 'ORDER_ID'
      ReadOnly = True
    end
    object SpPlansQueryPLAN_ID: TFloatField
      FieldName = 'PLAN_ID'
      ReadOnly = True
    end
    object SpPlansQueryCNUM: TStringField
      FieldName = 'CNUM'
      ReadOnly = True
      Size = 50
    end
    object SpPlansQueryCADEP: TFloatField
      FieldName = 'CADEP'
      ReadOnly = True
    end
    object SpPlansQueryMATERIAL: TFloatField
      FieldName = 'MATERIAL'
      ReadOnly = True
    end
    object SpPlansQueryARTICLE: TFloatField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'ARTICLE'
      ReadOnly = True
    end
    object SpPlansQueryDEPTH: TFloatField
      FieldName = 'DEPTH'
      ReadOnly = True
    end
    object SpPlansQueryPAINT: TFloatField
      FieldName = 'PAINT'
      ReadOnly = True
    end
    object SpPlansQueryBSS: TFloatField
      FieldName = 'BSS'
      ReadOnly = True
    end
    object SpPlansQueryQNUM: TFloatField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100
      FieldName = 'QNUM'
      ReadOnly = True
    end
    object SpPlansQuerySERVICE: TFloatField
      DisplayLabel = #1059#1089#1083#1091#1075#1072
      FieldName = 'SERVICE'
      ReadOnly = True
    end
    object SpPlansQueryCONTINUE: TFloatField
      FieldName = 'CONTINUE'
      ReadOnly = True
    end
    object SpPlansQueryADVANCED: TFloatField
      FieldName = 'ADVANCED'
      ReadOnly = True
    end
    object SpPlansQueryMETIZ: TFloatField
      FieldName = 'METIZ'
      ReadOnly = True
    end
    object SpPlansQueryARTICLE_TITLE: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldKind = fkLookup
      FieldName = 'ARTICLE_TITLE'
      LookupDataSet = LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Lookup = True
    end
    object SpPlansQueryORD: TFloatField
      FieldKind = fkLookup
      FieldName = 'ARTICLE_ORD'
      LookupDataSet = LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'ORD'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Lookup = True
    end
    object SpPlansQueryFULL_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ARTICLE_FULL_NAME'
      LookupDataSet = LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'FULL_NAME'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Size = 150
      Lookup = True
    end
    object SpPlansQueryDOP: TFloatField
      FieldKind = fkLookup
      FieldName = 'ARTICLE_DOP'
      LookupDataSet = LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'DOP'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Lookup = True
    end
    object SpPlansQueryMATERIAL_TITLE: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083
      FieldKind = fkLookup
      FieldName = 'MATERIAL_TITLE'
      LookupDataSet = LMaterialQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'MATERIAL'
      ReadOnly = True
      Size = 100
      Lookup = True
    end
    object SpPlansQueryPRODUCER_CA: TFloatField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100' (CA)'
      FieldKind = fkLookup
      FieldName = 'PRODUCER_CA'
      LookupDataSet = LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'CA'
      KeyFields = 'PRODUCER'
      ReadOnly = True
      Lookup = True
    end
    object SpPlansQueryPRODUCER_TITLE: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'PRODUCER_TITLE'
      LookupDataSet = LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'PRODUCER'
      ReadOnly = True
      Size = 100
      Lookup = True
    end
    object SpPlansQueryCADEP_CA: TFloatField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082' (CA)'
      FieldKind = fkLookup
      FieldName = 'CADEP_CA'
      LookupDataSet = LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'CA'
      KeyFields = 'CADEP'
      ReadOnly = True
      Lookup = True
    end
    object SpPlansQueryCADEP_TITLE: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldKind = fkLookup
      FieldName = 'CADEP_TITLE'
      LookupDataSet = LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'CADEP'
      ReadOnly = True
      Size = 100
      Lookup = True
    end
    object SpPlansQueryPEREGRUZ: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1075#1088#1091#1079
      FieldName = 'PEREGRUZ'
    end
  end
  object EditPlansDataSource: TDataSource
    DataSet = EditPlansQuery
    OnDataChange = EditPlansDataSourceDataChange
    Left = 224
    Top = 80
  end
  object EditSpPlansDataSource: TDataSource
    DataSet = EditSpPlansQuery
    OnDataChange = EditSpPlansDataSourceDataChange
    Left = 176
    Top = 264
  end
  object EditPlansQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    BeforeInsert = EditPlansQueryBeforeInsert
    AfterInsert = EditPlansQueryAfterInsert
    AfterPost = AfterPost
    BeforeDelete = EditPlansQueryBeforeDelete
    AfterScroll = EditPlansQueryAfterScroll
    OnCalcFields = EditPlansQueryCalcFields
    EnableBCD = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select nrec CPLANS, pmonth, pyear, pponrec, OraUser '
      'from cmknew.Plans'
      'order by pyear, pmonth')
    Left = 176
    Top = 24
    object EditPlansQueryPMONTH: TFloatField
      FieldName = 'PMONTH'
      Visible = False
      MaxValue = 12.000000000000000000
    end
    object EditPlansQueryMONTH: TStringField
      DisplayLabel = #1052#1077#1089#1103#1094
      FieldKind = fkCalculated
      FieldName = 'MONTH'
      Size = 8
      Calculated = True
    end
    object EditPlansQueryPYEAR: TFloatField
      DisplayLabel = #1043#1086#1076
      FieldName = 'PYEAR'
    end
    object EditPlansQueryCPLANS: TFloatField
      FieldName = 'CPLANS'
      Visible = False
    end
    object EditPlansQueryPPONREC: TFloatField
      FieldName = 'PPONREC'
      Visible = False
    end
    object EditPlansQueryORAUSER: TStringField
      FieldName = 'ORAUSER'
      Visible = False
    end
  end
  object EditSpPlansQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    AfterInsert = EditSpPlansQueryAfterInsert
    BeforeEdit = EditSpPlansQueryBeforeEdit
    AfterPost = AfterPost
    AfterScroll = EditSpPlansQueryAfterScroll
    OnCalcFields = EditSpPlansQueryCalcFields
    DataSource = EditPlansDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'CPLANS'
        DataType = ftFloat
        Value = 164.000000000000000000
      end>
    Prepared = True
    SQL.Strings = (
      'select * from cmkNew.SpPlans where cPlans=:CPLANS')
    Left = 120
    Top = 304
    object EditSpPlansQueryNREC: TFloatField
      FieldName = 'NREC'
      Visible = False
    end
    object EditSpPlansQueryCPLANS: TFloatField
      FieldName = 'CPLANS'
      Visible = False
    end
    object EditSpPlansQueryCCONTRACTOR: TFloatField
      FieldName = 'CCONTRACTOR'
      Visible = False
    end
    object EditSpPlansQueryCONTRACTOR_S: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'CONTRACTOR_S'
      LookupDataSet = ContractorsQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      KeyFields = 'CCONTRACTOR'
      Lookup = True
    end
    object EditSpPlansQueryCRECIPIENT: TFloatField
      FieldName = 'CRECIPIENT'
      Visible = False
    end
    object EditSpPlansQueryRECIPIENT_S: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'RECIPIENT_S'
      LookupDataSet = ContractorsQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      KeyFields = 'CRECIPIENT'
      Lookup = True
    end
    object EditSpPlansQueryARTICLE: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'ARTICLE'
    end
    object EditSpPlansQueryORDERNUM: TStringField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072' '#1052#1056#1050
      FieldName = 'ORDERNUM'
      Size = 7
    end
    object EditSpPlansQueryORDERNUM2: TStringField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072' '#1062#1052#1050
      FieldName = 'ORDERNUM2'
      Size = 7
    end
    object EditSpPlansQueryORDN: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldName = 'ORDN'
      Size = 5
    end
    object EditSpPlansQueryCMARK: TFloatField
      FieldName = 'CMARK'
      Visible = False
    end
    object EditSpPlansQueryMARK_S: TStringField
      DisplayLabel = #1052#1072#1088#1082#1072
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'MARK_S'
      LookupDataSet = SelectMarksQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'CMARK'
      Size = 255
      Lookup = True
    end
    object EditSpPlansQueryKOLSHT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLSHT'
      OnChange = WeightChange
    end
    object EditSpPlansQueryWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1076#1085#1086#1081
      FieldName = 'WEIGHT1'
      OnChange = WeightChange
    end
    object EditSpPlansQueryWEIGHT: TFloatField
      DisplayLabel = #1054#1073#1097#1080#1081' '#1074#1077#1089
      FieldName = 'WEIGHT'
    end
    object EditSpPlansQueryPTYPE: TFloatField
      FieldName = 'PTYPE'
      Visible = False
    end
    object EditSpPlansQueryPPONREC: TFloatField
      FieldName = 'PPONREC'
      Visible = False
    end
    object EditSpPlansQuerySTATE: TFloatField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'STATE'
      Visible = False
    end
    object EditSpPlansQueryMATERIAL: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083
      FieldName = 'MATERIAL'
      Size = 100
    end
    object EditSpPlansQueryDRAWING: TStringField
      DisplayLabel = #8470' '#1095#1077#1088#1090#1077#1078#1072
      DisplayWidth = 25
      FieldName = 'DRAWING'
      Size = 50
    end
    object EditSpPlansQueryGRAPH: TStringField
      DisplayLabel = #8470' '#1075#1088#1072#1092#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'GRAPH'
      Size = 200
    end
    object EditSpPlansQueryRELDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1099'|'#1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'RELDATE'
    end
    object EditSpPlansQueryISSUEDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1099'|'#1042#1099#1076#1072#1095#1072' '#1080#1079' '#1055#1056#1041
      FieldName = 'ISSUEDATE'
    end
    object EditSpPlansQueryUPDATED: TDateTimeField
      DisplayLabel = #1044#1072#1090#1099'|'#1048#1079#1084#1077#1085#1077#1085#1086' '#1074' '#1055#1055#1059
      FieldName = 'UPDATED'
    end
    object EditSpPlansQueryIMPORTED: TDateTimeField
      DisplayLabel = #1044#1072#1090#1099'|'#1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1085#1086
      FieldName = 'IMPORTED'
    end
    object EditSpPlansQueryUPDATED_US: TDateTimeField
      DisplayLabel = #1044#1072#1090#1099'|'#1055#1086#1089#1083#1077#1076#1085#1077#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
      FieldName = 'UPDATED_US'
    end
    object EditSpPlansQueryKOEF: TStringField
      DisplayLabel = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1089#1083#1086#1078#1085#1086#1089#1090#1080
      FieldName = 'KOEF'
      Size = 10
    end
    object EditSpPlansQueryQUEUE: TFloatField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100
      FieldName = 'QUEUE'
    end
    object EditSpPlansQueryPRIM_PRB: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1055#1056#1041
      FieldName = 'PRIM_PRB'
      Size = 255
    end
    object EditSpPlansQueryDRAWINGEXISTANCE: TFloatField
      DisplayLabel = #1053#1072#1083#1080#1095#1080#1077' '#1095#1077#1088#1090#1077#1078#1077#1081
      FieldName = 'DRAWINGEXISTANCE'
    end
    object EditSpPlansQueryDOP: TStringField
      DisplayLabel = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081
      FieldName = 'DOP'
      Size = 5
    end
    object EditSpPlansQueryRKOEF: TFloatField
      DisplayLabel = #1056'. '#1082'.'
      FieldName = 'RKOEF'
    end
    object EditSpPlansQuerySCHAB: TStringField
      DisplayLabel = #1064#1072#1073#1083#1086#1085#1080#1088#1086#1074#1082#1072
      FieldName = 'SCHAB'
      Size = 100
    end
    object EditSpPlansQuerySERVICE: TFloatField
      DisplayLabel = #1059#1089#1083#1091#1075#1072
      FieldName = 'SERVICE'
    end
    object EditSpPlansQueryTITLE: TStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1079#1072#1082#1072#1079#1072
      FieldName = 'TITLE'
      Size = 200
    end
    object EditSpPlansQueryMAVERICK: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1093#1086#1076#1103#1097#1080#1081
      FieldName = 'MAVERICK'
      OnChange = EditSpPlansQueryMAVERICKChange
    end
    object EditSpPlansQueryPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 1024
    end
    object EditSpPlansQueryRES_WEIGHT: TFloatField
      FieldKind = fkCalculated
      FieldName = 'RES_WEIGHT'
      Calculated = True
    end
    object EditSpPlansQueryTONKOEF: TFloatField
      DisplayLabel = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
      FieldName = 'TONKOEF'
    end
    object EditSpPlansQueryTONCALC: TFloatField
      DisplayLabel = #1059#1089#1083#1086#1074#1085#1099#1077' '#1090#1086#1085#1085#1099
      FieldName = 'TONCALC'
    end
  end
  object ContractorsQuery: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select nrec, abbr from cmknew.Contractors')
    Left = 40
    Top = 480
    object ContractorsQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object ContractorsQueryABBR: TStringField
      FieldName = 'ABBR'
    end
  end
  object SelectKDQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    DataSource = EditSpPlansDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'ORDERNUM'
        DataType = ftString
        Size = 7
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select * from cmknew.KD KD'
      'where KD.ORDERNUM=:ORDERNUM')
    Left = 136
    Top = 352
    object SelectKDQueryNREC: TFloatField
      AutoGenerateValue = arAutoInc
      FieldName = 'NREC'
    end
    object SelectKDQueryORDERNUM: TStringField
      FieldName = 'ORDERNUM'
      Size = 10
    end
    object SelectKDQueryINPUTDATE: TDateTimeField
      FieldName = 'INPUTDATE'
    end
    object SelectKDQueryLUPDDATE: TDateTimeField
      FieldName = 'LUPDDATE'
    end
    object SelectKDQueryCCONTRACTOR: TFloatField
      FieldName = 'CCONTRACTOR'
    end
    object SelectKDQueryACTDATE: TDateTimeField
      FieldName = 'ACTDATE'
    end
    object SelectKDQueryCONTRACTOR_S: TStringField
      FieldName = 'CONTRACTOR_S'
      Size = 255
    end
    object SelectKDQueryORAUSER: TStringField
      FieldName = 'ORAUSER'
    end
    object SelectKDQueryORDERNUM2: TStringField
      FieldName = 'ORDERNUM2'
      Size = 7
    end
    object SelectKDQueryEMPTY: TFloatField
      FieldName = 'EMPTY'
    end
    object SelectKDQueryCONTROL: TStringField
      FieldName = 'CONTROL'
      Size = 33
    end
  end
  object SelectMarksQuery: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    AfterInsert = SelectMarksQueryAfterInsert
    DataSource = KDDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'NREC'
        DataType = ftFloat
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'select * from cmknew.Marks'
      'where CKD=:NREC')
    Left = 264
    Top = 336
    object SelectMarksQueryNREC: TFloatField
      AutoGenerateValue = arAutoInc
      FieldName = 'NREC'
    end
    object SelectMarksQueryCKD: TFloatField
      FieldName = 'CKD'
    end
    object SelectMarksQueryORDN: TStringField
      FieldName = 'ORDN'
      Size = 5
    end
    object SelectMarksQueryQUEUE: TStringField
      FieldName = 'QUEUE'
      Size = 100
    end
    object SelectMarksQueryMARK: TStringField
      FieldName = 'MARK'
      Size = 100
    end
    object SelectMarksQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object SelectMarksQueryRKOEF: TFloatField
      FieldName = 'RKOEF'
    end
    object SelectMarksQueryCMKGROUP: TFloatField
      FieldName = 'CMKGROUP'
    end
    object SelectMarksQueryWEIGHT1: TFloatField
      FieldName = 'WEIGHT1'
    end
    object SelectMarksQueryWEIGHTZ: TFloatField
      FieldName = 'WEIGHTZ'
    end
    object SelectMarksQueryDRAWING: TStringField
      FieldName = 'DRAWING'
      Size = 100
    end
    object SelectMarksQueryINPUTDATE: TDateTimeField
      FieldName = 'INPUTDATE'
    end
    object SelectMarksQueryLUPDDATE: TDateTimeField
      FieldName = 'LUPDDATE'
    end
    object SelectMarksQueryCRECIPIENT: TFloatField
      FieldName = 'CRECIPIENT'
    end
    object SelectMarksQueryT_SBORKA_NV: TFloatField
      FieldName = 'T_SBORKA_NV'
    end
    object SelectMarksQueryT_SBORKA_PR: TStringField
      FieldName = 'T_SBORKA_PR'
      Size = 255
    end
    object SelectMarksQueryT_SVARKA_WE: TFloatField
      FieldName = 'T_SVARKA_WE'
    end
    object SelectMarksQueryT_SVARKA_M: TFloatField
      FieldName = 'T_SVARKA_M'
    end
    object SelectMarksQueryT_SVARKA_CEQ: TFloatField
      FieldName = 'T_SVARKA_CEQ'
    end
    object SelectMarksQueryT_SVARKA_NV: TFloatField
      FieldName = 'T_SVARKA_NV'
    end
    object SelectMarksQueryT_ZACHIST_CEQ: TFloatField
      FieldName = 'T_ZACHIST_CEQ'
    end
    object SelectMarksQueryT_ZACHIST_NV: TFloatField
      FieldName = 'T_ZACHIST_NV'
    end
    object SelectMarksQueryT_GRPOKR_GR: TStringField
      FieldName = 'T_GRPOKR_GR'
      Size = 255
    end
    object SelectMarksQueryT_GRPOKR_POKR: TStringField
      FieldName = 'T_GRPOKR_POKR'
      Size = 255
    end
    object SelectMarksQueryT_GRPOKR_NV: TFloatField
      FieldName = 'T_GRPOKR_NV'
    end
    object SelectMarksQueryT_DOVODKA_CEQ: TFloatField
      FieldName = 'T_DOVODKA_CEQ'
    end
    object SelectMarksQueryT_DOVODKA_NV: TFloatField
      FieldName = 'T_DOVODKA_NV'
    end
    object SelectMarksQueryT_DOVODKA_PR: TStringField
      FieldName = 'T_DOVODKA_PR'
      Size = 255
    end
    object SelectMarksQueryPRIM: TStringField
      FieldName = 'PRIM'
      Size = 255
    end
    object SelectMarksQueryMKGROUP_S: TStringField
      FieldName = 'MKGROUP_S'
      Size = 255
    end
    object SelectMarksQueryRECIPIENT_S: TStringField
      FieldName = 'RECIPIENT_S'
      Size = 255
    end
    object SelectMarksQueryT_SVARKA_EQ_S: TStringField
      FieldName = 'T_SVARKA_EQ_S'
      Size = 255
    end
    object SelectMarksQueryT_ZACHIST_EQ_S: TStringField
      FieldName = 'T_ZACHIST_EQ_S'
      Size = 255
    end
    object SelectMarksQueryT_DOVODKA_EQ_S: TStringField
      FieldName = 'T_DOVODKA_EQ_S'
      Size = 255
    end
    object SelectMarksQueryEMPTY: TFloatField
      FieldName = 'EMPTY'
    end
    object SelectMarksQueryCONTROL: TStringField
      FieldName = 'CONTROL'
      Size = 33
    end
  end
  object LcaDepQuery: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from PPU_PLAN.LCADEP@GAL')
    Left = 24
    Top = 120
    object LcaDepQueryID: TFloatField
      FieldName = 'ID'
    end
    object LcaDepQueryCA: TFloatField
      FieldName = 'CA'
    end
    object LcaDepQueryTITLE: TStringField
      FieldName = 'TITLE'
      Size = 100
    end
  end
  object SelectContractorsQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from cmknew.contractors')
    Left = 400
    Top = 328
  end
  object PlanMarksDataSource: TDataSource
    DataSet = PlanMarksQuery
    Left = 352
    Top = 80
  end
  object DMarksDataSource: TDataSource
    DataSet = DMarksTotalQuery
    Left = 432
    Top = 272
  end
  object PlanMarksQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    BeforeScroll = PlanMarksQueryBeforeScroll
    AfterScroll = PlanMarksQueryAfterScroll
    OnCalcFields = PlanMarksQueryCalcFields
    DataSource = EditPlansDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'CPLANS'
        DataType = ftFloat
        Value = 690.000000000000000000
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT MARKS.*, KD.*, SPPLANS.KOLSHT, SPPLANS.WEIGHT1, SPPLANS.W' +
        'EIGHT, SPPLANS.RELDATE,'
      '  SPPLANS.CPLANS,'
      '  SPPLANS.NREC CSPPLANS,'
      
        '  (SELECT COUNT(*) FROM CMKNEW.DMARKS WHERE CMARK=MARKS.NREC) DM' +
        'ARKSCOUNT'
      '  FROM CMKNEW.MARKS'
      '       JOIN CMKNEW.KD'
      '          ON MARKS.CKD = KD.NREC'
      '       JOIN CMKNEW.SPPLANS'
      '          ON     MARKS.ORDN = SPPLANS.ORDN'
      '             AND KD.ORDERNUM = SPPLANS.ORDERNUM'
      '             AND KD.ORDERNUM2 = SPPLANS.ORDERNUM2'
      '       JOIN CMKNEW.PLANS'
      '          ON SPPLANS.CPLANS = PLANS.NREC'
      'WHERE PLANS.NREC = :CPLANS AND KD.ACTDATE >= SYSDATE'
      'ORDER BY KD.ORDERNUM, KD.ORDERNUM2, MARKS.ORDN')
    Left = 384
    Top = 24
    object PlanMarksQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object PlanMarksQueryCONTRACTOR_S: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldName = 'CONTRACTOR_S'
      LookupDataSet = ContractorsQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      Size = 255
    end
    object PlanMarksQueryRECIPIENT_S: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      FieldName = 'RECIPIENT_S'
      LookupDataSet = ContractorsQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      Size = 255
    end
    object PlanMarksQueryORDERNUM: TStringField
      DisplayLabel = #8470' '#1079'-'#1079' '#1052#1056#1050
      FieldName = 'ORDERNUM'
      Size = 10
    end
    object PlanMarksQueryORDERNUM2: TStringField
      DisplayLabel = #8470' '#1079'-'#1079' '#1062#1052#1050
      FieldName = 'ORDERNUM2'
      Size = 7
    end
    object PlanMarksQueryORDN: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldName = 'ORDN'
      Size = 5
    end
    object PlanMarksQueryMARK: TStringField
      DisplayLabel = #1052#1072#1088#1082#1072
      FieldName = 'MARK'
      Size = 100
    end
    object PlanMarksQueryNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 255
    end
    object PlanMarksQueryKOLSHT: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'KOLSHT'
    end
    object PlanMarksQueryWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' 1'#1096#1090'.'
      FieldName = 'WEIGHT1'
    end
    object PlanMarksQueryWEIGHT1_1: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1073#1097'.'
      FieldName = 'WEIGHT1_1'
    end
    object PlanMarksQueryINPUTDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1074#1086#1076#1072
      FieldName = 'INPUTDATE'
    end
    object PlanMarksQueryLUPDDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'LUPDDATE'
    end
    object PlanMarksQueryCCONTRACTOR: TFloatField
      FieldName = 'CCONTRACTOR'
      Visible = False
    end
    object PlanMarksQueryACTDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1072#1082#1090#1072
      FieldName = 'ACTDATE'
    end
    object PlanMarksQueryORAUSER: TStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1043#1072#1083#1072#1082#1090#1080#1082#1080
      FieldName = 'ORAUSER'
    end
    object PlanMarksQueryEMPTY: TFloatField
      DisplayLabel = #1055#1091#1089#1090#1086#1081
      FieldName = 'EMPTY'
    end
    object PlanMarksQueryQUEUE: TStringField
      FieldName = 'QUEUE'
      Size = 100
    end
    object PlanMarksQueryRKOEF: TFloatField
      FieldName = 'RKOEF'
    end
    object PlanMarksQueryCMKGROUP: TFloatField
      FieldName = 'CMKGROUP'
    end
    object PlanMarksQueryWEIGHTZ: TFloatField
      FieldName = 'WEIGHTZ'
    end
    object PlanMarksQueryDRAWING: TStringField
      FieldName = 'DRAWING'
      Size = 100
    end
    object PlanMarksQueryCRECIPIENT: TFloatField
      FieldName = 'CRECIPIENT'
    end
    object PlanMarksQueryPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 255
    end
    object PlanMarksQueryMKGROUP_S: TStringField
      FieldName = 'MKGROUP_S'
      Size = 255
    end
    object PlanMarksQueryCKD: TFloatField
      FieldName = 'CKD'
    end
    object PlanMarksQueryT_SBORKA_NV: TFloatField
      FieldName = 'T_SBORKA_NV'
    end
    object PlanMarksQueryT_SBORKA_PR: TStringField
      FieldName = 'T_SBORKA_PR'
      Size = 255
    end
    object PlanMarksQueryT_SVARKA_WE: TFloatField
      FieldName = 'T_SVARKA_WE'
    end
    object PlanMarksQueryT_SVARKA_M: TFloatField
      FieldName = 'T_SVARKA_M'
    end
    object PlanMarksQueryT_SVARKA_CEQ: TFloatField
      FieldName = 'T_SVARKA_CEQ'
    end
    object PlanMarksQueryT_SVARKA_NV: TFloatField
      FieldName = 'T_SVARKA_NV'
    end
    object PlanMarksQueryT_SVARKA_EQ_S: TStringField
      FieldName = 'T_SVARKA_EQ_S'
      Size = 255
    end
    object PlanMarksQueryT_ZACHIST_CEQ: TFloatField
      FieldName = 'T_ZACHIST_CEQ'
    end
    object PlanMarksQueryT_ZACHIST_NV: TFloatField
      FieldName = 'T_ZACHIST_NV'
    end
    object PlanMarksQueryT_ZACHIST_EQ_S: TStringField
      FieldName = 'T_ZACHIST_EQ_S'
      Size = 255
    end
    object PlanMarksQueryT_GRPOKR_GR: TStringField
      FieldName = 'T_GRPOKR_GR'
      Size = 255
    end
    object PlanMarksQueryT_GRPOKR_POKR: TStringField
      FieldName = 'T_GRPOKR_POKR'
      Size = 255
    end
    object PlanMarksQueryT_GRPOKR_NV: TFloatField
      FieldName = 'T_GRPOKR_NV'
    end
    object PlanMarksQueryT_DOVODKA_CEQ: TFloatField
      FieldName = 'T_DOVODKA_CEQ'
    end
    object PlanMarksQueryT_DOVODKA_NV: TFloatField
      FieldName = 'T_DOVODKA_NV'
    end
    object PlanMarksQueryT_DOVODKA_PR: TStringField
      FieldName = 'T_DOVODKA_PR'
      Size = 255
    end
    object PlanMarksQueryT_DOVODKA_EQ_S: TStringField
      FieldName = 'T_DOVODKA_EQ_S'
      Size = 255
    end
    object PlanMarksQueryWEIGHT: TFloatField
      FieldName = 'WEIGHT'
    end
    object PlanMarksQueryRELDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086' '#1075#1088#1072#1092#1080#1082#1091
      FieldName = 'RELDATE'
    end
    object PlanMarksQuerySBORKA: TStringField
      DisplayLabel = #1057#1073#1086#1088#1082#1072
      FieldKind = fkCalculated
      FieldName = 'SBORKA'
      Calculated = True
    end
    object PlanMarksQuerySVARKA: TStringField
      DisplayLabel = #1057#1074#1072#1088#1082#1072
      FieldKind = fkCalculated
      FieldName = 'SVARKA'
      Calculated = True
    end
    object PlanMarksQueryZACHIST: TStringField
      DisplayLabel = #1047#1072#1095#1080#1089#1090#1082#1072
      FieldKind = fkCalculated
      FieldName = 'ZACHIST'
      Size = 0
      Calculated = True
    end
    object PlanMarksQueryGRPOKR: TStringField
      DisplayLabel = #1043#1088#1091#1085#1090#1086#1074#1072#1085#1080#1077'/'#1055#1086#1082#1088#1072#1089#1082#1072
      FieldKind = fkCalculated
      FieldName = 'GRPOKR'
      Size = 0
      Calculated = True
    end
    object PlanMarksQueryDOVODKA: TStringField
      DisplayLabel = #1044#1086#1074#1086#1076#1082#1072
      FieldKind = fkCalculated
      FieldName = 'DOVODKA'
      Calculated = True
    end
    object PlanMarksQueryCONTROL: TStringField
      FieldName = 'CONTROL'
      Size = 33
    end
    object PlanMarksQueryNREC_1: TFloatField
      FieldName = 'NREC_1'
    end
    object PlanMarksQueryINPUTDATE_1: TDateTimeField
      FieldName = 'INPUTDATE_1'
    end
    object PlanMarksQueryLUPDDATE_1: TDateTimeField
      FieldName = 'LUPDDATE_1'
    end
    object PlanMarksQueryEMPTY_1: TFloatField
      FieldName = 'EMPTY_1'
    end
    object PlanMarksQueryCONTROL_1: TStringField
      FieldName = 'CONTROL_1'
      Size = 33
    end
    object PlanMarksQueryCSPPLANS: TFloatField
      FieldName = 'CSPPLANS'
    end
    object PlanMarksQueryDMARKSCOUNT: TFloatField
      FieldName = 'DMARKSCOUNT'
    end
    object PlanMarksQueryCPLANS: TFloatField
      FieldName = 'CPLANS'
    end
  end
  object DMarksTotalQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    OnCalcFields = DMarksQueryCalcFields
    DataSource = PlanMarksDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'CPLANS'
        DataType = ftFloat
        Value = 690.000000000000000000
      end>
    Prepared = True
    SQL.Strings = (
      '  SELECT KD.NREC,'
      '         KD.ORDERNUM2,'
      '         SPPLANS.CPLANS,'
      '         DMARKS.CMARK,'
      '         DMARKS.NUMP,'
      '         SUM ('
      '              DMARKS.NUMCOUNT'
      '            * CASE DMARKS.FROZEN'
      '                 WHEN 0 THEN SPPLANS.KOLSHT'
      '                 WHEN 1 THEN 1'
      '                 ELSE 1'
      '              END)'
      '            NUMCOUNT,'
      '         AVG (DMARKS.WEIGHT1) WEIGHT1,'
      '         SUM ('
      '              DMARKS.WEIGHT'
      '            * CASE DMARKS.FROZEN'
      '                 WHEN 0 THEN SPPLANS.KOLSHT'
      '                 WHEN 1 THEN 1'
      '                 ELSE 1'
      '              END)'
      '            WEIGHT'
      '    FROM CMKNEW.KD'
      '         JOIN CMKNEW.MARKS'
      '            ON KD.NREC = MARKS.CKD'
      '         JOIN CMKNEW.DMARKS'
      '            ON MARKS.NREC = DMARKS.CMARK'
      '         JOIN CMKNEW.SPPLANS'
      '            ON     MARKS.ORDN = SPPLANS.ORDN'
      '               AND KD.ORDERNUM = SPPLANS.ORDERNUM'
      '               AND KD.ORDERNUM2 = SPPLANS.ORDERNUM2'
      '         JOIN CMKNEW.PLANS'
      '            ON SPPLANS.CPLANS = PLANS.NREC'
      '   WHERE SPPLANS.CPLANS = :CPLANS AND KD.ACTDATE >= SYSDATE'
      'GROUP BY KD.NREC,'
      '         KD.ORDERNUM2,'
      '         SPPLANS.CPLANS,'
      '         DMARKS.CMARK,'
      '         DMARKS.NUMP')
    Left = 312
    Top = 400
    object DMarksTotalQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object DMarksTotalQueryCPLANS: TFloatField
      FieldName = 'CPLANS'
    end
    object DMarksTotalQueryCMARK: TFloatField
      FieldName = 'CMARK'
    end
    object DMarksTotalQueryNUMP: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldName = 'NUMP'
    end
    object FMTBCDField1: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'NUMCOUNT'
      ReadOnly = True
    end
    object DMarksTotalQueryWEIGHT1: TFloatField
      FieldName = 'WEIGHT1'
      ReadOnly = True
    end
    object FMTBCDField3: TFloatField
      DisplayLabel = #1054#1073#1097#1080#1081' '#1074#1077#1089
      FieldName = 'WEIGHT'
      ReadOnly = True
    end
    object DMarksTotalQueryPROP_STEELMARK: TFloatField
      FieldKind = fkLookup
      FieldName = 'PROP_STEELMARK'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'PROP_STEELMARK'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryPROP_STEELMARK_C: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083
      FieldKind = fkLookup
      FieldName = 'PROP_STEELMARK_C'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'PROP_STEELMARK_C'
      KeyFields = 'NREC;NUMP'
      Size = 50
      Lookup = True
    end
    object DMarksTotalQueryGRMATERIALS_S: TStringField
      DisplayLabel = #1055#1088#1086#1092#1080#1083#1100
      FieldKind = fkLookup
      FieldName = 'GRMATERIALS_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'GRMATERIALS_S'
      KeyFields = 'NREC;NUMP'
      ReadOnly = True
      Size = 593
      Lookup = True
    end
    object DMarksTotalQueryT_RAZMET_EQ_S: TStringField
      FieldKind = fkLookup
      FieldName = 'T_RAZMET_EQ_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_RAZMET_EQ_S'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_RAZMET_NV: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_RAZMET_NV'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_RAZMET_NV'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_RAZMET_PR: TStringField
      FieldKind = fkLookup
      FieldName = 'T_RAZMET_PR'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_RAZMET_PR'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_REZKA_EQ_S: TStringField
      FieldKind = fkLookup
      FieldName = 'T_REZKA_EQ_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_REZKA_EQ_S'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_REZKA_PR: TStringField
      FieldKind = fkLookup
      FieldName = 'T_REZKA_PR'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_REZKA_PR'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_REZKA_M: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_REZKA_M'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_REZKA_M'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_REZKA_NV: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_REZKA_NV'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_REZKA_NV'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_ZACHIST_TYPE_S: TStringField
      FieldKind = fkLookup
      FieldName = 'T_ZACHIST_TYPE_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_ZACHIST_TYPE_S'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_ZACHIST_NV: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_ZACHIST_NV'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_ZACHIST_NV'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_STROZH_EQ_S: TStringField
      FieldKind = fkLookup
      FieldName = 'T_STROZH_EQ_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_STROZH_EQ_S'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_STROZH_PR: TStringField
      FieldKind = fkLookup
      FieldName = 'T_STROZH_PR'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_STROZH_PR'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_STROZH_M: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_STROZH_M'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_STROZH_M'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_STROZH_NV: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_STROZH_NV'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_STROZH_NV'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_OTVERST_EQ_S: TStringField
      FieldKind = fkLookup
      FieldName = 'T_OTVERST_EQ_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_OTVERST_EQ_S'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_OTVERST_PR: TStringField
      FieldKind = fkLookup
      FieldName = 'T_OTVERST_PR'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_OTVERST_PR'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_OTVERST_COUNT: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_OTVERST_COUNT'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_OTVERST_COUNT'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_OTVERST_DIAM: TStringField
      FieldKind = fkLookup
      FieldName = 'T_OTVERST_DIAM'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_OTVERST_DIAM'
      KeyFields = 'NREC;NUMP'
      Size = 100
      Lookup = True
    end
    object DMarksTotalQueryT_OTVERST_NV: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_OTVERST_NV'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_OTVERST_NV'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryT_GIBKA_EQ_S: TStringField
      FieldKind = fkLookup
      FieldName = 'T_GIBKA_EQ_S'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_GIBKA_EQ_S'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_GIBKA_PR: TStringField
      FieldKind = fkLookup
      FieldName = 'T_GIBKA_PR'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_GIBKA_PR'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryT_GIBKA_NV: TFloatField
      FieldKind = fkLookup
      FieldName = 'T_GIBKA_NV'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'T_GIBKA_NV'
      KeyFields = 'NREC;NUMP'
      Lookup = True
    end
    object DMarksTotalQueryPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldKind = fkLookup
      FieldName = 'PRIM'
      LookupDataSet = DetailsADOQuery
      LookupKeyFields = 'CKD;NUMP'
      LookupResultField = 'PRIM'
      KeyFields = 'NREC;NUMP'
      Size = 255
      Lookup = True
    end
    object DMarksTotalQueryRAZMET: TStringField
      DisplayLabel = #1056#1072#1079#1084#1077#1090#1082#1072
      FieldKind = fkCalculated
      FieldName = 'RAZMET'
      Calculated = True
    end
    object DMarksTotalQueryREZKA: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072
      FieldKind = fkCalculated
      FieldName = 'REZKA'
      Size = 100
      Calculated = True
    end
    object DMarksTotalQueryZACHIST: TStringField
      DisplayLabel = #1047#1072#1095#1080#1089#1090#1082#1072
      FieldKind = fkCalculated
      FieldName = 'ZACHIST'
      Size = 100
      Calculated = True
    end
    object DMarksTotalQuerySTROZH: TStringField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072
      FieldKind = fkCalculated
      FieldName = 'STROZH'
      Size = 100
      Calculated = True
    end
    object DMarksTotalQueryOTVERST: TStringField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103
      FieldKind = fkCalculated
      FieldName = 'OTVERST'
      Size = 100
      Calculated = True
    end
    object DMarksTotalQueryGIBKA: TStringField
      DisplayLabel = #1043#1080#1073#1082#1072
      FieldKind = fkCalculated
      FieldName = 'GIBKA'
      Size = 100
      Calculated = True
    end
    object DMarksTotalQueryORDERNUM2: TStringField
      DisplayLabel = #8470#1079'-'#1079' '#1062#1052#1050
      FieldName = 'ORDERNUM2'
    end
    object DMarksTotalQueryCPERSON: TFloatField
      FieldKind = fkCalculated
      FieldName = 'CPERSON'
      Calculated = True
    end
    object DMarksTotalQueryKOL: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'KOL'
      Calculated = True
    end
    object DMarksTotalQueryTRIMDATE: TDateTimeField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1044#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'TRIMDATE'
      Calculated = True
    end
    object DMarksTotalQueryTRIMMED: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1054#1090#1088#1077#1079#1072#1085#1086
      FieldKind = fkCalculated
      FieldName = 'TRIMMED'
      Calculated = True
    end
    object DMarksTotalQueryPUT: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1057#1076#1072#1085#1086
      FieldKind = fkCalculated
      FieldName = 'PUT'
      Calculated = True
    end
    object DMarksTotalQueryPASSPORT: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1055#1072#1089#1087#1086#1088#1090
      FieldKind = fkCalculated
      FieldName = 'PASSPORT'
      Calculated = True
    end
    object DMarksTotalQueryTRIMDUTY: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1054#1090#1088#1077#1079#1072#1085#1086' '#1087#1086' '#1085#1072#1088#1103#1076#1072#1084
      FieldKind = fkCalculated
      FieldName = 'TRIMDUTY'
      Calculated = True
    end
    object DMarksTotalQueryPERSON: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'PERSON'
      Calculated = True
    end
    object DMarksTotalQueryRAZMETDATE: TDateField
      DisplayLabel = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1044#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'RAZMETDATE'
      Calculated = True
    end
    object DMarksTotalQueryRAZMETPERSON: TStringField
      DisplayLabel = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'RAZMETPERSON'
      Size = 182
      Calculated = True
    end
    object DMarksTotalQueryRAZMETKOL: TIntegerField
      DisplayLabel = #1056#1072#1079#1084#1077#1090#1082#1072'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'RAZMETKOL'
      Calculated = True
    end
    object DMarksTotalQueryZACHISTDATE: TDateField
      DisplayLabel = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1044#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'ZACHISTDATE'
      Calculated = True
    end
    object DMarksTotalQueryZACHISTPERSON: TStringField
      DisplayLabel = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'ZACHISTPERSON'
      Size = 182
      Calculated = True
    end
    object DMarksTotalQueryZACHISTKOL: TIntegerField
      DisplayLabel = #1047#1072#1095#1080#1089#1090#1082#1072'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'ZACHISTKOL'
      Calculated = True
    end
    object DMarksTotalQuerySTROZHDATE: TDateField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1044#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'STROZHDATE'
      Calculated = True
    end
    object DMarksTotalQuerySTROZHPERSON: TStringField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'STROZHPERSON'
      Size = 182
      Calculated = True
    end
    object DMarksTotalQuerySTROZHKOL: TIntegerField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'STROZHKOL'
      Calculated = True
    end
    object DMarksTotalQueryBENDINGDATE: TDateField
      DisplayLabel = #1043#1080#1073#1082#1072'|'#1044#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'BENDINGDATE'
      Calculated = True
    end
    object DMarksTotalQueryBENDINGPERSON: TStringField
      DisplayLabel = #1043#1080#1073#1082#1072'|'#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'BENDINGPERSON'
      Size = 182
      Calculated = True
    end
    object DMarksTotalQueryBENDINGKOL: TIntegerField
      DisplayLabel = #1043#1080#1073#1082#1072'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'BENDINGKOL'
      Calculated = True
    end
    object DMarksTotalQueryHOLESDATE: TDateField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1044#1072#1090#1072
      FieldKind = fkCalculated
      FieldName = 'HOLESDATE'
      Calculated = True
    end
    object DMarksTotalQueryHOLESPERSON: TStringField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkCalculated
      FieldName = 'HOLESPERSON'
      Size = 182
      Calculated = True
    end
    object DMarksTotalQueryHOLESKOL: TIntegerField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldKind = fkCalculated
      FieldName = 'HOLESKOL'
      Calculated = True
    end
  end
  object PlanMarksTotalQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    BeforeScroll = PlanMarksTotalQueryBeforeScroll
    AfterScroll = PlanMarksTotalQueryAfterScroll
    DataSource = PlanMarksDataSource
    EnableBCD = False
    Parameters = <
      item
        Name = 'ORDERNUM'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'ORDERNUM2'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'CPLANS'
        DataType = ftFloat
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      '  SELECT '
      '         KD.ORDERNUM,'
      '         KD.ORDERNUM2,'
      '         MARKS.ORDN,'
      '         MARKS.NAME,'
      '         SUM (SPPLANS.KOLSHT),'
      '         AVG (MARKS.WEIGHT1),'
      '         SUM (SPPLANS.WEIGHT1),'
      '         AVG (SPPLANS.WEIGHT)'
      '    FROM CMKNEW.MARKS'
      '         JOIN CMKNEW.KD'
      '            ON MARKS.CKD = KD.NREC'
      '         JOIN CMKNEW.SPPLANS'
      '            ON     MARKS.ORDN = SPPLANS.ORDN'
      '               AND KD.ORDERNUM = SPPLANS.ORDERNUM'
      '               AND KD.ORDERNUM2 = SPPLANS.ORDERNUM2'
      
        '   WHERE SPPLANS.ORDERNUM=:ORDERNUM AND SPPLANS.ORDERNUM2=:ORDER' +
        'NUM2 '
      '         AND SPPLANS.CPLANS=:CPLANS'
      'GROUP BY KD.ORDERNUM,'
      '         KD.ORDERNUM2,'
      'MARKS.ORDN, MARKS.NAME'
      'ORDER BY 1,2')
    Left = 272
    Top = 24
    object PlanMarksTotalQueryORDERNUM: TStringField
      DisplayLabel = #8470' '#1079'-'#1079' '#1052#1056#1050
      FieldName = 'ORDERNUM'
      Size = 10
    end
    object PlanMarksTotalQueryORDERNUM2: TStringField
      DisplayLabel = #8470' '#1079'-'#1079' '#1062#1052#1050
      FieldName = 'ORDERNUM2'
      Size = 7
    end
    object PlanMarksTotalQueryORDN: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldName = 'ORDN'
      Size = 5
    end
    object PlanMarksTotalQueryNAME: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'NAME'
      Size = 150
    end
    object PlanMarksTotalQuerySUMSPPLANSKOLSHT: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'SUM(SPPLANS.KOLSHT)'
      ReadOnly = True
    end
    object PlanMarksTotalQueryAVGMARKSWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' 1'#1096#1090'.'
      FieldName = 'AVG(MARKS.WEIGHT1)'
      ReadOnly = True
    end
    object PlanMarksTotalQuerySUMSPPLANSWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1073#1097'.'
      FieldName = 'SUM(SPPLANS.WEIGHT1)'
      ReadOnly = True
    end
    object PlanMarksTotalQueryAVGSPPLANSWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089' 1'#1096#1090'.'
      FieldName = 'AVG(SPPLANS.WEIGHT)'
      ReadOnly = True
    end
  end
  object PlanMarksTotalDataSource: TDataSource
    DataSet = PlanMarksTotalQuery
    Left = 280
    Top = 152
  end
  object IPImageList: TImageList
    Left = 24
    Top = 424
    Bitmap = {
      494C010101000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000585858A71E1E1EE11E1E1EE11E1E1EE11E1E1EE11E1E1EE11E1E1EE15858
      58A7000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCB34333333CC5C5C5CA3F5F5F50A0000000000000000CBCBCB343333
      33CC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000CDCDCD323A3A3AC56262629DF5F5F50A0000000000000000CDCD
      CD32000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CFCFCF30404040BF67676798F5F5F50A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F5F5F50A6B6B6B94464646B9D0D0D02F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F6F6F6096F6F6F904B4B4BB4D1D1D12E0000000000000000D2D2
      D22D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6F6F6097373738C505050AFD3D3D32C0000000000000000D3D3D32C5050
      50AF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007E7E7E81535353AC535353AC535353AC535353AC535353AC535353AC7E7E
      7E81000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000F00F000000000000F0CF000000000000
      F86F000000000000FC3F000000000000FC3F000000000000F86F000000000000
      F0CF000000000000F00F000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object DetailsADOQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'SELECT DETAILS.CKD,'
      '       DETAILS.NUMP,'
      '       DETAILS.PROP_STEELMARK,'
      '       DETAILS.PROP_STEELMARK_C,'
      '       CASE GRMATERIALS.CPARENT'
      '          WHEN 3'
      '          THEN'
      
        '             DETAILS.GRMATERIALS_S                              ' +
        '     -- '#1055#1088#1086#1095#1080#1077
      '          WHEN 4'
      '          THEN'
      '                '#39#1051#1080#1089#1090' '#39
      '             || DETAILS.PROP_THICK_C'
      '             || '#39'*'#39
      '             || DETAILS.PROP_WIDTH_C'
      '             || '#39'*'#39
      '             || DETAILS.PROP_LENGTH_C'
      '          WHEN 5'
      '          THEN'
      '                '#39#1050#1074#1072#1076#1088#1072#1090' '#39
      '             || DETAILS.PROP_SIZE'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 6'
      '          THEN'
      '                '#39#1043#1085#1091#1090#1099#1081' '#1087#1088#1086#1092#1080#1083#1100' '#39
      '             || DETAILS.PROP_SIZE1'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SIZE2'
      '             || '#39'*'#39
      '             || DETAILS.PROP_WTHICK'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 7'
      '          THEN'
      '                '#39#1058#1088#1091#1073#1072' '#7443#39
      '             || DETAILS.PROP_DIAM'
      '             || '#39'*'#39
      '             || DETAILS.PROP_WTHICK'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 8'
      '          THEN'
      '                '#39#1041#1072#1083#1082#1072' '#39
      '             || DETAILS.PROP_PROFNUM'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 9'
      '          THEN'
      '                '#39#1041#1072#1083#1082#1072' '#39
      '             || DETAILS.PROP_PROFNUM'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 10'
      '          THEN'
      '                '#39#1059#1075#1086#1083#1086#1082' '#39
      '             || DETAILS.PROP_PWIDTH1'
      '             || '#39'*'#39
      '             || DETAILS.PROP_PWIDTH2'
      '             || '#39'*'#39
      '             || DETAILS.PROP_WTHICK'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 11'
      '          THEN'
      '                '#39#1064#1074#1077#1083#1083#1077#1088' '#39
      '             || DETAILS.PROP_PROFNUM'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '          WHEN 100'
      '          THEN'
      '                '#39#1050#1088#1091#1075' '#7443#39
      '             || DETAILS.PROP_DIAM'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      
        '          WHEN 101                                              ' +
        '     -- '#1050#1088#1077#1087#1105#1078
      '          THEN'
      '                DETAILS.PROP_FIXTYPE_C'
      '             || '#39' '#39
      '             || DETAILS.PROP_CARVTYPE_C'
      '             || '#39' '#39
      '             || DETAILS.PROP_DIAM'
      '             || '#39'*'#39
      '             || DETAILS.PROP_SLENGTH'
      '       END'
      '          GRMATERIALS_S,'
      '       DETAILS.T_RAZMET_EQ_S,'
      '       DETAILS.T_RAZMET_NV,'
      '       DETAILS.T_RAZMET_PR,'
      '       DETAILS.T_REZKA_EQ_S,'
      '       DETAILS.T_REZKA_PR,'
      '       DETAILS.T_REZKA_M,'
      '       DETAILS.T_REZKA_NV,'
      '       DETAILS.T_ZACHIST_TYPE_S,'
      '       DETAILS.T_ZACHIST_NV,'
      '       DETAILS.T_STROZH_EQ_S,'
      '       DETAILS.T_STROZH_PR,'
      '       DETAILS.T_STROZH_M,'
      '       DETAILS.T_STROZH_NV,'
      '       DETAILS.T_OTVERST_EQ_S,'
      '       DETAILS.T_OTVERST_PR,'
      '       DETAILS.T_OTVERST_COUNT,'
      '       DETAILS.T_OTVERST_DIAM,'
      '       DETAILS.T_OTVERST_NV,'
      '       DETAILS.T_GIBKA_EQ_S,'
      '       DETAILS.T_GIBKA_PR,'
      '       DETAILS.T_GIBKA_NV,'
      '       DETAILS.PRIM'
      '  FROM    CMKNEW.DETAILS'
      '       JOIN'
      '          CMKNEW.GRMATERIALS'
      '       ON DETAILS.CGRMATERIALS = GRMATERIALS.NREC')
    Left = 152
    Top = 152
    object DetailsADOQueryCKD: TFloatField
      FieldName = 'CKD'
    end
    object DetailsADOQueryNUMP: TStringField
      FieldName = 'NUMP'
    end
    object DetailsADOQueryGRMATERIALS_S: TStringField
      FieldName = 'GRMATERIALS_S'
      ReadOnly = True
      Size = 593
    end
    object DetailsADOQueryT_RAZMET_EQ_S: TStringField
      FieldName = 'T_RAZMET_EQ_S'
      Size = 255
    end
    object DetailsADOQueryT_RAZMET_NV: TFloatField
      FieldName = 'T_RAZMET_NV'
    end
    object DetailsADOQueryT_RAZMET_PR: TStringField
      FieldName = 'T_RAZMET_PR'
      Size = 255
    end
    object DetailsADOQueryT_REZKA_EQ_S: TStringField
      FieldName = 'T_REZKA_EQ_S'
      Size = 255
    end
    object DetailsADOQueryT_REZKA_PR: TStringField
      FieldName = 'T_REZKA_PR'
      Size = 255
    end
    object DetailsADOQueryT_REZKA_M: TFloatField
      FieldName = 'T_REZKA_M'
    end
    object DetailsADOQueryT_REZKA_NV: TFloatField
      FieldName = 'T_REZKA_NV'
    end
    object DetailsADOQueryT_ZACHIST_TYPE_S: TStringField
      FieldName = 'T_ZACHIST_TYPE_S'
      Size = 255
    end
    object DetailsADOQueryT_ZACHIST_NV: TFloatField
      FieldName = 'T_ZACHIST_NV'
    end
    object DetailsADOQueryT_STROZH_EQ_S: TStringField
      FieldName = 'T_STROZH_EQ_S'
      Size = 255
    end
    object DetailsADOQueryT_STROZH_PR: TStringField
      FieldName = 'T_STROZH_PR'
      Size = 255
    end
    object DetailsADOQueryT_STROZH_M: TFloatField
      FieldName = 'T_STROZH_M'
    end
    object DetailsADOQueryT_STROZH_NV: TFloatField
      FieldName = 'T_STROZH_NV'
    end
    object DetailsADOQueryT_OTVERST_EQ_S: TStringField
      FieldName = 'T_OTVERST_EQ_S'
      Size = 255
    end
    object DetailsADOQueryT_OTVERST_PR: TStringField
      FieldName = 'T_OTVERST_PR'
      Size = 255
    end
    object DetailsADOQueryT_OTVERST_COUNT: TFloatField
      FieldName = 'T_OTVERST_COUNT'
    end
    object DetailsADOQueryT_OTVERST_DIAM: TStringField
      FieldName = 'T_OTVERST_DIAM'
      Size = 100
    end
    object DetailsADOQueryT_OTVERST_NV: TFloatField
      FieldName = 'T_OTVERST_NV'
    end
    object DetailsADOQueryT_GIBKA_EQ_S: TStringField
      FieldName = 'T_GIBKA_EQ_S'
      Size = 255
    end
    object DetailsADOQueryT_GIBKA_PR: TStringField
      FieldName = 'T_GIBKA_PR'
      Size = 255
    end
    object DetailsADOQueryT_GIBKA_NV: TFloatField
      FieldName = 'T_GIBKA_NV'
    end
    object DetailsADOQueryPRIM: TStringField
      FieldName = 'PRIM'
      Size = 255
    end
    object DetailsADOQueryPROP_STEELMARK: TFloatField
      FieldName = 'PROP_STEELMARK'
    end
    object DetailsADOQueryPROP_STEELMARK_C: TStringField
      FieldName = 'PROP_STEELMARK_C'
      Size = 50
    end
  end
  object xlApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 104
    Top = 416
  end
  object SPGOTADOQuery: TADOQuery
    Connection = ADOConnection
    Filtered = True
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <
      item
        Name = 'pCKD'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end
      item
        Name = 'pCMARK'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end
      item
        Name = 'pCPLANS'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end
      item
        Name = 'PNUMP'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select * from CMKNEW.SPGOT'
      'where CKD=:pCKD'
      'and CMARK = :pCMARK'
      'and CPLANS = :pCPLANS'
      'and NUMP = :PNUMP')
    Left = 184
    Top = 416
    object SPGOTADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object SPGOTADOQueryCKD: TFloatField
      FieldName = 'CKD'
    end
    object SPGOTADOQueryCPLANS: TFloatField
      FieldName = 'CPLANS'
    end
    object SPGOTADOQueryCMARK: TFloatField
      FieldName = 'CMARK'
    end
    object SPGOTADOQueryNUMP: TStringField
      FieldName = 'NUMP'
    end
    object SPGOTADOQueryCPERSON: TFloatField
      FieldName = 'CPERSON'
    end
    object SPGOTADOQueryKOL: TFloatField
      FieldName = 'KOL'
    end
    object SPGOTADOQueryTRIMDATE: TDateTimeField
      FieldName = 'TRIMDATE'
    end
    object SPGOTADOQueryTRIMMED: TFloatField
      FieldName = 'TRIMMED'
    end
    object SPGOTADOQueryPUT: TFloatField
      FieldName = 'PUT'
    end
    object SPGOTADOQueryCPASSPORT: TFloatField
      FieldName = 'CPASSPORT'
    end
    object SPGOTADOQueryTRIMDUTY: TFloatField
      FieldName = 'TRIMDUTY'
    end
    object SPGOTADOQueryOPERTYPE: TFloatField
      FieldName = 'OPERTYPE'
    end
    object SPGOTADOQueryPERSON: TStringField
      FieldKind = fkLookup
      FieldName = 'PERSON'
      LookupDataSet = PersonsADOQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'AGGNAME'
      KeyFields = 'CPERSON'
      Lookup = True
    end
    object SPGOTADOQueryPASSPORT: TStringField
      FieldKind = fkLookup
      FieldName = 'PASSPORT'
      LookupDataSet = PassportsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NUM'
      KeyFields = 'CPASSPORT'
      Lookup = True
    end
  end
  object PersonsADOQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <
      item
        Name = 'pType'
        DataType = ftInteger
        Value = 3
      end>
    SQL.Strings = (
      
        'select ID, LASTNAME || '#39' '#39' || FIRSTNAME || '#39' '#39' || MIDDLENAME AGG' +
        'NAME from CMKNEW.MRP'
      'where TYPE = :pType')
    Left = 288
    Top = 448
    object PersonsADOQueryAGGNAME: TStringField
      FieldName = 'AGGNAME'
      ReadOnly = True
      Size = 92
    end
    object PersonsADOQueryID: TFloatField
      FieldName = 'ID'
    end
  end
  object PassportsADOQuery: TADOQuery
    Connection = ADOConnection
    BeforeOpen = BeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.PASSPORTS')
    Left = 440
    Top = 400
    object PassportsADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object PassportsADOQueryCSPARRIVALS: TFloatField
      FieldName = 'CSPARRIVALS'
    end
    object PassportsADOQueryNUM: TStringField
      FieldName = 'NUM'
      Size = 16
    end
    object PassportsADOQuerySPENT: TFloatField
      FieldName = 'SPENT'
    end
  end
  object LArticlesQuery: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from PPU_PLAN.LARTICLES@GAL')
    Left = 24
    Top = 72
    object LArticlesQueryID: TFloatField
      FieldName = 'ID'
    end
    object LArticlesQueryTITLE: TStringField
      FieldName = 'TITLE'
    end
    object LArticlesQueryORD: TFloatField
      FieldName = 'ORD'
    end
    object LArticlesQueryFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 150
    end
    object LArticlesQueryDOP: TFloatField
      FieldName = 'DOP'
    end
  end
  object LMaterialQuery: TADOQuery
    Active = True
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = BeforeOpen
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from PPU_PLAN.LMATERIAL@GAL')
    Left = 24
    Top = 168
    object LMaterialQueryID: TFloatField
      FieldName = 'ID'
    end
    object LMaterialQueryTITLE: TStringField
      FieldName = 'TITLE'
      Size = 100
    end
  end
  object KDDataSource: TDataSource
    DataSet = SelectKDQuery
    Left = 40
    Top = 368
  end
end
