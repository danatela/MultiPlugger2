unit UGrMaterials11SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TGrMaterials11SprPlugin = class(TPlugin)
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

class function TGrMaterials11SprPlugin.Name: string;
begin
  Result := 'Швеллер';
end;

class function TGrMaterials11SprPlugin.Group: string;
begin
  Result := 'Группы материалов'
end;

class function TGrMaterials11SprPlugin.Pos: integer;
begin
  Result := 9;
end;

class function TGrMaterials11SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TGrMaterials11SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TGrMaterials11SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TGrMaterials11SprPlugin.Exec;
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
  Plugin.SetProp('SprDescription', 'Группы материалов - Швеллер');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=11');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 11);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TGrMaterials11SprPlugin);

finalization
  ClassManager.Remove(TGrMaterials11SprPlugin);

end.

