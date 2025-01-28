program Project1;

uses
  Vcl.Forms,
  Person in 'Person.pas',
  Controller in 'Controller.pas',
  MainForm in 'MainForm.pas' {FormMain},
  ControllerDB in 'ControllerDB.pas',
  SingletonDB in 'SingletonDB.pas',
  CheckException in 'CheckException.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
