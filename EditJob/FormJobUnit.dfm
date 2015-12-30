object FormJobForm: TFormJobForm
  Left = 294
  Top = 219
  BorderStyle = bsDialog
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1076#1072#1085#1080#1103' '#1085#1072' '#1079#1072#1075#1086#1090#1086#1074#1080#1090#1077#1083#1100#1085#1086#1084' '#1091#1095#1072#1089#1090#1082#1077
  ClientHeight = 168
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    299
    168)
  PixelsPerInch = 96
  TextHeight = 13
  object NumDBGridEh: TDBGridEh
    Left = 8
    Top = 8
    Width = 281
    Height = 120
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = NumOrderDataSource
    DynProps = <>
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 0
    OnKeyDown = NumDBGridEhKeyDown
    OnTitleBtnClick = NumDBGridEhTitleBtnClick
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NumOrder'
        Footers = <>
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Cutting'
        Footers = <>
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Holes'
        Footers = <>
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Bending'
        Footers = <>
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'Gouging'
        Footers = <>
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'All'
        Footers = <>
        Title.TitleButton = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object FormJobBitBtn: TBitBtn
    Left = 130
    Top = 134
    Width = 159
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1076#1072#1085#1080#1077
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
    OnClick = FormJobBitBtnClick
  end
  object NumOrderClientDataSet: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NumOrder'
        DataType = ftInteger
      end
      item
        Name = 'Cutting'
        DataType = ftBoolean
      end
      item
        Name = 'Holes'
        DataType = ftBoolean
      end
      item
        Name = 'Bending'
        DataType = ftBoolean
      end
      item
        Name = 'Gouging'
        DataType = ftBoolean
      end
      item
        Name = 'All'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 152
    Data = {
      750000009619E0BD0100000018000000060000000000030000007500084E756D
      4F7264657204000100000000000743757474696E67020003000000000005486F
      6C657302000300000000000742656E64696E67020003000000000007476F7567
      696E67020003000000000003416C6C02000300000000000000}
    object NumOrderClientDataSetNumOrder: TIntegerField
      DisplayLabel = #1079'-'#1079#8470' '#1062#1052#1050
      DisplayWidth = 10
      FieldName = 'NumOrder'
    end
    object NumOrderClientDataSetCutting: TBooleanField
      AutoGenerateValue = arDefault
      DisplayLabel = #1056#1077#1079#1082#1072
      FieldName = 'Cutting'
      OnChange = NumOrderClientDataSetChange
    end
    object NumOrderClientDataSetHoles: TBooleanField
      AutoGenerateValue = arDefault
      DisplayLabel = #1054#1090#1074#1077#1088#1089#1090#1080#1103
      FieldName = 'Holes'
      OnChange = NumOrderClientDataSetChange
    end
    object NumOrderClientDataSetBending: TBooleanField
      AutoGenerateValue = arDefault
      DisplayLabel = #1043#1080#1073#1082#1072
      FieldName = 'Bending'
      OnChange = NumOrderClientDataSetChange
    end
    object NumOrderClientDataSetGouging: TBooleanField
      AutoGenerateValue = arDefault
      DisplayLabel = #1057#1090#1088#1086#1078#1082#1072
      FieldName = 'Gouging'
      OnChange = NumOrderClientDataSetChange
    end
    object NumOrderClientDataSetAll: TBooleanField
      AutoGenerateValue = arDefault
      DisplayLabel = #1042#1089#1077
      FieldName = 'All'
      OnChange = NumOrderClientDataSetAllChange
    end
  end
  object NumOrderDataSource: TDataSource
    DataSet = NumOrderClientDataSet
    Left = 336
    Top = 112
  end
  object UpdADOQuery: TADOQuery
    Connection = EditJobForm.ADOConnection
    Parameters = <>
    Left = 336
    Top = 64
  end
  object CloneDS: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CloneDSAfterInsert
    Left = 136
    Top = 88
  end
  object EnhPlanADOQuery: TADOQuery
    Connection = EditJobForm.ADOConnection
    Parameters = <
      item
        Name = 'ppMonth'
        Size = -1
        Value = Null
      end
      item
        Name = 'ppYear'
        Size = -1
        Value = Null
      end
      item
        Name = 'pOrderNum2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '  SELECT DMARKS.NUMP,'
      '         KD.NREC,'
      '         DMARKS.CMARK,'
      '         KD.ORDERNUM,'
      '         KD.ORDERNUM2,'
      '         CASE GRMATERIALS.CPARENT'
      '            WHEN 3'
      '            THEN'
      
        '               DETAILS.GRMATERIALS_S                            ' +
        '     -- '#1055#1088#1086#1095#1080#1077
      '            WHEN 4'
      '            THEN'
      '                  '#39#1051#1080#1089#1090' '#39
      '               || DETAILS.PROP_THICK_C'
      '               || '#39'*'#39
      '               || DETAILS.PROP_WIDTH_C'
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
      '            GRMATERIALS_S,'
      
        '         SUM (DMARKS.NUMCOUNT * DECODE(DMARKS.FROZEN, 0, SPPLANS' +
        '.KOLSHT, 1, 1, 1)) NUMCOUNT,'
      '         AVG (DMARKS.WEIGHT1),'
      
        '         SUM (DMARKS.WEIGHT * DECODE(DMARKS.FROZEN, 0, SPPLANS.K' +
        'OLSHT, 1, 1, 1)) WEIGHT,'
      '         DETAILS.PROP_STEELMARK_C,'
      '         DETAILS.T_REZKA_CEQ,'
      '         DETAILS.T_REZKA_EQ_S,'
      '         DETAILS.T_REZKA_PR,'
      '         DETAILS.T_REZKA_M,'
      '         DETAILS.T_REZKA_NV,'
      '         DETAILS.T_STROZH_CEQ,'
      '         DETAILS.T_STROZH_EQ_S,'
      '         DETAILS.T_STROZH_PR,'
      '         DETAILS.T_STROZH_M,'
      '         DETAILS.T_STROZH_NV,'
      '         DETAILS.T_OTVERST_CEQ,'
      '         DETAILS.T_OTVERST_EQ_S,'
      '         DETAILS.T_OTVERST_PR,'
      '         DETAILS.T_OTVERST_COUNT,'
      '         DETAILS.T_OTVERST_DIAM,'
      '         DETAILS.T_OTVERST_NV,'
      '         DETAILS.T_GIBKA_CEQ,'
      '         DETAILS.T_GIBKA_EQ_S,'
      '         DETAILS.T_GIBKA_PR,'
      '         DETAILS.T_GIBKA_NV,'
      '         DETAILS.PRIM'
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
      
        '   WHERE KD.ACTDATE >= SYSDATE AND PLANS.PMONTH=:ppMonth AND PLA' +
        'NS.PYEAR=:ppYear'
      '   AND KD.ORDERNUM2=:pOrderNum2'
      'GROUP BY DMARKS.NUMP,'
      '         KD.NREC,'
      '         DMARKS.CMARK,'
      '         KD.ORDERNUM,'
      '         KD.ORDERNUM2,'
      '         DETAILS.GRMATERIALS_S,'
      '         GRMATERIALS.CPARENT,'
      '         DETAILS.PROP_STEELMARK,'
      '         DETAILS.PROP_NORMDOC0,'
      '         DETAILS.PROP_NORMDOC1,'
      '         DETAILS.PROP_LINEDENS,'
      '         DETAILS.PROP_PWIDTH1,'
      '         DETAILS.PROP_PWIDTH2,'
      '         DETAILS.PROP_WTHICK,'
      '         DETAILS.PROP_PROFTYPE,'
      '         DETAILS.PROP_DIAM,'
      '         DETAILS.PROP_SIZE,'
      '         DETAILS.PROP_UW,'
      '         DETAILS.PROP_PROFILE,'
      '         DETAILS.PROP_THICK,'
      '         DETAILS.PROP_WIDTH,'
      '         DETAILS.PROP_LENGTH,'
      '         DETAILS.PROP_SIZE1,'
      '         DETAILS.PROP_SIZE2,'
      '         DETAILS.PROP_SLENGTH,'
      '         DETAILS.PROP_STEELMARK_C,'
      '         DETAILS.PROP_NORMDOC0_C,'
      '         DETAILS.PROP_NORMDOC1_C,'
      '         DETAILS.PROP_PROFTYPE_C,'
      '         DETAILS.PROP_PROFILE_C,'
      '         DETAILS.PROP_THICK_C,'
      '         DETAILS.PROP_WIDTH_C,'
      '         DETAILS.PROP_LENGTH_C,'
      '         DETAILS.PROP_PROFNUM,'
      '         DETAILS.PROP_FIXTYPE,'
      '         DETAILS.PROP_CARVTYPE,'
      '         DETAILS.PROP_STEP,'
      '         DETAILS.PROP_FIXTYPE_C,'
      '         DETAILS.PROP_CARVTYPE_C,'
      '         DETAILS.T_REZKA_CEQ,'
      '         DETAILS.T_REZKA_EQ_S,'
      '         DETAILS.T_REZKA_PR,'
      '         DETAILS.T_REZKA_M,'
      '         DETAILS.T_REZKA_NV,'
      '         DETAILS.T_STROZH_CEQ,'
      '         DETAILS.T_STROZH_EQ_S,'
      '         DETAILS.T_STROZH_PR,'
      '         DETAILS.T_STROZH_M,'
      '         DETAILS.T_STROZH_NV,'
      '         DETAILS.T_OTVERST_CEQ,'
      '         DETAILS.T_OTVERST_EQ_S,'
      '         DETAILS.T_OTVERST_PR,'
      '         DETAILS.T_OTVERST_COUNT,'
      '         DETAILS.T_OTVERST_DIAM,'
      '         DETAILS.T_OTVERST_NV,'
      '         DETAILS.T_GIBKA_CEQ,'
      '         DETAILS.T_GIBKA_EQ_S,'
      '         DETAILS.T_GIBKA_PR,'
      '         DETAILS.T_GIBKA_NV,'
      '         DETAILS.PRIM'
      'ORDER BY KD.ORDERNUM2, DMARKS.NUMP')
    Left = 40
    Top = 88
  end
end
