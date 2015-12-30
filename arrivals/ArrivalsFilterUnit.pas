unit ArrivalsFilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit;


type
  TArrivalsFilterForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_NUM: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    f_ADATE1: TJvDateEdit;
    f_ADATE2: TJvDateEdit;
    f_ANUM: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TArrivalsFilter = class
 NUM: integer;
 ADATE1: TDateTime;
 ADATE2: TDateTime;
 ANUM: string;
 Procedure Clear;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TArrivalsFilterForm;New:boolean):boolean;
 Function FromForm(Var Form:TArrivalsFilterForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetFilterString:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  ArrivalsFilterForm: TArrivalsFilterForm;

implementation

{$R *.dfm}

Constructor TArrivalsFilter.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TArrivalsFilter.Clear;
Var
 Year,Month,Day:word;
begin
 NUM:=0;
 DecodeDate(Now,Year,Month,Day);
 ADATE1:=EncodeDate(Year,1,1);
 ADATE2:=Trunc(Now);
 ANUM:=EmptyStr;
end;

Function TArrivalsFilter.GetFilterString:string;
Var
 FList:TStringList;
 i:integer;
Begin
 FList:=TStringList.Create;
 if NUM<>0 then FList.Append('NUM='+IntToStr(NUM));
 FList.Append('adate>=:ad1 and adate<=:ad2');
 if Not Empty(ANUM) then FList.Append('ANUM like ''%'+AddSlashes(ANUM)+'%''');

 result:=EmptyStr;
 for i:=0 to flist.Count-1 do
  Begin
   if Not Empty(flist[i]) then
    Begin
     if Not Empty(result) then result:=result+andd;
     result:=result+'('+flist[i]+')';
    End;
  End;
 if Empty(result) then result:=Truu;

 FList.Free;
End;

Function TArrivalsFilter.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
End;

Function TArrivalsFilter.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
End;

Function TArrivalsFilter.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TArrivalsFilterForm;
begin
 Form:=TArrivalsFilterForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TArrivalsFilter.ToForm(Var Form:TArrivalsFilterForm;New:boolean):boolean;
Begin
 Form.f_NUM.Text:=IntToStr(NUM);
 Form.f_ADATE1.Date:=ADATE1;
 Form.f_ADATE2.Date:=ADATE2;
 Form.f_ANUM.Text:=ANUM;
 result:=True;
End;

Function TArrivalsFilter.FromForm(Var Form:TArrivalsFilterForm):boolean;
Begin
 NUM:=StrToIntM(Form.f_NUM.Text);
 ADATE1:=Form.f_ADATE1.Date;
 ADATE2:=Form.f_ADATE2.Date;
 ANUM:=Form.f_ANUM.Text;
 result:=True;
End;

Destructor TArrivalsFilter.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.
