unit uImgViewerFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, math; // wichtig für JPG/PNG

type
  TImgViewerFrame = class(TFrame)
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Edtfilename: TEdit;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    ScrollBox1: TScrollBox;
    pnlCenterMain: TPanel;
    pnlMain: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure ScrollBox1Resize(Sender: TObject);
    procedure FrameMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);

  private
  const
    FScrollMax=50;
    FScrollFactor=100;
    FZoomFactor=0.005;
    procedure UpdateScrollBar;
    procedure HandleEscape;
  var
    FZoom : double;
    FInitialized: Boolean;

    procedure LoadFromFile(filename: string);
    procedure OpenDialog;
    procedure ApplyZoom;
    procedure Zoom(Sender: TObject; factor: double);
    property Initialized: Boolean read FInitialized;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    //constructor Create(AOwner: TComponent);reintroduce;
    procedure Update (sender: TObject);
    procedure Loaded; override;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  end;

implementation

uses
  uImageLoader;

{$R *.dfm}

procedure TImgViewerFrame.Button1Click(Sender: TObject);
begin
  LoadFromFile(Edtfilename.Text);
end;

procedure TImgViewerFrame.Button2Click(Sender: TObject);
begin
    Zoom(sender, 1 - FZoomFactor ) ;
end;

procedure TImgViewerFrame.Button4Click(Sender: TObject);
begin
    Zoom(sender, 1 + FZoomFactor) ;
end;

procedure TImgViewerFrame.Button3Click(Sender: TObject);
begin
  OpenDialog;
end;

procedure TImgViewerFrame.LoadFromFile(filename: string);
begin
  Image1.Picture.LoadFromFile(filename);

  FZoom := ScrollBox1.Width / Image1.Picture.Width;
  ApplyZoom;
end;

procedure TImgViewerFrame.Update (sender: TObject);
begin
  if not Initialized or (Image1.Picture.Width = 0) then
    exit;

  ApplyZoom;
end;

procedure TImgViewerFrame.Loaded;
begin
  inherited;

  ScrollBox1.AutoScroll := False; // Deaktiviert automatische Verwaltung
  ScrollBox1.VertScrollBar.Visible := True;
  ScrollBox1.VertScrollBar.Range := Image1.Height;
  ScrollBox1.VertScrollBar.Position := 0;
  ScrollBox1.VertScrollBar.Increment := 20; // Scroll-Increment

  Image1.top := 0;
  Image1.left := 0;
  Image1.Width := ScrollBox1.Width;
  Image1.Height := ScrollBox1.Height;

  Image1.Center := true;
  Image1.Proportional := True;
  Image1.Stretch := True;
  Image1.Parent := ScrollBox1;

  Self.DoubleBuffered := True;

  FInitialized := true;
end;

procedure TImgViewerFrame.OpenDialog;
var
  OpenDialog1: TOpenDialog;
begin

  OpenDialog1 := TOpenDialog.Create(Application);
  // Dateifilter: BMP, JPG, JPEG, PNG
  OpenDialog1.Filter :=
    'Bilder (*.bmp;*.jpg;*.jpeg;*.png)|*.bmp;*.jpg;*.jpeg;*.png|Alle Dateien (*.*)|*.*';
  OpenDialog1.Title := 'Bild auswählen';

  if OpenDialog1.Execute then
    Edtfilename.Text := OpenDialog1.FileName;

  OpenDialog1.free;

  LoadFromFile(Edtfilename.Text);

end;

procedure TImgViewerFrame.Zoom(Sender: TObject; factor: double);
begin
  FZoom := FZoom * factor;
  ApplyZoom;
end;

procedure TImgViewerFrame.ApplyZoom;
var
  width : integer;
begin
  if (Image1.Picture.Graphic = nil) then
    Exit;

  Image1.Width := Round(Image1.Picture.Width * FZoom);
  Image1.Height := Round(Image1.Picture.Height * FZoom);

  UpdateScrollBar;
end;


procedure TImgViewerFrame.FrameMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  MaxScroll, HeightScroll: Integer;
begin

  // Prüfen, ob die Maus über der ScrollBox ist
  if PtInRect(ScrollBox1.ClientRect, ScrollBox1.ScreenToClient(MousePos)) then
  begin
    // zoom
    if ssShift in Shift then
    begin
      if WheelDelta <= 0 then
          Zoom(sender, 1 + FZoomFactor)
      else
          Zoom(sender, 1 - FZoomFactor) ;
    end;
  end;

end;

procedure TImgViewerFrame.ScrollBox1Resize(Sender: TObject);
var
  currentMax : integer;
begin
  if not Initialized or (Image1.Picture.Width = 0 )then
    exit;

  FZoom := ScrollBox1.Width / Image1.Picture.Width;
  ApplyZoom;

end;

procedure TImgViewerFrame.UpdateScrollBar;
begin
  ScrollBox1.VertScrollBar.Range := Image1.Height;
end;

procedure TImgViewerFrame.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
const
  ScrollStep = 100; // Pixel pro Tastendruck
begin
  case Key of
    VK_PRIOR: // PageUp
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - ScrollStep;
    VK_NEXT:  // PageDown
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position + ScrollStep;
    VK_ESCAPE:
      HandleEscape;
  end;
end;

procedure TImgViewerFrame.HandleEscape;
var
  ParentForm: TCustomForm;
begin
  ParentForm := GetParentForm(Self);
  if Assigned(ParentForm) then
    ParentForm.Close;
end;


end.
