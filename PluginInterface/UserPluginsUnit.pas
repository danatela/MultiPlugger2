unit UserPluginsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UClassManager, UPlugin, CMKUserUnit;

type
  TUserPluginsForm = class(TForm)
    PluginsMemo: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UserPluginsForm: TUserPluginsForm;
  CMKUser: TCmkUser;

implementation

{$R *.dfm}

procedure TUserPluginsForm.FormShow(Sender: TObject);
var
  I: Integer;
  UsrGrps: TStringList;
begin
  UsrGrps := TStringList.Create;
  for I := 0 to ClassManager.Count - 1 do begin
    UsrGrps.CommaText := TPluginClass(ClassManager[I]).UserGroups;
    if UsrGrps.IndexOf(IntToStr(CMKUser.CUSERGROUPS)) > -1 then
      PluginsMemo.Lines.Add(ClassManager[I].ClassName + ': ' + TPluginClass(ClassManager[I]).Group + ' - ' + TPluginClass(ClassManager[I]).Name);
  end;
  UsrGrps.Free;
end;

end.
