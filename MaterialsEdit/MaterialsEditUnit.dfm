object MaterialsEditForm: TMaterialsEditForm
  Left = 219
  Top = 157
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  ClientHeight = 591
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TreeEditSplitter: TSplitter
    Left = 225
    Top = 0
    Height = 591
    ExplicitLeft = 272
    ExplicitTop = 104
    ExplicitHeight = 100
  end
  object SelectTreeView: TTreeView
    Left = 0
    Top = 0
    Width = 225
    Height = 591
    Align = alLeft
    HideSelection = False
    Indent = 19
    PopupMenu = TreePopupMenu
    TabOrder = 0
    OnChange = SelectTreeViewChange
    OnEdited = SelectTreeViewEdited
    OnKeyDown = SelectTreeViewKeyDown
  end
  object EditPanel: TPanel
    Left = 228
    Top = 0
    Width = 386
    Height = 591
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object GrMaterialsLabel: TLabel
      Left = 6
      Top = 11
      Width = 106
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074': '
    end
    object GrMaterialsComboBox: TDBComboBox
      Left = 112
      Top = 8
      Width = 145
      Height = 21
      AutoDropDown = True
      DataField = 'GRMATERIALS_NAME'
      DataSource = EditDataSource
      TabOrder = 0
      OnChange = GrMaterialsComboBoxChange
      OnKeyDown = GrMaterialsComboBoxKeyDown
    end
  end
  object ADOConnection: TADOConnection
    ConnectionString = 'Provider=MSDAORA.1;User ID=Emanton;Data Source=server1571;'
    LoginPrompt = False
    Provider = 'MSDAORA.1'
    OnWillConnect = ADOConnectionWillConnect
    Left = 24
    Top = 40
  end
  object TreeQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pParent'
        DataType = ftInteger
        Value = 0
      end>
    Prepared = True
    SQL.Strings = (
      'select Name, NRec from CmkNew.Materials where cParent=:pParent')
    Left = 24
    Top = 88
    object TreeQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object TreeQueryNREC: TFloatField
      FieldName = 'NREC'
    end
  end
  object UpdateTreeQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pName'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'pNRec'
        DataType = ftLargeint
        Size = -1
        Value = '0'
      end>
    Prepared = True
    SQL.Strings = (
      'Update CmkNew.Materials Set Name=:pName where NRec=:pNRec')
    Left = 24
    Top = 144
  end
  object EditQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'pNRec'
        DataType = ftLargeint
        Size = 1
        Value = '1'
      end>
    Prepared = True
    SQL.Strings = (
      'select par.ChildProp,'
      'mat.*,'
      'sm.ShortName SteelMark_Name,'
      'nd0.Name NormDoc0_Name,'
      'nd1.Name NormDoc1_Name,'
      'pt.Name ProfType_Name,'
      'pr.Name Profile_Name,'
      'th.Value Thick_Name,'
      'wi.Value Width_Name,'
      'le.Value Length_Name,'
      'GrMat.Name GrMaterials_Name'
      'from CmkNew.Materials mat'
      'left outer join CmkNew.Materials par'
      'on mat.cParent = par.nRec'
      'left outer join CmkNew.SteelMarks sm'
      'on mat.Prop_SteelMark = sm.NRec'
      'left outer join CmkNew.NormDoc nd0'
      'on mat.Prop_NormDoc0 = nd0.NRec'
      'left outer join CmkNew.NormDoc nd1'
      'on mat.Prop_NormDoc1 = nd1.NRec'
      'left outer join CmkNew.ProfTypes pt'
      'on mat.Prop_ProfType = pt.NRec'
      'left outer join CmkNew.NormDoc pr'
      'on mat.Prop_Profile = pr.NRec'
      'left outer join CmkNew.Thicks th'
      'on mat.Prop_Thick = th.NRec'
      'left outer join CmkNew.Widths wi'
      'on mat.Prop_Width = wi.NRec'
      'left outer join CmkNew.Lengths le'
      'on mat.Prop_Length = le.NRec'
      'left outer join CmkNew.GrMaterials GrMat'
      'on mat.cGrMaterials = GrMat.NRec'
      'where mat.NRec=:pNRec')
    Left = 248
    Top = 136
    object EditQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object EditQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
    object EditQueryGALNREC: TStringField
      FieldName = 'GALNREC'
      FixedChar = True
      Size = 16
    end
    object EditQueryCPARENT: TFloatField
      FieldName = 'CPARENT'
    end
    object EditQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object EditQueryCHILDPROP: TMemoField
      FieldName = 'CHILDPROP'
      BlobType = ftMemo
    end
    object EditQueryCHILDPROP_1: TMemoField
      FieldName = 'CHILDPROP_1'
      BlobType = ftMemo
    end
    object EditQueryPROP_PROFNUM: TStringField
      FieldName = 'PROP_PROFNUM'
    end
    object EditQueryPROP_STEELMARK: TFloatField
      FieldName = 'PROP_STEELMARK'
    end
    object EditQueryPROP_NORMDOC0: TFloatField
      FieldName = 'PROP_NORMDOC0'
    end
    object EditQueryPROP_NORMDOC1: TFloatField
      FieldName = 'PROP_NORMDOC1'
    end
    object EditQueryPROP_LINEDENS: TFloatField
      FieldName = 'PROP_LINEDENS'
    end
    object EditQueryPROP_PWIDTH1: TFloatField
      FieldName = 'PROP_PWIDTH1'
    end
    object EditQueryPROP_PWIDTH2: TFloatField
      FieldName = 'PROP_PWIDTH2'
    end
    object EditQueryPROP_WTHICK: TFloatField
      FieldName = 'PROP_WTHICK'
    end
    object EditQueryPROP_PROFTYPE: TFloatField
      FieldName = 'PROP_PROFTYPE'
    end
    object EditQueryPROP_DIAM: TFloatField
      FieldName = 'PROP_DIAM'
    end
    object EditQueryPROP_SIZE: TFloatField
      FieldName = 'PROP_SIZE'
    end
    object EditQueryPROP_UW: TFloatField
      FieldName = 'PROP_UW'
    end
    object EditQueryPROP_PROFILE: TFloatField
      FieldName = 'PROP_PROFILE'
    end
    object EditQueryPROP_THICK: TFloatField
      FieldName = 'PROP_THICK'
    end
    object EditQueryPROP_WIDTH: TFloatField
      FieldName = 'PROP_WIDTH'
    end
    object EditQueryPROP_LENGTH: TFloatField
      FieldName = 'PROP_LENGTH'
    end
    object EditQueryPROP_SIZE1: TFloatField
      FieldName = 'PROP_SIZE1'
    end
    object EditQueryPROP_SIZE2: TFloatField
      FieldName = 'PROP_SIZE2'
    end
    object EditQueryPROP_SLENGTH: TFMTBCDField
      FieldName = 'PROP_SLENGTH'
      Precision = 38
      Size = 0
    end
    object EditQueryPROP_STEELMARK_C: TStringField
      FieldName = 'PROP_STEELMARK_C'
      Size = 50
    end
    object EditQueryPROP_NORMDOC0_C: TStringField
      FieldName = 'PROP_NORMDOC0_C'
      Size = 100
    end
    object EditQueryPROP_NORMDOC1_C: TStringField
      FieldName = 'PROP_NORMDOC1_C'
      Size = 1
    end
    object EditQueryPROP_PROFTYPE_C: TStringField
      FieldName = 'PROP_PROFTYPE_C'
      Size = 255
    end
    object EditQueryPROP_PROFILE_C: TStringField
      FieldName = 'PROP_PROFILE_C'
      Size = 100
    end
    object EditQueryPROP_THICK_C: TFMTBCDField
      FieldName = 'PROP_THICK_C'
      Precision = 38
      Size = 0
    end
    object EditQueryPROP_WIDTH_C: TFMTBCDField
      FieldName = 'PROP_WIDTH_C'
      Precision = 38
      Size = 0
    end
    object EditQueryPROP_LENGTH_C: TFMTBCDField
      FieldName = 'PROP_LENGTH_C'
      Precision = 38
      Size = 0
    end
    object EditQuerySTEELMARK_NAME: TStringField
      FieldName = 'STEELMARK_NAME'
      Size = 200
    end
    object EditQueryNORMDOC0_NAME: TStringField
      FieldName = 'NORMDOC0_NAME'
      Size = 100
    end
    object EditQueryNORMDOC1_NAME: TStringField
      FieldName = 'NORMDOC1_NAME'
      Size = 100
    end
    object EditQueryPROFTYPE_NAME: TStringField
      FieldName = 'PROFTYPE_NAME'
      Size = 255
    end
    object EditQueryPROFILE_NAME: TStringField
      FieldName = 'PROFILE_NAME'
      Size = 100
    end
    object EditQueryTHICK_NAME: TFloatField
      FieldName = 'THICK_NAME'
    end
    object EditQueryWIDTH_NAME: TFloatField
      FieldName = 'WIDTH_NAME'
    end
    object EditQueryLENGTH_NAME: TFloatField
      FieldName = 'LENGTH_NAME'
    end
    object EditQueryORD: TFloatField
      FieldName = 'ORD'
    end
    object EditQueryCGRMATERIALS: TFloatField
      FieldName = 'CGRMATERIALS'
    end
    object EditQueryGRMATERIALS_NAME: TStringField
      FieldName = 'GRMATERIALS_NAME'
      Size = 255
    end
  end
  object EditDataSource: TDataSource
    DataSet = EditQuery
    Left = 248
    Top = 80
  end
  object DropDownQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    Left = 296
    Top = 136
  end
  object UpdateEditQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 296
    Top = 80
  end
  object TreePopupMenu: TPopupMenu
    OnPopup = TreePopupMenuPopup
    Left = 128
    Top = 192
    object AddMenuItem: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = AddMenuItemClick
    end
    object Edit1: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = False
      OnClick = Edit1Click
    end
    object RenameByFormula: TMenuItem
      Caption = #1055#1077#1088#1077#1080#1084#1077#1085#1086#1074#1072#1090#1100' '#1087#1086' '#1092#1086#1088#1084#1091#1083#1077
      ShortCut = 120
      OnClick = RenameByFormulaClick
    end
    object DeleteMenuItem: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = DeleteMenuItemClick
    end
  end
  object DeleteTreeQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pNRec'
        DataType = ftLargeint
        Size = -1
        Value = '0'
      end>
    Prepared = True
    SQL.Strings = (
      'delete from CmkNew.Materials where NRec=:pNRec')
    Left = 24
    Top = 192
  end
  object AddQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctDynamic
    Parameters = <
      item
        Name = 'pName'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'pParent'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Insert INTO CmkNew.Materials(Name, cParent)'
      'Values(:pName, :pParent)')
    Left = 24
    Top = 240
  end
  object UpdQuery: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'pName'
        DataType = ftString
        Size = 2
        Value = #39#39
      end
      item
        Name = 'pChildProp'
        Size = -1
        Value = Null
      end
      item
        Name = 'pNRec'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Update CmkNew.Materials set Name=:pName, ChildProp=:pChildProp '
      'where NRec=:pNRec')
    Left = 24
    Top = 288
  end
  object MaxNrecQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctDynamic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'Select Max(Nrec) MaxNrec from CmkNew.Materials')
    Left = 24
    Top = 344
  end
  object DetQuery: TADOQuery
    Connection = ADOConnection
    CursorType = ctDynamic
    Parameters = <
      item
        Name = 'pMaterial'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'Select Nrec from CmkNew.Details where cMaterial=:pMaterial')
    Left = 24
    Top = 392
  end
end
