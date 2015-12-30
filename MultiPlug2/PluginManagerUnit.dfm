object PluginManagerForm: TPluginManagerForm
  Left = 0
  Top = 0
  Caption = #1052#1077#1085#1077#1076#1078#1077#1088' '#1087#1083#1072#1075#1080#1085#1086#1074
  ClientHeight = 412
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PluginsGridPanel: TGridPanel
    Left = 0
    Top = 0
    Width = 466
    Height = 412
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 100.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = PluginsDBGridEh
        Row = 0
      end
      item
        Column = 0
        Control = GroupsPluginsDBGridEh
        Row = 1
      end>
    RowCollection = <
      item
        Value = 50.000000000000000000
      end
      item
        Value = 50.000000000000000000
      end>
    TabOrder = 0
    object PluginsDBGridEh: TDBGridEh
      Left = 0
      Top = 0
      Width = 466
      Height = 206
      Align = alClient
      DataSource = MainForm.PluginsDataSource
      DynProps = <>
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ClassName'
          Footers = <>
          Width = 142
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 176
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Group'
          Footers = <>
          Width = 153
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Pos'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'AutoLoad'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Hidden'
          Footers = <>
          Width = 64
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Granted'
          Footers = <>
          Width = 64
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object GroupsPluginsDBGridEh: TDBGridEh
      Left = 0
      Top = 206
      Width = 466
      Height = 206
      Align = alClient
      DataSource = MainForm.GrDataSource
      DynProps = <>
      IndicatorOptions = [gioShowRowIndicatorEh]
      TabOrder = 1
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Width = 129
        end
        item
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACTIVE'
          Footers = <>
          Width = 101
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_Name'
          Footers = <>
          Width = 165
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_Group'
          Footers = <>
          Width = 247
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_Pos'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_AutoLoad'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_Hidden'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_Granted'
          Footers = <>
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'Plugin_EditRights'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
end
