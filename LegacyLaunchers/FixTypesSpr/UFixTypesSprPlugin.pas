unit UFixTypesSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TFixTypesSprPlugin = class(TPlugin)
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

class function TFixTypesSprPlugin.Name: string;
begin
  Result := '���� �������';
end;

class function TFixTypesSprPlugin.Group: string;
begin
  Result := '�����������'
end;

class function TFixTypesSprPlugin.Pos: integer;
begin
  Result := 22;
end;

class function TFixTypesSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TFixTypesSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TFixTypesSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TFixTypesSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('����');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'FIXTYPES');
  Plugin.SetProp('SprVisibleFieldNames', 'NAME,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"������������","����������"');
  Plugin.SetProp('SprVisibleFieldWidths', '0,80');
  Plugin.SetProp('SprOrderByString', 'NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', '���������� ����� �������');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.Exec;
end;

initialization
  ClassManager.Add(TFixTypesSprPlugin);

finalization
  ClassManager.Remove(TFixTypesSprPlugin);

end.

