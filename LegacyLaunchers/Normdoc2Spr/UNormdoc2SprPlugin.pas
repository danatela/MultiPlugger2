unit UNormdoc2SprPlugin;

interface

uses
  UClassManager, UPlugin;

type
  TNormdoc2SprPlugin = class(TPlugin)
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

class function TNormdoc2SprPlugin.Name: string;
begin
  Result := '����������� ������������ ��� "�����"';
end;

class function TNormdoc2SprPlugin.Group: string;
begin
  Result := '�����������'
end;

class function TNormdoc2SprPlugin.Pos: integer;
begin
  Result := 11;
end;

class function TNormdoc2SprPlugin.UserGroups: string;
begin
  Result := '1,2,3';
end;

class function TNormdoc2SprPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TNormdoc2SprPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TNormdoc2SprPlugin.Exec;
var
  Plugin: TPlugin;
begin
 // ...
 // ShowMessage('����');
  Plugin := Host.RunPlugin('TSprPlugin);
  Plugin.SetProp('SprTableName', 'NORMDOC');
  Plugin.SetProp('SprVisibleFieldNames', 'NORMTYPE,NAME,PRIM,ACTIVE');
  Plugin.SetProp('SprVisibleFieldTitles', '"0 - �� ����������, 1 - �� �����, 2 - ��� �����","������������ �����","����������","����������"');
  Plugin.SetProp('SprVisibleFieldWidths', '100,0,80,100,80');
  Plugin.SetProp('SprOrderByString', 'NORMTYPE,NAME');
  Plugin.SetProp('UnicalField', 'NAME');
  Plugin.SetProp('SprDescription', '����������� ��������� ��� "�����"');
  Plugin.SetProp('EditRights', (CurrentUser.CUSERGROUPS<>4));
  Plugin.SetProp('SprFilterString', 'NORMTYPE=2');
  Plugin.SetProp('BeforePostField1', 'NORMTYPE');
  Plugin.SetProp('BeforePostValue1', 2);

  Plugin.Exec;
end;

initialization
  ClassManager.Add(TNormdoc2SprPlugin);

finalization
  ClassManager.Remove(TNormdoc2SprPlugin);

end.

