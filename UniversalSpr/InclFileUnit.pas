unit InclFileUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit, JvBaseEdits,
  Vcl.PlatformDefaultStyleActnCtrls, PrViewEh, Vcl.ComCtrls,
  ShellApi, GifImg, CmkUserUnit;

Const
 DeleteError = 'Не удается удалить существующий вложенный файл! Не достаточно прав, либо файл открыт в другой программе!';

type
  TInclFileForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ActionManager1: TActionManager;
    SelectFileAction: TAction;
    OpenFileAction: TAction;
    SaveFileAsAction: TAction;
    DeleteFileAction: TAction;
    BitBtn5: TBitBtn;
    PreviewGroupBox: TGroupBox;
    PreviewRichEdit: TRichEdit;
    PreviewImage: TImage;
    ImageFiles: TImage;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure SelectFileActionExecute(Sender: TObject);
    procedure OpenFileActionExecute(Sender: TObject);
    procedure SaveFileAsActionExecute(Sender: TObject);
    procedure DeleteFileActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_nrec:int64;
    f_dir:string;
    f_FileName:string;
    f_Descr:string;
    procedure UpdatePreview;
    procedure ActionsEnabling;
  end;

TInclFile = class
 dir: string;
 nrec: int64;
 FileName: string;
 Descr: string;
 Procedure Clear;
 Function Save:boolean;
 Function Read:boolean;
 Function ToForm(Var Form:TInclFileForm):boolean;
 Function FromForm(Var Form:TInclFileForm):boolean;
 Function Edit(OForm:TComponent):boolean;
 constructor Create;
 destructor Destroy; override;
end;

var
  InclFileForm: TInclFileForm;

  Function GetThumbName(vDir:string;vNrec:int64):string;
  function MakeIcon(vDir:string;vNrec:int64;W,H:integer):boolean;
  Procedure DeleteIncFile(Table:string;nrec:int64);
  Function DetectExistsFileName(vdir:string;vnrec:int64):string;

implementation

{$R *.dfm}

Function DetectExistsFileName(vdir:string;vnrec:int64):string;
Var
 sr: TSearchRec;
Begin
 result:=EmptyStr;
// ShowMessage(IncludeTrailingPathDelimiter(vdir)+IntToStr(vnrec)+'.*');
 if FindFirst(IncludeTrailingPathDelimiter(vdir)+IntToStr(vnrec)+'.*', $20, sr) = 0 then
  begin
   if (sr.Attr and $20) = $20 then result:=IncludeTrailingPathDelimiter(vdir)+sr.Name;
//   ShowMessage(result);
   FindClose(sr);
  end;
End;

Function GetFileType(vfilename:string):string;
Begin
 result:=UpperCase(ExtractFileExt(vfilename));
 if Not Empty(result) and (result[1]=dot) then Delete(result,1,1);

End;

Procedure DeleteIncFile(Table:string;nrec:int64);
Var
 dir,tf,FileName:string;
Begin
 dir:=IncludeTrailingPathDelimiter(Host.PicturesDir)+Table;
 FileName:=DetectExistsFileName(dir,nrec);
 if Not Empty(FileName) and FileExists(FileName) then
  Begin
   tf:=GetThumbName(Dir,Nrec);
   if FileExists(tf) then DeleteFile(tf);
   If Not DeleteFile(FileName) then ShowMessage(DeleteError+' ('+FileName+')');
  End;
End;

procedure TInclFileForm.DeleteFileActionExecute(Sender: TObject);
Var
 tf:string;
begin
 if DeleteFileAction.Enabled then
  Begin
   if Not Empty(f_FileName) and FileExists(f_FileName) then
    Begin
     tf:=GetThumbName(f_Dir,f_Nrec);
     if FileExists(tf) then DeleteFile(tf);
     If DeleteFile(f_FileName) then
      Begin

       f_FileName:=EmptyStr;
       UpdatePreview;
      End else ShowMessage(DeleteError);
    End;
  End;
end;

