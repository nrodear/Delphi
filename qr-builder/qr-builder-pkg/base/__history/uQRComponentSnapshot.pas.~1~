unit uQRComponentSnapshot;

interface

uses
  XMLDoc, XMLIntf, Classes, QuickRpt, QRPrntr, QRCTRLS, SysUtils, Vcl.Forms,
  uHasSnapShotAttribute, Rtti, TypInfo;

type
  TQRComponentSnapshot = class
    class procedure SaveQuickReportToXML(AForm: TForm; AReport: TQuickRep; AComponentClass: TComponentClass; const FileName: string);
    class procedure ApplyXMLToQuickReport(AReport: TQuickRep; const FileName: string);
  private
    class procedure CollectQRComponentsFromForm(AForm: TForm; AComponentClass: TComponentClass; AReport: TQuickRep; Components: TList); static;
  end;

implementation

class procedure TQRComponentSnapshot.SaveQuickReportToXML(AForm: TForm; AReport: TQuickRep; AComponentClass: TComponentClass; const FileName: string);
var
  XMLDoc: IXMLDocument;
  RootNode, CompNode: IXMLNode;
  i, NewHeight, NewWidth: Integer;
  Comp: TComponent;
  Components: TList;
begin
  Components := TList.Create;
  CollectQRComponentsFromForm(AForm, AComponentClass, AReport, Components);

  XMLDoc := NewXMLDocument;
  XMLDoc.Encoding := 'UTF-8';
  XMLDoc.Options := [doNodeAutoCreate];
  XMLDoc.Active := True;

  RootNode := XMLDoc.AddChild('QuickReportComponents');

  for i := 0 to Components.Count - 1 do
  begin
    Comp := Components[i];
    if Comp is AComponentClass then
    begin
      CompNode := RootNode.AddChild('Component');
      CompNode.Attributes['Name'] := Comp.Name;
      CompNode.Attributes['Class'] := Comp.ClassName;

      CompNode.Attributes['Left'] := TQRPrintable(Comp).Left;
      CompNode.Attributes['Top'] := TQRPrintable(Comp).Top;

      if Comp is TQRCustomBand then
      begin
        CompNode.Attributes['Width'] :=  FormatFloat('0.00', TQRCustomBand(Comp).Size.Width);
        CompNode.Attributes['Height'] := FormatFloat('0.00', TQRCustomBand(Comp).Size.Height);
      end
      else
      begin
        CompNode.Attributes['Width'] := TQRPrintable(Comp).Width;
        CompNode.Attributes['Height'] := TQRPrintable(Comp).Height;
      end;

    end;
  end;

  XMLDoc.SaveToFile(FileName);
end;

class procedure TQRComponentSnapshot.CollectQRComponentsFromForm(AForm: TForm; AComponentClass: TComponentClass; AReport: TQuickRep; Components: TList);
var
  i: Integer;
  Comp: TComponent;
  ctx: TRttiContext;
  rType: TRttiType;
begin
  ctx := TRttiContext.Create;
  try
    for i := 0 to AForm.ComponentCount - 1 do
    begin
      Comp := AForm.Components[i];

      // Prüfen: Ist es die gewünschte Klasse?
      if (Comp is AComponentClass) then
      begin
        rType := ctx.GetType(Comp.ClassType);

        // Hat die Klasse das HoverAttribute?
        if rType.HasAttribute<HasSnapShotAttribute>then
        begin
          Components.Add(Comp);
        end;
      end;
    end;
  finally
    ctx.Free;
  end;
end;

class procedure TQRComponentSnapshot.ApplyXMLToQuickReport(AReport: TQuickRep; const FileName: string);
var
  XMLDoc: IXMLDocument;
  RootNode, CompNode: IXMLNode;
  i: Integer;
  CompClass: TComponentClass;
  ExistingComp, NewComp: TComponent;
  FPersistentClass: TPersistentClass;
begin
  XMLDoc := LoadXMLDocument(FileName);
  RootNode := XMLDoc.DocumentElement;

  for i := 0 to RootNode.ChildNodes.Count - 1 do
  begin
    CompNode := RootNode.ChildNodes[i];

    // Suche nach vorhandener Komponente mit gleichem Namen
    ExistingComp := AReport.Owner.FindComponent(CompNode.Attributes['Name']);
    if Assigned(ExistingComp) then
    begin
      // Komponente existiert – aktualisiere Eigenschaften
      TQRPrintable(ExistingComp).Left := StrToIntDef(CompNode.Attributes['Left'], TQRCustomBand(ExistingComp).Left);
      TQRPrintable(ExistingComp).Top := StrToIntDef(CompNode.Attributes['Top'], TQRCustomBand(ExistingComp).Top);

      if ExistingComp is TQRCustomBand then
      begin
        TQRCustomBand(ExistingComp).Size.Width := StrToFloat(CompNode.Attributes['Width']);
        TQRCustomBand(ExistingComp).Size.Height := StrToFloat(CompNode.Attributes['Height']);
      end
      else
      begin
        TQRPrintable(ExistingComp).Width := StrToIntDef(CompNode.Attributes['Width'], TQRPrintable(ExistingComp).Width);
        TQRPrintable(ExistingComp).Height := StrToIntDef(CompNode.Attributes['Height'], TQRPrintable(ExistingComp).Height);
      end;

    end ;

  end;
end;

end.

