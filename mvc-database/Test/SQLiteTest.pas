unit SqliteTest;

interface

uses
  DUnitX.TestFramework, Data.SqlExpr, Data.DbxSqlite, System.SysUtils;

type
  [TestFixture]
  TSqliteDUnitTest = class
  private
    FConnection: TSQLConnection;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestSqliteConnection;
  end;

implementation

procedure TSqliteDUnitTest.Setup;
begin
  // TSQLConnection konfigurieren
  FConnection := TSQLConnection.Create(nil);
  FConnection.ConnectionName := 'Sqlite3AppConnection'; // Der Name aus der DBXConnection.ini
   FConnection.DriverName := 'Sqlite';
  FConnection.LoadParamsFromIniFile('C:\Users\Public\Documents\Embarcadero\Studio\dbExpress\23.0\dbxconnections.ini') ;
  FConnection.LoginPrompt := False;


  // Verbindung öffnen
  FConnection.Open;

  Assert.IsTrue(FConnection.Connected, 'Die Verbindung zur Sqlite-Datenbank sollte geöffnet sein.');
end;

procedure TSqliteDUnitTest.TearDown;
begin
  // Ressourcen freigeben
  FConnection.Free;
end;

procedure TSqliteDUnitTest.TestSqliteConnection;
begin
  // Überprüfung der Verbindung
  Assert.IsTrue(FConnection.Connected, 'Die Verbindung zur Sqlite-Datenbank sollte geöffnet sein.');
end;

initialization
  TDUnitX.RegisterTestFixture(TSqliteDUnitTest);

end.

