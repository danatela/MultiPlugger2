unit FastReportUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxExportRTF, frxExportPDF,
  MagsoftSharedUnit, GlobVars, ADODB, frxDesgn, MemTableEh, DB, MagsoftUniSelector2Unit,
  frxChBox;

type
  TFRForm = class(TForm)
    Report: TfrxReport;
    DBDataset: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    DBDataset2: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    DBDataset3: TfrxDBDataset;
    DBDataset4: TfrxDBDataset;
    function ReportUserFunction(const MethodName: string;
      var Params: Variant): Variant;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function UpperFirst(s: String):string;
    Function LowerFirst(s: String):string;
    function Propis(Rubs,Padeg:integer):string;
    function PropisOkonch(Rubs,tip:integer):string;
  end;

var
  FRForm: TFRForm;

procedure VarsToReport(Var Form:TComponent;tip: integer);
Function GetReportsList(Owner:TComponent;Var ReportsList:TMemTableEh;MainTable:string):boolean;

implementation

{$R *.dfm}

Function GetReportsList(Owner:TComponent;Var ReportsList:TMemTableEh;MainTable:string):boolean;
Var
 ReportDir:string;
 sr: TSearchRec;
 list:TStringList;
 s1,s2:string;
 n:integer;
Begin
 result:=False;
 list:=TStringList.Create;
 ReportsList.FieldDefs.Add('fr3', ftString, 255);
 ReportsList.FieldDefs.Add('descr', ftString, 255);
 ReportsList.CreateDataSet;
 ReportsList.Open;
 ReportDir:=IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'Reports\'+MainTable);
 if FindFirst(ReportDir+'*.fr3', faAnyFile, sr) = 0 then
  Begin
   Repeat
{    if (sr.Attr and $20) = $20 then
     Begin}
      ReportsList.Append;
      ReportsList['fr3']:=ReportDir+sr.Name;
      FRForm.Report.Clear;
      FRForm.Report.LoadFromFile(VarToStr(ReportsList['fr3']));
      ReportsList['descr']:=FRForm.Report.ReportOptions.Description.Text;
      ReportsList.Post;
{     End;}
   Until FindNext(sr) <> 0;
   FindClose(sr);
  End;


 ReportsList.SortOrder:='descr';
 ReportsList.First;
 while Not ReportsList.Eof do
  Begin
   list.Append(VarToStr(ReportsList['descr']));
   ReportsList.Next;
  End;


 if list.Count>0 then
  Begin
   n:=GetUniSelect2Result(Owner,list,0,'�������� �����');
   if n<>-1 then
    Begin
     ReportsList.RecNo:=n+1;
     s1:=VarToStr(ReportsList['fr3']);
     s2:=VarToStr(ReportsList['descr']);
     ReportsList.Close;
     ReportsList.DestroyTable;
     ReportsList.CreateDataSet;
     ReportsList.Open;
     ReportsList.Append;
     ReportsList['fr3']:=s1;
     ReportsList['descr']:=s2;
     ReportsList.Post;
     result:=true;
    End;
  End;

 list.Free;
End;

procedure TFRForm.FormCreate(Sender: TObject);
begin
 Report.AddFunction('Function ReplChars(s:string;s1:string;s2:string):string');
 Report.AddFunction('Function CharN(s:string;n:integer):string');
 Report.AddFunction('Function Padl(s:string;n:integer;c:string):string');
 Report.AddFunction('Function UpperFirst(s: String):string');
 Report.AddFunction('Function LowerFirst(s: String):string');
 Report.AddFunction('Function MVDate(d:TDateTime;Postfix:string):string');
 Report.AddFunction('Function CommonDate(d:TDateTime;Postfix:string):string');
 Report.AddFunction('function Propis(Rubs,Padeg:integer):string');
 Report.AddFunction('function PropisOkonch(Rubs,tip:integer):string');
 Report.AddFunction('function ShortFIO(fami,nami,fanm:string):string');
 Report.AddFunction('Function Kop(s:currency):integer');
 Report.AddFunction('Function GetTextValueOfRef(NRec,TableName,NRecFieldName,ResultFieldName:string;StrPointer,SprBase:boolean):string');
 Report.AddFunction('Function UpdatedAddr(s:string):string');
 Report.AddFunction('Function TrimCommas(s:string):string');
 Report.AddFunction('Function PFRAddr(s:string;fl:boolean):string');
 {$IFDEF ARENDA}
 Report.AddFunction('Function A_ArendatorM(nrec:string;tip,posit:integer):string');
 {$ENDIF}
end;

{$IFDEF ARENDA}
Function GetArendatorDescriptionM(nrec:string;tip,posit:integer):string;
Var
 ADOQ:TAdoQuery;
 s,s1,s2,s3:string;
