unit MagsoftWaitDialog;

interface

uses
  SysUtils, Classes, Dialogs, Forms, Messages, CommDlg, StdCtrls, Gauges, Buttons,
  Controls, ExtCtrls, ComCtrls, JvExComCtrls, JvProgressBar, JvExControls,
  JvSpecialProgress, Windows, CommCtrl, ActiveX;

const
  CLSID_TaskbarList: TGUID = '{56FDF344-FD6D-11d0-958A-006097C9A090}';
  TBPF_NOPROGRESS    = 0;
  TBPF_INDETERMINATE = $1;
  TBPF_NORMAL        = $2;
  TBPF_ERROR         = $4;
  TBPF_PAUSED        = $8;

type
  ITaskbarList = interface(IUnknown) 
    ['{56FDF342-FD6D-11D0-958A-006097C9A090}']
    function HrInit: HRESULT; stdcall;
    function AddTab(hwnd: HWND): HRESULT; stdcall;
    function DeleteTab(hwnd: HWND): HRESULT; stdcall;
    function ActivateTab(hwnd: HWND): HRESULT; stdcall;
    function SetActiveAlt(hwnd: HWND): HRESULT; stdcall;
  end;

  ITaskbarList2 = interface(ITaskbarList) 
    ['{602D4995-B13A-429B-A66E-1935E44F4317}']
    function MarkFullscreenWindow(hwnd: HWND; 
      fFullscreen: BOOL): HRESULT; stdcall;
  end;

  THUMBBUTTON = record 
    dwMask: DWORD;
    iId: UINT;
    iBitmap: UINT;
    hIcon: HICON;
    szTip: packed array[0..259] of WCHAR;
    dwFlags: DWORD;
  end;
  TThumbButton = THUMBBUTTON;
  PThumbButton = ^TThumbButton;

  ITaskbarList3 = interface(ITaskbarList2) 
    ['{EA1AFB91-9E28-4B86-90E9-9E9F8A5EEFAF}']
    function SetProgressValue(hwnd: HWND; ullCompleted: ULONGLONG; 
      ullTotal: ULONGLONG): HRESULT; stdcall;
    function SetProgressState(hwnd: HWND; 
      tbpFlags: Integer): HRESULT; stdcall;
    function RegisterTab(hwndTab: HWND; hwndMDI: HWND): HRESULT; stdcall;
    function UnregisterTab(hwndTab: HWND): HRESULT; stdcall;
    function SetTabOrder(hwndTab: HWND;
      hwndInsertBefore: HWND): HRESULT; stdcall;
    function SetTabActive(hwndTab: HWND; hwndMDI: HWND; 
      tbatFlags: Integer): HRESULT; stdcall;
    function ThumbBarAddButtons(hwnd: HWND; cButtons: UINT;
      pButton: PThumbButton): HRESULT; stdcall;
    function ThumbBarUpdateButtons(hwnd: HWND; cButtons: UINT;
      pButton: PThumbButton): HRESULT; stdcall;
    function ThumbBarSetImageList(hwnd: HWND; 
      himl: HIMAGELIST): HRESULT; stdcall;
    function SetOverlayIcon(hwnd: HWND; hIcon: HICON; 
      pszDescription: LPCWSTR): HRESULT; stdcall;
    function SetThumbnailTooltip(hwnd: HWND; 
      pszTip: LPCWSTR): HRESULT; stdcall;
    function SetThumbnailClip(hwnd: HWND; 
      var prcClip: TRect): HRESULT; stdcall;
  end;

  TMyWait = class(TForm)
    Panel1: TPanel;
    TextLabel: TLabel;
    Gauge2: TGauge;
    ProgressLabel: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    BreakButton: TBitBtn;
    Button1: TButton;
    gauge1: TJvSpecialProgress;
    procedure FormCreate(Sender: TObject);
    procedure BreakButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    STOP:boolean;
  public
    { Public declarations }
  end;

  TMagsoftWaitDialog = class(TCommonDialog)
  private
    FTitle: string;
    FText: string;
    FPromtVisible:boolean;
    FProgressLabelVisible:boolean;
    FProgressBarVisible:boolean;
    FTimeVisible:boolean;
    FCalculatedTimeVisible:boolean;
    FCancelButtonVisible:boolean;
    FDotDotDot: string;
    FMaxVal: int64;
    FStartTime: TDateTime;
    FTicks: int64;
    FVal: int64;
    FCanceled:boolean;
    FWaitForm:TMyWait;
    FTBL: ITaskbarList3;
  protected

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
//    Function Execute:boolean; override;
    procedure CreateWait(AText:string='';AMaxVal:Integer=100);
    procedure KillWait;
    procedure Update(valu:integer;AUpdateGaugeEveryTime:Boolean=False;ACaption:string='');
    procedure Hide;
    procedure Show;
  published
    property Title: string read FTitle write FTitle;
    property PromtVisible: boolean read FPromtVisible write FPromtVisible default True;
    property ProgressLabelVisible: boolean read FProgressLabelVisible write FProgressLabelVisible default True;
    property ProgressBarVisible: boolean read FProgressBarVisible write FProgressBarVisible default True;
    property TimeVisible: boolean read FTimeVisible write FTimeVisible default True;
    property CalculatedTimeVisible: boolean read FCalculatedTimeVisible write FCalculatedTimeVisible default True;
    property CancelButtonVisible: boolean read FCancelButtonVisible write FCancelButtonVisible default True;
    property DotDotDot: string read FDotDotDot write FDotDotDot;
    property MaxVal: int64 read FMaxVal default 100;
    property Value: int64 read FVal write FVal default 0;
    property Canceled: boolean read FCanceled write FCanceled default False;
  end;

