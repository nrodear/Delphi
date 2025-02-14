unit TestBaseTypesX;

interface

uses
  DUnitX.TestFramework, Resolver, Consts;

var

  TMatrixxyz: TMatrix = ( // type by
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
  TTestBaseTypes = class
  public
    // Simple single Test
    [Test]
    procedure TestCopy;

  end;

implementation

{ TTestBaseTypes }

procedure TTestBaseTypes.TestCopy;
var
  MatA: TMatrix;
begin
  MatA := TMatrixxyz;
  MatA[1][1] := 8;

  assert.AreNotEqual(MatA[1][1], TMatrixxyz[1][1]);

end;

initialization

TDUnitX.RegisterTestFixture(TTestBaseTypes);

end.
