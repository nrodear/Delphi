unit uQRComponentSnapshot;

interface

uses
  XMLDoc, XMLIntf, Classes, QuickRpt, QRPrntr, QRCTRLS, SysUtils, Vcl.Forms,
  uHasSnapShotAttribute, Rtti, TypInfo;

type
  TQRComponentSnapshot = class
    class procedure SaveQuickReportToXML(AForm: TForm; AReport: TQuickRep; AComponentClass: TComponentClass; const FileName: string; ASnapshotType: TSnapshotType);
    class procedure ApplyXMLToQuickReport(AReport: TQuickRep; const FileName: string; ASnapshotType: TSnapshotType);
  private
    class procedure CollectQRComponentsFromForm(AForm: TForm; AComponentClass: TComponentClass; AReport: TQuickRep; Components: TList); static;
    class procedure ApplyComponentNodes(AReport: TQuickRep; SnapshotNode: IXMLNode); static;
    class procedure AddComponentsToNode(AComponentList: TList; AComponentClass: TComponentClass; AParentNode: IXMLNode); static;
  end;

implementation

class procedure TQRComponentSnapshot.SaveQuickReportToXML(AForm: TForm; AReport: TQuickRep; AComponentClass: TComponentClass; const FileName: string; ASnapshotType: TSnapshotType);
var
  XMLDoc: IXMLDocument;
  RootNode, CompNameNode, CompNode: IXMLNode;
  i: Integer;
  Comp: TComponent;
  Components: TList;
  SnapshotTypeStr: string;
  Found: Boolean;
begin
  Components := TList.Create;
  try
    CollectQRComponentsFromForm(AForm, AComponentClass, AReport, Components);

    // SnapshotType als String
    SnapshotTypeStr := TSnapshotEnums.GetNameByType(ASnapshotType);

    // XML laden oder neu erstellen
    if FileExists(FileName) then
      XMLDoc := LoadXMLDocument(FileName)
    else
      XMLDoc := NewXMLDocument;

    XMLDoc.Encoding := 'UTF-8';
    XMLDoc.Options := [doNodeAutoCreate];
    XMLDoc.Active := True;

    // RootNode sicherstellen
    if Assigned(XMLDoc.DocumentElement) then
      RootNode := XMLDoc.DocumentElement
    else
      RootNode := XMLDoc.AddChild('QuickReportComponents');

    // Prüfen, ob SnapshotType bereits existiert
    Found := False;
    for i := 0 to RootNode.ChildNodes.Count - 1 do
    begin
      if SameText(RootNode.ChildNodes[i].Attributes['SnapshotType'], SnapshotTypeStr) then
      begin
        CompNameNode := RootNode.ChildNodes[i];
        Found := True;

         // Alte Komponenten entfernen
        for var j := CompNameNode.ChildNodes.Count - 1 downto 0 do
        begin
          if SameText(CompNameNode.ChildNodes[j].NodeName, 'Component') then
            CompNameNode.ChildNodes.Delete(j);
        end;

        Break;
      end;
    end;

    // Falls nicht vorhanden, neu anlegen
    if not Found then
    begin
      CompNameNode := RootNode.AddChild('ComponentName');
      CompNameNode.Attributes['SnapshotType'] := SnapshotTypeStr;
    end;

    AddComponentsToNode(Components, AComponentClass, CompNameNode);

    // Speichern
    XMLDoc.SaveToFile(FileName);
  finally
    Components.Free;
  end;
end;

class procedure TQRComponentSnapshot.AddComponentsToNode(AComponentList: TList; AComponentClass: TComponentClass; AParentNode: IXMLNode);
var
  i: Integer;
  Comp: TComponent;
  CompNode: IXMLNode;
begin
  for i := 0 to AComponentList.Count - 1 do
  begin
    Comp := AComponentList[i];
    if Comp is AComponentClass then
    begin
      CompNode := AParentNode.AddChild('Component');

      CompNode.Attributes['Name'] := Comp.Name;
      CompNode.Attributes['Class'] := Comp.ClassName;
      CompNode.Attributes['Left'] := TQRPrintable(Comp).Left;
      CompNode.Attributes['Top'] := TQRPrintable(Comp).Top;

      if Comp is TQRCustomBand then
      begin
        CompNode.Attributes['Width'] := FormatFloat('0.00', TQRCustomBand(Comp).Size.Width);
        CompNode.Attributes['Height'] := FormatFloat('0.00', TQRCustomBand(Comp).Size.Height);
      end
      else
      begin
        CompNode.Attributes['Width'] := TQRPrintable(Comp).Width;
        CompNode.Attributes['Height'] := TQRPrintable(Comp).Height;
      end;
    end;
  end;
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

class procedure TQRComponentSnapshot.ApplyXMLToQuickReport(AReport: TQuickRep; const FileName: string; ASnapshotType: TSnapshotType);
var
  XMLDoc: IXMLDocument;
  RootNode, SnapshotNode: IXMLNode;
  i: Integer;
  SnapshotTypeStr: string;
begin
  if not FileExists(FileName) then
    Exit;

  XMLDoc := LoadXMLDocument(FileName);
  RootNode := XMLDoc.DocumentElement;

  SnapshotTypeStr := SnapshotTypeNames[ASnapshotType];

  // Suche nach dem passenden SnapshotType-Knoten
  for i := 0 to RootNode.ChildNodes.Count - 1 do
  begin
    SnapshotNode := RootNode.ChildNodes[i];
    if SameText(SnapshotNode.Attributes['SnapshotType'], SnapshotTypeStr) then
    begin
      // Subfunktion aufrufen
      ApplyComponentNodes(AReport, SnapshotNode);
      Break
    end;
  end;
end;

class procedure TQRComponentSnapshot.ApplyComponentNodes(AReport: TQuickRep; SnapshotNode: IXMLNode);
var
  j: Integer;
  CompNode: IXMLNode;
  ExistingComp: TComponent;
begin
  for j := 0 to SnapshotNode.ChildNodes.Count - 1 do
  begin
    CompNode := SnapshotNode.ChildNodes[j];

    ExistingComp := AReport.Owner.FindComponent(CompNode.Attributes['Name']);
    if Assigned(ExistingComp) then
    begin
      TQRPrintable(ExistingComp).Left := StrToIntDef(CompNode.Attributes['Left'], TQRPrintable(ExistingComp).Left);
      TQRPrintable(ExistingComp).Top := StrToIntDef(CompNode.Attributes['Top'], TQRPrintable(ExistingComp).Top);

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
    end;
  end;
end;

end.

