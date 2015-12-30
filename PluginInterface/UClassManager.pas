unit UClassManager;

interface

uses
  Classes, Contnrs;

type
  TClassManager = class(TClassList);

function ClassManager: TClassManager;

implementation

var
  Manager: TClassManager;

function ClassManager: TClassManager;
begin
  Result := Manager;
end;

initialization
Manager := TClassManager.Create;

finalization
Manager.Free;

end.
