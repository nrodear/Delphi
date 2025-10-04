unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Vcl.ExtCtrls,uThreadForm;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    var formTimer: TTimer;

  public
    { Public-Deklarationen }
    procedure btnStartThreadClick(Sender: TObject);
  end;

var
  Form1: TForm1;
  ThreadForm : TForm2;

implementation

{$R *.dfm}

uses
  uMyThread;

procedure TForm1.FormCreate(Sender: TObject);
begin
  formTimer := TTimer.Create(self);
  formTimer.OnTimer := btnStartThreadClick;
  formTimer.Interval:= 4000;
  formTimer.Enabled:= true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  btnStartThreadClick(sender)
end;

procedure TForm1.btnStartThreadClick(Sender: TObject);
begin
   TMyThread.Create(False); // Thread automatisch starten
end;

end.
