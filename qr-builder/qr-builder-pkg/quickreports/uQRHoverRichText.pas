unit uQRHoverRichText;

interface

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, uQRMouseBehavior;

type
  TQRHoverRichText = class(TQRRichEdit)
  private
    FMouseBehavior: TQRMouseBehavior;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint;
    procedure Print(OfsX, OfsY: Integer);

  public
    constructor Create(AOwner: TComponent); override;
  end;

   procedure Register;
implementation

procedure Register;
begin
  RegisterComponents('QuickReport', [TQRHoverRichText]);
end;

constructor TQRHoverRichText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DoubleBuffered := True;

  FMouseBehavior := TQRMouseBehavior.Create(self);
  AutoSize:= False;
end;

procedure TQRHoverRichText.CMMouseEnter(var Message: TMessage);
begin
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverRichText.CMMouseLeave(var Message: TMessage);
begin
  FMouseBehavior.MouseLeave(Self);
end;

procedure TQRHoverRichText.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseDown(Self, Button, Shift, X, Y);
end;

procedure TQRHoverRichText.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseMove(Self, Shift, X, Y);
end;

procedure TQRHoverRichText.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseUp(Self);
end;

procedure TQRHoverRichText.Paint;
begin
  inherited;
  FMouseBehavior.Paint(Self, nil, Width, Height);
end;

procedure TQRHoverRichText.Print(OfsX, OfsY: Integer);
begin
  FMouseBehavior.Paint(Self, nil, Width, Height);
end;

end.

