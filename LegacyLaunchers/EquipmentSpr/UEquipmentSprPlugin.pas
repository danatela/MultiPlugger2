unit UEquipmentSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TEquipmentSprPlugin = class(TPlugin)
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

class function TEquipmentSprPlugin.Name: string;
begin
  Result := 'Оборудование';
end;

class function TEquipmentSprPlugin.Group: string;
begin
  Result := 'Справочники'
end;

class function TEquipmentSprPlugin.Pos: integer;
begin
  Result := 18;
end;

class function TEquipmentSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TEquipmentSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TEquipmentSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TEquipmentSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'EQUIPMENT');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,INVNUM,CEHNUM,MODEL,OPERATIONS,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование","Инвентарный номер","Цеховой номер","Модель","Операции","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80,70,70,100,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME,CEHNUM,INVNUM');
  Plugin.SetProp('SprDescription', 'Каталог оборудования');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TEquipmentSprPlugin);

finalization
  ClassManager.Remove(TEquipmentSprPlugin);

end.

