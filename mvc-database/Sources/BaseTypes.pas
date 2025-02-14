unit BaseTypes;

interface

uses
  SysUtils, Consts;

type

  TTryGetMatrix = class

  public
    FMatrix: TMatrix;
    FIsValid: Boolean;

    constructor Create(IsValid: Boolean; Matrix: TMatrix)overload;
    constructor Create(Matrix: TMatrix)overload;
    destructor Destroy; override;

  end;

function TryGetMatrixDefault: TTryGetMatrix;

implementation

function TryGetMatrixDefault: TTryGetMatrix;
begin
  result := TTryGetMatrix.Create(False, FMatrixEmpty);
end;

{ TTryGetMatrix }

constructor TTryGetMatrix.Create(IsValid: Boolean; Matrix: TMatrix);
begin

  FIsValid := IsValid;
  FMatrix := Matrix;
end;

constructor TTryGetMatrix.Create(Matrix: TMatrix);
begin
FMatrix := Matrix;
end;

destructor TTryGetMatrix.Destroy;
begin

  inherited;
end;

end.
