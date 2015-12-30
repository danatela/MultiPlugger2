{
ѕример использовани€ (кодирование строки):
var
 estr:TEncryptStr;
begin
 estr:=TEncryptStr.Create;
 Edit2.Text:=estr.EncryptStr(Edit1.Text);
 estr.Free;
end;

ѕример использовани€ (декодирование строки):
var
 estr:TEncryptStr;
begin
 estr:=TEncryptStr.Create;
 Edit3.Text:=estr.DecryptStr(Edit2.Text);
 estr.Free;
end;
}

unit EncryptorUnit;

interface

uses
  SysUtils, Soap.EncdDecd;

type
  TEncryptStr = class
  private
    { Private declarations }
    const
    StartKey = 381;  // Start key
    MultKey = 43874; // Mult key
    AddKey = 13852;  // Add key
    function Encrypt(const InString: AnsiString; StartKey, MultKey, AddKey: Integer):AnsiString;
    function Decrypt(const InString: AnsiString; StartKey, MultKey, AddKey: Integer):AnsiString;
  public
    { Public declarations }
    function EncryptStr(InString: string):string;
    function DecryptStr(InString: string):string;
  end;

implementation

function TEncryptStr.Encrypt(const InString: AnsiString; StartKey, MultKey, AddKey: Integer):AnsiString;
var
  I: integer;
begin
  Result := EmptyStr;
  for I := 1 to Length(InString) do
  begin
    Result := Result + AnsiCHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey;
  end;
end;

{$R-}
{$Q-}
function TEncryptStr.Decrypt(const InString: AnsiString; StartKey, MultKey, AddKey: Integer):AnsiString;
var
  I: integer;
begin
  Result := EmptyStr;
  for I := 1 to Length(InString) do
  begin
    Result := Result + AnsiCHAR(Byte(InString[I]) xor (StartKey shr 8));
    StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey;
  end;
end;
{$R+}
{$Q+}

function TEncryptStr.EncryptStr(InString: string):string;
begin
 result:=EncodeString(Encrypt(AnsiString(InString), StartKey, MultKey, AddKey));
end;

function TEncryptStr.DecryptStr(InString: string):string;
begin
 result:=DeCrypt(DecodeString(InString), StartKey, MultKey, AddKey);
end;

end.
