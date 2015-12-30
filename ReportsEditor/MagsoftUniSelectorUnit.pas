unit MagsoftUniSelectorUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TMagsoftUniSelectorForm = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MagsoftUniSelectorForm: TMagsoftUniSelectorForm;

Function GetUniSelectResult(Owner: TComponent; Var list: TStringList;
  initindex: integer = -1; caption: string = ''; labelc: string = ''): integer;

implementation

{$R *.dfm}

Function GetUniSelectResult(Owner: TComponent; Var list: TStringList;
  initindex: integer = -1; caption: string = ''; labelc: string = ''): integer;
Var
  i, max: integer;
Begin
  max := 0;
  for i := 0 to list.Count - 1 do
    if Length(list[i]) > max then
      max := Length(list[i]);

  MagsoftUniSelectorForm := TMagsoftUniSelectorForm.Create(Owner);
  MagsoftUniSelectorForm.Height := MagsoftUniSelectorForm.Panel1.Height + 24 *
    list.Count + 40;
  MagsoftUniSelectorForm.Width := max * 7 + 30;
  if MagsoftUniSelectorForm.Width < 270 then
    MagsoftUniSelectorForm.Width := 270;
  MagsoftUniSelectorForm.RadioGroup1.Items.AddStrings(list);
  MagsoftUniSelectorForm.RadioGroup1.ItemIndex := initindex;
  MagsoftUniSelectorForm.caption := caption;
  MagsoftUniSelectorForm.RadioGroup1.caption := labelc;
  if MagsoftUniSelectorForm.ShowModal = mrOK then
    result := MagsoftUniSelectorForm.RadioGroup1.ItemIndex
  else
    result := -1;
  MagsoftUniSelectorForm.Free;
End;

end.
