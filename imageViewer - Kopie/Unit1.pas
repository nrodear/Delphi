unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, uImgViewerFrame; // wichtig für JPG/PNG

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    ImgViewerFrame1: TImgViewerFrame;
    procedure FormResize(Sender: TObject);


  end;

var
  Form1: TForm1;

implementation


uses uImageLoader;
{$R *.dfm}


procedure TForm1.FormResize(Sender: TObject);
begin
 ImgViewerFrame1.Update (sender);
end;


end.

