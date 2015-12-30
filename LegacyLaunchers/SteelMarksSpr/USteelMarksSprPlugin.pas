unit USteelMarksSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TSteelMarksSprPlugin = class(TPlugin)
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

class function TSteelMarksSprPlugin.Name: string;
begin
  Result := 'Марки стали';
end;

class function TSteelMarksSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TSteelMarksSprPlugin.Pos: integer;
begin
  Result := 5;
end;

class function TSteelMarksSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TSteelMarksSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TSteelMarksSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TSteelMarksSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'STEELMARKS');
  Plugin.SetProp('SprVisibleFieldNames', 'SHORTNAME,UW,PRIM,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование","Удельный вес (г/см3)","Примечание","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,70,100,80');
  Plugin.SetProp('SprOrderByString', 'SHORTNAME');
  Plugin.SetProp('UnicalField', 'SHORTNAME');
  Plugin.SetProp('SprDescription', 'Справочник марок стали');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TSteelMarksSprPlugin);

finalization
  ClassManager.Remove(TSteelMarksSprPlugin);

end.

