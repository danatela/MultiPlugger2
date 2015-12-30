object EditJobForm: TEditJobForm
  Left = 209
  Top = 142
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103
  ClientHeight = 521
  ClientWidth = 734
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RightPanel: TPanel
    Left = 549
    Top = 0
    Width = 185
    Height = 521
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object PrintBitBtn: TBitBtn
      Left = 6
      Top = 415
      Width = 75
      Height = 25
      Caption = #1055#1077#1095#1072#1090#1100
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF000000
        0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000FF00FF00FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C00000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFF
        FF00C0C0C000C0C0C000000000000000000000000000FF00FF0000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000FF000000FF000000
        FF00C0C0C000C0C0C00000000000C0C0C00000000000FF00FF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000C0C0C000C0C0C0000000000000000000C0C0
        C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
        C000C0C0C00000000000C0C0C00000000000C0C0C00000000000FF00FF000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000C0C0C00000000000C0C0C0000000000000000000FF00FF00FF00
        FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0000000000C0C0C00000000000C0C0C00000000000FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FF000000FF000000FF000000FF000000FF00
        0000FFFFFF0000000000000000000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FF000000FF000000FF000000FF00
        0000FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00000000000000000000000000000000000000
        000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      TabOrder = 0
    end
    object FormJobBitBtn: TBitBtn
      Left = 16
      Top = 72
      Width = 153
      Height = 25
      Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
      TabOrder = 1
      OnClick = FormJobBitBtnClick
    end
  end
  object ClientPanel: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 521
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object SwitchTabSet: TTabSet
      Left = 0
      Top = 41
      Width = 549
      Height = 21
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      SoftTop = True
      Style = tsSoftTabs
      Tabs.Strings = (
        #1054#1073#1097#1080#1081' '#1089#1087#1080#1089#1086#1082
        #1056#1077#1079#1082#1072
        #1054#1090#1074#1077#1088#1089#1090#1080#1103
        #1057#1090#1088#1086#1078#1082#1072
        #1043#1080#1073#1082#1072
        #1057#1087#1080#1089#1086#1082' '#1052'/'#1087' '#1080' '#1044#1054)
      TabIndex = 5
      TabPosition = tpTop
      OnChange = SwitchTabSetChange
    end
    object TopPanel: TPanel
      Left = 0
      Top = 0
      Width = 549
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object NumJobLabeledEdit: TLabeledEdit
        Left = 88
        Top = 14
        Width = 121
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = #8470' '#1047#1072#1076#1072#1085#1080#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        LabelPosition = lpLeft
        ParentFont = False
        TabOrder = 0
      end
      object DateLabeledEdit: TLabeledEdit
        Left = 272
        Top = 14
        Width = 121
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = #1044#1072#1090#1072':'
        LabelPosition = lpLeft
        TabOrder = 1
      end
    end
    object RezkaDBGridEh: TDBGridEh
      Left = 0
      Top = 62
      Width = 549
      Height = 459
      Align = alClient
      Border.ExtendedDraw = False
      DataSource = AllDataSource
      DynProps = <>
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 4
      TitleParams.MultiTitle = True
      OnEnter = RezkaDBGridEhEnter
      OnKeyDown = GibkaDBGridEhKeyDown
      Columns = <
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'TAKEJOB'
          Footers = <>
          Width = 98
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PROFILE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL'
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
          FieldName = 'WEIGHT'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_M'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ENTRYDATE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Width = 400
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object OtverstDBGridEh: TDBGridEh
      Left = 0
      Top = 62
      Width = 549
      Height = 459
      Align = alClient
      Border.ExtendedDraw = False
      DataSource = AllDataSource
      DynProps = <>
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 5
      TitleParams.MultiTitle = True
      OnEnter = OtverstDBGridEhEnter
      OnKeyDown = GibkaDBGridEhKeyDown
      Columns = <
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'TAKEJOB'
          Footers = <>
          Width = 98
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PROFILE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL'
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
          FieldName = 'WEIGHT'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_DIAM'
          Footers = <>
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_COUNT'
          Footers = <>
          Width = 154
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ENTRYDATE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Width = 400
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object StrozhDBGridEh: TDBGridEh
      Left = 0
      Top = 62
      Width = 549
      Height = 459
      Align = alClient
      Border.ExtendedDraw = False
      DataSource = AllDataSource
      DynProps = <>
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 6
      TitleParams.MultiTitle = True
      OnEnter = StrozhDBGridEhEnter
      OnKeyDown = GibkaDBGridEhKeyDown
      Columns = <
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'TAKEJOB'
          Footers = <>
          Width = 98
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PROFILE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL'
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
          FieldName = 'WEIGHT'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_M'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ENTRYDATE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Width = 400
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object GibkaDBGridEh: TDBGridEh
      Left = 0
      Top = 62
      Width = 549
      Height = 459
      Align = alClient
      Border.ExtendedDraw = False
      DataSource = AllDataSource
      DynProps = <>
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 7
      TitleParams.MultiTitle = True
      OnEnter = GibkaDBGridEhEnter
      OnKeyDown = GibkaDBGridEhKeyDown
      Columns = <
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'TAKEJOB'
          Footers = <>
          Width = 98
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PROFILE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL'
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
          FieldName = 'WEIGHT'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_GIBKA_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_GIBKA_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_GIBKA_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ENTRYDATE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Width = 400
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object JointDBGridEh: TDBGridEh
      Left = 0
      Top = 62
      Width = 549
      Height = 459
      Align = alClient
      Border.ExtendedDraw = False
      DataSource = AllDataSource
      DynProps = <>
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 2
      TitleParams.MultiTitle = True
      OnEnter = JointDBGridEhEnter
      OnKeyDown = GibkaDBGridEhKeyDown
      Columns = <
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'TAKEJOB'
          Footers = <>
          Width = 98
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDERNUM2'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORDN'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PROFILE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'KOL'
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
          FieldName = 'WEIGHT'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_M'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_REZKA_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_DIAM'
          Footers = <>
          Width = 60
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_COUNT'
          Footers = <>
          Width = 154
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_OTVERST_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_M'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_STROZH_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_GIBKA_EQ_S'
          Footers = <>
          Width = 100
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_GIBKA_NV'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'T_GIBKA_PR'
          Footers = <>
          Width = 200
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ENTRYDATE'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTE'
          Footers = <>
          Width = 400
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object MPDOPanel: TGridPanel
      Left = 0
      Top = 62
      Width = 549
      Height = 459
      Align = alClient
      BevelOuter = bvNone
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = MPPanel
          Row = 0
        end
        item
          Column = 0
          Control = DOPanel
          Row = 1
        end>
      RowCollection = <
        item
          Value = 50.000000000000000000
        end
        item
          Value = 50.000000000000000000
        end>
      TabOrder = 3
      object MPPanel: TPanel
        Left = 0
        Top = 0
        Width = 549
        Height = 229
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object MPLabel: TLabel
          Left = 0
          Top = 0
          Width = 549
          Height = 16
          Align = alTop
          Caption = #1052'/'#1087
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 22
        end
        object MPDBGridEh: TDBGridEh
          Left = 0
          Top = 16
          Width = 549
          Height = 213
          Align = alClient
          DataSource = MPDataSource
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          SortLocal = True
          STFilter.Local = True
          STFilter.Location = stflInTitleFilterEh
          STFilter.Visible = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MARKIR'
              Footers = <>
              Title.Caption = #8470' '#1083#1080#1089#1090#1072
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NUM'
              Footers = <>
              Title.Caption = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
              Title.TitleButton = True
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'THICKNESS'
              Footers = <>
              Title.Caption = #1058#1086#1083#1097#1080#1085#1072
              Width = 73
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PROP_WIDTH_C'
              Footers = <>
              Title.Caption = #1064#1080#1088#1080#1085#1072
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'LENGTHNESS'
              Footers = <>
              Title.Caption = #1044#1083#1080#1085#1072
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KOLT'
              Footers = <>
              Title.Caption = #1042#1077#1089
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object DOPanel: TPanel
        Left = 0
        Top = 229
        Width = 549
        Height = 230
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DOLabel: TLabel
          Left = 0
          Top = 0
          Width = 549
          Height = 16
          Align = alTop
          Caption = #1044#1054
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitWidth = 18
        end
        object DODBGridEh: TDBGridEh
          Left = 0
          Top = 16
          Width = 549
          Height = 214
          Align = alClient
          DataSource = DODataSource
          DynProps = <>
          FooterParams.Color = clWindow
          IndicatorOptions = [gioShowRowIndicatorEh]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          SortLocal = True
          STFilter.Local = True
          STFilter.Location = stflInTitleFilterEh
          STFilter.Visible = True
          TabOrder = 0
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'MARKIR'
              Footers = <>
              Title.Caption = #8470' '#1083#1080#1089#1090#1072
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NUM'
              Footers = <>
              Title.Caption = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072
              Title.TitleButton = True
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
              Title.TitleButton = True
              Width = 100
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'THICKNESS'
              Footers = <>
              Title.Caption = #1058#1086#1083#1097#1080#1085#1072
              Width = 69
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'PROP_WIDTH_C'
              Footers = <>
              Title.Caption = #1064#1080#1088#1080#1085#1072
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'LENGTHNESS'
              Footers = <>
              Title.Caption = #1044#1083#1080#1085#1072
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'KOLT'
              Footers = <>
              Title.Caption = #1042#1077#1089
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object AllDataSource: TDataSource
    DataSet = AllADOQuery
    Left = 496
    Top = 456
  end
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    OnWillConnect = ADOConnectionWillConnect
    Left = 144
    Top = 128
  end
  object AllADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.JOBS')
    Left = 232
    Top = 224
    object AllADOQueryID: TFloatField
      FieldName = 'ID'
    end
    object AllADOQueryORDERNUM: TStringField
      FieldName = 'ORDERNUM'
      Size = 10
    end
    object AllADOQueryORDERNUM2: TStringField
      DisplayLabel = #1079'-'#1079#8470' '#1062#1052#1050
      FieldName = 'ORDERNUM2'
      Size = 7
    end
    object AllADOQueryORDN: TStringField
      DisplayLabel = #8470' '#1087'/'#1087
      FieldName = 'ORDN'
      Size = 5
    end
    object AllADOQueryENTRYDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1085#1077#1089#1077#1085#1080#1103
      FieldName = 'ENTRYDATE'
    end
    object AllADOQueryNOTE: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTE'
      Size = 255
    end
    object AllADOQueryTAKEJOB: TFMTBCDField
      DisplayLabel = #1042#1079#1103#1090#1100' '#1074' '#1088#1072#1073#1086#1090#1091
      FieldName = 'TAKEJOB'
      MaxValue = '1'
      MinValue = '0'
      Precision = 38
      Size = 0
    end
    object AllADOQueryPROFILE: TStringField
      DisplayLabel = #1055#1088#1086#1092#1080#1083#1100
      FieldName = 'PROFILE'
    end
    object AllADOQueryKOL: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'KOL'
    end
    object AllADOQueryWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' 1 '#1096#1090'.'
      FieldName = 'WEIGHT1'
    end
    object AllADOQueryWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1073#1097#1080#1081
      FieldName = 'WEIGHT'
    end
    object AllADOQueryT_REZKA_CEQ: TFloatField
      FieldName = 'T_REZKA_CEQ'
    end
    object AllADOQueryT_REZKA_M: TFloatField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1052#1077#1090#1088#1072#1078
      FieldName = 'T_REZKA_M'
    end
    object AllADOQueryT_REZKA_NV: TFloatField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1053'/'#1042
      FieldName = 'T_REZKA_NV'
    end
    object AllADOQueryT_REZKA_PR: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_REZKA_PR'
      Size = 255
    end
    object AllADOQueryT_OTVERST_CEQ: TFloatField
      FieldName = 'T_OTVERST_CEQ'
    end
    object AllADOQueryT_OTVERST_DIAM: TStringField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1044#1080#1072#1084#1077#1090#1088
      FieldName = 'T_OTVERST_DIAM'
      Size = 100
    end
    object AllADOQueryT_OTVERST_COUNT: TFMTBCDField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'T_OTVERST_COUNT'
      Precision = 38
      Size = 0
    end
    object AllADOQueryT_OTVERST_NV: TFloatField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1053'/'#1042
      FieldName = 'T_OTVERST_NV'
    end
    object AllADOQueryT_OTVERST_PR: TStringField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_OTVERST_PR'
      Size = 255
    end
    object AllADOQueryT_STROZH_CEQ: TFloatField
      FieldName = 'T_STROZH_CEQ'
    end
    object AllADOQueryT_STROZH_M: TFloatField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1052#1077#1090#1088#1072#1078
      FieldName = 'T_STROZH_M'
    end
    object AllADOQueryT_STROZH_NV: TFloatField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1053'/'#1042
      FieldName = 'T_STROZH_NV'
    end
    object AllADOQueryT_STROZH_PR: TStringField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_STROZH_PR'
      Size = 255
    end
    object AllADOQueryT_GIBKA_CEQ: TFloatField
      FieldName = 'T_GIBKA_CEQ'
    end
    object AllADOQueryT_GIBKA_NV: TFloatField
      DisplayLabel = #1043#1080#1073#1082#1072'|'#1053'/'#1042
      FieldName = 'T_GIBKA_NV'
    end
    object AllADOQueryT_GIBKA_PR: TStringField
      DisplayLabel = #1043#1080#1073#1082#1072'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'T_GIBKA_PR'
      Size = 255
    end
    object AllADOQueryT_REZKA_EQ_S: TStringField
      DisplayLabel = #1056#1077#1079#1082#1072'|'#1052#1072#1096#1080#1085#1072
      DisplayWidth = 40
      FieldKind = fkLookup
      FieldName = 'T_REZKA_EQ_S'
      LookupDataSet = RezkaADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_REZKA_CEQ'
      Size = 255
      Lookup = True
    end
    object AllADOQueryT_OTVERST_EQ_S: TStringField
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103'|'#1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_OTVERST_EQ_S'
      LookupDataSet = OtverstADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_OTVERST_CEQ'
      Size = 255
      Lookup = True
    end
    object AllADOQueryT_STROZH_EQ_S: TStringField
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072'|'#1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_STROZH_EQ_S'
      LookupDataSet = StrozhADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_STROZH_CEQ'
      Size = 255
      Lookup = True
    end
    object AllADOQueryT_GIBKA_EQ_S: TStringField
      DisplayLabel = #1043#1080#1073#1082#1072'|'#1052#1072#1096#1080#1085#1072
      FieldKind = fkLookup
      FieldName = 'T_GIBKA_EQ_S'
      LookupDataSet = GibkaADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'MODEL'
      KeyFields = 'T_GIBKA_CEQ'
      Size = 255
      Lookup = True
    end
  end
  object GibkaADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from cmknew.EQUIPMENT where '
      
        'NREC in (select CEQUIPMENT from cmknew.OPEREQUIP where COPERATIO' +
        'N=9) and (active=1)'
      ' order by freq desc,name'
      '')
    Left = 232
    Top = 432
    object GibkaADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object GibkaADOQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object GibkaADOQueryFREQ: TFMTBCDField
      FieldName = 'FREQ'
      Precision = 38
      Size = 0
    end
    object GibkaADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object GibkaADOQueryINVNUM: TFMTBCDField
      FieldName = 'INVNUM'
      Precision = 38
      Size = 0
    end
    object GibkaADOQueryCEHNUM: TStringField
      FieldName = 'CEHNUM'
      Size = 12
    end
    object GibkaADOQueryPYEAR: TFMTBCDField
      FieldName = 'PYEAR'
      Precision = 38
      Size = 0
    end
    object GibkaADOQueryMODEL: TStringField
      FieldName = 'MODEL'
      Size = 255
    end
    object GibkaADOQueryCSITE: TFloatField
      FieldName = 'CSITE'
    end
    object GibkaADOQueryOPERATIONS: TStringField
      FieldName = 'OPERATIONS'
      Size = 255
    end
  end
  object StrozhADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from cmknew.EQUIPMENT where '
      
        'NREC in (select CEQUIPMENT from cmknew.OPEREQUIP where COPERATIO' +
        'N=8) and (active=1)'
      ' order by freq desc,name'
      '')
    Left = 232
    Top = 376
    object StrozhADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object StrozhADOQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object StrozhADOQueryFREQ: TFMTBCDField
      FieldName = 'FREQ'
      Precision = 38
      Size = 0
    end
    object StrozhADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object StrozhADOQueryINVNUM: TFMTBCDField
      FieldName = 'INVNUM'
      Precision = 38
      Size = 0
    end
    object StrozhADOQueryCEHNUM: TStringField
      FieldName = 'CEHNUM'
      Size = 12
    end
    object StrozhADOQueryPYEAR: TFMTBCDField
      FieldName = 'PYEAR'
      Precision = 38
      Size = 0
    end
    object StrozhADOQueryMODEL: TStringField
      FieldName = 'MODEL'
      Size = 255
    end
    object StrozhADOQueryCSITE: TFloatField
      FieldName = 'CSITE'
    end
    object StrozhADOQueryOPERATIONS: TStringField
      FieldName = 'OPERATIONS'
      Size = 255
    end
  end
  object OtverstADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from cmknew.EQUIPMENT where '
      
        'NREC in (select CEQUIPMENT from cmknew.OPEREQUIP where COPERATIO' +
        'N=7) and (active=1)'
      ' order by freq desc,name'
      '')
    Left = 232
    Top = 328
    object OtverstADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object OtverstADOQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object OtverstADOQueryFREQ: TFMTBCDField
      FieldName = 'FREQ'
      Precision = 38
      Size = 0
    end
    object OtverstADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object OtverstADOQueryINVNUM: TFMTBCDField
      FieldName = 'INVNUM'
      Precision = 38
      Size = 0
    end
    object OtverstADOQueryCEHNUM: TStringField
      FieldName = 'CEHNUM'
      Size = 12
    end
    object OtverstADOQueryPYEAR: TFMTBCDField
      FieldName = 'PYEAR'
      Precision = 38
      Size = 0
    end
    object OtverstADOQueryMODEL: TStringField
      FieldName = 'MODEL'
      Size = 255
    end
    object OtverstADOQueryCSITE: TFloatField
      FieldName = 'CSITE'
    end
    object OtverstADOQueryOPERATIONS: TStringField
      FieldName = 'OPERATIONS'
      Size = 255
    end
  end
  object RezkaADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select * from cmknew.EQUIPMENT where '
      
        'NREC in (select CEQUIPMENT from cmknew.OPEREQUIP where COPERATIO' +
        'N=6) and (active=1)'
      ' order by freq desc,name')
    Left = 232
    Top = 272
    object RezkaADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object RezkaADOQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object RezkaADOQueryFREQ: TFMTBCDField
      FieldName = 'FREQ'
      Precision = 38
      Size = 0
    end
    object RezkaADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object RezkaADOQueryINVNUM: TFMTBCDField
      FieldName = 'INVNUM'
      Precision = 38
      Size = 0
    end
    object RezkaADOQueryCEHNUM: TStringField
      FieldName = 'CEHNUM'
      Size = 12
    end
    object RezkaADOQueryPYEAR: TFMTBCDField
      FieldName = 'PYEAR'
      Precision = 38
      Size = 0
    end
    object RezkaADOQueryMODEL: TStringField
      FieldName = 'MODEL'
      Size = 255
    end
    object RezkaADOQueryCSITE: TFloatField
      FieldName = 'CSITE'
    end
    object RezkaADOQueryOPERATIONS: TStringField
      FieldName = 'OPERATIONS'
      Size = 255
    end
  end
  object DODataSource: TDataSource
    DataSet = DOADOQuery
    Left = 48
    Top = 416
  end
  object MPDataSource: TDataSource
    DataSet = MPADOQuery
    Left = 32
    Top = 168
  end
  object DOADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select spd.*, pas.*,'
      'case spd.prop_thick_c'
      'when 0 then spd.prop_wthick'
      'else spd.prop_thick_c'
      'end thickness,'
      'case spd.prop_length_c'
      'when 0 then spd.prop_slength'
      'else spd.prop_length_c'
      'end lengthness'
      ' from cmknew.sppassports sp'
      'join cmknew.passports pas'
      'on sp.cpassports = pas.nrec'
      'join cmknew.sppassports spd'
      'on spd.csppassports = sp.nrec'
      
        'where (select count(*) from cmknew.sppassports where csppassport' +
        's=sp.nrec) > 0')
    Left = 48
    Top = 376
    object DOADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object DOADOQueryKOLT: TFloatField
      FieldName = 'KOLT'
    end
    object DOADOQueryPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object DOADOQueryPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object DOADOQueryPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object DOADOQueryPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object DOADOQueryPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object DOADOQueryPROP_SLENGTH: TFloatField
      FieldName = 'PROP_SLENGTH'
    end
    object DOADOQueryPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object DOADOQueryPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object DOADOQueryPROP_THICK_C: TFloatField
      FieldName = 'PROP_THICK_C'
    end
    object DOADOQueryPROP_WIDTH_C: TFloatField
      FieldName = 'PROP_WIDTH_C'
    end
    object DOADOQueryPROP_LENGTH_C: TFloatField
      FieldName = 'PROP_LENGTH_C'
    end
    object DOADOQueryCPASSPORTS: TFloatField
      FieldName = 'CPASSPORTS'
    end
    object DOADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object DOADOQueryMARKIR: TStringField
      FieldName = 'MARKIR'
      Size = 16
    end
    object DOADOQueryCSPPASSPORTS: TFloatField
      FieldName = 'CSPPASSPORTS'
    end
    object DOADOQueryDATEF: TDateTimeField
      FieldName = 'DATEF'
    end
    object DOADOQueryNREC_1: TFloatField
      FieldName = 'NREC_1'
    end
    object DOADOQueryCSPARRIVALS: TFloatField
      FieldName = 'CSPARRIVALS'
    end
    object DOADOQueryNUM: TStringField
      FieldName = 'NUM'
      Size = 16
    end
    object DOADOQuerySPENT: TFMTBCDField
      FieldName = 'SPENT'
      Precision = 38
      Size = 0
    end
    object DOADOQueryTHICKNESS: TFMTBCDField
      FieldName = 'THICKNESS'
      Precision = 38
      Size = 0
    end
    object DOADOQueryLENGTHNESS: TFMTBCDField
      FieldName = 'LENGTHNESS'
      Precision = 38
      Size = 0
    end
  end
  object MPADOQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      'select sp.*, pas.*,'
      'case sp.prop_thick_c'
      'when 0 then sp.prop_wthick'
      'else sp.prop_thick_c'
      'end thickness,'
      'case sp.prop_length_c'
      'when 0 then sp.prop_slength'
      'else sp.prop_length_c'
      'end lengthness'
      ' from cmknew.sppassports sp'
      'join cmknew.passports pas'
      'on sp.cpassports = pas.nrec'
      
        'where (select count(*) from cmknew.sppassports where csppassport' +
        's=sp.nrec) = 0')
    Left = 32
    Top = 120
    object MPADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object MPADOQueryKOLT: TFloatField
      FieldName = 'KOLT'
    end
    object MPADOQueryPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object MPADOQueryPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object MPADOQueryPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object MPADOQueryPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object MPADOQueryPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object MPADOQueryPROP_SLENGTH: TFloatField
      FieldName = 'PROP_SLENGTH'
    end
    object MPADOQueryPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object MPADOQueryPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object MPADOQueryPROP_THICK_C: TFloatField
      FieldName = 'PROP_THICK_C'
    end
    object MPADOQueryPROP_WIDTH_C: TFloatField
      FieldName = 'PROP_WIDTH_C'
    end
    object MPADOQueryPROP_LENGTH_C: TFloatField
      FieldName = 'PROP_LENGTH_C'
    end
    object MPADOQueryCPASSPORTS: TFloatField
      FieldName = 'CPASSPORTS'
    end
    object MPADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object MPADOQueryMARKIR: TStringField
      FieldName = 'MARKIR'
      Size = 16
    end
    object MPADOQueryCSPPASSPORTS: TFloatField
      FieldName = 'CSPPASSPORTS'
    end
    object MPADOQueryDATEF: TDateTimeField
      FieldName = 'DATEF'
    end
    object MPADOQueryNREC_1: TFloatField
      FieldName = 'NREC_1'
    end
    object MPADOQueryCSPARRIVALS: TFloatField
      FieldName = 'CSPARRIVALS'
    end
    object MPADOQueryNUM: TStringField
      FieldName = 'NUM'
      Size = 16
    end
    object MPADOQuerySPENT: TFMTBCDField
      FieldName = 'SPENT'
      Precision = 38
      Size = 0
    end
    object MPADOQueryTHICKNESS: TFMTBCDField
      FieldName = 'THICKNESS'
      Precision = 38
      Size = 0
    end
    object MPADOQueryLENGTHNESS: TFMTBCDField
      FieldName = 'LENGTHNESS'
      Precision = 38
      Size = 0
    end
  end
  object DMarksTotalQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeOpen = DOADOQueryBeforeOpen
    Parameters = <>
    SQL.Strings = (
      '  SELECT DMARKS.NUMP,'
      '         CASE GRMATERIALS.CPARENT'
      '            WHEN 3'
      '            THEN'
      
        '               DETAILS.GRMATERIALS_S                            ' +
        '     -- '#1055#1088#1086#1095#1080#1077
      '            WHEN 4'
      '            THEN'
      '                  '#39#1051#1080#1089#1090' '#39
      '               || DETAILS.PROP_WIDTH_C'
      '               || '#39'*'#39
      '               || DETAILS.PROP_THICK_C'
      '               || '#39'*'#39
      '               || DETAILS.PROP_LENGTH_C'
      '            WHEN 5'
      '            THEN'
      '                  '#39#1050#1074#1072#1076#1088#1072#1090' '#39
      '               || DETAILS.PROP_SIZE'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 6'
      '            THEN'
      '                  '#39#1043#1085#1091#1090#1099#1081' '#1087#1088#1086#1092#1080#1083#1100' '#39
      '               || DETAILS.PROP_SIZE1'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SIZE2'
      '               || '#39'*'#39
      '               || DETAILS.PROP_WTHICK'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 7'
      '            THEN'
      '                  '#39#1058#1088#1091#1073#1072' '#7443#39
      '               || DETAILS.PROP_DIAM'
      '               || '#39'*'#39
      '               || DETAILS.PROP_WTHICK'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 8'
      '            THEN'
      '                  '#39#1041#1072#1083#1082#1072' '#39
      '               || DETAILS.PROP_PROFNUM'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 9'
      '            THEN'
      '                  '#39#1041#1072#1083#1082#1072' '#39
      '               || DETAILS.PROP_PROFNUM'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 10'
      '            THEN'
      '                  '#39#1059#1075#1086#1083#1086#1082' '#39
      '               || DETAILS.PROP_PWIDTH1'
      '               || '#39'*'#39
      '               || DETAILS.PROP_PWIDTH2'
      '               || '#39'*'#39
      '               || DETAILS.PROP_WTHICK'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 11'
      '            THEN'
      '                  '#39#1064#1074#1077#1083#1083#1077#1088' '#39
      '               || DETAILS.PROP_PROFNUM'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '            WHEN 100'
      '            THEN'
      '                  '#39#1050#1088#1091#1075' '#7443#39
      '               || DETAILS.PROP_DIAM'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      
        '            WHEN 101                                            ' +
        '     -- '#1050#1088#1077#1087#1105#1078
      '            THEN'
      '                  DETAILS.PROP_FIXTYPE_C'
      '               || '#39' '#39
      '               || DETAILS.PROP_CARVTYPE_C'
      '               || '#39' '#39
      '               || DETAILS.PROP_DIAM'
      '               || '#39'*'#39
      '               || DETAILS.PROP_SLENGTH'
      '         END'
      '            GRMATERIALS_S'
      '    FROM CMKNEW.KD'
      '         JOIN CMKNEW.MARKS'
      '            ON KD.NREC = MARKS.CKD'
      '         JOIN CMKNEW.DMARKS'
      '            ON MARKS.NREC = DMARKS.CMARK'
      '         JOIN CMKNEW.DETAILS'
      
        '            ON DMARKS.NUMP = DETAILS.NUMP AND MARKS.CKD = DETAIL' +
        'S.CKD'
      '         JOIN CMKNEW.SPPLANS'
      '            ON     MARKS.ORDN = SPPLANS.ORDN'
      '               AND KD.ORDERNUM = SPPLANS.ORDERNUM'
      '               AND KD.ORDERNUM2 = SPPLANS.ORDERNUM2'
      '         JOIN CMKNEW.PLANS'
      '            ON SPPLANS.CPLANS = PLANS.NREC'
      '         JOIN CMKNEW.GRMATERIALS'
      '            ON DETAILS.CGRMATERIALS = GRMATERIALS.NREC'
      '   WHERE KD.ACTDATE >= SYSDATE'
      'GROUP BY DMARKS.NUMP,'
      '         DETAILS.GRMATERIALS_S,'
      'ORDER BY DMARKS.NUMP')
    Left = 360
    Top = 224
    object DMarksTotalQueryNUMP: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldName = 'NUMP'
    end
    object StringField4: TStringField
      DisplayLabel = #1055#1088#1086#1092#1080#1083#1100
      FieldName = 'GRMATERIALS_S'
      Size = 255
    end
  end
end
