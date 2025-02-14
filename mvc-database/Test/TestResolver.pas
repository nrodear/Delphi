unit TestResolver;

interface

uses
  TestFramework,
  Resolver, SysUtils;

type
  // Test methods for class TPerson
  TestTResolver = class(TTestCase)
  strict private
    FResolver: TResolver;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  public
    procedure TestStart(Index: Integer);
    procedure TestSolve(Index: Integer);
  end;

implementation

procedure TestTResolver.SetUp;
begin
  FResolver := TResolver.Create;
end;

procedure TestTResolver.TearDown;
begin

end;

procedure TestTResolver.TestSolve(Index: Integer);
begin
  FResolver.Start(1);
end;

procedure TestTResolver.TestStart(Index: Integer);
begin

end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTResolver.Suite);

end.
