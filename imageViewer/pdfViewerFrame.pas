unit pdfViewerFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, gtScrollingPanel,
  gtPDFViewer, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrame3 = class(TFrame)
    gtPDFViewer1: TgtPDFViewer;
    Panel1: TPanel;
    Button1: TButton;
    Button3: TButton;
    Edtfilename: TEdit;
    gtPDFViewer2: TgtPDFViewer;
    procedure Button1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

implementation

{$R *.dfm}

procedure TFrame3.Button1Click(Sender: TObject);
//var  doc : tgtcoustomdocument;

begin



gtPDFViewer1.PDFDocument.LoadFromFile(Edtfilename.text);
end;

end.

