object SelectListsForm: TSelectListsForm
  Left = 376
  Top = 276
  BorderIcons = []
  Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  ClientHeight = 285
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 478
    Height = 36
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    AutoSize = False
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1091#1078#1085#1086#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1081' '#1080#1079' '#1084#1072#1088#1086#1082':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
    ExplicitWidth = 310
  end
  object Panel1: TPanel
    Left = 0
    Top = 228
    Width = 488
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      488
      57)
    object BitBtn1: TBitBtn
      Left = 354
      Top = 16
      Width = 121
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
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 186
      Top = 16
      Width = 121
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object Grid: TDBGridEh
    AlignWithMargins = True
    Left = 5
    Top = 51
    Width = 478
    Height = 172
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    AutoFitColWidths = True
    Color = clBtnFace
    Constraints.MinHeight = 172
    Constraints.MinWidth = 310
    DataSource = DataSource
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = []
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
    TabOrder = 1
    TitleParams.RowLines = 1
    Columns = <
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'ordn'
        Footers = <>
        Title.Caption = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
        Width = 73
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 147
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'queue'
        Footers = <>
        Title.Caption = #1054#1095#1077#1088#1077#1076#1100
        Width = 98
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'drawing'
        Footers = <>
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Width = 97
      end
      item
        AutoFitColWidth = False
        Color = clWindow
        DynProps = <>
        EditButtons = <>
        FieldName = 'cnt'
        Footers = <>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object DataSource: TDataSource
    Left = 160
    Top = 112
  end
end
