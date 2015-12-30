unit UGrMaterials8SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TGrMaterials8SprPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    procedure Exec; override;
  end;

implementation

uses
  System.SysUtils,
  System.Classes,
  ADODB,
  Vcl.Dialogs,
  //Vcl.OleAuto,
  Vcl.Forms,
  Generics.Collections,
  CmkUserUnit,
  GlobVars;

class function TGrMaterials8SprPlugin.Name: string;
begin
  Result := 'Тавровая балка';
end;

class function TGrMaterials8SprPlugin.Group: string;
begin
  Result := 'Группы материалов'
end;

class function TGrMaterials8SprPlugin.Pos: integer;
begin
  Result := 6;
end;

class function TGrMaterials8SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TGrMaterials8SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TGrMaterials8SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TGrMaterials8SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'GRMATERIALS');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование группы","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Группы материалов - Тавровая балка');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=8');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 8);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TGrMaterials8SprPlugin);

finalization
  ClassManager.Remove(TGrMaterials8SprPlugin);

end.

