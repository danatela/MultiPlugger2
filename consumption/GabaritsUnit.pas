unit GabaritsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, JvExMask, ActnList,
  XPStyleActnCtrls, ActnMan, xmldom, XMLIntf, msxmldom, XMLDoc,
  DB, ADODB, MagsoftSharedUnit, GlobVars, JvToolEdit,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ImgList;


type
  TGabaritsForm = class(TForm)
    Panel1: TPanel;
    ImportBtn: TBitBtn;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TGabarits = class
 PROP_PWIDTH1: double;
 PROP_PWIDTH2: double;
 PROP_SIZE1: double;
 PROP_SIZE2: double;
 PROP_WTHICK: double;
 PROP_SLENGTH: double;
 PROP_DIAM: double;
 PROP_SIZE: double;
 PROP_THICK_C: double;
 PROP_WIDTH_C: double;
 PROP_LENGTH_C: double;
 Procedure Clear;
 constructor Create;
 destructor Destroy; override;
end;

var
  GabaritsForm: TGabaritsForm;

implementation

{$R *.dfm}

Constructor TGabarits.Create;
begin
 inherited Create;
 Clear;
end;

Procedure TGabarits.Clear;
begin
 PROP_PWIDTH1:=0;
 PROP_PWIDTH2:=0;
 PROP_SIZE1:=0;
 PROP_SIZE2:=0;
 PROP_WTHICK:=0;
 PROP_SLENGTH:=0;
 PROP_DIAM:=0;
 PROP_SIZE:=0;
 PROP_THICK_C:=0;
 PROP_WIDTH_C:=0;
 PROP_LENGTH_C:=0;
end;

Destructor TGabarits.Destroy;
begin
 Clear;
 inherited Destroy;
end;

end.

