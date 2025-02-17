unit Resolver;

interface

uses
  Validation, BaseTypes, Consts, DateUtils;

type

  TResolver = class

  var
    Validator: TValidation;
  public
    procedure Start(SolveMatrix: TMatrix);
  end;

function Solve(SolveMatrix: TMatrix; Id: Integer): TTryGetMatrix;

implementation

uses
  SysUtils, TimeUtils;

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
  StartTime: TDateTime;

begin
  CurrentId := Id + 1;
  Validator := TValidation.Create;

  Result := GetMatrix(SolveMatrix, True);
  Valid := Validator.ForceCheck(SolveMatrix);

  if Valid then
    Exit;

  Valid := True;
  Matrix := SolveMatrix;

  StartTime := Now;
  if Valid then
  begin

    for CoOrdI := 1 to 9 do
    begin

      for CoOrdJ := 1 to 9 do
      begin

        if not Validator.SimpleCheck(Matrix) then
        begin
          Result := GetMatrix(SolveMatrix, false);
          Duration(StartTime, Now, CurrentId);
          Exit;
        end;

        // exists any Value but 0
        if Matrix[CoOrdI][CoOrdJ] <> NotSet then
        begin
          Continue;
        end;

        // set new Value in coordinate x,y
        for Value := 1 to 9 do
        begin
          // set Value
          Matrix[CoOrdI][CoOrdJ] := Value;
          TryGet := Solve(Matrix, CurrentId);
          if TryGet.FIsValid then
          begin
            Result := GetMatrix(TryGet.FMatrix, True);
            Duration(StartTime, Now, CurrentId);
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
