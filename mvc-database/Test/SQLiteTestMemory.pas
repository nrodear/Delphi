unit SQLiteTestMemory;

interface

uses
  DUnitX.TestFramework, Data.SqlExpr, Data.DbxSqlite, Data.DB;

type

  [TestFixture]
  TSQLiteTest = class
  private
    FConnection: TSQLConnection;
    FQuery: TSQLQuery;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestSQLiteQueryExecution;
  end;

implementation

procedure TSQLiteTest.Setup;
begin
  // TSQLConnection für SQLite konfigurieren
  FConnection := TSQLConnection.Create(nil);
  FConnection.DriverName := 'SQLite';
  FConnection.Params.Values['VendorLib'] := 'sqlite3.dll';
  FConnection.Params.Values['Database'] := ':memory:'; // In-Memory-Datenbank

  FQuery := TSQLQuery.Create(nil);
  FQuery.SQLConnection := FConnection;

  // Verbindung öffnen und Datenbank initialisieren
  FConnection.Open;

  FQuery.SQL.Text := 'CREATE TABLE test (id INTEGER PRIMARY KEY, name TEXT);';
  FQuery.ExecSQL;

  FQuery.SQL.Text := 'INSERT INTO test (id, name) VALUES (1, ''TestName'');';
  FQuery.ExecSQL;
end;

procedure TSQLiteTest.TearDown;
begin
  // Ressourcen freigeben
  FQuery.Free;
  FConnection.Free;
end;

procedure TSQLiteTest.TestSQLiteQueryExecution;
begin
  // Test-Abfrage ausführen
  FQuery.SQL.Text := 'SELECT name FROM test WHERE id = 1;';
  FQuery.Open;

  Assert.AreEqual('TestName', FQuery.FieldByName('name').AsString,
    'Der Name sollte "TestName" sein.');
end;

initialization

TDUnitX.RegisterTestFixture(TSQLiteTest);

end.
