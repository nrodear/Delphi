unit Resolver;

interface

uses
  Validation, BaseTypes, Consts;

type

  TResolver = class

  var
    Validator: TValidation;
  private
    Launch: TDateTime;
  public
    procedure Start(SolveMatrix: TMatrix);
  end;

function Solve(SolveMatrix: TMatrix; Id: Integer): TTryGetMatrix;

implementation

uses
  SysUtils;

procedure TResolver.Start(SolveMatrix: TMatrix);
begin
  // check given puzzle
  Solve(SolveMatrix, 1);

end;

function Solve(SolveMatrix: TMatrix; Id: Integer): TTryGetMatrix;
var
  CoOrdI, CoOrdJ, Value: Integer;
  Valid: Boolean;
  Matrix: TMatrix;
  TryGet: TTryGetMatrix;
  Validator: TValidation;
  CurrentId: Integer;

begin
  CurrentId := Id + 1;
  Validator := TValidation.Create;

  if Validator.ForceCheck(SolveMatrix) then
  begin
    Result := TTryGetMatrix.Create(SolveMatrix, True);
    Exit;
  end;

  Valid := Validator.SimpleCheck(SolveMatrix);
  Matrix := SolveMatrix;
  Result := TTryGetMatrix.Create(SolveMatrix, Valid);

  if Valid then
  begin

    for CoOrdI := 1 to 9 do
    begin

      if not Validator.SimpleCheck(Matrix) then
      begin
        Result := TTryGetMatrix.Create(SolveMatrix, False);
        Exit;
      end;

      for CoOrdJ := 1 to 9 do
      begin

        if not Validator.SimpleCheck(Matrix) then
        begin
          Result := TTryGetMatrix.Create(SolveMatrix, False);
          Exit;
        end;

        // exists any Value but 0
        if Matrix[CoOrdI][CoOrdJ] <> NotSet then
          Continue;

        // set new Value in coordinate x,y
        for Value := 1 to 9 do
        begin
          // set Value
          Matrix[CoOrdI][CoOrdJ] := Value;
          TryGet := Solve(Matrix, CurrentId);

          if TryGet.FIsValid then
          begin
            Result := TTryGetMatrix.Create(TryGet.FMatrix, True);
            Exit;
          end;

        end;
      end;
    end;

    raise Exception.Create('some test');
  end;

  Validator.Free;
end;

end.
