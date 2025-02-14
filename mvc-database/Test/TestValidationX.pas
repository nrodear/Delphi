unit TestValidationX;

interface

uses
  DUnitX.TestFramework, Validation, Consts;

var

  FMatrixSimpleTest: TMatrix = ( // type by
    (0, 0, 0, 2, 6, 0, 7, 0, 1), // line 1
    (6, 8, 0, 0, 7, 0, 0, 9, 0), // line 2
    (1, 9, 0, 0, 0, 4, 5, 0, 0), // line 3
    (8, 2, 0, 1, 0, 0, 0, 4, 0), // line 4
    (0, 0, 4, 6, 0, 2, 9, 0, 0), // line 5
    (0, 5, 0, 0, 0, 3, 0, 2, 8), // line 6
    (0, 0, 9, 3, 0, 0, 0, 7, 4), // line 7
    (0, 0, 0, 0, 5, 0, 0, 3, 6), // line 8
    (0, 0, 0, 0, 1, 8, 0, 0, 0)); // line 9

  FMatrixTest: TMatrix = ( // type by
    (1, 2, 3, 2, 6, 2, 7, 0, 1), // line 1
    (4, 5, 6, 0, 7, 0, 0, 9, 0), // line 2
    (7, 8, 9, 0, 0, 4, 5, 0, 0), // line 3
    (8, 2, 0, 1, 0, 0, 0, 4, 0), // line 4
    (0, 0, 4, 6, 0, 2, 9, 0, 0), // line 5
    (0, 5, 0, 0, 0, 3, 0, 2, 8), // line 6
    (0, 0, 9, 3, 0, 0, 0, 7, 4), // line 7
    (0, 0, 0, 0, 5, 0, 0, 3, 6), // line 8
    (0, 0, 0, 0, 1, 8, 0, 0, 0)); // line 9

type

  [TestFixture]
  TMyTestObject = class
  var
    FValidation: TValidation;
  public

    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    procedure Test2;
    [Test]
    procedure TestYLine;
    [Test]
    procedure TestXLine;
    [Test]
    procedure TestFullSuccess;
    [Test]
    procedure TestFullFail;

  end;

implementation

procedure TMyTestObject.Test1;
begin
  Assert.IsTrue(FValidation.CheckTileSmall(FMatrixTest, 1, 1, False));
end;

procedure TMyTestObject.Test2;
begin
  Assert.IsFalse(FValidation.CheckTileSmall(FMatrixTest, 1, 4, False));

end;

procedure TMyTestObject.TestFullSuccess;
begin
  Assert.IsTrue(FValidation.SimpleCheck(FMatrixSimpleTest));
end;

procedure TMyTestObject.TestFullFail;
begin
  Assert.IsFalse(FValidation.SimpleCheck(FMatrixTest));
end;

procedure TMyTestObject.TestYLine;
begin
  Assert.IsTrue(FValidation.CheckLine(FMatrixTest, Col, 1, False),
    'Should successful run because 1..9 values');
end;

procedure TMyTestObject.TestXLine;
begin
  Assert.IsFalse(FValidation.CheckLine(FMatrixTest, Row, 1, False),
    'Should fail because of multiple same numbers');
end;

initialization

TDUnitX.RegisterTestFixture(TMyTestObject);

end.
