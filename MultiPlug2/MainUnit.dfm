object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1062#1052#1050'-'#1089#1080#1089#1090#1077#1084#1072
  ClientHeight = 225
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu: TMainMenu
    Left = 40
    Top = 8
    object DataBase: TMenuItem
      Caption = '&'#1041#1072#1079#1072
      object Connect: TMenuItem
        Caption = '&'#1057#1086#1077#1076#1080#1085#1077#1085#1080#1077' '#1089' '#1073#1072#1079#1086#1081
        ShortCut = 16462
        OnClick = ConnectClick
      end
      object CloseConnection: TMenuItem
        Caption = '&'#1054#1090#1089#1086#1077#1076#1080#1085#1080#1090#1100
        ShortCut = 16471
        OnClick = CloseConnectionClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object DetachPlugins: TMenuItem
        Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1087#1083#1072#1075#1080#1085#1099
        OnClick = DetachPluginsClick
      end
      object ScanPlugins: TMenuItem
        Caption = #1055#1088#1086#1089#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1075#1080#1085#1099
        OnClick = ScanPluginsClick
      end
      object ScanLaunchers: TMenuItem
        Caption = #1055#1088#1086#1089#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1083#1072#1091#1085#1095#1077#1088#1099
        OnClick = ScanLaunchersClick
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ConsoleMenuItem: TMenuItem
        Caption = #1050#1086#1085#1089#1086#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
        Visible = False
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Exit2: TMenuItem
        Caption = '&'#1042#1099#1093#1086#1076
        OnClick = Exit2Click
      end
    end
    object Edit1: TMenuItem
      Caption = '&'#1055#1088#1072#1074#1082#1072
      Visible = False
      object Undo1: TMenuItem
        Caption = '&'#1054#1090#1084#1077#1085#1072
        ShortCut = 16474
      end
      object Repeat1: TMenuItem
        Caption = '&'#1055#1086#1074#1090#1086#1088' <'#1082#1086#1084#1072#1085#1076#1072'>'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = '&'#1042#1099#1088#1077#1079#1072#1090#1100
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = '&'#1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = #1042'&'#1089#1090#1072#1074#1080#1090#1100
        ShortCut = 16470
      end
      object PasteSpecial1: TMenuItem
        Caption = '&'#1057#1087#1077#1094#1080#1072#1083#1100#1085#1072#1103' '#1074#1089#1090#1072#1074#1082#1072'...'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = '&'#1053#1072#1081#1090#1080'...'
      end
      object Replace1: TMenuItem
        Caption = '&'#1047#1072#1084#1077#1085#1080#1090#1100'...'
      end
      object GoTo1: TMenuItem
        Caption = #1055#1077#1088#1077'&'#1081#1090#1080'...'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Links1: TMenuItem
        Caption = #1057#1089#1099#1083'&'#1082#1080'...'
      end
      object Object1: TMenuItem
        Caption = #1054'&'#1073#1098#1077#1082#1090
      end
    end
    object DocumentsMenuItem: TMenuItem
      Caption = '&'#1044#1086#1082#1091#1084#1077#1085#1090#1099
    end
    object MaterialsMenuItem: TMenuItem
      Caption = '&'#1052#1072#1090#1077#1088#1080#1072#1083#1099
    end
    object GrMaterialsMenuItem: TMenuItem
      Caption = '&'#1043#1088#1091#1087#1087#1099' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
    end
    object PlansMenuItem: TMenuItem
      Caption = #1055'&'#1083#1072#1085#1099
    end
    object CatalogsMenuItem: TMenuItem
      Caption = #1057#1087'&'#1088#1072#1074#1086#1095#1085#1080#1082#1080
    end
    object ReportsMenuItem: TMenuItem
      Caption = '&'#1054#1090#1095#1105#1090#1099
    end
    object Window1: TMenuItem
      Caption = '&'#1054#1082#1085#1086
      object Tile1: TMenuItem
        Caption = '&'#1055#1083#1080#1090#1082#1072
        OnClick = Tile1Click
      end
      object Cascade1: TMenuItem
        Caption = '&'#1050#1072#1089#1082#1072#1076
        OnClick = Cascade1Click
      end
      object ArrangeAll1: TMenuItem
        Caption = '&'#1042#1099#1088#1086#1074#1085#1103#1090#1100' '#1074#1089#1077
        OnClick = ArrangeAll1Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Hide1: TMenuItem
        Caption = '&'#1057#1082#1088#1099#1090#1100
        OnClick = Hide1Click
      end
      object Show1: TMenuItem
        Caption = '&'#1055#1086#1082#1072#1079#1072#1090#1100'...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Next1: TMenuItem
        Caption = #1057#1083#1077#1076#1091#1102#1097#1077#1077
        ShortCut = 16393
      end
    end
    object ManagingMenuItem: TMenuItem
      Caption = '&'#1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077
    end
    object Help1: TMenuItem
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      Visible = False
      object Contents1: TMenuItem
        Caption = '&'#1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
      end
      object SearchforHelpOn1: TMenuItem
        Caption = '&'#1055#1086#1080#1089#1082' '#1089#1087#1088#1072#1074#1082#1080' '#1086'...'
      end
      object HowtoUseHelp1: TMenuItem
        Caption = '&'#1050#1072#1082' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1087#1088#1072#1074#1082#1091
      end
      object About1: TMenuItem
        Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      end
    end
  end
  object ADOMainConnection: TADOConnection
    ConnectionString = 'Provider=MSDAORA.1;User ID=Danatela;Data Source=CMK;'
    Provider = 'MSDAORA.1'
    AfterConnect = ADOMainConnectionAfterConnect
    BeforeConnect = ADOMainConnectionBeforeConnect
    AfterDisconnect = ADOMainConnectionAfterDisconnect
    BeforeDisconnect = ADOMainConnectionBeforeDisconnect
    Left = 40
    Top = 56
  end
  object JrnQuery: TADOQuery
    Connection = ADOMainConnection
    Parameters = <
      item
        Name = 'pOperType'
        Size = -1
        Value = Null
      end
      item
        Name = 'pUserName'
        Size = -1
        Value = Null
      end
      item
        Name = 'pChanges'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO CmkNew.Journal(OperType,OperTime,UserName,Changes)'
      'VALUES(:pOperType,SYSDATE,:pUserName,:pChanges)')
    Left = 40
    Top = 112
  end
  object CloseTimer: TJvThreadTimer
    KeepAlive = True
    OnTimer = CloseTimerTimer
    Priority = tpHigher
    Left = 40
    Top = 168
  end
  object PluginsCDS: TClientDataSet
    Aggregates = <>
    FileName = 'Plugins.xml'
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faReadonly, faUnNamed]
        DataType = ftAutoInc
      end
      item
        Name = 'ClassName'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 255
      end
      item
        Name = 'Name'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Group'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 80
      end
      item
        Name = 'Pos'
        Attributes = [faUnNamed]
        DataType = ftInteger
      end
      item
        Name = 'AutoLoad'
        Attributes = [faUnNamed]
        DataType = ftBoolean
      end
      item
        Name = 'Hidden'
        Attributes = [faUnNamed]
        DataType = ftBoolean
      end
      item
        Name = 'Granted'
        Attributes = [faUnNamed]
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 8
    object PluginsCDSID: TAutoIncField
      FieldName = 'ID'
    end
    object PluginsCDSClassName: TStringField
      FieldName = 'ClassName'
      Size = 255
    end
    object PluginsCDSName: TStringField
      FieldName = 'Name'
      Size = 80
    end
    object PluginsCDSGroup: TStringField
      FieldName = 'Group'
      Size = 80
    end
    object PluginsCDSPos: TIntegerField
      FieldName = 'Pos'
    end
    object PluginsCDSAutoLoad: TBooleanField
      FieldName = 'AutoLoad'
    end
    object PluginsCDSHidden: TBooleanField
      FieldName = 'Hidden'
    end
    object PluginsCDSGranted: TBooleanField
      FieldName = 'Granted'
    end
  end
  object GroupsPluginsCDS: TClientDataSet
    Aggregates = <>
    FileName = 'GroupsPlugins.xml'
    IndexFieldNames = 'Plugin_ID'
    MasterFields = 'ID'
    MasterSource = PluginsDataSource
    PacketRecords = 0
    Params = <>
    AfterInsert = GroupsPluginsCDSAfterInsert
    Left = 168
    Top = 56
    object GroupsPluginsCDSID: TAutoIncField
      FieldName = 'ID'
    end
    object GroupsPluginsCDSPlugin_ID: TIntegerField
      FieldName = 'Plugin_ID'
    end
    object GroupsPluginsCDSCUSERGROUPS: TFloatField
      FieldName = 'CUSERGROUPS'
    end
    object GroupsPluginsCDSUSERGROUPS_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'USERGROUPS_NAME'
      LookupDataSet = UserGroupsADOQuery
      LookupKeyFields = 'NREC'
      LookupResultField = 'NAME'
      KeyFields = 'CUSERGROUPS'
      Lookup = True
    end
    object GroupsPluginsCDSName: TStringField
      FieldName = 'Name'
      Size = 80
    end
    object GroupsPluginsCDSGroup: TStringField
      FieldName = 'Group'
      Size = 80
    end
    object GroupsPluginsCDSPos: TIntegerField
      FieldName = 'Pos'
    end
    object GroupsPluginsCDSAutoLoad: TBooleanField
      FieldName = 'AutoLoad'
    end
    object GroupsPluginsCDSHidden: TBooleanField
      FieldName = 'Hidden'
    end
    object GroupsPluginsCDSGranted: TBooleanField
      FieldName = 'Granted'
    end
    object GroupsPluginsCDSEditRights: TBooleanField
      FieldName = 'EditRights'
    end
  end
  object UserGroupsADOQuery: TADOQuery
    Connection = ADOMainConnection
    Parameters = <>
    SQL.Strings = (
      'select * from CMKNEW.UserGroups')
    Left = 168
    Top = 112
    object UserGroupsADOQueryNREC: TFloatField
      FieldName = 'NREC'
    end
    object UserGroupsADOQueryNAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object UserGroupsADOQueryACTIVE: TFMTBCDField
      FieldName = 'ACTIVE'
      Precision = 38
      Size = 0
    end
  end
  object PluginsDataSource: TDataSource
    DataSet = PluginsCDS
    Left = 272
    Top = 8
  end
end
