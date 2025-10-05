unit uQRHoverBand;

interface

uses
  System.Classes, System.Messaging, Vcl.Controls,
  QuickRpt, uQRMouseBehavior, uHasSnapShotAttribute;

type
  [HasSnapShotAttribute]
  TQRHoverBandPanel = class(TQRBand)
  private
    FMouseBehavior: TQRMouseBehavior;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure SetParent(AParent: TWinControl); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
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
  Enabled := true;
  FMouseBehavior.FResizingDirection := RDVertikal;

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

procedure TQRHoverBandPanel.SetParent(AParent: TWinControl);
begin
  inherited;
end;

initialization
  RegisterClass(TQRHoverBandPanel);

end.

