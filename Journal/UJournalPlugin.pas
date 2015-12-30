unit UJournalPlugin;

interface

uses
  UClassManager, UPlugin;

type
    TJournalPlugin = class(TPlugin)
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
  GlobVars,
  JournalUnit,
  FastReportUnit;

class function TJournalPlugin.Name: string;
begin
  Result := 'Журнал действий пользователей';
end;

class function TJournalPlugin.Group: string;
begin
  Result := 'Администрирование'
end;

class function TJournalPlugin.Pos: integer;
begin
  Result := 2;
end;

class function TJournalPlugin.UserGroups: string;
begin
  Result := '1';
end;

class function TJournalPlugin.AutoLoad: Boolean;
begin
  Result := false;
end;

class function TJournalPlugin.Hidden: Boolean;
begin
  Result := false;
end;

procedure TJournalPlugin.Exec;
var
 Spr: TJournal;
begin
 // ...
 // ShowMessage('Тест');
 if not Assigned(FRForm) then FRForm:=TFRForm.Create(nil);

 Spr:=TJournal.Create;
 Spr.SprTableName:='JOURNAL';
 Spr.SprVisibleFieldNames :='TABLENAME,TABLENREC,OPERTYPE,OPERTIME,USERNAME,CHANGES';
 Spr.SprVisibleFieldTitles:='"Таблица","Идентификатор записи в таблице","Код операции","Время операции","Пользователь","Описание"';
 Spr.SprVisibleFieldWidths:='80,100,80,120,100,0';
 Spr.SprOrderByString:='OPERTIME DESC,NREC DESC';
 Spr.SprDescription:='Журнал действий пользователей';

 Spr.Edit(Application.MainForm);
 Spr.Free;
end;

initialization
  ClassManager.Add(TJournalPlugin);

finalization
  ClassManager.Remove(TJournalPlugin);

end.

