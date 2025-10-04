unit uMyThread;

interface

uses
  System.Classes, System.types;


type
  TMyThread = class(TThread)
  protected
    procedure Execute; override;

  end;

implementation

uses
  Winapi.Windows, uThreadForm,
  Vcl.Forms, Vcl.Controls, uMainForm;

procedure TMyThread.Execute;
begin
 TThread.Queue(nil,
  procedure
  begin
    if not assigned(ThreadForm)  then
      ThreadForm := TForm2.Create(nil);

    ShowWindow(ThreadForm.Handle, SW_SHOWNOACTIVATE); // Fenster anzeigen ohne Fokus
    ThreadForm.Visible := True;

   end);

end;


end.

