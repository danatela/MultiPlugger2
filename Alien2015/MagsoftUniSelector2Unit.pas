unit MagsoftUniSelector2Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TMagsoftUniSelector2Form = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox: TGroupBox;
    f_ComboBox: TComboBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MagsoftUniSelector2Form: TMagsoftUniSelector2Form;

Function GetUniSelect2Result(Owner:TComponent;Var list:TStringList;initindex:integer=-1;caption:string=''):integer;

implementation

{$R *.dfm}

Function GetUniSelect2Result(Owner:TComponent;Var list:TStringList;initindex:integer=-1;caption:string=''):integer;
Var
 i:integer;
Begin
 MagsoftUniSelector2Form:=TMagsoftUniSelector2Form.Create(Owner);
 MagsoftUniSelector2Form.f_ComboBox.Items.AddStrings(list);
 MagsoftUniSelector2Form.f_ComboBox.ItemIndex:=initindex;
 MagsoftUniSelector2Form.Caption:=caption;
 if MagsoftUniSelector2Form.ShowModal=mrOK then result:=MagsoftUniSelector2Form.f_ComboBox.ItemIndex
                                           else result:=-1;
 MagsoftUniSelector2Form.Free;
End;


procedure TMagsoftUniSelector2Form.FormShow(Sender: TObject);
begin
 f_ComboBox.SetFocus;
// f_ComboBox.
end;

end.
