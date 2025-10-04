unit uQRHoverDBRichText;

interface

uses
  System.Classes, System.Types, System.Messaging, Vcl.Controls, Vcl.Graphics,
  QuickRpt, QRCtrls, uQRMouseBehavior,uIQRMouseBehavior;

type
  TQRHoverDBRichText = class(TQRDBRichText)
  private
    FMouseBehavior: TQRMouseBehavior;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
  protected
    procedure Paint; override;
    procedure Print(OfsX, OfsY: Integer);

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
  RegisterComponents('QuickReport', [TQRHoverDBRichText]);
end;

constructor TQRHoverDBRichText.Create(AOwner: TComponent);
begin

  inherited Create(AOwner);
  DoubleBuffered := True;
  FMouseBehavior := TQRMouseBehavior.Create(self,self);
  AutoSize := False;
end;

procedure TQRHoverDBRichText.CMMouseEnter(var Message: TMessage);
begin
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverDBRichText.CMMouseLeave(var Message: TMessage);
begin
  FMouseBehavior.MouseLeave(Self);
end;

procedure TQRHoverDBRichText.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseDown(Self, Button, Shift, X, Y);
end;

procedure TQRHoverDBRichText.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseMove(Self, Shift, X, Y);
end;

procedure TQRHoverDBRichText.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  FMouseBehavior.MouseUp(Self);
end;

procedure TQRHoverDBRichText.Paint;
begin
  inherited;
  FMouseBehavior.Paint(Self, Canvas, Width, Height);
end;

procedure TQRHoverDBRichText.Print(OfsX, OfsY: Integer);
begin
    inherited;
  FMouseBehavior.Paint(Self, Canvas, Width, Height);
end;

end.

