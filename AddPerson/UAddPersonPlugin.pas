unit UAddPersonPlugin;

interface

uses
  UClassManager, UPlugin, Classes, Forms, RTTI, Generics.Collections;

type
  TAddPersonPlugin = class(TPlugin)
    class function Name: string; override;
    class function Group: string; override;
    class function Pos: integer; override;
    class function UserGroups: string; override;
    class function AutoLoad: Boolean; override;
    class function Hidden: Boolean; override;
    class function GetPropNames: TStrings; override;
    constructor Create;
    destructor Destroy; override;
    procedure Exec; override;
    function SetProp(Key: string; Value: TValue): Boolean; override;
    function GetProp(Key: string): TValue; override;
    function Form: TForm; override;
  private
    PropDict: TDictionary<string, TValue>;
  end;

var
  Plugin: TAddPersonPlugin;

implementation

uses
  AddPersonUnit, ADODB;

class function TAddPersonPlugin.Name: string;
begin
  Result := 'Добавить персону';
end;

class function TAddPersonPlugin.Group: string;
begin
  Result := 'Планы'
end;

class function TAddPersonPlugin.Pos: integer;
begin
  Result := 7;
end;

class function TAddPersonPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TAddPersonPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TAddPersonPlugin.Hidden: Boolean;
begin
  Result := True;
end;

class function TAddPersonPlugin.GetPropNames: TStrings;
begin
  Result := TStringList.Create;
  Result.Add('PersonType');
  Result.Add('Caption');
end;

constructor TAddPersonPlugin.Create;
begin
  inherited;
  PropDict := TDictionary<string, TValue>.Create;
  PropDict.Add('PersonType', nil);
  PropDict.Add('Caption', nil);
  Plugin := Self;
end;

destructor TAddPersonPlugin.Destroy;
begin
  if Assigned(AddPersonForm) then begin
    AddPersonForm.Parent := nil;
    AddPersonForm.Free;
    AddPersonForm := nil;
  end;
  PropDict.Free;
  Plugin := nil;
  inherited;
end;

function TAddPersonPlugin.SetProp(Key: string; Value: TValue): Boolean;
begin
  Result := PropDict.ContainsKey(Key);
  if Result then
    PropDict[Key] := Value;
end;

function TAddPersonPlugin.GetProp(Key: string): TValue;
begin
  if not PropDict.TryGetValue(Key, Result) then
    Result := nil;
end;

function TAddPersonPlugin.Form;
begin
  if not Assigned(AddPersonForm) then
    Application.CreateForm(TAddPersonForm, AddPersonForm);
  Result := AddPersonForm;
end;

procedure TAddPersonPlugin.Exec;
begin
  Form.ShowModal;
end;

initialization
  ClassManager.Add(TAddPersonPlugin);

finalization
  ClassManager.Remove(TAddPersonPlugin);

end.
