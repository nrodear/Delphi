unit uQRMouseBehavior;

interface

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, Windows, Forms;

type
  TResizingDirection = (RDHorizontal, RDVertikal, RDAll);

  TQRMouseBehavior = class
  private
    const
      // Größe der Ecke zum Greifen
      FResizeZoneSize = 15;
    function UpdateCursor(Sender: TControl; Shift: TShiftState; X, Y: Integer): TCursor;

    var
      // TQRPrintable
      FTarget: TControl;
      FOwner: TComponent;
      FDragging: Boolean;
      FDragStart: TPoint;

      FResizing: Boolean;
      FResizeStart: TPoint;

    function IsResizingDirection(isDirection: TResizingDirection): boolean;
  public
    FResizingDirection: TResizingDirection;

    procedure MouseEnter(Sender: TControl);
    procedure MouseLeave(Sender: TControl);
    procedure MouseDown(Sender: TControl; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MouseMove(Sender: TControl; Shift: TShiftState; X, Y: Integer);

    procedure MouseUp(Sender: TControl);

    constructor Create(AOwner: TComponent; ATarget: TControl);
  end;

implementation

procedure TQRMouseBehavior.MouseEnter(Sender: TControl);
var
  P: TPoint;
  LocalX, LocalY: Integer;
begin

  // Mausposition relativ zum Bildschirm
  GetCursorPos(P);

  // Umrechnung in lokale Koordinaten des Steuerelements
  P := Sender.ScreenToClient(P);
  LocalX := P.X;
  LocalY := P.Y;

  UpdateCursor(Sender, [], LocalX, LocalY);

end;

procedure TQRMouseBehavior.MouseLeave(Sender: TControl);
begin
   TControl(Sender).Cursor := crDefault
end;

constructor TQRMouseBehavior.Create(AOwner: TComponent; ATarget: TControl);
begin
  inherited Create;
  FTarget := ATarget;
  FResizingDirection := RDAll;
  FTarget.Name := FTarget.ClassName;
end;

procedure TQRMouseBehavior.MouseUp(Sender: TControl);
begin
  FDragging := False;
  FResizing := False;
end;

procedure TQRMouseBehavior.MouseDown(Sender: TControl; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) and (ssCtrl in Shift) then
  begin
    FDragging := True;
    FDragStart := Point(X, Y);
  end
  else if (Button = mbLeft) and (X + FResizeZoneSize > Sender.Width) and (Y >= Sender.Height - FResizeZoneSize) then
  begin
    FResizing := True;
    FResizeStart := Sender.ClientToScreen(Point(X, Y));
  end;

end;

procedure TQRMouseBehavior.MouseMove(Sender: TControl; Shift: TShiftState; X, Y: Integer);
var
  dx, dy: Integer;
  CurrentPos: TPoint;
begin
  UpdateCursor(Sender, Shift, X, Y);

  if FDragging then
  begin
    dx := X - FDragStart.X;
    dy := Y - FDragStart.Y;
    Sender.SetBounds(Sender.Left + dx, Sender.Top + dy, Sender.Width, Sender.Height);
  end
  else if FResizing then
  begin
    CurrentPos := Sender.ClientToScreen(Point(X, Y));
    dx := CurrentPos.X - FResizeStart.X;
    dy := CurrentPos.Y - FResizeStart.Y;

    if IsResizingDirection(RDHorizontal) then
      Sender.Width := Sender.Width + dx;
    if IsResizingDirection(RDVertikal) then
      Sender.Height := Sender.Height + dy;

    FResizeStart := CurrentPos;
  end;

end;

function TQRMouseBehavior.IsResizingDirection(isDirection: TResizingDirection): Boolean;
begin
  if (isDirection = RDHorizontal) or (isDirection = RDAll) then
    exit(true);
  if (isDirection = RDVertikal) then
    exit(true);

  exit(false);
end;

function TQRMouseBehavior.UpdateCursor(Sender: TControl; Shift: TShiftState; X, Y: Integer): TCursor;
begin
  if (X >= Sender.Width - 10) and (Y >= TControl(Sender).Height - 10) then
  begin
    if ssCtrl in Shift then
      TControl(Sender).Cursor := crSize
    else
      TControl(Sender).Cursor := crSizeNWSE
  end
  else
    TControl(Sender).Cursor := crDefault;

end;

end.

