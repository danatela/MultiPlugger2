unit UMaterials7SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterials7SprPlugin = class(TPlugin)
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

class function TMaterials7SprPlugin.Name: string;
begin
  Result := 'Труба';
end;

class function TMaterials7SprPlugin.Group: string;
begin
  Result := 'Материалы'
end;

class function TMaterials7SprPlugin.Pos: integer;
begin
  Result := 5;
end;

class function TMaterials7SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMaterials7SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterials7SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterials7SprPlugin.Exec;
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
  Plugin.SetProp('SprDescription', 'Каталог материалов - Труба');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=7');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 7);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMaterials7SprPlugin);

finalization
  ClassManager.Remove(TMaterials7SprPlugin);

end.

