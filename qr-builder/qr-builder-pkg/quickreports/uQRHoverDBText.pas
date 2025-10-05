unit uQRHoverDBText;

interface

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, uQRMouseBehavior;

type
  TQRHoverDBText = class(TQRDBText)
  private
    FMouseBehavior: TQRMouseBehavior;

    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
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
  RegisterComponents('QuickReport', [TQRHoverDBText]);
end;

constructor TQRHoverDBText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DoubleBuffered := True;
  AutoSize := False;

  FMouseBehavior := TQRMouseBehavior.Create(AOwner, self);

end;

procedure TQRHoverDBText.CMMouseEnter(var Message: TMessage);
begin
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverDBText.CMMouseLeave(var Message: TMessage);
begin
  FMouseBehavior.MouseLeave(Self);
end;

procedure TQRHoverDBText.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseDown(Self, Button, Shift, X, Y);
end;

procedure TQRHoverDBText.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseMove(Self, Shift, X, Y);
end;

procedure TQRHoverDBText.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseUp(Self);
end;

end.

