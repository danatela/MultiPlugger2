unit UMaterials13SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterials13SprPlugin = class(TPlugin)
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

class function TMaterials13SprPlugin.Name: string;
begin
  Result := 'Крепёж';
end;

class function TMaterials13SprPlugin.Group: string;
begin
  Result := 'Материалы'
end;

class function TMaterials13SprPlugin.Pos: integer;
begin
  Result := 11;
end;

class function TMaterials13SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMaterials13SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterials13SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterials13SprPlugin.Exec;
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
  Plugin.SetProp('SprDescription', 'Каталог материалов - Крепёж');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=101');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 101);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMaterials13SprPlugin);

finalization
  ClassManager.Remove(TMaterials13SprPlugin);

end.

