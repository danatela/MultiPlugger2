object PersonSelectorForm: TPersonSelectorForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1090#1072#1083#1086#1075' '#1087#1077#1088#1089#1086#1085#1072#1083#1072
  ClientHeight = 487
  ClientWidth = 731
  Color = clBtnFace
  Constraints.MinHeight = 280
  Constraints.MinWidth = 640
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
  object PersonGrid: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 725
    Height = 421
    Align = alClient
    AutoFitColWidths = True
    BorderStyle = bsNone
    DataGrouping.GroupLevels = <>
    DataSource = PersonDS
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
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    PopupMenu = PopupMenu
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = PersonGridDblClick
    OnKeyDown = PersonGridKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1060'.'#1048'.'#1054'.'
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 414
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'tabnum'
        Footers = <>
        Title.Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 430
    Width = 725
    Height = 54
    Align = alBottom
    Caption = ' '#1060#1080#1083#1100#1090#1088': '
    TabOrder = 1
    object f_fio: TLabeledEdit
      Left = 64
      Top = 21
      Width = 281
      Height = 22
      EditLabel.Width = 42
      EditLabel.Height = 14
      EditLabel.Caption = #1060'.'#1048'.'#1054'.'
      LabelPosition = lpLeft
      TabOrder = 0
      OnKeyDown = f_fioKeyDown
    end
    object f_tabnum: TLabeledEdit
      Left = 488
      Top = 21
      Width = 81
      Height = 22
      EditLabel.Width = 119
      EditLabel.Height = 14
      EditLabel.Caption = #1058#1072#1073#1077#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088':'
      LabelPosition = lpLeft
      TabOrder = 1
      OnKeyDown = f_fioKeyDown
    end
    object f_filtered: TCheckBox
      Left = 592
      Top = 24
      Width = 122
      Height = 17
      Caption = #1086#1090#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100
      TabOrder = 2
      OnClick = f_filteredClick
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
    Left = 376
    Top = 152
    StyleName = 'Platform Default'
    object SelectAction: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = SelectActionExecute
    end
  end
  object PopupMenu: TPopupMenu
    Left = 464
    Top = 200
    object N3: TMenuItem
      Action = SelectAction
      Default = True
    end
  end
  object PersonMTE: TMemTableEh
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'PersonMTEIndex1'
        Fields = 'nrec'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'PersonMTEIndex2'
        Fields = 'cparent'
      end>
    Params = <>
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'nrec'
    TreeList.RefParentFieldName = 'cparent'
    Left = 520
    Top = 128
    object PersonMTEnrec: TStringField
      FieldName = 'nrec'
      Size = 100
    end
    object PersonMTEcparent: TStringField
      FieldName = 'cparent'
      Size = 100
    end
    object StringField1: TStringField
      FieldName = 'name'
      Size = 100
    end
    object StringField2: TStringField
      FieldName = 'code'
      Size = 8
    end
    object StringField3: TStringField
      FieldName = 'cexclassseg'
      Size = 16
    end
    object PersonMTEtabnum: TStringField
      FieldName = 'tabnum'
      Size = 8
    end
  end
  object PersonDS: TDataSource
    DataSet = PersonMTE
    Left = 472
    Top = 128
  end
end
