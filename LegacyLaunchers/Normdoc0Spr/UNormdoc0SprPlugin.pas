unit UNormdoc0SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TNormdoc0SprPlugin = class(TPlugin)
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

class function TNormdoc0SprPlugin.Name: string;
begin
  Result := 'Нормативная документация по сортаменту';
end;

class function TNormdoc0SprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TNormdoc0SprPlugin.Pos: integer;
begin
  Result := 9;
end;

class function TNormdoc0SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TNormdoc0SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TNormdoc0SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TNormdoc0SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'NORMDOC');
  Plugin.SetProp('SprVisibleFieldNames', 'NORMTYPE,NAME,PRIM,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"0 - по сортаменту, 1 - по марке, 2 - для листа","Наименование ГОСТа","Примечание","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '100,0,80,100,80');
  Plugin.SetProp('SprOrderByString', 'NORMTYPE,NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Нормативные документы по сортаменту');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'NORMTYPE=0');
  Plugin.SetProp('BeforePostField1', 'NORMTYPE');
  Plugin.SetProp('BeforePostValue1', 0);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TNormdoc0SprPlugin);

finalization
  ClassManager.Remove(TNormdoc0SprPlugin);

end.

