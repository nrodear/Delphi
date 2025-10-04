unit uQRShapeDelegate;

interface

uses
  Vcl.Controls, Vcl.Graphics, System.Classes, System.Messaging, QuickRpt,
  QRCtrls;

type
  TQRShapeDelegate = class
  private
    FTarget: TQRPrintable;
    FShape: TQRShape;

  public
    constructor Create(AOwner: TComponent; ATarget: TQRPrintable);
    destructor Destroy; override;

    procedure SyncShape;

    procedure Invalidate;
    procedure Paint;
    procedure Visible(Visible: Boolean) ;
  end;


implementation
constructor TQRShapeDelegate.Create(AOwner: TComponent; ATarget: TQRPrintable);
begin
  FTarget := ATarget;
  FShape := TQRShape.Create(AOwner);
  FShape.Parent := FTarget.Parent;

  FShape.Shape := qrsRectangle;
  FShape.Brush.Style := bsCross;
  FShape.Pen.Color := clRed;
  FShape.Visible:= True;

  ATarget.BringToFront;
  SyncShape;


end;

destructor TQRShapeDelegate.Destroy;
begin
  FShape.Free;
  inherited;
end;

procedure TQRShapeDelegate.Invalidate;
begin
  FShape.Invalidate;
end;

procedure TQRShapeDelegate.SyncShape;
const
  offset= 2;
begin
  FShape.Left := FTarget.Left + 1;
  FShape.Left := FTarget.Left - 1;

  FShape.Left := FTarget.Left - offset;
  FShape.Top := FTarget.Top - offset;
  FShape.Width := FTarget.Width + offset+ 2;
  FShape.Height := FTarget.Height + offset + 2;
end;

procedure TQRShapeDelegate.Paint;
begin
  SyncShape;
  FShape.Repaint;
end;
procedure TQRShapeDelegate.Visible (Visible: Boolean) ;
begin
   FShape.Visible:= Visible;
end;


end.

