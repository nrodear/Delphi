unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt,
  Vcl.ExtCtrls, QRCtrls, uQRHoverLabel, uQRHoverImage, uQRHoverDBText,
  uQRHoverBand, Vcl.StdCtrls, uQRComponentSnapshot;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRHoverBandPanel1: TQRHoverBandPanel;
    QRHoverLabel1: TQRHoverLabel;
    QRHoverLabel2: TQRHoverLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  QuickRep1.Prepare;
  QuickRep1.print;

end;

const
  filename = '.\QuickReportComponent.XML';

procedure TForm2.Button2Click(Sender: TObject);
begin
  TQRComponentSnapshot.SaveQuickReportToXML(Form2, QuickRep1, TComponent, filename)
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  TQRComponentSnapshot.ApplyXMLToQuickReport(QuickRep1, filename);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  TQRComponentSnapshot.ApplyXMLToQuickReport(QuickRep1, filename);
end;

end.

