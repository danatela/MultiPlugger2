unit UGrMaterials12SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TGrMaterials12SprPlugin = class(TPlugin)
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

class function TGrMaterials12SprPlugin.Name: string;
begin
  Result := 'Круг';
end;

class function TGrMaterials12SprPlugin.Group: string;
begin
  Result := 'Группы материалов'
end;

class function TGrMaterials12SprPlugin.Pos: integer;
begin
  Result := 10;
end;

class function TGrMaterials12SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TGrMaterials12SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TGrMaterials12SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TGrMaterials12SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('Тест');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'GRMATERIALS');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"Наименование группы","Активность"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', 'Группы материалов - Круг');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=100');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 100);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TGrMaterials12SprPlugin);

finalization
  ClassManager.Remove(TGrMaterials12SprPlugin);

end.