Begin
 result:=EmptyStr;
 ADOQ:=TAdoQuery.Create(Host.ADOC);
 ADOQ.Connection:=Host.ADOC;
 ADOQ.SQL.Text:='select * from '+a_MOwnerTable+' where fnrec='''+nrec+'''';
 ADOQ.Open;
 if ADOQ.RecordCount=1 then
 Begin
 case tip of
  0: Begin
      if VarToStr(ADOQ['fizlico').AsBoolean then
       Begin
        result:=Trim(VarToStr(ADOQ['fami'])+space+VarToStr(ADOQ['nami'])+
        space+VarToStr(ADOQ['fanm']));
       End
        else
       Begin
        result:=Trim(VarToStr(ADOQ['opf'])+space+VarToStr(ADOQ['firm']));
       End;
     End;
  1: Begin
 if VarToStr(ADOQ['fizlico').AsBoolean then
  Begin
   s:=Trim(VarToStr(ADOQ['fami'])+space+VarToStr(ADOQ['nami'])+
   space+VarToStr(ADOQ['fanm']));
   if posit>0 then
    s:=s+', � ���������� "��������� '+chr(ord('�')+posit-1)+'"';
//   rep.Variables[Pr+const_dot+'a_arendator2']:=kav+AddSlashes(s)+kav;
   if VarToStr(ADOQ['datbirth').AsDateTime<>0 then
    Begin
     s:=s+comma+space+MVDate(VarToStr(ADOQ['datbirth').AsDateTime,'���� ��������');
    End;
   if Not Empty(VarToStr(ADOQ['udl'])) then
    Begin
     s:=s+comma+space;
     DivDoc(VarToStr(ADOQ['udl']),s1,s2);
     s3:=GetTextValueOfPointerADOC(SprADOC,s1,'spudl2','kod','name',True);
     if Empty(s3) or (Pos('�������',UpperCase(s3))>0) then s3:='�������';
     s:=s+s3+space+s2;
     if VarToStr(ADOQ['udlkogda').AsDateTime<>0 then
      Begin
       s:=s+comma+space+'����� '+DateToStr(VarToStr(ADOQ['udlkogda').AsDateTime)+'�.';
       if Not EmptyFNRC(VarToStr(ADOQ['fcudlkem'])) then
        Begin
         s3:=GetTextValueOfPointer(VarToStr(ADOQ['fcudlkem']),UdlkemTable,'fnrec','name',True);
         s:=s+space+s3;
         if (Pos('��� �������������',UpperCase(s3))=0) and Not Empty(VarToStr(ADOQ['udlpodr'])) then
          s:=s+comma+space+'��� ������������� '+VarToStr(ADOQ['udlpodr']);
        End;
      End;
    End;
   if Not Empty(VarToStr(ADOQ['address'])) then
    Begin
     if VarToStr(ADOQ['sex'])='�' then s3:='��'
                                             else s3:='��';
     s:=s+comma+space+'���������'+s3+space+'��'+space+'������'+space;
     s:=s+TrimCommas(PFRAddr(VarToStr(ADOQ['address']),True));
    End;
   if Not Empty(VarToStr(ADOQ['inn'])) then
    Begin
     s:=s+comma+space+'���'+space+VarToStr(ADOQ['inn']);
    End;
  End
   else
  Begin
   s:=Trim(VarToStr(ADOQ['opf'])+space+VarToStr(ADOQ['firm']));
   if posit>0 then
    s:=s+', � ���������� "��������� '+chr(ord('�')+posit-1)+'"';
//   rep.Variables[Pr+const_dot+'a_arendator2']:=kav+AddSlashes(s)+kav;
{
   if Not Empty(VarToStr(ADOQ['a_obqz'])) then
    Begin
     s:=s+comma+space+'���������������'+zrod+space+VarToStr(ADOQ['a_obqz']);
     if Not Empty(VarToStr(ADOQ['a_zegruv'])) then s:=s+comma+space+VarToStr(ADOQ['a_zegruv']);
    End;
}
   if Not Empty(VarToStr(ADOQ['inn'])) then
    Begin
     s:=s+comma+space+'���'+space+VarToStr(ADOQ['inn']);
    End;
   if Not Empty(VarToStr(ADOQ['kpp'])) then
    Begin
     s:=s+comma+space+'���'+space+VarToStr(ADOQ['kpp']);
    End;
  End;

 if Not Empty(VarToStr(ADOQ['vlice'])) then
  Begin
   s:=s+comma+space+'� ����'+space+VarToStr(ADOQ['vlice']);
   if Not Empty(VarToStr(ADOQ['dnaosn'])) then
    s:=s+comma+space+VarToStr(ADOQ['dnaosn']);
  End;


 result:=s;










     End;
  2: Begin
      if Empty(VarToStr(ADOQ['firm_dp'])) then result:=GetArendatorDescriptionM(nrec,0,posit)
                                                     else result:=Trim(VarToStr(ADOQ['firm_dp']));
     End;
 end;




 end;
 ADOQ.Close;
 ADOQ.Free;
End;
 {$ENDIF}

function TFRForm.ReportUserFunction(const MethodName: string;
  var Params: Variant): Variant;
Var
 s:string;
begin
 if MethodName = 'REPLCHARS' then Result := ReplChars(Params[0],Params[1],Params[2]);
 if MethodName = 'CHARN' then Result := CharN(Params[0],Params[1]);
 if MethodName = 'UPPERFIRST' then Result := UpperFirst(Params[0]);
 if MethodName = 'LOWERFIRST' then Result := LowerFirst(Params[0]);
 if MethodName = 'MVDATE' then Result := MVDate(Params[0],Params[1]);
 if MethodName = 'COMMONDATE' then Result := CommonDate(Params[0],Params[1]);
 if MethodName = 'PROPIS' then Result := Propis(Params[0],Params[1]);
 if MethodName = 'PROPISOKONCH' then Result := PropisOkonch(Params[0],Params[1]);
 if MethodName = 'SHORTFIO' then Result := SocrFIO(Params[0],Params[1],Params[2]);

 if MethodName = 'TRIMCOMMAS' then Result := TrimCommas(Params[0]);

 if MethodName = 'GETTEXTVALUEOFREF' then
  Begin
    Result:=GetTextValueOfPointer(Params[0],Params[1],Params[2],Params[3],Params[4]);
  End;
 if MethodName = 'PADL' then
  Begin
  s:=Params[2];
  Result := Padl(Params[0],Params[1],s[1]);
  End;
 if MethodName = 'KOP' then Result := Kopeek(Params[0]);
 {$IFDEF ARENDA}
 if MethodName = 'A_ARENDATORM' then Result := GetArendatorDescriptionM(Params[0],Params[1],Params[2]);
 {$ENDIF}
end;

Function TFRForm.UpperFirst(s: String):string;
begin
 if Length(s)>0 then result:=UpperCase(s[1])+Copy(s,2,Length(s)-1)
                else result:=s;
end;

Function TFRForm.LowerFirst(s: String):string;
begin
 if Length(s)>0 then result:=LowerCase(s[1])+Copy(s,2,Length(s)-1)
                else result:=s;
end;

function CifrToStr(Cifr:String;Pr:Integer;Padeg:Integer) : string;
{������� ���������� �������� 1 ����� ������� 3-������� 2-������� 1-����� 4-11-19
Padeg - 1-��������� 2- ����, ��� }
var i:Integer;
begin
i:=StrToInt(Cifr);
if Pr = 1 Then
case i of
1: CifrToStr :='���';
2: CifrToStr :='������';
3: CifrToStr :='������';
4: CifrToStr :='���������';
5: CifrToStr :='�������';
6: CifrToStr :='��������';
7: CifrToStr :='�������';
8: CifrToStr :='���������';
9: CifrToStr :='���������';
0: CifrToStr :='';
end
else if Pr = 2 Then
case i of
1: CifrToStr :='';
2: CifrToStr :='��������';
3: CifrToStr :='��������';
4: CifrToStr :='�����';
5: CifrToStr :='���������';
6: CifrToStr :='����������';
7: CifrToStr :='���������';
8: CifrToStr :='�����������';
9: CifrToStr :='���������';
0: CifrToStr :='';
end
else if Pr = 3 Then
case i of
1: if Padeg =1 Then CifrToStr :='����'
else CifrToStr :='����';
2: if Padeg =1 Then CifrToStr :='���'
else CifrToStr :='���';
3: CifrToStr :='���';
4: CifrToStr :='������';
5: CifrToStr :='����';
6: CifrToStr :='�����';
7: CifrToStr :='����';
8: CifrToStr :='������';
9: CifrToStr :='������';
0: CifrToStr :='';
end
else if Pr = 4 Then
case i of
1: CifrToStr :='�����������';
2: CifrToStr :='����������';
3: CifrToStr :='����������';
4: CifrToStr :='������������';
5: CifrToStr :='����������';
6: CifrToStr :='�����������';
7: CifrToStr :='����������';
8: CifrToStr :='������������';
9: CifrToStr :='������������';
0: CifrToStr :='������';

end;
end;

function Rasryad(K:Integer;V:String) : string;
{������� ���������� ������������ ������� � ����������� �� ��������� 2 ���� ���}
Var j:Integer;
Begin
Rasryad :='';
if v<>'000' then
Begin
j := StrToInt(Copy(v,Length(v),1));
if (StrToInt(Copy(v,Length(v)-1,2))> 9) And (StrToInt(Copy(v,Length(v)-1,2))< 20) Then
case K of
0: Rasryad :='';
1: Rasryad :='�����';
2: Rasryad :='���������';
3: Rasryad :='����������';
4: Rasryad :='����������';
end
else
case K of
0: Rasryad :='';
1: case j of
1: Rasryad :='������';
2..4: Rasryad :='������';
else
Rasryad :='�����';
end;
2: case j of
1: Rasryad :='�������';
2..4: Rasryad :='�������a';
else
Rasryad :='���������';
end;
3: case j of
1: Rasryad :='��������';
2..4: Rasryad :='���������';
else
Rasryad :='����������';
end;
4: case j of
1: Rasryad :='��������';
2..4: Rasryad :='���������';
else
Rasryad :='����������';
end;
end;
End;
end;


function GroupToStr(Group:String;Padeg:Integer) : string;
{������� ���������� �������� 3 �����}
var i:Integer;
S,S2:String;
begin
S:='';
if (StrToInt(Copy(Group,Length(Group)-1,2))> 9) And (StrToInt(Copy(Group,Length(Group)-1,2))< 20) Then
begin
if Length(Group) = 3 Then
 S := S+' '+CifrToStr(Copy(Group,1,1),1,Padeg);
S := S+' '+CifrToStr(Copy(Group,Length(Group),1),4,Padeg);
end
else
for i:=1 to Length(Group) do
 Begin
  S2:=Trim(CifrToStr(Copy(Group,i,1),i-Length(Group)+3,Padeg));
  if (S2<>EmptyStr) then S:=S+' ';
  S := S+S2;
 End;
GroupToStr:=Trim(S);
end;


{������� ���������� ����� ��������}
{
function TFRForm.Propis(Rubs:Currency;Rub,Kop:String) : string;
var i,j:Integer;
R,K,S:String;
begin
S := CurrToStr(Rubs);
S := Trim(S);
if Pos(',',S) = 0 Then
begin
R:= S;
K:= '00';
end
else
begin
R:= Copy(S,0,(Pos(',',S)-1));
K:= Copy(S,(Pos(',',S)+1),Length(S));
end;

S :='';
i:= 0;
j := 1;
While Length(R) >3 Do
Begin
if i = 1 Then j :=2
else j:=1;
S := GroupToStr(Copy(R,Length(R)-2,3),j) +' '+Rasryad(i,Copy(R,Length(R)-2,3))+ ' ' +S;
R := Copy(R,1,Length(R)-3);
i:=i+1;
end;
if i = 1 Then j :=2
else j:=1;
S := Trim( GroupToStr(R,j)+' '+Rasryad(i,R) + ' ' +S +' '+Rub+' '+K+' '+Kop);
S := UpperCase(Copy(S,1,1)) + Copy(S,2,Length(S)-1);
Propis := S;
end;
}

function TFRForm.Propis(Rubs,Padeg:integer):string;
var i,j:Integer;
R,S,S2:String;
begin
if Rubs=0 then S:='����'
 else
  Begin
R := Trim(IntToStr(Rubs));
S:='';
i:=0;
j:=1;
While Length(R) >3 Do
Begin
if (i = 1) or ((Padeg=2) and (i<1)) Then j :=2 else j:=1;
S2:=Trim(GroupToStr(Copy(R,Length(R)-2,3),j)+' '+Rasryad(i,Copy(R,Length(R)-2,3)));
S := Trim(S2+' '+S);
R := Copy(R,1,Length(R)-3);
i:=i+1;
end;

if (i = 1) or ((Padeg=2) and (i<1)) Then j :=2 else j:=1;
S := Trim( GroupToStr(R,j)+' '+Rasryad(i,R) + ' ' +S);
  End;

//S := UpperCase(Copy(S,1,1)) + Copy(S,2,Length(S)-1);
Propis := UpperFirst(Trim(S));
end;

function TFRForm.PropisOkonch(Rubs,tip:integer):string;
Var
 oko:integer;
begin
 result:=EmptyStr;
 oko:=Rubs mod 100;
 if oko>20 then oko:=oko mod 10;
 case tip of
  1: Begin // "����"
      if oko=1 then result:='�';
      if (oko=2) or (oko=3) or (oko=4) then result:='�';
     End;
  2: Begin // "�������"
      if (oko=2) or (oko=3) or (oko=4) then result:='�';
     End;
  3: Begin // "������"
      result:='��';
      if oko=1 then result:='�';
      if (oko=2) or (oko=3) or (oko=4) then result:='�';
     End;
  4: Begin // "������"
      result:='��';
      if oko=1 then result:='';
      if (oko=2) or (oko=3) or (oko=4) then result:='�';
     End;
  5: Begin // "������"
      result:='��';
      if oko=1 then result:='���';
      if (oko=2) or (oko=3) or (oko=4) then result:='���';
     End;
 end;

end;

procedure VarsToReport(Var Form:TComponent; tip: integer);
Begin
 //
End;


end.
