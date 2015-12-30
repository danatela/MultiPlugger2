object SprSelectorForm: TSprSelectorForm
  Left = 0
  Top = 0
  ClientHeight = 389
  ClientWidth = 389
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Grid: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 383
    Height = 383
    Align = alClient
    AutoFitColWidths = True
    BorderStyle = bsNone
    DataGrouping.GroupLevels = <>
    DataSource = DS
    Flat = True
    FooterColor = clBtnFace
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -12
    FooterFont.Name = 'Verdana'
    FooterFont.Style = []
    IndicatorOptions = []
    EmptyDataInfo.Active = True
    Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDblClick = GridDblClick
    OnKeyDown = GridKeyDown
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
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
  object DS: TDataSource
    DataSet = ADOQ
    Left = 472
    Top = 128
  end
  object ADOQ: TADOQuery
    Parameters = <>
    Left = 528
    Top = 88
  end
end
