unit UMaterials5SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterials5SprPlugin = class(TPlugin)
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

class function TMaterials5SprPlugin.Name: string;
begin
  Result := 'Квадрат';
end;

class function TMaterials5SprPlugin.Group: string;
begin
  Result := 'Материалы'
end;

class function TMaterials5SprPlugin.Pos: integer;
begin
  Result := 3;
end;

class function TMaterials5SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMaterials5SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterials5SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterials5SprPlugin.Exec;
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
  Plugin.SetProp('SprDescription', 'Каталог материалов - Квадрат');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=5');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 5);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMaterials5SprPlugin);

finalization
  ClassManager.Remove(TMaterials5SprPlugin);

end.

