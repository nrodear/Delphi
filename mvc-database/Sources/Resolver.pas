unit Resolver;

interface

uses
  SysUtils, Validation, BaseTypes, Consts;

var
  gIdResolver: integer;

type

  TResolver = class

  var
    validator: TValidation;
  public
    IdResolver: integer;
    StartTime: TDateTime;
    constructor Create;
    destructor Destroy; override;
    procedure Start(SolveMatrix: TMatrix);

  end;

function Solve(SolveMatrix: TMatrix; pIdResolver: integer): TTryGetMatrix;

implementation

constructor TResolver.Create;
begin
  IdResolver := gIdResolver;
  Inc(gIdResolver);
end;

destructor TResolver.Destroy;
begin

  inherited;
end;

procedure TResolver.Start(SolveMatrix: TMatrix);
var
  TimeDiff: Double;
  tryGet: TTryGetMatrix;
  Caption: String;
begin
  StartTime := now;
  gIdResolver := 0;
  // check given puzzle
  tryGet := Solve(SolveMatrix, gIdResolver);

  TimeDiff := now - StartTime;
  Caption := FormatDateTime('dd hh:nn:ss', TimeDiff) ;
  writeln('done #' + Caption );

end;

function Solve(SolveMatrix: TMatrix; pIdResolver: integer): TTryGetMatrix;
var
  I, J, Value: integer;
  Valid: Boolean;
  Matrix: TMatrix;
  tryGet: TTryGetMatrix;
  validator: TValidation;
  IdResolver: integer;

begin
  IdResolver := pIdResolver + 1;
  validator := TValidation.Create;
  //writeln('Solve #' + IntToStr(IdResolver));

  if validator.ForceCheck(SolveMatrix) then
  begin
    Result := TTryGetMatrix.Create(True, SolveMatrix);
    exit;
  end;

  Valid := validator.SimpleCheck(SolveMatrix);
  Matrix := SolveMatrix;
  Result := TTryGetMatrix.Create(Valid, SolveMatrix);

  if Valid then
  begin

    for I := 1 to 9 do
    begin

      if not validator.SimpleCheck(Matrix) then
      begin
        Result := TTryGetMatrix.Create(False, SolveMatrix);
        exit;
      end;

      for J := 1 to 9 do
      begin

        if not validator.SimpleCheck(Matrix) then
        begin
          Result := TTryGetMatrix.Create(False, SolveMatrix);
          exit;
        end;

        // exists any value but 0
        if Matrix[I][J] <> NotSet then
          Continue;

        // set new value in coordinate x,y
        for Value := 1 to 9 do
        begin
          // set value
          Matrix[I][J] := Value;
          tryGet := Solve(Matrix, IdResolver);

          if tryGet.FIsValid then
          begin
            Result := TTryGetMatrix.Create(True, tryGet.FMatrix);
            exit;
          end;

        end;
      end;
    end;

    raise Exception.Create('some test');
  end;

  validator.Free;
end;

end.
