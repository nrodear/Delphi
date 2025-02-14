unit BaseTypes;

interface

uses
  SysUtils, Consts;

type

  TTryGetMatrix = class

  public
    FMatrix: TMatrix;
    FIsValid: Boolean;

    constructor Create(Matrix: TMatrix; IsValid: Boolean)overload;
    constructor Create(Matrix: TMatrix)overload;

  end;

function TryGetMatrixDefault: TTryGetMatrix;

implementation

function TryGetMatrixDefault: TTryGetMatrix;
begin
  result := TTryGetMatrix.Create(FMatrixEmpty, False);
end;

constructor TTryGetMatrix.Create(Matrix: TMatrix; IsValid: Boolean);
begin
  FIsValid := IsValid;
  FMatrix := Matrix;
end;

constructor TTryGetMatrix.Create(Matrix: TMatrix);
begin
  FMatrix := Matrix;
end;

end.
