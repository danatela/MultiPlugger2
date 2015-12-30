object MachineSelectorForm: TMachineSelectorForm
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1089#1090#1072#1085#1082#1072' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
  ClientHeight = 408
  ClientWidth = 322
  Color = clBtnFace
  Constraints.MinHeight = 280
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object ToolsGrid: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 316
    Height = 344
    Align = alClient
    AutoFitColWidths = True
    BorderStyle = bsNone
    DataGrouping.GroupLevels = <>
    DataSource = ToolsDS
    Flat = True
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = 'Verdana'
    FooterFont.Style = []
    IndicatorOptions = []
    EmptyDataInfo.Active = True
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    PopupMenu = PopupMenu
    ReadOnly = True
    SortLocal = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = ToolsGridDblClick
    OnKeyDown = ToolsGridKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 231
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'shopcode'
        Footers = <>
        Title.Caption = #1062#1077#1093' ('#1082#1086#1076')'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 52
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 353
    Width = 316
    Height = 52
    Align = alBottom
    TabOrder = 1
    object f_tree: TCheckBox
      Left = 16
      Top = 16
      Width = 281
      Height = 17
      Caption = #1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1074' '#1074#1080#1076#1077' '#1076#1077#1088#1077#1074#1072
      TabOrder = 0
      OnClick = f_treeClick
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = SelectAction
          end>
      end>
    Left = 32
    Top = 224
    StyleName = 'Platform Default'
    object SelectAction: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = SelectActionExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 32
    Top = 272
    object N3: TMenuItem
      Action = SelectAction
      Default = True
    end
  end
  object ToolsMTE: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'nrec'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'cparent'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'shopcode'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <
      item
        Name = 'ToolsMTEIndex1'
        Fields = 'nrec'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'ToolsMTEIndex2'
        Fields = 'cparent'
      end>
    Params = <>
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'nrec'
    TreeList.RefParentFieldName = 'cparent'
    Left = 32
    Top = 128
    object ToolsMTEnrec: TStringField
      FieldName = 'nrec'
      Size = 100
    end
    object ToolsMTEcparent: TStringField
      FieldName = 'cparent'
      Size = 100
    end
    object StringField1: TStringField
      FieldName = 'name'
      Size = 100
    end
    object ToolsMTEshopcode: TStringField
      FieldName = 'shopcode'
      Size = 3
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object nrec: TMTStringDataFieldEh
          FieldName = 'nrec'
          StringDataType = fdtStringEh
          Size = 100
        end
        object cparent: TMTStringDataFieldEh
          FieldName = 'cparent'
          StringDataType = fdtStringEh
          Size = 100
        end
        object name: TMTStringDataFieldEh
          FieldName = 'name'
          StringDataType = fdtStringEh
          Size = 100
        end
        object shopcode: TMTStringDataFieldEh
          FieldName = 'shopcode'
          StringDataType = fdtStringEh
          Size = 3
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object ToolsDS: TDataSource
    DataSet = ToolsMTE
    OnDataChange = ToolsDSDataChange
    Left = 32
    Top = 176
  end
end
