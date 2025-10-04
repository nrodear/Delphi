program Project1;

uses
  Vcl.Forms,
  uMainForm in 'uMainForm.pas' {Form1},
  uMyThread in 'uMyThread.pas',
  uThreadForm in 'uThreadForm.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TForm1, Form1);

  Application.Run;
end.
