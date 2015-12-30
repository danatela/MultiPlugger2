unit DanatelaSharedUnit;

interface

uses Generics.Collections, StrUtils, Types, DB;

function BuildDbParams(ConnectionString: string): TDictionary<string, string>;
function BuildConnectionString(DBParams: TDictionary<string, string>): string;
procedure MyRefresh(DataSet: TDataSet);

implementation

function BuildDbParams(ConnectionString: string): TDictionary<string, string>;
var
  s: string;
  Pair: TStringDynArray;
begin
  Result := TDictionary<string, string>.Create;
  for s in SplitString(ConnectionString, ';') do if PosEx('=', s) > 0 then begin
    Pair := SplitString(s, '=');
    Result.Add(Pair[0], Pair[1]);
  end;
end;

function BuildConnectionString(DBParams: TDictionary<string, string>): string;
var
  Pair: TPair<string, string>;
begin
  Result := '';
  for Pair in DBParams do
    Result := Result + ';' + Pair.Key + '=' + Pair.Value;
  Result := RightStr(Result, Length(Result) - 1);
end;

procedure MyRefresh(DataSet: TDataSet);
var
  Bookmark: TBookmark;
begin
  DataSet.DisableControls;
  Bookmark := DataSet.Bookmark;
  DataSet.Close;
  DataSet.Open;
  DataSet.GoToBookmark(Bookmark);
  DataSet.FreeBookmark(Bookmark);
  DataSet.EnableControls;
end;

end.
