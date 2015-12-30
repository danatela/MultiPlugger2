object AddPersonForm: TAddPersonForm
  Left = 0
  Top = 0
  ClientHeight = 271
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PersonsDBGridEh: TDBGridEh
    Left = 0
    Top = 25
    Width = 404
    Height = 246
    Align = alClient
    DataSource = PersonsDataSource
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'LASTNAME'
        Footers = <>
        Width = 115
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIRSTNAME'
        Footers = <>
        Width = 115
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MIDDLENAME'
        Footers = <>
        Width = 123
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object PersonsDBNavigator: TDBNavigator
    Left = 0
    Top = 0
    Width = 404
    Height = 25
    DataSource = PersonsDataSource
    Align = alTop
    Flat = True
    Kind = dbnHorizontal
    TabOrder = 1
  end
  object PersonsDataSource: TDataSource
    DataSet = PersonsADOQuery
    Left = 128
    Top = 136
  end
  object PersonsADOQuery: TADOQuery
    Connection = ApproveActForm.ADOConnection
    CursorType = ctStatic
    BeforeOpen = PersonsADOQueryBeforeOpen
    AfterInsert = PersonsADOQueryAfterInsert
    Parameters = <
      item
        Name = 'pType'
        DataType = ftWideString
        Size = 1
        Value = '0'
      end>
    SQL.Strings = (
      'select * from CMKNEW.MRP where TYPE=:pType')
    Left = 240
    Top = 200
    object PersonsADOQueryID: TFloatField
      FieldName = 'ID'
    end
    object PersonsADOQueryTYPE: TFMTBCDField
      FieldName = 'TYPE'
      Precision = 38
      Size = 0
    end
    object PersonsADOQueryFIRSTNAME: TStringField
      DisplayLabel = #1048#1084#1103
      FieldName = 'FIRSTNAME'
      Size = 30
    end
    object PersonsADOQueryLASTNAME: TStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'LASTNAME'
      Size = 30
    end
    object PersonsADOQueryMIDDLENAME: TStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'MIDDLENAME'
      Size = 30
    end
  end
end
