unit uQRHoverBand;

interface

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, uQRMouseBehavior, uHasSnapShotAttribute;

type
  [HasSnapShotAttribute]
  TQRHoverBandPanel = class(TQRBand)
  private
    FMouseBehavior: TQRMouseBehavior;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure Paint; override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    procedure Invalidate; override;
    constructor Create(AOwner: TComponent); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('QuickReport', [TQRHoverBandPanel]);
end;

constructor TQRHoverBandPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  ControlStyle := ControlStyle + [csReplicatable, csDesignInteractive];
  FMouseBehavior := TQRMouseBehavior.Create(AOwner, self);
  DoubleBuffered := True;
  name := Self.ClassName;

  FMouseBehavior.FResizingDirection := RDVertikal;

end;

procedure TQRHoverBandPanel.Invalidate;
begin
  inherited;
end;

procedure TQRHoverBandPanel.CMMouseEnter(var Message: TMessage);
begin
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverBandPanel.CMMouseLeave(var Message: TMessage);
begin
  FMouseBehavior.MouseLeave(Self);
end;

procedure TQRHoverBandPanel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseDown(Self, Button, Shift, X, Y);
end;

procedure TQRHoverBandPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseMove(Self, Shift, X, Y);
end;

procedure TQRHoverBandPanel.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseUp(Self);
end;

procedure TQRHoverBandPanel.Paint;
begin
  inherited;
end;

initialization
  RegisterClass(TQRHoverBandPanel);

end.

