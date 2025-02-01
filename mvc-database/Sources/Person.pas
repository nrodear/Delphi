unit Person;

interface

uses
  SysUtils;

type
  TPerson = class
  private
    FID: integer;
    FFirstName: string;
    FLastName: string;
    FDomicile: string;
    constructor Create(Id: integer; AFirstName, ALastName,
      ADomicile: string); overload;
{$HINTS OFF}
    constructor Create(); overload;

  public
    property Id: integer read FID write FID;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Domicile: string read FDomicile write FDomicile;

    class function TryGet(): Boolean;
    class function TryGetNewTPerson(Id: integer;
      AFirstName, ALastName, ADomicile: string; out Person: TPerson): Boolean;
  end;

implementation

constructor TPerson.Create();
begin
  FID := -1;
end;

constructor TPerson.Create(Id: integer;
  AFirstName, ALastName, ADomicile: string);
begin
  FID := Id;
  FFirstName := AFirstName;
  FLastName := ALastName;
  FDomicile := ADomicile;
end;

class function TPerson.TryGetNewTPerson(Id: integer;
  AFirstName, ALastName, ADomicile: string; out Person: TPerson): Boolean;
var
  check: Boolean;
begin
  check := true;
  check := check and (length(AFirstName) = 0);
  check := check and (length(ALastName) = 0);
  check := check and (length(ADomicile) = 0);

  Person := nil;
  if check then
  begin
    Person := TPerson.Create(Id, AFirstName, ALastName, ADomicile);
  end;
  result := check;
end;

class function TPerson.TryGet(): Boolean;
begin
  result := true;
end;

end.
