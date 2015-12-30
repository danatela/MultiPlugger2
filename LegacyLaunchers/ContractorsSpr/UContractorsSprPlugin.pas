unit UContractorsSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TContractorsSprPlugin = class(TPlugin)
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

class function TContractorsSprPlugin.Name: string;
begin
  Result := 'Поставщики/получатели';
end;

class function TContractorsSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TContractorsSprPlugin.Pos: integer;
begin
  Result := 7;
end;

class function TContractorsSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TContractorsSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TContractorsSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TContractorsSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'CONTRACTORS');
  Plugin.SetProp('SprVisibleFieldNames', 'CONTRTYPE,NAME,ABBR,CODE,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"0 - подразделение МРК, 1 - сторонняя организация","Полное наименование","Сокращенное наименование","Код","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '100,0,80,50,80');
  Plugin.SetProp('SprOrderByString', 'CONTRTYPE,NAME');
  Plugin.SetProp('SprDescription', 'Справочник поставщиков/получателей');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TContractorsSprPlugin);

finalization
  ClassManager.Remove(TContractorsSprPlugin);

end.

