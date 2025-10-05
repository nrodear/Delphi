unit uQRHoverRichText;

interface

uses
  System.Classes, System.Messaging, Vcl.Controls,
  QuickRpt, QRCtrls, uQRMouseBehavior,  uHasSnapShotAttribute;

type
  [HasSnapShotAttribute]
  TQRHoverRichText = class(TQRRichText)
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
  RegisterComponents('QuickReport', [TQRHoverRichText]);
end;

constructor TQRHoverRichText.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DoubleBuffered := True;
  name := Self.ClassName;
  FMouseBehavior := TQRMouseBehavior.Create(AOwner,self);
  FMouseBehavior.FResizingDirection:= RDAll;
  AutoSize:= False;
end;

procedure TQRHoverRichText.SetParent(AParent: TWinControl);
begin
  inherited SetParent(AParent); // ganz wichtig: zuerst Basisverhalten ausführen
end;

procedure TQRHoverRichText.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  FMouseBehavior.MouseEnter(Self);
end;

procedure TQRHoverRichText.CMMouseLeave(var Message: TMessage);
begin
  inherited;
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

end.

