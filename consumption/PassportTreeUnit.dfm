object PassportTreeForm: TPassportTreeForm
  Left = 218
  Top = 141
  Caption = #1054#1087#1077#1088#1072#1094#1080#1080' '#1089' '#1087#1072#1089#1087#1086#1088#1090#1086#1084
  ClientHeight = 442
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000009999999999990000000000000000000099999999999900000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF80
    01FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFF8001FFFFFFFFFFFFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 720
    Height = 442
    Align = alClient
    AutoFitColWidths = True
    DataSource = Source
    DynProps = <>
    FooterParams.Color = clWindow
    IndicatorOptions = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ReadOnly = True
    SortLocal = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDrawColumnCell = GridDrawColumnCell
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083'/'#1044#1054'/'#1044#1077#1090#1072#1083#1100
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 222
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'markir'
        Footers = <>
        Title.Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072'/'#8470' '#1076#1077#1090#1072#1083#1080
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 83
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'datef'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 71
      end
      item
        AutoFitColWidth = False
        DynProps = <>
        EditButtons = <>
        FieldName = 'kolt'
        Footers = <>
        Title.Caption = #1042#1077#1089
        Title.TitleButton = True
        Title.ToolTips = True
        ToolTips = True
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Source: TDataSource
    DataSet = MTE
    Left = 248
    Top = 20
  end
  object MTE: TMemTableEh
    FieldDefs = <
      item
        Name = 'kolt'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'markir'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'datef'
        DataType = ftDate
      end
      item
        Name = 'do'
        DataType = ftBoolean
      end
      item
        Name = 'nrec'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'csppassports'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'nrec'
    TreeList.RefParentFieldName = 'csppassports'
    TreeList.DefaultNodeExpanded = True
    Left = 280
    Top = 224
    object MTEkolt: TFloatField
      DisplayWidth = 10
      FieldName = 'kolt'
    end
    object MTEmarkir: TStringField
      DisplayWidth = 16
      FieldName = 'markir'
      Size = 16
    end
    object MTEname: TStringField
      DisplayWidth = 255
      FieldName = 'name'
      Size = 255
    end
    object MTEdatef: TDateField
      DisplayWidth = 10
      FieldName = 'datef'
    end
    object MTEdo: TBooleanField
      DisplayWidth = 5
      FieldName = 'do'
    end
    object MTEnrec: TStringField
      DisplayWidth = 40
      FieldName = 'nrec'
      Size = 40
    end
    object MTEcsppassports: TStringField
      DisplayWidth = 40
      FieldName = 'csppassports'
      Size = 40
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object kolt: TMTNumericDataFieldEh
          FieldName = 'kolt'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          currency = False
          Precision = 15
        end
        object markir: TMTStringDataFieldEh
          FieldName = 'markir'
          StringDataType = fdtStringEh
          Size = 16
        end
        object name: TMTStringDataFieldEh
          FieldName = 'name'
          StringDataType = fdtStringEh
          Size = 255
        end
        object datef: TMTDateTimeDataFieldEh
          FieldName = 'datef'
          DateTimeDataType = fdtDateEh
        end
        object do: TMTBooleanDataFieldEh
          FieldName = 'do'
        end
        object nrec: TMTStringDataFieldEh
          FieldName = 'nrec'
          StringDataType = fdtStringEh
          Size = 40
        end
        object csppassports: TMTStringDataFieldEh
          FieldName = 'csppassports'
          StringDataType = fdtStringEh
          Size = 40
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end
