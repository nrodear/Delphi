unit uThreadForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs,Vcl.ExtCtrls, math;

type
  TForm2 = class(TForm)
      procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private-Deklarationen }
    var
    FadeTimer: TTimer;
    StartFadeTimer: TTimer;
    FAlphaBlend: integer;
    FAlphaStep: integer;

    procedure MakeFormTransparent(Form: TForm; Alpha: Byte);

    procedure FadeTimerTimer(Sender: TObject);
    procedure StartFadeOut(Sender: TObject);

  public
    { Public-Deklarationen }
  end;

var
  ThreadForm: TForm2;

implementation

{$R *.dfm}



procedure TForm2.FormCreate(Sender: TObject);
begin
  FadeTimer := TTimer.Create(self);
  FadeTimer.OnTimer := FadeTimerTimer;
  FadeTimer.Interval:= 10;
  FadeTimer.Enabled := false;

  StartFadeTimer := TTimer.Create(self);
  StartFadeTimer.OnTimer := StartFadeOut;
  StartFadeTimer.Interval:= 3000;
  StartFadeTimer.Enabled := True;

  FAlphaStep:= 10;
  FAlphaBlend := 255;
  Color := clBlack;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  MakeFormTransparent(self,255);
  FAlphaBlend := 255;
  StartFadeTimer.Enabled := true;
end;

procedure TForm2.StartFadeOut(Sender: TObject);
begin
     FadeTimer.Enabled := True;
     StartFadeTimer.Enabled := false;
end;

procedure TForm2.FadeTimerTimer(Sender: TObject);
begin
  if FAlphaBlend > 0 then
  begin
    FAlphaBlend := math.Max(0, FAlphaBlend - FAlphaStep);
      MakeFormTransparent(self,FAlphaBlend);
  end
  else
  begin
    FadeTimer.Enabled := False;
    Close; // or Hide, depending on your goal
  end;
end;

procedure TForm2.MakeFormTransparent(Form: TForm; Alpha: Byte);
var
  Attr: Longint;
begin
  Attr := GetWindowLong(Form.Handle, GWL_EXSTYLE);
  SetWindowLong(Form.Handle, GWL_EXSTYLE, Attr or WS_EX_LAYERED);
  SetLayeredWindowAttributes(Form.Handle, 0, Alpha, LWA_ALPHA);
end;

end.
