unit UGrMaterials9SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TGrMaterials9SprPlugin = class(TPlugin)
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

class function TGrMaterials9SprPlugin.Name: string;
begin
  Result := 'Двутавровая балка';
end;

class function TGrMaterials9SprPlugin.Group: string;
begin
  Result := 'Группы материалов'
end;

class function TGrMaterials9SprPlugin.Pos: integer;
begin
  Result := 7;
end;

class function TGrMaterials9SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TGrMaterials9SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TGrMaterials9SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TGrMaterials9SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'GRMATERIALS'));
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE'));
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование группы","Активность"'));
  Plugin.SetProp('SprVisibleFieldWidths', '0,80'));
  Plugin.SetProp('SprOrderByString', 'NAME'));
  Plugin.SetProp('UnicalField', 'NAME'));
  Plugin.SetProp('SprDescription', 'Группы материалов - Двутавровая балка'));
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4)));
  Plugin.SetProp('SprFilterString', 'CPARENT=9'));
  Plugin.SetProp('BeforePostField1', 'CPARENT'));
  Plugin.SetProp('BeforePostValue1', 9));

  Plugin.SetProp('Edit(Application.MainForm)));
  Plugin.SetProp('Free));
end;

initialization
  ClassManager.Add(TGrMaterials9SprPlugin);

finalization
  ClassManager.Remove(TGrMaterials9SprPlugin);

end.

