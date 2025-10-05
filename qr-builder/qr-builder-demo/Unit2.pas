unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt,
  Vcl.ExtCtrls, QRCtrls, uQRHoverLabel, uQRHoverImage, uQRHoverDBText,
  uQRHoverBand, Vcl.StdCtrls, uQRComponentSnapshot, uHasSnapShotAttribute,
  Vcl.ComCtrls, uQRHoverRichText;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    QuickRep1: TQuickRep;
    ComboBox1: TComboBox;
    QRBand1: TQRBand;
    QRHoverBandPanel1: TQRHoverBandPanel;
    QRHoverBandPanel2: TQRHoverBandPanel;
    QRHoverLabel1: TQRHoverLabel;
    QRHoverLabel2: TQRHoverLabel;
    QRHoverLabel3: TQRHoverLabel;
    QRHoverLabel4: TQRHoverLabel;
    QRHoverRichText1: TQRHoverRichText;
    QRHoverLabel5: TQRHoverLabel;
    QRHoverRichText2: TQRHoverRichText;
    QRHoverImage1: TQRHoverImage;
    QRHoverImage2: TQRHoverImage;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    const
      filename = '.\QuickReportComponent.XML';

    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

resourcestring
  StrDiesIstEinBeispie = 'Dies ist ein Beispieltext für den Monatsbericht. H' +
  'ier können Sie formatierte Inhalte wie in Word einfügen.';
  StrDieVerwendungDiese = 'Die Verwendung dieser Inhalte in produktiven oder' +
  ' rechtlich relevanten Kontexten wird ausdrücklich nicht empfohlen. Änderu' +
  'ngen und Irrtümer vorbehalten.';

{$R *.dfm}

procedure TForm2.FormCreate(Sender: TObject);
var
  Snapshot: TSnapshotType;
begin

  TQRComponentSnapshot.ApplyXMLToQuickReport(QuickRep1, filename, TSnapshotType.STDefault);

  ComboBox1.Items.Clear;
  for Snapshot := Low(TSnapshotType) to High(TSnapshotType) do
    ComboBox1.Items.Add(SnapshotTypeNames[Snapshot]);
  ComboBox1.ItemIndex := 0;

  QRHoverLabel1.Caption := 'Monatsbericht Oktober';
  QRHoverLabel2.Caption := 'Abteilung Vertrieb';
  QRHoverLabel3.Caption := FormatDateTime('dd.mm.yyyy', Date);

  QRHoverRichText1.lines.text := StrDiesIstEinBeispie;

  QRHoverLabel4.Caption := 'Disclaimer';
  QRHoverRichText2.lines.text := StrDieVerwendungDiese;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  QuickRep1.Prepare;

  QuickRep1.Preview;

  //QuickRep1.print;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  TQRComponentSnapshot.SaveQuickReportToXML(Form2, QuickRep1, TComponent, filename, TSnapshotType(ComboBox1.ItemIndex))
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
  TQRComponentSnapshot.ApplyXMLToQuickReport(QuickRep1, filename, TSnapshotType(ComboBox1.ItemIndex));
end;

end.

