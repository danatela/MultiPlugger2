unit AddMaterialUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Generics.Collections;

type
  TAddMaterialForm = class(TForm)
    CancelButton: TButton;
    OkButton: TButton;
    MaterialNameEdit: TLabeledEdit;
    PropGroupBox: TGroupBox;
    AvlPropListBox: TListBox;
    AvlPropLabel: TLabel;
    SelPropListBox: TListBox;
    SelPropLabel: TLabel;
    AddButton: TButton;
    AddAllButton: TButton;
    DelButton: TButton;
    DelAllButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure AddAllButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure DelAllButtonClick(Sender: TObject);
    procedure MaterialNameEditChange(Sender: TObject);
    procedure MaterialNameEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure MoveItem(I: Integer; ListBoxFrom, ListBoxTo: TListBox);
    { Public declarations }
  end;

var
  AddMaterialForm: TAddMaterialForm;

implementation

{$R *.dfm}

uses MaterialsEditUnit;

procedure TAddMaterialForm.AddAllButtonClick(Sender: TObject);
begin
  AvlPropListBox.SelectAll;
  AddButtonClick(Sender);
end;

procedure TAddMaterialForm.AddButtonClick(Sender: TObject);
var
  I: Integer;
begin
  I := 0;
  while I < AvlPropListBox.Items.Count do if AvlPropListBox.Selected[I] then begin
    MoveItem(I, AvlPropListBox, SelPropListBox);
  end else Inc(I);
end;

procedure TAddMaterialForm.DelAllButtonClick(Sender: TObject);
begin
  SelPropListBox.SelectAll;
  DelButtonClick(Sender);
end;

procedure TAddMaterialForm.DelButtonClick(Sender: TObject);
var
  I: Integer;
begin
  I := 0;
  while I < SelPropListBox.Items.Count do if SelPropListBox.Selected[I] then begin
    MoveItem(I, SelPropListBox, AvlPropListBox);
  end else Inc(I);
end;

procedure TAddMaterialForm.FormCreate(Sender: TObject);
var
  Pair: TPair<string, string>;
begin
  for Pair in PropNames do begin
    AvlPropListBox.Items.AddObject(Pair.Value, TObject(Pair.Key));
  end;
end;

procedure TAddMaterialForm.MaterialNameEditChange(Sender: TObject);
begin
  with Sender as TLabeledEdit do OkButton.Enabled := Text <> '';
end;

procedure TAddMaterialForm.MaterialNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  case Key of
    #13: if MaterialNameEdit.Text <> '' then ModalResult := mrOk;
  end;
end;

procedure TAddMaterialForm.MoveItem(I: Integer; ListBoxFrom, ListBoxTo: TListBox);
begin
  ListBoxTo.Items.AddObject(ListBoxFrom.Items[I], ListBoxFrom.Items.Objects[I]);
  ListBoxFrom.Items.Delete(I);
end;

end.
