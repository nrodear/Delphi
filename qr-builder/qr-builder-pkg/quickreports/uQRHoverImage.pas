unit uQRHoverImage;

interface

{
TQRLabel
TQRDBText
TQRShape
TQRImage
TQRExpr
TQRRichText
}

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, FMX.Forms, uQRMouseBehavior;

type
  TQRHoverImage = class(TQRImage)
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
  DoubleBuffered := True;
  FMouseBehavior := TQRMouseBehavior.Create(AOwner, self);
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

procedure TQRHoverImage.Paint;
begin
  inherited Paint;
end;

end.