procedure Register;

implementation

{$R *.dfm}
//{$R MagsoftVCL.dcr}

procedure Register;
begin
  RegisterComponents('Magsoft Components', [TMagsoftWaitDialog]);
end;

Function Padl(s:string;n:integer;c:char):string;
Var
 ss:string;
 i,l:integer;
Begin
 l:=Length(s);
 ss:=s;
 If l<n then
                  Begin
                   For i:=1 to n-l do ss:=c+ss;
                  End;
 result:=ss;
End;

function RoundUp(X: Extended): int64;
begin
 Result := Trunc(X) + Trunc (Frac(X) * 2);
end;

Function ChmsToSec2(ch,m,s:integer):integer;
Begin
 result:=ch*MinsPerHour*SecsPerMin+m*SecsPerMin+s;
End;

Function LostTime(Past,PastPr,FullPr:int64):int64;
Begin
 If PastPr>0 then result:=RoundUp(Past*FullPr/PastPr-Past)
             else result:=3600;
 If result<0 then result:=0;
End;

Function SecToTime(sec:integer):string;
Var
 h,m,s:integer;
Begin
 h:=sec div 3600;
 m:=(sec-h*3600) div 60;
 s:=sec-h*3600-m*60;
 SecToTime:=Padl(IntToStr(h),2,'0')+':'+Padl(IntToStr(m),2,'0')+':'+Padl(IntToStr(s),2,'0');
End;

procedure TMyWait.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 STOP:=True;
 CanClose := False;
end;

procedure TMyWait.FormCreate(Sender: TObject);
begin
 STOP:=False;
 ProgressLabel.Caption:='';
// Gauge1.Progress:=0;
 Gauge1.Position:=0;
end;

constructor TMagsoftWaitDialog.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 FTitle:='Пожалуйста, подождите...';
 FText:='';
 FPromtVisible:=True;
 FProgressLabelVisible:=True;
 FProgressBarVisible:=True;
 FTimeVisible:=True;
 FCalculatedTimeVisible:=True;
 FCancelButtonVisible:=True;
 FDotDotDot:=' ...';
 FMaxVal:=100;
 FVal:=0;
 FCanceled:=False;

 CoCreateInstance(CLSID_TaskbarList, nil, CLSCTX_INPROC, ITaskbarList3, FTBL);
end;

destructor TMagsoftWaitDialog.Destroy;
begin
  If Assigned(FWaitForm) then FWaitForm.Free;
  inherited Destroy;
end;

