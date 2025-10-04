unit Unit1;

interface

uses
  DUnitX.TestFramework, Data.DB, Data.SqlExpr;

type

  [TestFixture]
  TDatabaseTests = class
  private
    FConnection: TSQLConnection;
  public
    [Setup]
    procedure Setup;

    [Teardown]
    procedure Teardown;

    [Test]
    procedure TestDatabaseConnection;

    [Test]
    procedure TestQueryExecution;
  end;

implementation

procedure TDatabaseTests.Setup;
var
  Query: tsqlQuery;
begin

  FConnection := TSQLConnection.Create(nil);
  FConnection.DriverName := 'Sqlite';

  FConnection.Params.Values['Database'] := 'D:\git-demos\delphi\mvc-database\data\datafile.db';
  FConnection.Params.Values['DriverName'] := 'Sqlite';
  FConnection.Params.Values['DriverUnit'] := 'Data.DbxSqlite';

  FConnection.Params.Values['DriverPackageLoader'] := 'TDBXSqliteDriverLoader,DBXSqliteDriver290.bpl';
  FConnection.Params.Values['MetaDataPackageLoader'] := 'TDBXSqliteMetaDataCommandFactory,DbxSqliteDriver290.bpl';

  FConnection.Params.Values['FailIfMissing'] := 'True';

  FConnection.LoginPrompt := False;
  FConnection.Open;

  // Tabelle erstellen und Daten einfügen
  Query := tsqlQuery.Create(nil);
  try
    Query.SQLConnection := FConnection;
    Query.SQL.Text :=
      'CREATE TABLE IF NOT EXISTS TestTable (ID INTEGER PRIMARY KEY, Name TEXT);';
    Query.ExecSQL;

    Query.SQL.Text :=
      'INSERT INTO TestTable (ID, Name) VALUES (1, ''TestName'');';
    Query.ExecSQL;
  finally
    Query.Free;
  end;

end;

procedure TDatabaseTests.Teardown;
begin
  if FConnection <> nil then
    FConnection.Free;
end;

procedure TDatabaseTests.TestDatabaseConnection;
begin
  Assert.IsTrue(FConnection.Connected,
    'Die Datenbankverbindung konnte nicht hergestellt werden.');
end;

procedure TDatabaseTests.TestQueryExecution;
var
  Query: tsqlQuery;
begin
  Query := tsqlQuery.Create(nil);
  try
    Query.SQLConnection := FConnection;
    Query.SQL.Text := 'SELECT * FROM TestTable';
    Query.Open;

    Assert.IsTrue(Query.RecordCount > 0,
      'Die Abfrage hat keine Ergebnisse geliefert.');
  finally
    Query.Free;
  end;
end;

initialization

TDUnitX.RegisterTestFixture(TDatabaseTests);

end.
