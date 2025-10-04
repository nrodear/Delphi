program Project1Tests;
{

  Delphi DUnit-Testprojekt
  -------------------------
  Dieses Projekt enthält das DUnit-Test-Framework und die GUI/Konsolen-Test-Runner.
  Fügen Sie den Bedingungen in den Projektoptionen "CONSOLE_TESTRUNNER" hinzu,
  um den Konsolen-Test-Runner zu verwenden.  Ansonsten wird standardmäßig der
  GUI-Test-Runner verwendet.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  SQLiteTest in 'SQLiteTest.pas',
  SQLiteTestMemory in 'SQLiteTestMemory.pas',
  TestBaseTypesX in 'TestBaseTypesX.pas',
  TestOracleDB in 'TestOracleDB.pas',
  TestPerson in 'TestPerson.pas',
  TestResolverX in 'TestResolverX.pas',
  TestTimeUtils in 'TestTimeUtils.pas',
  TestValidationX in 'TestValidationX.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

