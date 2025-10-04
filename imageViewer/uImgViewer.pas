unit uImgViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, uImgViewerFrame, Vcl.ComCtrls,
  pdfViewerFrame; // wichtig für JPG/PNG

type
  TForm1 = class(TForm)
    Button1: TButton;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ImgViewerFrame1: TImgViewerFrame;
    TabSheet2: TTabSheet;
    Frame31: TFrame3;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);

  end;

var
  Form1: TForm1;

implementation

uses uImageLoader;
{$R *.dfm}

procedure TForm1.Button2Click(Sender: TObject);
var
  Picture : TPicture;
begin
   Picture :=TPicture.Create;

   ImgViewerFrame1.Image1.Picture := Picture;
   Picture.free;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 ImgViewerFrame1.FormKeyDown(Sender, key, Shift);
end;

end.