Procedure TMagsoftWaitDialog.CreateWait(AText:string='';AMaxVal:Integer=100);
begin
 if (FTBL <> nil) then
  Begin
   if AMaxVal=0 then FTBL.SetProgressState(Application.Handle, TBPF_INDETERMINATE)
                else FTBL.SetProgressState(Application.Handle, TBPF_NORMAL);
  End;
 FPromtVisible:=True;
 FProgressLabelVisible:=True;
 FProgressBarVisible:=True;
 FTimeVisible:=True;
 FCalculatedTimeVisible:=True;
 FCancelButtonVisible:=True;

  FCanceled:=False;
  FMaxVal:=AMaxVal;
  FText:=AText;
  If Not Assigned(FWaitForm) then FWaitForm:=TMyWait.Create(Self);
  FWaitForm.STOP:=False;
  FWaitForm.Caption:=FTitle;
  FWaitForm.TextLabel.Caption:=FText+FDotDotDot;

  If FText='' then FPromtVisible:=False;

  If FMaxVal=0 then
   Begin
    FProgressLabelVisible:=False;
    FProgressBarVisible:=False;
    FTimeVisible:=False;
    FCalculatedTimeVisible:=False;
    FCancelButtonVisible:=False;
   End;

  FWaitForm.TextLabel.Visible:=FPromtVisible;
  FWaitForm.ProgressLabel.Visible:=FProgressLabelVisible;
  FWaitForm.Gauge1.Visible:=FProgressBarVisible;
  FWaitForm.Label4.Visible:=FTimeVisible;
  FWaitForm.Label6.Visible:=FTimeVisible;
  FWaitForm.Label5.Visible:=FCalculatedTimeVisible;
  FWaitForm.Label7.Visible:=FCalculatedTimeVisible;
  FWaitForm.BreakButton.Visible:=FCancelButtonVisible;

  {
  If FMaxVal=0 then
   Begin
    FWaitForm.ProgressLabel.Visible:=False;
    FWaitForm.Gauge1.Visible:=False;
    FWaitForm.Label4.Visible:=False;
    FWaitForm.Label6.Visible:=False;
    FWaitForm.Label5.Visible:=False;
    FWaitForm.Label7.Visible:=False;
    FWaitForm.BreakButton.Visible:=False;
   End;
  }

//  FWaitForm.Gauge1.MaxValue:=FMaxVal;
  FWaitForm.Gauge1.Maximum:=FMaxVal;
  FVal:=0;
  FStartTime:=Now;
  If Self.Owner is TWinControl then
  Try
   (Self.Owner as TWinControl).Enabled:=False;
  Except
  End;
  FWaitForm.FormResize(Self);
  Update(FVal);
  FWaitForm.Show;
  Application.ProcessMessages;
  FWaitForm.Repaint;
end;

procedure TMagsoftWaitDialog.KillWait;
Begin
  if (FTBL <> nil) then FTBL.SetProgressState(Application.Handle, TBPF_NOPROGRESS);
  If Assigned(FWaitForm) then FWaitForm.Hide;
  If Self.Owner is TWinControl then
  Begin
   (Self.Owner as TWinControl).Enabled:=True;
   (Self.Owner as TWinControl).BringToFront;
  End;
End;

procedure TMagsoftWaitDialog.Hide;
Begin
 If Assigned(FWaitForm) then FWaitForm.Hide;
End;

procedure TMagsoftWaitDialog.Show;
Begin
 If Assigned(FWaitForm) then FWaitForm.Show;
End;

procedure TMagsoftWaitDialog.Update(valu:integer;AUpdateGaugeEveryTime:Boolean=False;ACaption:string='');
Var
 myvalu:int64;
 lastprocent,divv:integer;
 timesh:TDateTime;
 ch,min,sec,msec:word;
Begin
 if (FTBL <> nil) and (FMaxVal>0) then FTBL.SetProgressValue(Application.Handle, valu, FMaxVal);

 If FTimeVisible and Not FWaitForm.Label4.Visible then
  Begin
   FWaitForm.Label4.Visible:=FTimeVisible;
   FWaitForm.Label6.Visible:=FTimeVisible;
   FWaitForm.FormResize(Self);
  End;

 divv:=(FMaxVal div 100); If divv=0 then divv:=1;
 If ((valu mod divv)=0) or (valu=0) or AUpdateGaugeEveryTime then
 Begin
 myvalu:=valu;
 If myvalu>MaxVal then myvalu:=FMaxVal;
 lastprocent:=FWaitForm.Gauge1.PercentDone;
