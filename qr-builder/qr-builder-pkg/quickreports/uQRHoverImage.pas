unit uQRHoverImage;

interface

uses
  System.Classes, System.Messaging, Vcl.Controls,
  QuickRpt, QRCtrls, uQRMouseBehavior, uHasSnapShotAttribute;

type
  [HasSnapShotAttribute]
  TQRHoverImage = class(TQRImage)
  private
    FMouseBehavior: TQRMouseBehavior;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;

  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    procedure SetParent(AParent: TWinControl); override;
    constructor Create(AOwner: TComponent); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('QuickReport', [TQRHoverImage]);
end;

constructor TQRHoverImage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable, csDesignInteractive];
  FMouseBehavior := TQRMouseBehavior.Create(AOwner, self);

  FMouseBehavior.FResizingDirection:= RDAll;
  name := Self.ClassName;
  DoubleBuffered := True;
  AutoSize := False;

end;

procedure TQRHoverImage.CMMouseEnter(var Message: TMessage);
begin
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverImage.CMMouseLeave(var Message: TMessage);
begin
  FMouseBehavior.MouseLeave(Self);
end;

procedure TQRHoverImage.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseDown(Self, Button, Shift, X, Y);
end;

procedure TQRHoverImage.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseMove(Self, Shift, X, Y);
end;

procedure TQRHoverImage.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseUp(Self);
end;

procedure TQRHoverImage.SetParent(AParent: TWinControl);
begin
  inherited;
end;

initialization
  RegisterClass(TQRHoverImage);

end.

