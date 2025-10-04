unit BelegeLoadTest;

interface

uses
  // SQLDb, SQLite3Conn,
  BelegeUnit, BelegUnit,
  DUnitX.TestFramework, Data.SqlExpr, SysUtils;

type

  [TestFixture]
  TBelegeLoadTest = class
  private
    FConnection: TSQLConnection;
    FBelege: TBelege;
    procedure InsertTestData;
  public
    [Setup]
    procedure Setup;

    [Test]
    procedure TestBelegeLaden;

    [Test]
    procedure TestErsterBelegDaten;
  end;

implementation

procedure TBelegeLoadTest.Setup;
begin

  FConnection := TSQLConnection.Create(nil);
  FConnection.DriverName := 'Sqlite';
  FConnection.Connected := True;

  // Testdatenbank mit 6 Belegen füllen
  InsertTestData;

  // Instanz der Belege-Klasse erstellen und Datenbank setzen
  FBelege := TBelege.Create;
  FBelege.SetDBConnection(FConnection);
  // Diese Methode sollte die Datenbankverbindung setzen

  // Belege aus der Datenbank laden
  FBelege.LoadFromDB;
end;

procedure TBelegeLoadTest.InsertTestData;
var
  SQLQuery: TSQLQuery;
begin
  SQLQuery := TSQLQuery.Create(nil);
  try
    SQLQuery.SQLConnection := FConnection;

    SQLQuery.SQL.Text := 'DELETE FROM Belege'; // Vorherige Daten löschen
    SQLQuery.ExecSQL;

    SQLQuery.SQL.Text := 'INSERT INTO Belege (Datum, Betrag) VALUES ' +
      '("2025-05-01", 100.50), ' + '("2025-05-02", 250.75), ' +
      '("2025-05-03", 85.20), ' + '("2025-05-04", 140.00), ' +
      '("2025-05-05", 310.90), ' + '("2025-05-06", 500.25)';
    SQLQuery.ExecSQL;
  finally
    SQLQuery.Free;
  end;
end;

procedure TBelegeLoadTest.TestBelegeLaden;
begin
  Assert.AreEqual(6, FBelege.GetBelege.Count,
    'Es wurden nicht alle Belege geladen.');
end;

procedure TBelegeLoadTest.TestErsterBelegDaten;
var
  Beleg: TBeleg;
begin
  Beleg := FBelege.GetBelege[0]; // Ersten Beleg abrufen
  Assert.AreEqual(StrToDate('2025-05-01'), Beleg.Datum,
    'Das Datum des ersten Belegs ist falsch.');
end;

initialization

// use db later
// TDUnitX.RegisterTestFixture(TBelegeLoadTest);

end.
