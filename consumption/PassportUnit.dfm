object PassportForm: TPassportForm
  Left = 0
  Top = 0
  Caption = #1055#1072#1089#1087#1086#1088#1090
  ClientHeight = 678
  ClientWidth = 1132
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 300
    Width = 1132
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 120
    ExplicitWidth = 872
  end
  object Panel1: TPanel
    Left = 0
    Top = 632
    Width = 1132
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      1132
      46)
    object ImportBtn: TBitBtn
      Left = 799
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
      Left = 976
      Top = 8
      Width = 145
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
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
    object BitBtn14: TBitBtn
      Left = 16
      Top = 8
      Width = 201
      Height = 25
      Action = PassportReportAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1072
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      WordWrap = True
    end
    object BitBtn5: TBitBtn
      Left = 232
      Top = 8
      Width = 201
      Height = 25
      Action = PassportTreeAction
      Caption = #1044#1077#1088#1077#1074#1086' '#1086#1087#1077#1088#1072#1094#1080#1081
      TabOrder = 3
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 303
    Width = 1132
    Height = 329
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Panel5: TPanel
      Left = 0
      Top = 0
      Width = 1132
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 12
        Top = 1
        Width = 29
        Height = 13
        Caption = #1055#1083#1072#1085':'
      end
      object Label2: TLabel
        Left = 375
        Top = 1
        Width = 58
        Height = 13
        Caption = #1079'-'#1079' '#8470' '#1052#1056#1050':'
      end
      object Label3: TLabel
        Left = 473
        Top = 1
        Width = 60
        Height = 13
        Caption = #1079'-'#1079' '#8470' '#1062#1052#1050':'
      end
      object f_PLAN: TComboBox
        Left = 12
        Top = 14
        Width = 357
        Height = 21
        TabOrder = 0
        OnChange = f_PLANChange
      end
      object f_ORDERNUM: TComboBox
        Left = 375
        Top = 14
        Width = 92
        Height = 21
        Sorted = True
        TabOrder = 1
        OnChange = f_ORDERNUMChange
      end
      object f_ORDERNUM2: TComboBox
        Left = 473
        Top = 14
        Width = 92
        Height = 21
        Sorted = True
        TabOrder = 2
        OnChange = f_ORDERNUM2Change
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 41
      Width = 1132
      Height = 288
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 459
        Top = 0
        Height = 288
        Align = alRight
        ExplicitLeft = 688
        ExplicitTop = 64
        ExplicitHeight = 100
      end
      object Panel7: TPanel
        Left = 462
        Top = 0
        Width = 670
        Height = 288
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 670
          Height = 231
          Align = alClient
          Caption = ' '#1044#1054' '#1086#1089#1090#1072#1090#1086#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1072': '
          TabOrder = 0
          object OstatokGrid: TDBGridEh
            Left = 2
            Top = 15
            Width = 666
            Height = 189
            Align = alClient
            AutoFitColWidths = True
            DataSource = OstatokDS
            DynProps = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            FooterRowCount = 1
            FooterParams.Color = clWindow
            IndicatorOptions = []
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            ParentFont = False
            ParentShowHint = False
            RowSizingAllowed = True
            ShowHint = True
            SortLocal = True
            SumList.Active = True
            TabOrder = 0
            TitleParams.MultiTitle = True
            OnKeyDown = OstatokGridKeyDown
            Columns = <
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'DATEF'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
                Width = 90
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'MARKIR'
                Footers = <>
                Title.Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
                Width = 82
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Caption = #1048#1084#1103
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
                Width = 164
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'TrimType_S'
                Footers = <>
                Title.Caption = #1058#1080#1087' '#1086#1073#1088#1077#1079#1080
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_PWIDTH1'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'1 ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_PWIDTH2'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'2 ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_SIZE1'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1056#1072#1079#1084#1077#1088' 1 ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_SIZE2'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1056#1072#1079#1084#1077#1088' 2 ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_WTHICK'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1058#1086#1083#1097#1080#1085#1072' '#1089#1090#1077#1085#1082#1080' ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_SLENGTH'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1044#1083#1080#1085#1072' ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_DIAM'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1044#1080#1072#1084#1077#1090#1088' ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_SIZE'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1056#1072#1079#1084#1077#1088' ('#1084#1084')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_THICK_C'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1058#1086#1083#1097#1080#1085#1072
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_WIDTH_C'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1064#1080#1088#1080#1085#1072
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_LENGTH_C'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1044#1083#1080#1085#1072
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_A'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|A'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_B'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|B'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_C'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|C'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_D'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|D'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'PROP_SQUARE'
                Footers = <>
                Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1055#1083#1086#1097#1072#1076#1100' ('#1084#1084#178')'
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'KOLT'
                Footer.FieldName = 'KOLT'
                Footer.ToolTips = True
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1042#1077#1089
                Title.TitleButton = True
                Title.ToolTips = True
                ToolTips = True
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object ostatokDBNavigator: TDBNavigator
            Left = 2
            Top = 204
            Width = 666
            Height = 25
            DataSource = OstatokDS
            Align = alBottom
            Hints.Strings = (
              #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1057#1083#1077#1076#1091#1102#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
              #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
              #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
              #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
              #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
              #1054#1073#1085#1086#1074#1080#1090#1100
              'Apply updates'
              'Cancel updates')
            Kind = dbnHorizontal
            ParentShowHint = False
            ConfirmDelete = False
            ShowHint = True
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 231
          Width = 670
          Height = 57
          Align = alBottom
          Caption = ' '#1051#1086#1084': '
          TabOrder = 1
          DesignSize = (
            670
            57)
          object f_lom: TLabel
            Left = 16
            Top = 24
            Width = 8
            Height = 16
            Caption = '0'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpisButton: TSpeedButton
            Left = 576
            Top = 19
            Width = 91
            Height = 22
            Action = SpisAction
            Anchors = [akTop, akRight, akBottom]
            Flat = True
          end
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 459
        Height = 288
        Align = alClient
        Caption = ' '#1048#1079#1075#1086#1090#1086#1074#1083#1077#1085#1085#1099#1077' '#1076#1077#1090#1072#1083#1080': '
        TabOrder = 1
        object DetailsGrid: TDBGridEh
          Left = 2
          Top = 66
          Width = 455
          Height = 220
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          AutoFitColWidths = True
          DataSource = detailsDS
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterRowCount = 1
          FooterParams.Color = clWindow
          IndicatorOptions = []
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          ParentShowHint = False
          RowSizingAllowed = True
          ShowHint = True
          SortLocal = True
          SumList.Active = True
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnDblClick = EditDetailActionExecute
          OnKeyDown = DetailsGridKeyDown
          Columns = <
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATEIZG'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 90
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDERNUM'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1079'-'#1079' '#8470' '#1052#1056#1050
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 68
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDERNUM2'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1079'-'#1079' '#8470' '#1062#1052#1050
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 51
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDN'
              Footers = <>
              ReadOnly = True
              Title.Caption = #8470'/'#1055
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 34
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'DETAILS_S'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1077#1090#1072#1083#1080
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 93
              OnDropDownBoxCheckButton = DetailsGridColumns4DropDownBoxCheckButton
              OnEditButtonClick = DetailsGridColumns4EditButtonClick
              OnEditButtonDown = DetailsGridColumns4EditButtonDown
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'KOLSHTP'
              Footer.FieldName = 'KOLSHTP'
              Footer.ToolTips = True
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1083#1072#1085#1086#1074#1086#1077
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 67
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'KOLSHTF'
              Footer.FieldName = 'KOLSHTF'
              Footer.ToolTips = True
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 71
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '0.00000000'
              DynProps = <>
              EditButtons = <>
              FieldName = 'WEIGHT1'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1077#1086#1088'.'#1074#1077#1089' 1 '#1096#1090'.'
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 100
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '0.00000000'
              DynProps = <>
              EditButtons = <>
              FieldName = 'WEIGHT1F'
              Footers = <>
              Title.Caption = #1060#1072#1082#1090'.'#1074#1077#1089' 1 '#1096#1090'.'
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 100
            end
            item
              Alignment = taRightJustify
              AutoFitColWidth = False
              DisplayFormat = '0.00000000'
              DynProps = <>
              EditButtons = <>
              FieldName = 'WEIGHT'
              Footer.FieldName = 'WEIGHT'
              Footer.ToolTips = True
              Footer.ValueType = fvtSum
              Footers = <>
              ReadOnly = True
              Title.Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel6: TPanel
          Left = 2
          Top = 15
          Width = 455
          Height = 51
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object BitBtn2: TBitBtn
            Left = 10
            Top = 6
            Width = 127
            Height = 35
            Action = AppendDetailAction
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Visible = False
          end
          object BitBtn3: TBitBtn
            Left = 157
            Top = 6
            Width = 132
            Height = 35
            Action = EditDetailAction
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
          end
          object BitBtn4: TBitBtn
            Left = 312
            Top = 6
            Width = 128
            Height = 35
            Action = DelDetailAction
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
          object BitBtn6: TBitBtn
            Left = 14
            Top = 6
            Width = 127
            Height = 35
            Action = AppendDetailsAction
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1090#1072#1083#1080
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1132
    Height = 300
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter3: TSplitter
      Left = 681
      Top = 33
      Height = 267
      Align = alRight
      ExplicitLeft = 656
      ExplicitTop = 80
      ExplicitHeight = 100
    end
    object Panel8: TPanel
      Left = 684
      Top = 33
      Width = 448
      Height = 267
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 448
        Height = 267
        Align = alClient
        Caption = ' '#1048#1089#1090#1086#1088#1080#1103': '
        TabOrder = 0
        object HistoryGrid: TDBGridEh
          Left = 2
          Top = 15
          Width = 444
          Height = 250
          Align = alClient
          Color = clBtnFace
          DataSource = HistoryDS
          DynProps = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterRowCount = 1
          FooterParams.Color = clBtnFace
          IndicatorOptions = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          ParentFont = False
          ParentShowHint = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          RowSizingAllowed = True
          ShowHint = True
          SortLocal = True
          SumList.Active = True
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnDblClick = HistoryEditActionExecute
          OnKeyDown = HistoryGridKeyDown
          Columns = <
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
              Width = 69
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATEIZG'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1080#1079#1075'.'
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 82
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
              Width = 50
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'ORDN'
              Footers = <>
              Title.Caption = #8470'/'#1055
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 37
            end
            item
              AutoFitColWidth = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'KOLSHTF'
              Footer.FieldName = 'KOLSHTF'
              Footer.ToolTips = True
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1092#1072#1082#1090#1080#1095#1077#1089#1082#1086#1077
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 75
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
              Title.Caption = #1054#1073#1097#1080#1081' '#1074#1077#1089
              Title.TitleButton = True
              Title.ToolTips = True
              ToolTips = True
              Width = 79
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object Panel9: TPanel
      Left = 0
      Top = 0
      Width = 1132
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object f_NUM: TLabeledEdit
        Left = 103
        Top = 6
        Width = 161
        Height = 21
        EditLabel.Width = 67
        EditLabel.Height = 13
        EditLabel.Caption = #8470' '#1087#1072#1089#1087#1086#1088#1090#1072':'
        LabelPosition = lpLeft
        MaxLength = 16
        TabOrder = 0
      end
    end
    object GroupBox5: TGroupBox
      Left = 0
      Top = 33
      Width = 681
      Height = 267
      Align = alClient
      Caption = ' '#1052#1072#1090#1077#1088#1080#1072#1083' '#1074' '#1085#1072#1083#1080#1095#1080#1080': '
      TabOrder = 2
      object CurrentGrid: TDBGridEh
        Left = 2
        Top = 15
        Width = 677
        Height = 250
        Align = alClient
        AutoFitColWidths = True
        DataSource = currentDS
        DynProps = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterRowCount = 1
        FooterParams.Color = clWindow
        ImeMode = imDisable
        IndicatorOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        RowSizingAllowed = True
        ShowHint = True
        SortLocal = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NREC'
            Footers = <>
            Visible = False
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'CSPPASSPORTS'
            Footers = <>
            Visible = False
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATEF'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1103
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 90
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'MARKIR'
            Footers = <>
            Title.Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 73
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1048#1084#1103
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
            Width = 196
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'TrimType_S'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1086#1073#1088#1077#1079#1080
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_PWIDTH1'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'1 ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_PWIDTH2'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1064#1080#1088#1080#1085#1072' '#1087#1086#1083#1082#1080'2 ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_SIZE1'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1056#1072#1079#1084#1077#1088' 1 ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_SIZE2'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1056#1072#1079#1084#1077#1088' 2 ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_WTHICK'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1058#1086#1083#1097#1080#1085#1072' '#1089#1090#1077#1085#1082#1080' ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_SLENGTH'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1044#1083#1080#1085#1072' ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_DIAM'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1044#1080#1072#1084#1077#1090#1088' ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_SIZE'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1056#1072#1079#1084#1077#1088' ('#1084#1084')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_THICK_C'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1058#1086#1083#1097#1080#1085#1072
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_WIDTH_C'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1064#1080#1088#1080#1085#1072
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_LENGTH_C'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1044#1083#1080#1085#1072
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_A'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|A'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_B'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|B'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_C'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|C'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_D'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|D'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP_SQUARE'
            Footers = <>
            Title.Caption = #1043#1072#1073#1072#1088#1080#1090#1099'|'#1055#1083#1086#1097#1072#1076#1100' ('#1084#1084#178')'
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'KOLT'
            Footer.FieldName = 'KOLT'
            Footer.ToolTips = True
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1077#1089
            Title.TitleButton = True
            Title.ToolTips = True
            ToolTips = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object currentADOQ: TADOQuery
    ConnectionString = 
      'Provider=OraOLEDB.Oracle.1;Password=b6118616479;Persist Security' +
      ' Info=True;User ID=Danatela;Data Source=server1571'
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from cmknew.sppassports')
    Left = 552
    Top = 8
    object currentADOQNREC: TFloatField
      FieldName = 'NREC'
    end
    object currentADOQKOLT: TFloatField
      FieldName = 'KOLT'
    end
    object currentADOQPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object currentADOQPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object currentADOQPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object currentADOQPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object currentADOQPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object currentADOQPROP_SLENGTH: TFloatField
      FieldName = 'PROP_SLENGTH'
    end
    object currentADOQPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object currentADOQPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object currentADOQCPASSPORTS: TFloatField
      FieldName = 'CPASSPORTS'
    end
    object currentADOQNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object currentADOQMARKIR: TStringField
      FieldName = 'MARKIR'
      Size = 16
    end
    object currentADOQCSPPASSPORTS: TFloatField
      FieldName = 'CSPPASSPORTS'
    end
    object currentADOQDATEF: TDateTimeField
      FieldName = 'DATEF'
    end
    object currentADOQPROP_A: TFloatField
      FieldName = 'PROP_A'
    end
    object currentADOQPROP_B: TFloatField
      FieldName = 'PROP_B'
    end
    object currentADOQPROP_C: TFloatField
      FieldName = 'PROP_C'
    end
    object currentADOQPROP_D: TFloatField
      FieldName = 'PROP_D'
    end
    object currentADOQTRIMTYPE: TFloatField
      FieldName = 'TRIMTYPE'
    end
    object currentADOQPROP_SQUARE: TFloatField
      FieldName = 'PROP_SQUARE'
    end
    object currentADOQTrimType_S: TStringField
      FieldKind = fkLookup
      FieldName = 'TrimType_S'
      LookupDataSet = TrimTypesADOQ
      LookupKeyFields = 'NREC'
      LookupResultField = 'DESCR'
      KeyFields = 'TRIMTYPE'
      Lookup = True
    end
    object currentADOQISLOM: TFloatField
      FieldName = 'ISLOM'
    end
    object currentADOQLOMDATE: TDateTimeField
      FieldName = 'LOMDATE'
    end
    object currentADOQLOMPERSON: TFloatField
      FieldName = 'LOMPERSON'
    end
    object currentADOQLOMCOMMENT: TStringField
      FieldName = 'LOMCOMMENT'
      Size = 255
    end
    object currentADOQPROP_THICK_C: TFloatField
      FieldName = 'PROP_THICK_C'
    end
    object currentADOQPROP_WIDTH_C: TFloatField
      FieldName = 'PROP_WIDTH_C'
    end
    object currentADOQPROP_LENGTH_C: TFloatField
      FieldName = 'PROP_LENGTH_C'
    end
  end
  object ActionManager1: TActionManager
    Images = ImageList1
    Left = 352
    StyleName = 'Platform Default'
    object AppendDetailsAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1090#1072#1083#1080
      ImageIndex = 3
      ShortCut = 16502
      OnExecute = AppendDetailsActionExecute
    end
    object AppendDetailAction: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 3
      ShortCut = 118
      OnExecute = AppendDetailActionExecute
    end
    object EditDetailAction: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 1
      ShortCut = 115
      OnExecute = EditDetailActionExecute
    end
    object DelDetailAction: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1090#1072#1083#1100
      ImageIndex = 2
      ShortCut = 8238
      OnExecute = DelDetailActionExecute
    end
    object PassportReportAction: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1087#1072#1089#1087#1086#1088#1090#1072
      ImageIndex = 0
      ShortCut = 16464
      OnExecute = PassportReportActionExecute
    end
    object HistoryEditAction: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 1
      OnExecute = HistoryEditActionExecute
    end
    object PassportTreeAction: TAction
      Caption = #1044#1077#1088#1077#1074#1086' '#1086#1087#1077#1088#1072#1094#1080#1081
      ImageIndex = 5
      OnExecute = PassportTreeActionExecute
    end
    object SpisAction: TAction
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1074' '#1083#1086#1084
      OnExecute = SpisActionExecute
    end
  end
  object ImageList1: TImageList
    Left = 280
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF000000BF000000BF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008080800000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF000000BF000000BF000000BF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BF000000BF000000BF000000FFFFFF00BF000000BF00
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00BF000000BF000000BF000000FFFFFF000000000000000000BF00
      0000BF000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      80008080800080808000BF000000FFFFFF00FFFFFF0000000000000000000000
      0000BF000000FFFFFF0000000000000000000000000000000000000000000000
      000080808000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000BF000000FFFFFF00000000000000000000000000000000000000
      0000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800080808000808080008080800080808000FFFFFF0000000000000000000000
      00000000000000000000BF000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000BF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      800080808000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080008080800080808000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C0000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000FFFFFF00FFFFFF00FFFFFF00C0C0C000C0C0
      C00000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C0000000FF000000FF000000FF00C0C0C000C0C0
      C00000000000C0C0C0000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C00000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      000080808000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C00000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000080808000000000000000
      00008080800000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C0000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080808000FFFFFF0080808000000000000000000000000000FFFFFF000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C0000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000080808000808080008080
      8000FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000FFFF008080
      800000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF00000000000000000000000000000000008080800000FF
      FF008080800000FFFF008080800000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FF000000FF000000FF000000FF000000FF000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF0000000000000000008080800000FFFF000000
      000080808000FFFFFF00000000008080800000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000FFFF00000000000000
      00008080800000FFFF00000000000000000080808000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFDE3F00000000FF9FDE3F00000000
      FF0FD82000000000FE0FDA3F000000008007DBFF000000008023D1FF00000000
      8033C107000000008039D1FF00000000803CDFFF00000000803ED1FF00000000
      873FC10700000000803FD1FF00000000857FDFFF0000000080FF8FFF00000000
      81FF083F00000000FFFF8FFF00000000FFFFFC00FFFFF801C007FC00FFFCF801
      80032000F3FFF80100010000E1F9F80100010000E1F3F80100010000F0E3F801
      00000000F847B00100000000FC0FB00180000000FE1FE001C0000000FC0F8203
      E001E000F84F8007E007F800E0E3C00FF007F000C1F1927FF003E001C7F8B33F
      F803C403FFFFF3FFFFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object currentDS: TDataSource
    DataSet = currentADOQ
    OnDataChange = currentDSDataChange
    Left = 576
    Top = 112
  end
  object detailsADOQ: TADOQuery
    AfterInsert = detailsADOQAfterInsert
    BeforePost = detailsADOQBeforePost
    EnableBCD = False
    Parameters = <>
    Left = 616
    Top = 8
  end
  object ostatokADOQ: TADOQuery
    AfterInsert = ostatokADOQAfterInsert
    BeforePost = ostatokADOQBeforePost
    EnableBCD = False
    Parameters = <>
    Left = 584
    Top = 8
    object ostatokADOQNREC: TFloatField
      FieldName = 'NREC'
    end
    object ostatokADOQKOLT: TFloatField
      FieldName = 'KOLT'
    end
    object ostatokADOQPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object ostatokADOQPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object ostatokADOQPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object ostatokADOQPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object ostatokADOQPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object ostatokADOQPROP_SLENGTH: TFloatField
      FieldName = 'PROP_SLENGTH'
    end
    object ostatokADOQPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object ostatokADOQPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object ostatokADOQPROP_THICK_C: TFloatField
      FieldName = 'PROP_THICK_C'
    end
    object ostatokADOQPROP_WIDTH_C: TFloatField
      FieldName = 'PROP_WIDTH_C'
    end
    object ostatokADOQPROP_LENGTH_C: TFloatField
      FieldName = 'PROP_LENGTH_C'
    end
    object ostatokADOQCPASSPORTS: TFloatField
      FieldName = 'CPASSPORTS'
    end
    object ostatokADOQNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object ostatokADOQMARKIR: TStringField
      FieldName = 'MARKIR'
      Size = 16
    end
    object ostatokADOQCSPPASSPORTS: TFloatField
      FieldName = 'CSPPASSPORTS'
    end
    object ostatokADOQDATEF: TDateTimeField
      FieldName = 'DATEF'
    end
    object ostatokADOQPROP_A: TFloatField
      FieldName = 'PROP_A'
    end
    object ostatokADOQPROP_B: TFloatField
      FieldName = 'PROP_B'
    end
    object ostatokADOQPROP_C: TFloatField
      FieldName = 'PROP_C'
    end
    object ostatokADOQPROP_D: TFloatField
      FieldName = 'PROP_D'
    end
    object ostatokADOQTRIMTYPE: TFloatField
      FieldName = 'TRIMTYPE'
      OnChange = ostatokADOQTRIMTYPEChange
    end
    object ostatokADOQPROP_SQUARE: TFloatField
      FieldName = 'PROP_SQUARE'
    end
    object ostatokADOQTrimType_S: TStringField
      FieldKind = fkLookup
      FieldName = 'TrimType_S'
      LookupDataSet = TrimTypesADOQ
      LookupKeyFields = 'NREC'
      LookupResultField = 'DESCR'
      KeyFields = 'TRIMTYPE'
      Lookup = True
    end
    object ostatokADOQISLOM: TFloatField
      FieldName = 'ISLOM'
    end
    object ostatokADOQLOMDATE: TDateTimeField
      FieldName = 'LOMDATE'
    end
    object ostatokADOQLOMPERSON: TFloatField
      FieldName = 'LOMPERSON'
    end
    object ostatokADOQLOMCOMMENT: TStringField
      FieldName = 'LOMCOMMENT'
      Size = 255
    end
  end
  object HistoryADOQ: TADOQuery
    EnableBCD = False
    Parameters = <>
    Left = 648
    Top = 8
  end
  object OstatokDS: TDataSource
    DataSet = ostatokADOQ
    OnDataChange = OstatokDSDataChange
    Left = 608
    Top = 112
  end
  object HistoryDS: TDataSource
    DataSet = HistoryADOQ
    OnDataChange = HistoryDSDataChange
    Left = 640
    Top = 112
  end
  object detailsDS: TDataSource
    DataSet = detailsADOQ
    OnDataChange = detailsDSDataChange
    Left = 672
    Top = 112
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 104
    Top = 64
    object N1: TMenuItem
      Action = HistoryEditAction
    end
  end
  object plansADOQ: TADOQuery
    Parameters = <>
    Left = 296
    Top = 224
  end
  object TrimTypesADOQ: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select nrec, descr, params from cmknew.trimtypes')
    Left = 384
    Top = 224
    object TrimTypesADOQNREC: TFloatField
      FieldName = 'NREC'
    end
    object TrimTypesADOQDESCR: TStringField
      FieldName = 'DESCR'
    end
    object TrimTypesADOQPARAMS: TMemoField
      FieldName = 'PARAMS'
      BlobType = ftMemo
    end
  end
  object spisADOQ: TADOQuery
    Parameters = <
      item
        Name = 'pComment'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'pNREC'
        DataType = ftFloat
        Value = Null
      end>
    SQL.Strings = (
      
        'update CMKNEW.SPPASSPORTS set ISLOM=1, LOMDATE=SysDate, LOMPERSO' +
        'N=UID, LOMCOMMENT = :pComment'
      'where NREC=:pNREC')
    Left = 1008
    Top = 592
  end
end
