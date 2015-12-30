object ComparisonSpPlanForm: TComparisonSpPlanForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1087#1083#1072#1085#1072
  ClientHeight = 306
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ComparisonDBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 506
    Height = 306
    Align = alClient
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    DataSource = ComparisonDataSource
    DynProps = <>
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    SortLocal = True
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 0
    OnDrawColumnCell = ComparisonDBGridEhDrawColumnCell
    OnKeyDown = ComparisonDBGridEhKeyDown
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'OperStr'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ARTICLE'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Article_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTRACTOR_S'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Contractor_S_PPU'
        Footers = <>
        ReadOnly = True
        Width = 82
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RECIPIENT_S'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Recipient_S_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORDERNUM'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'OrderNum_PPU'
        Footers = <>
        ReadOnly = True
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
        FieldName = 'OrderNum2_PPU'
        Footers = <>
        ReadOnly = True
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
        FieldName = 'Ordn_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Title'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Title_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'QUEUE'
        Footers = <>
        Width = 50
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'QUEUE_PPU'
        Footers = <>
        ReadOnly = True
        Width = 50
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
        FieldName = 'KolSht_PPU'
        Footers = <>
        ReadOnly = True
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
        FieldName = 'Weight1_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DRAWING'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Drawing_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'GRAPH'
        Footers = <>
        Width = 150
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Graph_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'MATERIAL'
        Footers = <>
        Width = 200
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Material_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RELDATE'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'RELDATE_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'UPDATED'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'UPDATED_PPU'
        Footers = <>
        ReadOnly = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM'
        Footers = <>
        Width = 200
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PRIM_PPU'
        Footers = <>
        ReadOnly = True
        Width = 200
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object RightPanel: TPanel
    Left = 506
    Top = 0
    Width = 185
    Height = 306
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object MutationBitBtn: TBitBtn
      Left = 6
      Top = 8
      Width = 171
      Height = 89
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103#1084
      TabOrder = 0
      OnClick = MutationBitBtnClick
    end
    object ImportBitBtn: TBitBtn
      Left = 6
      Top = 199
      Width = 171
      Height = 90
      Caption = #1048#1084#1087#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      TabOrder = 1
      OnClick = ImportBitBtnClick
    end
    object CorrBitBtn: TBitBtn
      Left = 6
      Top = 103
      Width = 171
      Height = 89
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      TabOrder = 2
      OnClick = CorrBitBtnClick
    end
  end
  object ComparisonDataSource: TDataSource
    DataSet = ComparisonDataSet
    Left = 32
    Top = 112
  end
  object PPUQuery: TADOQuery
    CursorLocation = clUseServer
    Parameters = <>
    Left = 136
    Top = 32
    object PPUQueryNUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088
      FieldName = 'NUM'
      ReadOnly = True
    end
    object PPUQueryINUM: TFloatField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1062#1052#1050
      FieldName = 'INUM'
      ReadOnly = True
    end
    object PPUQueryONUM: TFloatField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' '#1085#1086#1084#1077#1088
      FieldName = 'ONUM'
      ReadOnly = True
    end
    object PPUQueryDRAWING: TStringField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1095#1077#1088#1090#1077#1078#1072
      FieldName = 'DRAWING'
      ReadOnly = True
      Size = 50
    end
    object PPUQueryTITLE: TStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      FieldName = 'TITLE'
      ReadOnly = True
      Size = 200
    end
    object PPUQueryPRODUCER: TFloatField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      FieldName = 'PRODUCER'
      ReadOnly = True
    end
    object PPUQueryGRAPH: TStringField
      DisplayLabel = #1043#1088#1072#1092#1080#1082
      FieldName = 'GRAPH'
      ReadOnly = True
      Size = 200
    end
    object PPUQueryNOTE: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'NOTE'
      ReadOnly = True
      Size = 1024
    end
    object PPUQueryUPDATED: TDateTimeField
      DisplayLabel = #1054#1073#1085#1086#1074#1083#1105#1085
      FieldName = 'UPDATED'
      ReadOnly = True
    end
    object PPUQueryRELDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'RELDATE'
      ReadOnly = True
    end
    object PPUQueryID: TFloatField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object PPUQueryNUM_OF: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'NUM_OF'
      ReadOnly = True
      Visible = False
    end
    object PPUQueryWEIGHT: TFloatField
      DisplayLabel = #1042#1077#1089
      FieldName = 'WEIGHT'
      ReadOnly = True
    end
    object PPUQueryCALC_WEIGHT: TFloatField
      DisplayLabel = #1054#1073#1097#1080#1081' '#1074#1077#1089
      FieldName = 'CALC_WEIGHT'
      ReadOnly = True
    end
    object PPUQueryRES_WEIGHT: TFloatField
      DisplayLabel = #1056#1072#1089#1095#1105#1090#1085#1099#1081' '#1074#1077#1089
      FieldKind = fkCalculated
      FieldName = 'RES_WEIGHT'
      ReadOnly = True
      Calculated = True
    end
    object PPUQueryORDER_ID: TFloatField
      FieldName = 'ORDER_ID'
      ReadOnly = True
    end
    object PPUQueryPLAN_ID: TFloatField
      FieldName = 'PLAN_ID'
      ReadOnly = True
    end
    object PPUQueryCNUM: TStringField
      FieldName = 'CNUM'
      ReadOnly = True
      Size = 50
    end
    object PPUQueryCADEP: TFloatField
      FieldName = 'CADEP'
      ReadOnly = True
    end
    object PPUQueryMATERIAL: TFloatField
      FieldName = 'MATERIAL'
      ReadOnly = True
    end
    object PPUQueryARTICLE: TFloatField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'ARTICLE'
      ReadOnly = True
    end
    object PPUQueryDEPTH: TFloatField
      FieldName = 'DEPTH'
      ReadOnly = True
    end
    object PPUQueryPAINT: TFloatField
      FieldName = 'PAINT'
      ReadOnly = True
    end
    object PPUQueryBSS: TFloatField
      FieldName = 'BSS'
      ReadOnly = True
    end
    object PPUQueryQNUM: TFloatField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100
      FieldName = 'QNUM'
      ReadOnly = True
    end
    object PPUQuerySERVICE: TFloatField
      DisplayLabel = #1059#1089#1083#1091#1075#1072
      FieldName = 'SERVICE'
      ReadOnly = True
    end
    object PPUQueryCONTINUE: TFloatField
      FieldName = 'CONTINUE'
      ReadOnly = True
    end
    object PPUQueryADVANCED: TFloatField
      FieldName = 'ADVANCED'
      ReadOnly = True
    end
    object PPUQueryMETIZ: TFloatField
      FieldName = 'METIZ'
      ReadOnly = True
    end
    object PPUQueryARTICLE_TITLE: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldKind = fkLookup
      FieldName = 'ARTICLE_TITLE'
      LookupDataSet = ImportPlanForm.LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Lookup = True
    end
    object PPUQueryARTICLE_ORD: TFloatField
      FieldKind = fkLookup
      FieldName = 'ARTICLE_ORD'
      LookupDataSet = ImportPlanForm.LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'ORD'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Lookup = True
    end
    object PPUQueryARTICLE_FULL_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ARTICLE_FULL_NAME'
      LookupDataSet = ImportPlanForm.LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'FULL_NAME'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Size = 150
      Lookup = True
    end
    object PPUQueryARTICLE_DOP: TFloatField
      FieldKind = fkLookup
      FieldName = 'ARTICLE_DOP'
      LookupDataSet = ImportPlanForm.LArticlesQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'DOP'
      KeyFields = 'ARTICLE'
      ReadOnly = True
      Lookup = True
    end
    object PPUQueryMATERIAL_TITLE: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083
      FieldKind = fkLookup
      FieldName = 'MATERIAL_TITLE'
      LookupDataSet = ImportPlanForm.LMaterialQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'MATERIAL'
      ReadOnly = True
      Size = 100
      Lookup = True
    end
    object PPUQueryPRODUCER_CA: TFloatField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100' (CA)'
      FieldKind = fkLookup
      FieldName = 'PRODUCER_CA'
      LookupDataSet = ImportPlanForm.LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'CA'
      KeyFields = 'PRODUCER'
      ReadOnly = True
      Lookup = True
    end
    object PPUQueryPRODUCER_TITLE: TStringField
      DisplayLabel = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
      FieldKind = fkLookup
      FieldName = 'PRODUCER_TITLE'
      LookupDataSet = ImportPlanForm.LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'PRODUCER'
      ReadOnly = True
      Size = 100
      Lookup = True
    end
    object PPUQueryCADEP_CA: TFloatField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082' (CA)'
      FieldKind = fkLookup
      FieldName = 'CADEP_CA'
      LookupDataSet = ImportPlanForm.LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'CA'
      KeyFields = 'CADEP'
      ReadOnly = True
      Lookup = True
    end
    object PPUQueryCADEP_TITLE: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      FieldKind = fkLookup
      FieldName = 'CADEP_TITLE'
      LookupDataSet = ImportPlanForm.LcaDepQuery
      LookupKeyFields = 'ID'
      LookupResultField = 'TITLE'
      KeyFields = 'CADEP'
      ReadOnly = True
      Size = 100
      Lookup = True
    end
  end
  object ComparisonDataSet: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = ComparisonDataSetCalcFields
    Left = 144
    Top = 88
    object ComparisonDataSetNREC: TFloatField
      FieldName = 'NREC'
      Visible = False
    end
    object ComparisonDataSetCCONTRACTOR: TFloatField
      FieldName = 'CCONTRACTOR'
      Visible = False
    end
    object ComparisonDataSetCONTRACTOR_S: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'CONTRACTOR_S'
      LookupDataSet = ImportPlanForm.ContractorsQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      KeyFields = 'CCONTRACTOR'
      Lookup = True
    end
    object ComparisonDataSetCRECIPIENT: TFloatField
      FieldName = 'CRECIPIENT'
      Visible = False
    end
    object ComparisonDataSetRECIPIENT_S: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
      DisplayWidth = 15
      FieldKind = fkLookup
      FieldName = 'RECIPIENT_S'
      LookupDataSet = ImportPlanForm.ContractorsQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'ABBR'
      KeyFields = 'CRECIPIENT'
      Lookup = True
    end
    object ComparisonDataSetARTICLE: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103
      FieldName = 'ARTICLE'
    end
    object ComparisonDataSetORDERNUM: TStringField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072' '#1052#1056#1050
      FieldName = 'ORDERNUM'
      Size = 7
    end
    object ComparisonDataSetORDERNUM2: TStringField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072' '#1062#1052#1050
      FieldName = 'ORDERNUM2'
      Size = 7
    end
    object ComparisonDataSetORDN: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081
      FieldName = 'ORDN'
      Size = 5
    end
    object ComparisonDataSetTitle: TStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'Title'
      Size = 100
    end
    object ComparisonDataSetKOLSHT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLSHT'
    end
    object ComparisonDataSetWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1076#1085#1086#1081
      FieldName = 'WEIGHT1'
    end
    object ComparisonDataSetPPONREC: TFloatField
      FieldName = 'PPONREC'
      Visible = False
    end
    object ComparisonDataSetMATERIAL: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083
      FieldName = 'MATERIAL'
      Size = 100
    end
    object ComparisonDataSetDRAWING: TStringField
      DisplayLabel = #8470' '#1095#1077#1088#1090#1077#1078#1072
      DisplayWidth = 25
      FieldName = 'DRAWING'
      Size = 50
    end
    object ComparisonDataSetGRAPH: TStringField
      DisplayLabel = #8470' '#1075#1088#1072#1092#1080#1082#1072
      DisplayWidth = 50
      FieldName = 'GRAPH'
      Size = 200
    end
    object ComparisonDataSetRELDATE: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103
      FieldName = 'RELDATE'
    end
    object ComparisonDataSetUPDATED: TDateTimeField
      DisplayLabel = #1054#1073#1085#1086#1074#1083#1105#1085
      FieldName = 'UPDATED'
    end
    object ComparisonDataSetUPDATED_US: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1075#1086' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1091' '#1085#1072#1089
      FieldName = 'UPDATED_US'
    end
    object ComparisonDataSetArticle_PPU: TStringField
      DisplayLabel = #1057#1090#1072#1090#1100#1103' ('#1055#1055#1059')'
      FieldName = 'Article_PPU'
    end
    object ComparisonDataSetContractor_S_PPU: TStringField
      DisplayLabel = #1047#1072#1082#1072#1079#1095#1080#1082' ('#1055#1055#1059')'
      FieldName = 'Contractor_S_PPU'
    end
    object ComparisonDataSetRecipient_S_PPU: TStringField
      DisplayLabel = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' ('#1055#1055#1059')'
      FieldName = 'Recipient_S_PPU'
    end
    object ComparisonDataSetOrderNum_PPU: TStringField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072' ('#1055#1055#1059')'
      FieldName = 'OrderNum_PPU'
    end
    object ComparisonDataSetOrderNum2_PPU: TStringField
      DisplayLabel = #8470' '#1079#1072#1082#1072#1079#1072' '#1062#1052#1050' ('#1055#1055#1059')'
      FieldName = 'OrderNum2_PPU'
    end
    object ComparisonDataSetOrdn_PPU: TStringField
      DisplayLabel = #1055#1086#1088#1103#1076#1082#1086#1074#1099#1081' ('#1055#1055#1059')'
      FieldName = 'Ordn_PPU'
    end
    object ComparisonDataSetTitle_PPU: TStringField
      DisplayLabel = #1047#1072#1075#1086#1083#1086#1074#1086#1082' ('#1055#1055#1059')'
      FieldName = 'Title_PPU'
      Size = 100
    end
    object ComparisonDataSetQUEUE_PPU: TFMTBCDField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100' ('#1055#1055#1059')'
      FieldName = 'QUEUE_PPU'
      Precision = 38
      Size = 0
    end
    object ComparisonDataSetKolSht_PPU: TFloatField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' ('#1055#1055#1059')'
      FieldName = 'KolSht_PPU'
    end
    object ComparisonDataSetWeight1_PPU: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1076#1085#1086#1081' ('#1055#1055#1059')'
      FieldName = 'Weight1_PPU'
    end
    object ComparisonDataSetMaterial_PPU: TStringField
      DisplayLabel = #1052#1072#1090#1077#1088#1080#1072#1083' ('#1055#1055#1059')'
      FieldName = 'Material_PPU'
    end
    object ComparisonDataSetDrawing_PPU: TStringField
      DisplayLabel = #1063#1077#1088#1090#1105#1078' ('#1055#1055#1059')'
      FieldName = 'Drawing_PPU'
      Size = 50
    end
    object ComparisonDataSetGraph_PPU: TStringField
      DisplayLabel = #1043#1088#1072#1092#1080#1082' ('#1055#1055#1059')'
      FieldName = 'Graph_PPU'
    end
    object ComparisonDataSetUPDATED_PPU: TDateTimeField
      DisplayLabel = #1054#1073#1085#1086#1074#1083#1105#1085' ('#1055#1055#1059')'
      FieldName = 'UPDATED_PPU'
    end
    object ComparisonDataSetRELDATE_PPU: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085#1080#1103' ('#1055#1055#1059')'
      FieldName = 'RELDATE_PPU'
    end
    object ComparisonDataSetQUEUE: TFMTBCDField
      DisplayLabel = #1054#1095#1077#1088#1077#1076#1100
      FieldName = 'QUEUE'
      Precision = 38
      Size = 0
    end
    object ComparisonDataSetOper: TByteField
      FieldName = 'Oper'
    end
    object ComparisonDataSetOperStr: TStringField
      DisplayLabel = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
      FieldKind = fkCalculated
      FieldName = 'OperStr'
      Calculated = True
    end
    object ComparisonDataSetPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 1024
    end
    object ComparisonDataSetNOTE: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1055#1055#1059')'
      FieldName = 'PRIM_PPU'
      Size = 1024
    end
    object ComparisonDataSetDiffField: TStringField
      DisplayLabel = #1054#1090#1083#1080#1095#1080#1077' '#1074' '#1087#1086#1083#1077
      FieldName = 'DiffField'
    end
  end
  object SpPlansQuery: TADOQuery
    CursorLocation = clUseServer
    BeforeOpen = QueryBeforeOpen
    Parameters = <>
    Left = 24
    Top = 48
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
      LookupDataSet = ImportPlanForm.ContractorsQuery
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
      LookupDataSet = ImportPlanForm.ContractorsQuery
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
    object SpPlansQueryKOLSHT: TFloatField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      FieldName = 'KOLSHT'
    end
    object SpPlansQueryWEIGHT1: TFloatField
      DisplayLabel = #1042#1077#1089' '#1086#1076#1085#1086#1081
      FieldName = 'WEIGHT1'
    end
    object EditSpPlansQueryMARK_S: TStringField
      DisplayLabel = #1052#1072#1088#1082#1072
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'MARK_S'
      LookupDataSet = ImportPlanForm.MarksQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'CMARK'
      Size = 255
      Lookup = True
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
    object SpPlansQueryMAVERICK: TFloatField
      DisplayLabel = #1055#1077#1088#1077#1093#1086#1076#1103#1097#1080#1081
      FieldName = 'MAVERICK'
    end
    object SpPlansQueryPRIM: TStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'PRIM'
      Size = 1024
    end
  end
  object App: TWordApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 552
    Top = 80
  end
end
