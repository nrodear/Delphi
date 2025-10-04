program Project_Belege;

uses
  Vcl.Forms,
  Unit2 in 'sources\Unit2.pas' {Form2},
  BelegUnit in 'sources\BelegUnit.pas',
  BelegeUnit in 'sources\BelegeUnit.pas',
  Unit1 in 'sources\Unit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
