unit UMaterials4SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TMaterials4SprPlugin = class(TPlugin)
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

class function TMaterials4SprPlugin.Name: string;
begin
  Result := '����';
end;

class function TMaterials4SprPlugin.Group: string;
begin
  Result := '���������'
end;

class function TMaterials4SprPlugin.Pos: integer;
begin
  Result := 1;
end;

class function TMaterials4SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TMaterials4SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TMaterials4SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TMaterials4SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('����');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'MATERIALS');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"������������ ���������","����������"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', '������� ���������� - ����');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'CPARENT=4');
  Plugin.SetProp('BeforePostField1', 'CPARENT');
  Plugin.SetProp('BeforePostValue1', 4);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TMaterials4SprPlugin);

finalization
  ClassManager.Remove(TMaterials4SprPlugin);

end.

