unit FireDACSample;

interface

uses
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Comp.Client;

procedure SQLiteExample;

implementation

procedure SQLiteExample;
var
  FDConnection: TFDConnection;
  FDQuery: TFDQuery;
begin
  // Verbindung erstellen
  FDConnection := TFDConnection.Create(nil);
  FDQuery := TFDQuery.Create(nil);
  try
    // Verbindung konfigurieren
    FDConnection.DriverName := 'SQLite';
    FDConnection.Params.Database := 'example.db'; // Pfad zur SQLite-Datenbank
    FDConnection.Params.Add('LockingMode=Normal');
    // Optional: Konfiguration für SQLite
    FDConnection.LoginPrompt := False; // Keine Login-Abfrage
    FDConnection.Connected := True;

    // Tabelle erstellen
    FDQuery.Connection := FDConnection;
    FDQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS Users (' +
      'ID INTEGER PRIMARY KEY AUTOINCREMENT, ' + 'Name TEXT NOT NULL, ' +
      'Age INTEGER)';
    FDQuery.ExecSQL;

    // Daten einfügen
    FDQuery.SQL.Text := 'INSERT INTO Users (Name, Age) VALUES (:Name, :Age)';
    FDQuery.ParamByName('Name').AsString := 'John Doe';
    FDQuery.ParamByName('Age').AsInteger := 30;
    FDQuery.ExecSQL;

    // Daten abfragen
    FDQuery.SQL.Text := 'SELECT * FROM Users';
    FDQuery.Open;

    // Ergebnisse anzeigen
    while not FDQuery.Eof do
    begin
      WriteLn(Format('ID: %d, Name: %s, Age: %d',
        [FDQuery.FieldByName('ID').AsInteger, FDQuery.FieldByName('Name')
        .AsString, FDQuery.FieldByName('Age').AsInteger]));
      FDQuery.Next;
    end;

  finally
    FDQuery.Free;
    FDConnection.Free;
  end;
end;

end.