// If (FWaitForm.Gauge1.Progress<>myvalu) or (myvalu=0) or AUpdateGaugeEveryTime then
 If (FWaitForm.Gauge1.Position<>myvalu) or (myvalu=0) or AUpdateGaugeEveryTime then
  Begin
//   FWaitForm.Gauge1.Progress:=myvalu;
   FWaitForm.Gauge1.Position:=myvalu;
   FWaitForm.ProgressLabel.Caption:=IntToStr(myvalu)+'/'+IntToStr(FMaxVal);
   If lastprocent<>FWaitForm.Gauge1.PercentDone then
    Begin
     FWaitForm.Repaint;
    End;
  End;
 timesh:=Now-FStartTime;
 DecodeTime(timesh,ch,min,sec,msec);
 FTicks:=CHMSToSec2(ch,min,sec);
 FWaitForm.Label6.Caption:=SecToTime(FTicks);

 FWaitForm.Label7.Caption:=SecToTime(LostTime(FTicks,myvalu,FMaxVal));
 End;

 If ACaption<>'' then
  Begin
   FWaitForm.TextLabel.Caption:=ACaption;
   FWaitForm.Repaint;
  End;

 Application.ProcessMessages;
 FCanceled:=FWaitForm.STOP;
 if FCanceled and (FTBL <> nil) then FTBL.SetProgressState(Application.Handle, TBPF_ERROR);
End;

procedure TMyWait.BreakButtonClick(Sender: TObject);
begin
 STOP:=True;
end;

procedure TMyWait.FormResize(Sender: TObject);
Const
 mezhdu=4;
 HeightPlus=32;
begin
 TextLabel.Top:=mezhdu;
 If TextLabel.Visible then ProgressLabel.Top:=TextLabel.Top+TextLabel.Height+mezhdu
      else ProgressLabel.Top:=mezhdu;
 If ProgressLabel.Visible then Gauge1.Top:=ProgressLabel.Top+ProgressLabel.Height+mezhdu
     else If TextLabel.Visible then Gauge1.Top:=TextLabel.Top+TextLabel.Height+mezhdu
      else Gauge1.Top:=mezhdu;
 If Gauge1.Visible then Label4.Top:=Gauge1.Top+Gauge1.Height+mezhdu
    else If ProgressLabel.Visible then Label4.Top:=ProgressLabel.Top+ProgressLabel.Height+mezhdu
     else If TextLabel.Visible then Label4.Top:=TextLabel.Top+TextLabel.Height //+mezhdu
      else Label4.Top:=mezhdu;
 If Label4.Visible then Label5.Top:=Label4.Top+Label4.Height+mezhdu
   else If Gauge1.Visible then Label5.Top:=Gauge1.Top+Gauge1.Height+mezhdu
    else If ProgressLabel.Visible then Label5.Top:=ProgressLabel.Top+ProgressLabel.Height+mezhdu
     else If TextLabel.Visible then Label5.Top:=TextLabel.Top+TextLabel.Height+mezhdu
      else Label5.Top:=mezhdu;
 If Label5.Visible then BreakButton.Top:=Label5.Top+Label5.Height+mezhdu
  else If Label4.Visible then BreakButton.Top:=Label4.Top+Label4.Height+mezhdu
   else If Gauge1.Visible then BreakButton.Top:=Gauge1.Top+Gauge1.Height+mezhdu
    else If ProgressLabel.Visible then BreakButton.Top:=ProgressLabel.Top+ProgressLabel.Height+mezhdu
     else If TextLabel.Visible then BreakButton.Top:=TextLabel.Top+TextLabel.Height+mezhdu
      else BreakButton.Top:=mezhdu;
 Label6.Top:=Label4.Top; Label7.Top:=Label5.Top;
 If BreakButton.Visible then Height:=BreakButton.Top+BreakButton.Height+HeightPlus
  else If Label5.Visible then Height:=Label5.Top+Label5.Height+HeightPlus
   else If Label4.Visible then Height:=Label4.Top+Label4.Height+HeightPlus
    else If Gauge1.Visible then Height:=Gauge1.Top+Gauge1.Height+HeightPlus
     else If ProgressLabel.Visible then Height:=ProgressLabel.Top+ProgressLabel.Height+HeightPlus
      else If TextLabel.Visible then Height:=TextLabel.Top+TextLabel.Height+HeightPlus
        else Height:=HeightPlus;
end;

end.
