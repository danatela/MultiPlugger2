unit UProfTypesSprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TProfTypesSprPlugin = class(TPlugin)
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

class function TProfTypesSprPlugin.Name: string;
begin
  Result := '���� �������';
end;

class function TProfTypesSprPlugin.Group: string;
begin
  Result := '�����������'
end;

class function TProfTypesSprPlugin.Pos: integer;
begin
  Result := 13;
end;

class function TProfTypesSprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TProfTypesSprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TProfTypesSprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TProfTypesSprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('����');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'PROFTYPES');
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
  ClassManager.Add(TProfTypesSprPlugin);

finalization
  ClassManager.Remove(TProfTypesSprPlugin);

end.

