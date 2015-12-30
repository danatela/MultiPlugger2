unit UMaterials9SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterials9SprPlugin = class(TPlugin)
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

class function TMaterials9SprPlugin.Name: string;
begin
  Result := 'Двутавровая балка';
end;

class function TMaterials9SprPlugin.Group: string;
begin
  Result := 'Материалы'
end;

class function TMaterials9SprPlugin.Pos: integer;
begin
  Result := 7;
end;

class function TMaterials9SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMaterials9SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterials9SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterials9SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'MATERIALS');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование материала","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Каталог материалов - Двутавровая балка');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=9');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 9);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMaterials9SprPlugin);

finalization
  ClassManager.Remove(TMaterials9SprPlugin);

end.

