program Project1;

uses
  Vcl.Forms,
  CheckException in 'Sources\CheckException.pas',
  Controller in 'Sources\Controller.pas',
  ControllerDB in 'Sources\ControllerDB.pas',
  Person in 'Sources\Person.pas',
  SingletonDB in 'Sources\SingletonDB.pas',
  MainForm in 'Sources\MainForm.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
