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
    QRBand1: TQRBand;
    QRHoverBandPanel1: TQRHoverBandPanel;
    QRHoverLabel1: TQRHoverLabel;
    QRHoverLabel2: TQRHoverLabel;
    ComboBox1: TComboBox;
    QRBand3: TQRBand;
    QRHoverBandPanel2: TQRHoverBandPanel;
    QRHoverLabel3: TQRHoverLabel;
    QRHoverRichText1: TQRHoverRichText;
    QRLabel1: TQRLabel;
    QRRichText1: TQRRichText;
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
  ;
  QRHoverRichText1.text := 'Dies ist ein Beispieltext für den Monatsbericht. Hier können Sie formatierte Inhalte wie in Word einfügen.';

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  QuickRep1.Prepare;

  //QuickRep1.Preview;

  QuickRep1.print;

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

