unit Validation;

interface

uses
  BaseTypes, Inifiles, SysUtils, Consts, System.Classes;

type
  TValidation = class

  private
    function Check(matrix: TMatrix; force: Boolean): Boolean;
  public

    function CheckTileSmall(matrix: TMatrix; startY: Integer; startX: Integer;
      force: Boolean): Boolean;
    function CheckLine(matrix: TMatrix; orientation: TOrientation; i: Integer;
      force: Boolean): Boolean;

    function SimpleCheck(matrix: TMatrix): Boolean;
    function ForceCheck(matrix: TMatrix): Boolean;

  end;

implementation

function TValidation.Check(matrix: TMatrix; force: Boolean): Boolean;
var
  i, J: Integer;
  Valid: Boolean;
begin
  Valid := True;
  for i := 1 to 9 do
  begin
    Valid := Valid and CheckLine(matrix, Row, i, force) and
      CheckLine(matrix, Col, i, force);
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
      Valid := Valid and CheckTileSmall(matrix, i, J, force);
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

function TValidation.CheckLine(matrix: TMatrix; orientation: TOrientation;
  i: Integer; force: Boolean): Boolean;

var
  values: THashedStringList;
  value: Integer;
  J, found: Integer;

begin

  // setup hashed list
  values := THashedStringList.Create; // in Inifiles
  found := 0;

  // add to unique int list 1..9
  for J := 1 to 9 do
  begin

    // get default value from col
    value := matrix[J][i];
    if orientation = Row then
    begin
      // get value from row
      value := matrix[i][J];
    end;

    if force and (value = 0) then
    begin
      // validate for unique values  vs added
      Result := false;
      values.Destroy;
      exit;
    end;

    // ignore empty fields
    if not force and (value = 0) then
    begin
      Continue;
    end;

    Inc(found);
    if not values.Contains(IntToStr(value)) then
    begin
      values.add(IntToStr(value));
    end;

  end;
  // validate for unique values  vs added
  Result := values.count = found;
  values.Destroy;

end;

function TValidation.CheckTileSmall(matrix: TMatrix; startY: Integer;
  startX: Integer; force: Boolean): Boolean;

var
  values: THashedStringList;
  value: Integer;
  isSame: Boolean;
  X, Y, add: Integer;
  Size: Integer;
begin

  // setup hashed list
  values := THashedStringList.Create; // in Inifiles
  add := 0;
  // 3x3 tile
  Size := 3;

  for Y := startY to startY + Size - 1 do
  begin
    // add to unique int list 1..9
    for X := startX to startX + Size - 1 do
    begin
      // add to unique int list 1..9
      value := matrix[Y][X];

      if force and (value = 0) then
      begin
        // validate for unique values  vs added
        Result := false;
        values.Destroy;
        exit;
      end;

      // ignore empty fields
      if (value = 0) then
      begin
        Continue;
      end;

      Inc(add);
      if not values.Contains(IntToStr(value)) then
      begin
        values.add(IntToStr(value));
      end;

    end;

  end;

  isSame := values.count = add;
  values.Destroy;
  // validate for unique values  vs added
  Result := isSame;

end;

function TValidation.ForceCheck(matrix: TMatrix): Boolean;
begin
  Result := Check(matrix, True);
end;

function TValidation.SimpleCheck(matrix: TMatrix): Boolean;
begin
  Result := Check(matrix, false);
end;

end.
