unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  SHDocVw, Vcl.OleCtrls,

  ActiveX, // Für COM-Initialisierung
  ComObj,
  Registry,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Graphics, Winapi.WebView2, Vcl.Edge;

type
  TForm1 = class(TForm)

    Edit1xml: TEdit;
    Edit2xsl: TEdit;
    Button1: TButton;

    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    WebBrowser1: TWebBrowser;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure TransformXMLWithXSLT(const XMLFile, XSLFile: string);
    function GetTempDir: string;
    procedure ShowInvoiceHTML(const HTMLFile: string);
    function SelectFile: string;
    procedure SetBrowserEmulation;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses
  MSXML, ShellAPI;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TransformXMLWithXSLT(Edit1xml.Text, Edit2xsl.Text);
end;

procedure TForm1.TransformXMLWithXSLT(const XMLFile, XSLFile: string);
var
  XMLDoc, XSLDoc: OleVariant;
  Output: WideString;
  OutputFile: string;
begin
  CoInitialize(nil);
  try
    XMLDoc := CreateOleObject('Msxml2.DOMDocument.6.0');
    XSLDoc := CreateOleObject('Msxml2.DOMDocument.6.0');

    XMLDoc.async := False;
    XSLDoc.async := False;

    if not XMLDoc.load(XMLFile) then
      raise Exception.Create('Fehler beim Laden der XML-Datei.');

    if not XSLDoc.load(XSLFile) then
      raise Exception.Create('Fehler beim Laden der XSL-Datei.');

    Output := XMLDoc.transformNode(XSLDoc);

    // Ergebnis speichern in temporärer HTML-Datei
    OutputFile := ExtractFilePath(XSLFile) + 'transformed_output.html';

    with TStringList.Create do
      try
        Text := Output;
        SaveToFile(OutputFile, TEncoding.ANSI);
      finally
        Free;
      end;
    ShowInvoiceHTML(OutputFile);

    // HTML-Datei im Standardbrowser öffnen
    // ShellExecute(0, 'open', PChar(OutputFile), nil, nil, SW_SHOWNORMAL);

  finally
    CoUninitialize;
  end;
end;

procedure TForm1.SetBrowserEmulation;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey
      ('Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION',
      True) then
      Reg.WriteInteger(ExtractFileName(Application.ExeName), 11001); // IE11
  finally
    Reg.Free;
  end;
end;

// Hilfsfunktion für temporären Pfad
procedure TForm1.Button2Click(Sender: TObject);
begin
  Edit1xml.Text := SelectFile;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Edit2xsl.Text := SelectFile;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  SetBrowserEmulation
end;

function TForm1.GetTempDir: string;
var
  Buffer: array [0 .. MAX_PATH] of Char;
begin
  GetTempPath(MAX_PATH, Buffer);
  Result := string(Buffer);
end;

procedure TForm1.ShowInvoiceHTML(const HTMLFile: string);
begin
  if FileExists(HTMLFile) then
    WebBrowser1.Navigate(HTMLFile)
  else
    ShowMessage('HTML-Datei nicht gefunden: ' + HTMLFile);
end;

function TForm1.SelectFile: string;
var
  selectedFile: string;
  openDialog: TOpenDialog;
begin

  Result := '';
  openDialog := TOpenDialog.Create(nil);
  openDialog.InitialDir := GetCurrentDir + '\..\..';
  openDialog.Options := [ofFileMustExist];

  // Allow only .dpr and .pas files to be selected
  openDialog.Filter := 'All files (*.*)|*.*';
  // Display the open file dialog
  if openDialog.Execute then
    Result := openDialog.FileName;

  // Free up the dialog
  openDialog.Free;
end;

end.
