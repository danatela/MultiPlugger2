unit PluginManagerUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB,
  Data.Win.ADODB, Vcl.ExtCtrls;

type
  TPluginManagerForm = class(TForm)
    PluginsGridPanel: TGridPanel;
    PluginsDBGridEh: TDBGridEh;
    GroupsPluginsDBGridEh: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PluginManagerForm: TPluginManagerForm;

implementation

{$R *.dfm}

uses MainUnit;

procedure TPluginManagerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
