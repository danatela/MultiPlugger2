unit JournalFilterUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  ContractorUnit;


type
  TJournalFilterForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    f_TABLENREC: TLabeledEdit;
    f_TABLENAME: TComboBox;
    Label1: TLabel;
    contractorsADOQ: TADOQuery;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    f_OPERTIME1: TJvDateEdit;
    f_OPERTIME2: TJvDateEdit;
    Label5: TLabel;
    f_USERNAME: TComboBox;
    Label2: TLabel;
    f_OPERTYPE: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
  end;

TJournalFilter = class
 TABLENREC: int64;
 TABLENAME: string[20];
 OPERTIME1: TDateTime;
 OPERTIME2: TDateTime;
 OPERTYPE: integer;
 USERNAME: string[20];
 Procedure Clear;
 Function Save(Var Dataset:TAdoQuery):boolean;
 Function Read(Var Dataset:TAdoQuery):boolean;
 Function ToForm(Var Form:TJournalFilterForm;New:boolean):boolean;
 Function FromForm(Var Form:TJournalFilterForm):boolean;
 Function Edit(OForm:TComponent;New:boolean=False):boolean;
 Function GetFilterString:string;
 constructor Create;
 destructor Destroy; override;
end;

var
  JournalFilterForm: TJournalFilterForm;

implementation

{$R *.dfm}

procedure TJournalFilterForm.FormCreate(Sender: TObject);
Var
 orderby:string;
begin
 {
 orderby:=' order by freq desc,name';
 contractorsADOQ.Connection:=Host.ADOC;
 contractorsADOQ.SQL.Text:='select * from '+SchemaName+'CONTRACTORS'+' where active=1'+orderby;
 contractorsADOQ.Open;
 }
end;

procedure TJournalFilterForm.FormDestroy(Sender: TObject);
begin
// contractorsADOQ.Close;
end;

Constructor TJournalFilter.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TJournalFilter.Clear;
Var
 Year,Month,Day:word;
begin
 DecodeDate(Now,Year,Month,Day);
 TABLENREC:=0;
 TABLENAME:=EmptyStr;
 OPERTIME1:=EncodeDate(Year,Month,1);
 OPERTIME2:=Trunc(Now);
 OPERTYPE:=-1;
 USERNAME:=EmptyStr;
end;

Function TJournalFilter.GetFilterString:string;
Var
 FList:TStringList;
 i:integer;
