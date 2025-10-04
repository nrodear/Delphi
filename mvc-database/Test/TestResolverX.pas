unit TestResolverX;

interface

uses
  DUnitX.TestFramework, Resolver, Consts, System.SysUtils, DateUtils;

var
  FMatrixSimpleTest: TMatrix = ( // type by
    (3, 4, 0, 2, 6, 0, 7, 0, 1), // line 1
    (6, 8, 0, 0, 7, 0, 0, 9, 0), // line 2
    (1, 9, 0, 0, 0, 4, 5, 0, 0), // line 3
    (8, 2, 0, 1, 0, 0, 0, 4, 0), // line 4
    (0, 0, 4, 6, 0, 2, 9, 0, 0), // line 5
    (0, 5, 0, 0, 0, 3, 0, 2, 8), // line 6
    (0, 0, 9, 3, 0, 0, 0, 7, 4), // line 7
    (0, 0, 0, 0, 5, 0, 0, 3, 6), // line 8
    (0, 0, 0, 0, 1, 8, 0, 0, 0)); // line 9

type

  [TestFixture]
  TTestResolver = class
  var
    FResolver: TResolver;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Simple single Test
    [Test]
    procedure TestSimpleResolve;
  end;

implementation

uses
  TestBaseTypesX;

{ TTestResolver }

procedure TTestResolver.Setup;
begin
  DebugAsTest := False;
  FResolver := TResolver.Create;
end;

procedure TTestResolver.TearDown;
begin
  FResolver.Destroy;
end;

procedure TTestResolver.TestSimpleResolve;
var
  StartTime: TDateTime;
begin
  StartTime := Now;
  FResolver.Start(FMatrixSimple);
  TestDuration(StartTime, Now);
end;

initialization

TDUnitX.RegisterTestFixture(TTestResolver);

end.
