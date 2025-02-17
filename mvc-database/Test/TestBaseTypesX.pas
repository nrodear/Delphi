unit TestBaseTypesX;

interface

uses
  Resolver, Consts, BaseTypes, System.SysUtils, DateUtils,
  DUnitX.TestFramework, System.Diagnostics;

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

  procedure TestDuration(StartTime, EndTime: TDateTime);

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

procedure TestDuration(StartTime, EndTime: TDateTime);

var
  duationSec : integer;
  Text: String;
begin

  duationSec := SecondsBetween(StartTime, EndTime);
  Text := '       Sec: ' + IntToStr(duationSec) ;
  WriteLn(Text);

end;


initialization

TDUnitX.RegisterTestFixture(TTestBaseTypes);

end.
