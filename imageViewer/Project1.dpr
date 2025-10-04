program Project1;

uses
  Vcl.Forms,
  uImgViewer in 'uImgViewer.pas' {Form1},
  uImgViewerFrame in 'uImgViewerFrame.pas' {ImgViewerFrame: TFrame},
  pdfViewerFrame in 'pdfViewerFrame.pas' {Frame3: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
