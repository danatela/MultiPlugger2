unit UTestPlugin2;

interface

uses
  UClassManager, UPlugin, Forms, Generics.Collections, RTTI;

type
  TTestPlugin2 = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    procedure Init; override;
    procedure Exec; override;
    procedure Done; override;
    function SetProp(Key: string; Value: TValue): Boolean; override;
    function GetProp(Key: string): TValue; override;
    function Form: TForm; override;
    private
      PropDict: TDictionary<string, TValue>;
  end;

implementation

uses
  TestUnit, Dialogs;

class function TTestPlugin2.Name: string;
begin
  Result := 'Тестовый плагин 2';
end;

class function TTestPlugin2.Group: string;
begin
  Result := 'Справочники'
end;

class function TTestPlugin2.Pos: integer;
begin
  Result := 101;
end;

class function TTestPlugin2.UserGroups: string;
begin
  Result := '1';
end;

class function TTestPlugin2.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TTestPlugin2.Hidden: Boolean;
begin
  Result := false;
end;

procedure TTestPlugin2.Init;
begin
  ShowMessage(ClassName + ' Init');
  if not Assigned(TestForm) then
    Application.CreateForm(TTestForm, TestForm);
  if not Assigned(PropDict) then
    PropDict := TDictionary<string, TValue>.Create;
end;

procedure TTestPlugin2.Exec;
begin
  ShowMessage(ClassName + ' Exec');
  if not Assigned(TestForm) then
    Init;
  TestForm.Caption := ClassName;
  TestForm.Show;
end;

procedure TTestPlugin2.Done;
begin
  ShowMessage(ClassName + ' Done');
  TestForm.Parent := nil;
  TestForm.Free;
  TestForm := nil;
  PropDict.Free;
  PropDict := nil;
end;

function TTestPlugin2.SetProp(Key: string; Value: TValue): Boolean;
begin
  //ShowMessage(ClassName + ' SetProp ' + Key + ' := ' + Value.ToString);
  TestForm.LogMemo.Lines.Add(ClassName + ' SetProp ' + Key + ' := ' + Value.AsString);
  PropDict.AddOrSetValue(Key, Value);
  Result := True;
end;

function TTestPlugin2.GetProp(Key: string): TValue;
begin
  //ShowMessage(ClassName + ' GetProp ' + Key);
  TestForm.LogMemo.Lines.Add(ClassName + ' GetProp ' + Key);
  Result := nil;
  if PropDict.ContainsKey(Key) then
    Result := PropDict[Key];
end;

function TTestPlugin2.Form;
begin
  ShowMessage(ClassName + ' Form');
  Result := TestForm;
end;

initialization
  ClassManager.Add(TTestPlugin2);

finalization
  ClassManager.Remove(TTestPlugin2);

end.
