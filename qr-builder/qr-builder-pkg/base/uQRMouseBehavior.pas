unit uQRMouseBehavior;

interface

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, Forms;

type
  TResizingDirection = (RDHorizontal, RDVertikal, RDAll);

  TQRMouseBehavior = class
  private
    const
      // Größe der Ecke zum Greifen
      FResizeZoneSize = 15;
    var
      // TQRPrintable
      FTarget: TComponent;
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

    constructor Create(AOwner: TComponent; ATarget: TComponent);
  end;

implementation

procedure TQRMouseBehavior.MouseEnter(Sender: TControl);
begin

end;

procedure TQRMouseBehavior.MouseLeave(Sender: TControl);
begin

end;

constructor TQRMouseBehavior.Create(AOwner: TComponent; ATarget: TComponent);
begin
  inherited Create;
  FTarget := ATarget;
  FResizingDirection := RDAll;
  FTarget.Name:= FTarget.ClassName;
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

end.