Begin
 FList:=TStringList.Create;

 if TABLENREC<>0 then FList.Append('TABLENREC='+IntToStr(TABLENREC));
 if Not Empty(TABLENAME) then FList.Append('TABLENAME='''+Trim(AddSlashes(TABLENAME))+'''');
 if OPERTYPE<>-1 then FList.Append('OPERTYPE='+IntToStr(OPERTYPE));
 if Not Empty(USERNAME) then FList.Append('USERNAME='''+Trim(AddSlashes(USERNAME))+'''');
 FList.Append('OPERTIME>=:ot1 and OPERTIME<=:ot2');

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

Function TJournalFilter.Save(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
End;

Function TJournalFilter.Read(Var Dataset:TAdoQuery):boolean;
Begin
 result:=True;
 Clear;
End;

Function TJournalFilter.Edit(OForm:TComponent;New:boolean=False):boolean;
Var
 Form: TJournalFilterForm;
begin
 Form:=TJournalFilterForm.Create(OForm);

 if ToForm(Form,New) then
  Begin
   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
    End else result:=False;
  End;
 Form.Free;
end;

Function TJournalFilter.ToForm(Var Form:TJournalFilterForm;New:boolean):boolean;
Var
 adoq2:TAdoQuery;
Begin
 Form.f_TABLENREC.Text:=IntToStr(TABLENREC);
 Form.f_TABLENAME.Items.Clear;
 Form.f_TABLENAME.Items.Append('PERSONS');
 Form.f_TABLENAME.Items.Append('USERGROUPS');
 Form.f_TABLENAME.Items.Append('ARRIVALS');
 Form.f_TABLENAME.Items.Append('CONTRACTORS');
 Form.f_TABLENAME.Items.Append('WIDTHS');
 Form.f_TABLENAME.Items.Append('THICKS');
 Form.f_TABLENAME.Items.Append('LENGTHS');
 Form.f_TABLENAME.Items.Append('NORMDOC');
 Form.f_TABLENAME.Items.Append('STEELMARKS');
 Form.f_TABLENAME.Items.Append('PROFTYPES');
 Form.f_TABLENAME.Items.Append('MATERIALS');
 Form.f_TABLENAME.Items.Append('GRMATERIALS');
 Form.f_TABLENAME.Items.Append('OPERATIONS');
 Form.f_TABLENAME.Items.Append('SITES');
 Form.f_TABLENAME.Items.Append('EQUIPMENT');
 Form.f_TABLENAME.Items.Append('OPEREQUIP');
 Form.f_TABLENAME.Items.Append('MKGROUPS');
 Form.f_TABLENAME.Items.Append('ZACHTYPES');
 Form.f_TABLENAME.Items.Append('KD');
 Form.f_TABLENAME.Items.Append('MARKS');
 Form.f_TABLENAME.Items.Append('DMARKS');
 Form.f_TABLENAME.Items.Append('DETAILS');
 Form.f_TABLENAME.Items.Append('PLANS');
 Form.f_TABLENAME.Items.Append('SPPLANS');
 Form.f_TABLENAME.Items.Append('ARRIVALS');
 Form.f_TABLENAME.Items.Append('SPARRIVALS');
 Form.f_TABLENAME.Items.Append('PASSPORTS');
 Form.f_TABLENAME.Items.Append('SPPASSPORTS');
 Form.f_TABLENAME.Items.Append('SPPASSPORTSD');

 if Form.f_TABLENAME.Items.IndexOf(TABLENAME)<>-1 then Form.f_TABLENAME.ItemIndex:=Form.f_TABLENAME.Items.IndexOf(TABLENAME);
 Form.f_TABLENAME.Text:=TABLENAME;
 Form.f_OPERTIME1.Date:=OPERTIME1;
 Form.f_OPERTIME2.Date:=OPERTIME2;
 Try
  Form.f_OPERTYPE.ItemIndex:=OPERTYPE+1;
 Except
 End;

 adoq2:=TAdoQuery.Create(nil);
 adoq2.Connection:=Host.ADOC;
 adoq2.SQL.Text:='select * from '+SchemaName+'persons order by orauser';
 adoq2.Open;
 Form.f_USERNAME.Items.Clear;
 while Not adoq2.Eof do
  Begin
   Form.f_USERNAME.Items.Append(adoq2.FieldByName('orauser').AsString);
   adoq2.Next;
  End;
 adoq2.Close;
 adoq2.Free;


 if Form.f_USERNAME.Items.IndexOf(USERNAME)<>-1 then Form.f_USERNAME.ItemIndex:=Form.f_USERNAME.Items.IndexOf(USERNAME);
 Form.f_USERNAME.Text:=USERNAME;
 result:=True;
End;

Function TJournalFilter.FromForm(Var Form:TJournalFilterForm):boolean;
Begin
 TABLENREC:=StrToIntM(Form.f_TABLENREC.Text);
 if Form.f_TABLENAME.ItemIndex=-1 then TABLENAME:=EmptyStr
                                    else TABLENAME:=Form.f_TABLENAME.Items[Form.f_TABLENAME.ItemIndex];
 OPERTIME1:=Form.f_OPERTIME1.Date;
 OPERTIME2:=Form.f_OPERTIME2.Date;
 if (Form.f_OPERTYPE.ItemIndex>=0) and (Form.f_OPERTYPE.ItemIndex<=6) then OPERTYPE:=Form.f_OPERTYPE.ItemIndex-1
                                                            else OPERTYPE:=-1;
 if Form.f_USERNAME.ItemIndex=-1 then USERNAME:=EmptyStr
                                 else USERNAME:=Form.f_USERNAME.Items[Form.f_USERNAME.ItemIndex];
 result:=True;
End;

Destructor TJournalFilter.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.
