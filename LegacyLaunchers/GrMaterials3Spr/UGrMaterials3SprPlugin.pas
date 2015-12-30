unit UGrMaterials3SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TGrMaterials3SprPlugin = class(TPlugin)
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

class function TGrMaterials3SprPlugin.Name: string;
begin
  Result := 'Прочие материалы';
end;

class function TGrMaterials3SprPlugin.Group: string;
begin
  Result := 'Группы материалов'
end;

class function TGrMaterials3SprPlugin.Pos: integer;
begin
  Result := 13;
end;

class function TGrMaterials3SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TGrMaterials3SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TGrMaterials3SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TGrMaterials3SprPlugin.Exec;
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
  Plugin.SetProp('SprDescription', 'Группы материалов - Прочие материалы');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=3');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 3);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TGrMaterials3SprPlugin);

finalization
  ClassManager.Remove(TGrMaterials3SprPlugin);

end.

