program Project3Tests;
{

  Delphi DUnit-Testprojekt
  -------------------------
  Dieses Projekt enth�lt das DUnit-Test-Framework und die GUI/Konsolen-Test-Runner.
  F�gen Sie den Bedingungen in den Projektoptionen "CONSOLE_TESTRUNNER" hinzu,
  um den Konsolen-Test-Runner zu verwenden.  Ansonsten wird standardm��ig der
  GUI-Test-Runner verwendet.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestPerson in 'TestPerson.pas',
  TestResolver in 'TestResolver.pas',
  Person in '..\Sources\Person.pas',
  Resolver in '..\Sources\Resolver.pas',
  TestValidation in 'TestValidation.pas',
  Validation in '..\Sources\Validation.pas',
  BaseTypes in '..\Sources\BaseTypes.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

