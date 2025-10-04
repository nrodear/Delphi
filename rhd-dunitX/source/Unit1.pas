unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }


  end;


  Tperson = class

  public function getValue : integer;
  end;



var
  Form1: TForm1;

implementation

{$R *.dfm}



{ Tperson }

function Tperson.getValue: integer;
begin
 exit (1)
end;

end.
