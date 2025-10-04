unit TestOracleDB;

interface

uses
  DUnitX.TestFramework, Data.SqlExpr, System.SysUtils;

type
  [TestFixture]
  TOracleDBTest = class
  private
    FSQLConnection: TSQLConnection;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestInsertAndQuery;
  end;

implementation

procedure TOracleDBTest.Setup;
begin
  FSQLConnection := TSQLConnection.Create(nil);
  FSQLConnection.DriverName := 'Oracle'; // Oracle-Treiber
  FSQLConnection.Params.Values['Database'] := 'TestDB'; // Name der Datei-basierten Datenbank
  FSQLConnection.Params.Values['User_Name'] := 'test_user';
  FSQLConnection.Params.Values['Password'] := 'test_password';
  FSQLConnection.Params.Values['HostName'] := 'localhost';
  FSQLConnection.Open;

  // Test-Tabelle erstellen
  FSQLConnection.ExecuteDirect('CREATE TABLE TestTable (ID NUMBER PRIMARY KEY, Name VARCHAR2(50))');
end;

procedure TOracleDBTest.TearDown;
begin
  FSQLConnection.ExecuteDirect('DROP TABLE TestTable');
  FSQLConnection.Close;
  FSQLConnection.Free;
end;

procedure TOracleDBTest.TestInsertAndQuery;
var
  Query: TSQLQuery;
begin
  Query := TSQLQuery.Create(nil);
  try
    Query.SQLConnection := FSQLConnection;

    // Datensatz einfügen
    Query.SQL.Text := 'INSERT INTO TestTable (ID, Name) VALUES (1, ''TestName'')';
    Query.ExecSQL;

    // Datensatz abfragen
    Query.SQL.Text := 'SELECT Name FROM TestTable WHERE ID = 1';
    Query.Open;
    Assert.AreEqual('TestName', Query.FieldByName('Name').AsString, 'Datensatz wurde nicht korrekt eingefügt!');
  finally
    Query.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TOracleDBTest);

end.

