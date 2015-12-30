object EditSpGotForm: TEditSpGotForm
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080' '#1088#1072#1089#1096#1080#1088#1077#1085#1085#1086#1075#1086' '#1087#1083#1072#1085#1072
  ClientHeight = 407
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    526
    407)
  PixelsPerInch = 96
  TextHeight = 13
  object SPGOTDBGridEh: TDBGridEh
    Left = 8
    Top = 8
    Width = 510
    Height = 360
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = SPGOTDataSource
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    OnKeyDown = SPGOTDBGridEhKeyDown
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object CancelBitBtn: TBitBtn
    Left = 443
    Top = 374
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
  end
  object OKBitBtn: TBitBtn
    Left = 362
    Top = 374
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 2
  end
  object SPGOTDataSource: TDataSource
    DataSet = SPGOTADOQuery
    Left = 32
    Top = 352
  end
  object SPGOTADOQuery: TADOQuery
    Connection = ImportPlanForm.ADOConnection
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = SPGOTADOQueryBeforeOpen
    AfterInsert = SPGOTADOQueryAfterInsert
    EnableBCD = False
    Parameters = <
      item
        Name = 'PCKD'
        Size = -1
        Value = Null
      end
      item
        Name = 'PCPLANS'
        Size = -1
        Value = Null
      end
      item
        Name = 'PCMARK'
        Size = -1
        Value = Null
      end
      item
        Name = 'PNUMP'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from CMKNEW.SPGOT'
      'where CKD = :PCKD'
      'and CPLANS = :PCPLANS'
      'and CMARK = :PCMARK'
      'and NUMP = :PNUMP')
    Left = 104
    Top = 352
    object SPGOTADOQueryNREC: TFloatField
      FieldName = 'NREC'
      Visible = False
    end
    object SPGOTADOQueryCKD: TFloatField
      FieldName = 'CKD'
      Visible = False
    end
    object SPGOTADOQueryCPLANS: TFloatField
      FieldName = 'CPLANS'
      Visible = False
    end
    object SPGOTADOQueryCMARK: TFloatField
      FieldName = 'CMARK'
      Visible = False
    end
    object SPGOTADOQueryNUMP: TStringField
      FieldName = 'NUMP'
      Visible = False
    end
    object SPGOTADOQueryOPERTYPE: TFloatField
      FieldName = 'OPERTYPE'
      Visible = False
    end
    object SPGOTADOQueryCPERSON: TFloatField
      FieldName = 'CPERSON'
      Visible = False
    end
    object SPGOTADOQueryCPASSPORT: TFloatField
      FieldName = 'CPASSPORT'
      Visible = False
    end
    object SPGOTADOQueryTRIMDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      FieldName = 'TRIMDATE'
    end
    object SPGOTADOQueryTRIMMED: TFloatField
      DisplayLabel = #1054#1090#1088#1077#1079#1072#1085#1086
      FieldName = 'TRIMMED'
    end
    object SPGOTADOQueryPUT: TFloatField
      DisplayLabel = #1057#1076#1072#1085#1086
      FieldName = 'PUT'
    end
    object SPGOTADOQueryTRIMDUTY: TFloatField
      DisplayLabel = #1054#1090#1088#1077#1079#1072#1085#1086' '#1087#1086' '#1085#1072#1088#1103#1076#1072#1084
      FieldName = 'TRIMDUTY'
    end
    object SPGOTADOQueryPERSON: TStringField
      DisplayLabel = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'PERSON'
      LookupDataSet = ImportPlanForm.PersonsADOQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'AGGNAME'
      KeyFields = 'CPERSON'
      Lookup = True
    end
    object SPGOTADOQueryPASSPORT: TStringField
      DisplayLabel = #1055#1072#1089#1087#1086#1088#1090
      FieldKind = fkLookup
      FieldName = 'PASSPORT'
      LookupDataSet = ImportPlanForm.PassportsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NUM'
      KeyFields = 'CPASSPORT'
      Lookup = True
    end
    object SPGOTADOQueryKOL: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      FieldName = 'KOL'
    end
  end
end
