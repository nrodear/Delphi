unit BaseTypes;

interface

uses
  SysUtils, Consts, DateUtils;

var
  pMatrix: Pointer;
  DebugAsTest : Boolean;
type
  TTryGetMatrix = record
  public
    FMatrix: TMatrix;
    FIsValid: Boolean;
  end;

function GetMatrix(Matrix: TMatrix; IsValid: Boolean): TTryGetMatrix;

implementation

function GetMatrix(Matrix: TMatrix; IsValid: Boolean): TTryGetMatrix;
var
  res: TTryGetMatrix;
begin

  res.FMatrix := Matrix;
  res.FIsValid := IsValid;

  result := res;
end;

end.
