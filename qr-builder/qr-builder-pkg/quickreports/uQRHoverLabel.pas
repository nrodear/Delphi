unit uQRHoverLabel;

interface

uses
  System.Classes, System.Messaging, Vcl.Controls,
  QuickRpt, QRCtrls, uQRMouseBehavior, uHasSnapShotAttribute;

type
  [HasSnapShotAttribute]
  TQRHoverLabel = class(TQRLabel)
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
  RegisterComponents('QuickReport', [TQRHoverLabel]);
end;

constructor TQRHoverLabel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable, csDesignInteractive];
  FMouseBehavior := TQRMouseBehavior.Create(AOwner, self);
  FMouseBehavior.FResizingDirection:= RDAll;

  name := Self.ClassName;
  DoubleBuffered := True;
  AutoSize := False;

  Height:=24;
  Width:=50;
end;

procedure TQRHoverLabel.CMMouseEnter(var Message: TMessage);
begin
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverLabel.CMMouseLeave(var Message: TMessage);
begin
  FMouseBehavior.MouseLeave(Self);
end;

procedure TQRHoverLabel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseDown(Self, Button, Shift, X, Y);
end;

procedure TQRHoverLabel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseMove(Self, Shift, X, Y);
end;

procedure TQRHoverLabel.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseUp(Self);
end;

procedure TQRHoverLabel.SetParent(AParent: TWinControl);
begin
  inherited;
end;

initialization
  RegisterClass(TQRHoverLabel);

end.

