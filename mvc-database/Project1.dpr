program Project1;

uses
  Vcl.Forms,
  Model in 'Model.pas',
  Controller in 'Controller.pas',
  MainForm in 'MainForm.pas' {FormMain},
  ControllerDB in 'ControllerDB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
