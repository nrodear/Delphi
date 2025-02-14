unit Validation;

interface

uses
  BaseTypes, Inifiles, SysUtils, Consts, System.Classes;

type
  TValidation = class

  private
    function Check(Matrix: TMatrix; Force: Boolean): Boolean;
  public

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
  i, J: Integer;
  Valid: Boolean;
begin
  Valid := True;
  for i := 1 to 9 do
  begin
    Valid := Valid and CheckLine(Matrix, Row, i, Force) and
      CheckLine(Matrix, Col, i, Force);
    if not Valid then
    begin
      Break;
    end;
  end;

  i := 1;
  J := 1;
  while i <= 9 do
  begin
    while J <= 9 do
    begin
      Valid := Valid and CheckTileSmall(Matrix, i, J, Force);
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
    i := i + 3;
  end;

  Result := Valid;
end;

{ TVatidation }

function TValidation.CheckLine(Matrix: TMatrix; Orientation: TOrientation;
  I: Integer; Force: Boolean): Boolean;

var
  Values: THashedStringList;
  Value: Integer;
  J, Found: Integer;

begin

  // setup hashed list
  Values := THashedStringList.Create; // in Inifiles
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
      Values.Destroy;
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
  Values.Destroy;

end;

function TValidation.CheckTileSmall(Matrix: TMatrix; StartY: Integer;
  StartX: Integer; Force: Boolean): Boolean;

var
  Values: THashedStringList;
  Value: Integer;
  IsSame: Boolean;
  X, Y, CounterItem: Integer;
  Size: Integer;
begin

  // setup hashed list
  Values := THashedStringList.Create; // in Inifiles
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
        Values.Destroy;
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
  Values.Destroy;
  // validate for unique values  vs added
  Result := IsSame;

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
