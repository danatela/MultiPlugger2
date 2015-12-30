unit UMaterials12SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterials12SprPlugin = class(TPlugin)
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

class function TMaterials12SprPlugin.Name: string;
begin
  Result := 'Круг';
end;

class function TMaterials12SprPlugin.Group: string;
begin
  Result := 'Материалы'
end;

class function TMaterials12SprPlugin.Pos: integer;
begin
  Result := 10;
end;

class function TMaterials12SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMaterials12SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterials12SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterials12SprPlugin.Exec;
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
  Plugin.SetProp('SprDescription', 'Каталог материалов - Круг');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=100');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 100);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMaterials12SprPlugin);

finalization
  ClassManager.Remove(TMaterials12SprPlugin);

end.

