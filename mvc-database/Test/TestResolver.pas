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
    procedure TestStart(Index: integer);
    procedure TestSolve(Index: integer);
  end;

implementation

procedure TestTResolver.SetUp;
begin
  FResolver := TResolver.Create();
end;

procedure TestTResolver.TearDown;
begin

end;

procedure TestTResolver.TestSolve(Index: integer);
begin
  FResolver.Start(1);
end;

procedure TestTResolver.TestStart(Index: integer);
begin

end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTResolver.Suite);

end.
