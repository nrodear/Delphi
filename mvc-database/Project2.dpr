program Project2;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}
{$STRONGLINKTYPES ON}

uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ELSE}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  {$ENDIF }
  DUnitX.TestFramework,
  BaseTypes in 'Sources\BaseTypes.pas',
  Consts in 'Sources\Consts.pas',
  Validation in 'Sources\Validation.pas',
  Resolver in 'Sources\Resolver.pas',
  TestBaseTypesX in 'Test\TestBaseTypesX.pas',
  TestValidationX in 'Test\TestValidationX.pas',
  TestResolverX in 'Test\TestResolverX.pas',
  TimeUtils in 'Sources\TimeUtils.pas';

{ keep comment here to protect the following conditional from being removed by the IDE when adding a unit }
{$IFNDEF TESTINSIGHT}

var
  stopOnFailCL: Boolean;
  runner: ITestRunner;
  results: IRunResults;
  logger: ITestLogger;
  nunitLogger: ITestLogger;
{$ENDIF}

begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
{$ELSE}
  try
    // Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    // Create the test runner
    runner := TDUnitX.CreateRunner;
    // Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    // When true, Assertions must be made during tests;
    runner.FailsOnNoAsserts := False;

    // tell the runner how we will log things
    // Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      logger := TDUnitXConsoleLogger.Create
        (TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      runner.AddLogger(logger);
    end;
    // Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create
      (TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);

    // Run tests
    results := runner.Execute;
    stopOnFailCL := True; //  not results.AllPassed;

{$IFNDEF CI}
    // We don't want this happening when running under CI.
    if stopOnFailCL or (TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause)
    then
    begin

      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;

{$ENDIF}
  except
    on E: Exception do
      System.WriteLn(E.ClassName, ': ', E.Message);
  end;
{$ENDIF}

end.
