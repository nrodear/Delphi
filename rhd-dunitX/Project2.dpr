program Project2;

uses
  Vcl.Forms,
  Unit1 in 'source\Unit1.pas' {Form1},
  Person in 'source\Person.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