procedure TInclFileForm.OpenFileActionExecute(Sender: TObject);
begin
 if OpenFileAction.Enabled then
  if Not Empty(f_FileName) and FileExists(f_FileName) then
   ShellExecute(Application.Handle, nil, PChar(f_FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TInclFileForm.SaveFileAsActionExecute(Sender: TObject);
begin
 if SaveFileAsAction.Enabled then
  Begin
   if Not Empty(f_FileName) and FileExists(f_FileName) then
    Begin
     SaveDialog.DefaultExt:=ExtractFileExt(f_FileName);
     SaveDialog.FileName:=f_Descr+SaveDialog.DefaultExt;
     if SaveDialog.Execute then
      Begin
       CopyFile(PChar(f_FileName),PChar(SaveDialog.FileName),False);
      End;
    End;
  End;
end;

procedure TInclFileForm.SelectFileActionExecute(Sender: TObject);
Var
 ext:string;
 ok:boolean;
begin
 if SelectFileAction.Enabled then
  Begin
   if OpenDialog.Execute then
    Begin
     if Not Empty(OpenDialog.FileName) and FileExists(OpenDialog.FileName) then
      Begin
       ext:=ExtractFileExt(OpenDialog.FileName);
//       ShowMessage(ext);
       if Not Empty(ext) and (ext<>dot) then
        Begin
         if Not Empty(f_FileName) and FileExists(f_FileName) then ok:=DeleteFile(f_FileName)
                                                             else ok:=True;
         if ok then
           Begin
            f_FileName:=IncludeTrailingPathDelimiter(f_Dir)+IntToStr(f_nrec)+ext;
            CopyFile(PChar(OpenDialog.FileName),PChar(f_FileName),False);
            UpdatePreview;
           End else ShowMessage(DeleteError);
        End;
      End;
    End;
  End;
end;

Function GetThumbName(vDir:string;vNrec:int64):string;
Begin
 result:=IncludeTrailingPathDelimiter(vDir)+IntToStr(vnrec)+'_thumb'+'.bmp';
End;

function MakeIcon(vDir:string;vNrec:int64;W,H:integer):boolean;
var
 File1,File2:string;
 img: TPicture;
 bmp: TBitmap;
 pic: TBitMap;
begin
 result:=True;
 File2:=GetThumbName(vDir,vNrec);
 if Not Empty(File2) and FileExists(File2) then DeleteFile(File2);
 File1:=DetectExistsFileName(vdir,vnrec);
 if Not Empty(File1) and FileExists(File1) then
 Begin
 img := TPicture.Create;
 bmp := TBitMap.Create;
 pic := TBitMap.Create;
 Try
 img.LoadFromFile(File1);
 bmp.Assign(img.Graphic);
 pic.Width := W;
 pic.Height:= H;
 pic.Canvas.StretchDraw(Rect(0,0,pic.Width, pic.Height), bmp);
 pic.SaveToFile(file2);
 Except
  result:=False;
  file2:=File1;
 End;
 img.Free;
 bmp.Free;
 pic.Free;
 End;
End;

{
Procedure ReSizeJpeg(var jpg:TJpegImage; NewWidth,NewHeight:integer);
var
 bmp,sbmp:Tbitmap;
begin
 bmp:=Tbitmap.create;
 bmp.assign(jpg);
 sbmp:=Tbitmap.create;
 sbmp.width:=NewWidth;
 sbmp.Height:=NewHeight;
 sbmp.pixelFormat:=pf24bit;
 SetStretchBltMode(sbmp.canvas.handle,4);// мягкое растягивание
 StretchBlt(sbmp.canvas.handle,0,0,NewWidth,NewHeight,bmp.canvas.handle,
               0,0,bmp.width,bmp.height,SRCCOPY);
 jpg.assign(sbmp);
 jpg.compressQuality := 90;  //существенно уменьшает размер файла, качество  на глаз не хуже
 jpg.compress;
 sbmp.free;
 bmp.free;
end;
}
procedure TInclFileForm.UpdatePreview;
Var
 ext:string;
 PreviewError:boolean;
Begin
 PreviewError:=False;
 PreviewImage.Visible:=False;
 PreviewRichEdit.Visible:=False;
 ImageFiles.Visible:=True;
 PreviewGroupBox.Caption:=EmptyStr;
 if Not Empty(f_FileName) and FileExists(f_FileName) then
  Begin
   PreviewGroupBox.Caption:=space+ExtractFileName(f_FileName)+space;
   ext:=GetFileType(f_FileName);
   if (ext='PNG') or (ext='GIF') or (ext='PCX') or (ext='JPG') or (ext='JPEG') or (ext='BMP') then
    Begin
     Try
     if FileExists(f_FileName) then
      Begin
       PreviewImage.Picture.LoadFromFile(f_FileName);
      End;
      ImageFiles.Visible:=False;
      PreviewImage.Visible:=True;
     Except on E:Exception do
      Begin
       PreviewError:=True;
       PreviewImage.Visible:=False;
       ImageFiles.Visible:=True;
      End;
     End;
    End;
   if (ext='RTF') or (ext='TXT') then
    Begin
     Try
     if FileExists(f_FileName) then
      Begin
       PreviewRichEdit.Lines.LoadFromFile(f_FileName);
      End;
      ImageFiles.Visible:=False;
      PreviewRichEdit.Visible:=True;
     Except
      PreviewError:=True;
      PreviewRichEdit.Visible:=False;
      ImageFiles.Visible:=True;
     End;
    End;
  End
   else
  Begin
   PreviewRichEdit.Lines.Text:='Вложенный файл отсутствует!';
   ImageFiles.Visible:=False;
   PreviewRichEdit.Visible:=True;
  End;
 if PreviewError then
  Begin
   PreviewRichEdit.Lines.Text:='Предварительный просмотр вложенного файла недоступен...';
   ImageFiles.Visible:=False;
   PreviewRichEdit.Visible:=True;
  End;

 If PreviewImage.Visible then PreviewImage.Align:=alClient;
 If PreviewRichEdit.Visible then PreviewRichEdit.Align:=alClient;
 If ImageFiles.Visible then ImageFiles.Align:=alClient;
 ActionsEnabling;
End;

Constructor TInclFile.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TInclFile.Clear;
begin
 dir:=EmptyStr;
 nrec:=0;
 FileName:=EmptyStr;
 Descr:=EmptyStr;
end;

Function TInclFile.Save:boolean;
Begin

 result:=True;
End;

Function TInclFile.Read:boolean;
Begin
 result:=True;
 Clear;
End;

Function TInclFile.Edit(OForm:TComponent):boolean;
Var
 Form: TInclFileForm;
 OldFileName:string;
 TempFile:string;
// TempFile:array [0..MAX_PATH-1] of Char;
// TempFile: array[0..MAX_PATH] of Char;
begin
 Result := False;
 if Not DirectoryExists(Dir) then MyMkDir(Dir);
 Form:=TInclFileForm.Create(OForm);
 TempFile:=EmptyStr;
 if ToForm(Form) then
  Begin
   if Not Empty(Form.f_FileName) and FileExists(Form.f_FileName) then
    Begin
     TempFile:=IncludeTrailingPathDelimiter(Dir)+'~'+IntToStr(nrec)+'.tmp';
     OldFileName:=Form.f_FileName;
     if FileExists(TempFile) then DeleteFile(TempFile);
     CopyFile(PChar(Form.f_FileName),PChar(TempFile),False);
    End;

   if Form.ShowModal=mrOK then
    Begin
     result:=FromForm(Form);
     if Not Empty(Form.f_FileName) and FileExists(Form.f_FileName) then
      MakeIcon(Dir,nrec,ThumbW,ThumbH);
    End
     else
    Begin
     result:=False;
     if Not Empty(Form.f_FileName) and FileExists(Form.f_FileName) then DeleteFile(Form.f_FileName);
     if Not Empty(OldFileName) and FileExists(OldFileName) then DeleteFile(OldFileName);
     if Not Empty(TempFile) and FileExists(TempFile) then CopyFile(PChar(TempFile),PChar(OldFileName),False);
    End;
   if Not Empty(TempFile) and FileExists(TempFile) then DeleteFile(TempFile);
  End;
 Form.Free;
end;

Function TInclFile.ToForm(Var Form:TInclFileForm):boolean;
Var
 i:integer;
Begin
 Form.f_nrec:=nrec;
 Form.f_dir:=dir;
 Form.f_FileName:=DetectExistsFileName(dir,nrec);
 Form.f_Descr:=Descr;
 Form.UpdatePreview;
 Form.ActionsEnabling;
 result:=True;
End;

Function TInclFile.FromForm(Var Form:TInclFileForm):boolean;
Begin
 nrec:=Form.f_nrec;
 dir:=Form.f_dir;
 FileName:=Form.f_FileName;
 Descr:=Form.f_Descr;
 result:=True;
End;

Destructor TInclFile.Destroy;
begin
 Clear;
 inherited Destroy;
end;

procedure TInclFileForm.ActionsEnabling;
Begin
 SelectFileAction.Enabled:=(CurrentUser.CUSERGROUPS<>2) and (CurrentUser.CUSERGROUPS<>4);
 OpenFileAction.Enabled:=Not Empty(f_FileName) and FileExists(f_FileName);
 SaveFileAsAction.Enabled:=Not Empty(f_FileName) and FileExists(f_FileName);
 DeleteFileAction.Enabled:=(CurrentUser.CUSERGROUPS<>2) and (CurrentUser.CUSERGROUPS<>4) and Not Empty(f_FileName) and FileExists(f_FileName);
End;

end.

