unit Person;

interface

uses
  SysUtils;

type
  TPerson = class
  private
    FID2: Integer;
    FID: Integer;
    FFirstName: string;
    FLastName: string;
    FDomicile: string;
    constructor Create(Id: Integer; AFirstName, ALastName,
      ADomicile: string); overload;
    constructor Create; overload;

  public
    property Id: Integer read FID write FID;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Domicile: string read FDomicile write FDomicile;

    class function TryGet: Boolean;
    class function TryGetNewTPerson(Id: Integer;
      AFirstName, ALastName, ADomicile: string; out Person: TPerson): Boolean;
  end;

implementation

constructor TPerson.Create;
begin
  FID := -1;
end;

constructor TPerson.Create(Id: Integer;
  AFirstName, ALastName, ADomicile: string);
begin
  FID := Id;
  FFirstName := AFirstName;
  FLastName := ALastName;
  FDomicile := ADomicile;
end;

class function TPerson.TryGetNewTPerson(Id: Integer;
  AFirstName, ALastName, ADomicile: string; out Person: TPerson): Boolean;
var
  check: Boolean;
begin
  check := True;
  check := check and (Length(AFirstName) = 0);
  check := check and (Length(ALastName) = 0);
  check := check and (Length(ADomicile) = 0);

  Person := nil;
  if check then
  begin
    Person := TPerson.Create(Id, AFirstName, ALastName, ADomicile);
  end;
  Result := check;
end;

class function TPerson.TryGet: Boolean;
begin
  Result := True;
end;

end.
