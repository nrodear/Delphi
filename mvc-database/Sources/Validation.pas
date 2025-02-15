unit Validation;

interface

uses
  BaseTypes, Inifiles, SysUtils, Consts, System.Classes;

type
  TValidation = class

  var
    Values: THashedStringList;
  private
    function Check(Matrix: TMatrix; Force: Boolean): Boolean;
  public
    constructor Create;
    destructor Destroy;
    function CheckTileSmall(Matrix: TMatrix; StartY: Integer; StartX: Integer;
      Force: Boolean): Boolean;
    function CheckLine(Matrix: TMatrix; Orientation: TOrientation; I: Integer;
      Force: Boolean): Boolean;

    function SimpleCheck(Matrix: TMatrix): Boolean;
    function ForceCheck(Matrix: TMatrix): Boolean;

  end;

implementation

function TValidation.Check(Matrix: TMatrix; Force: Boolean): Boolean;
var
  I, J: Integer;
  Valid: Boolean;
begin
  Valid := True;
  for I := 1 to 9 do
  begin
    Valid := Valid and CheckLine(Matrix, Row, I, Force) and
      CheckLine(Matrix, Col, I, Force);
    if not Valid then
    begin
      Break;
    end;
  end;

  I := 1;
  J := 1;
  while I <= 9 do
  begin
    while J <= 9 do
    begin
      Valid := Valid and CheckTileSmall(Matrix, I, J, Force);
      if (not Valid) then
      begin
        Break;
      end;
      J := J + 3;
    end;
    if (not Valid) then
    begin
      Break;
    end;
    I := I + 3;
  end;

  Result := Valid;
end;

{ TVatidation }

function TValidation.CheckLine(Matrix: TMatrix; Orientation: TOrientation;
  I: Integer; Force: Boolean): Boolean;

var
  Value: Integer;
  J, Found: Integer;

begin

  // setup hashed list
  Values.Clear;
  Found := 0;

  // add to unique int list 1..9
  for J := 1 to 9 do
  begin

    // get default Value from col
    Value := Matrix[J][I];
    if Orientation = Row then
    begin
      // get Value from row
      Value := Matrix[I][J];
    end;

    if Force and (Value = 0) then
    begin
      // validate for unique values  vs added
      Result := False;
      Exit;
    end;

    // ignore empty fields
    if not Force and (Value = 0) then
    begin
      Continue;
    end;

    Inc(Found);
    if not Values.Contains(IntToStr(Value)) then
    begin
      Values.add(IntToStr(Value));
    end;

  end;
  // validate for unique values  vs added
  Result := Values.count = Found;

end;

function TValidation.CheckTileSmall(Matrix: TMatrix; StartY: Integer;
  StartX: Integer; Force: Boolean): Boolean;
var
  Value: Integer;
  IsSame: Boolean;
  X, Y, CounterItem: Integer;
  Size: Integer;
begin

  // setup hashed list
  Values.Clear;

  CounterItem := 0;
  // 3x3 tile
  Size := 3;

  for Y := StartY to StartY + Size - 1 do
  begin
    // add to unique int list 1..9
    for X := StartX to StartX + Size - 1 do
    begin
      // add to unique int list 1..9
      Value := Matrix[Y][X];

      if Force and (Value = 0) then
      begin
        // validate for unique values  vs added
        Result := False;
        Exit;
      end;

      // ignore empty fields
      if (Value = 0) then
      begin
        Continue;
      end;

      Inc(CounterItem);
      if not Values.Contains(IntToStr(Value)) then
      begin
        Values.add(IntToStr(Value));
      end;

    end;

  end;

  IsSame := Values.count = CounterItem;

  // validate for unique values  vs added
  Result := IsSame;

end;

constructor TValidation.Create;
begin
  Values := THashedStringList.Create();
end;

destructor TValidation.Destroy;
begin
  Values.Destroy;
  inherited;
end;

function TValidation.ForceCheck(Matrix: TMatrix): Boolean;
begin
  Result := Check(Matrix, True);
end;

function TValidation.SimpleCheck(Matrix: TMatrix): Boolean;
begin
  Result := Check(Matrix, False);
end;

end.
