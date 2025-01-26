unit Model;

interface

type
  TPerson = class
  private
    FID: integer;
    FFirstName: string;
    FLastName: string;
    FDomicile: string;
  public
    property Id: integer read FID write FID;
    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Domicile: string read FDomicile write FDomicile;
    constructor Create(const id : integer;const  AFirstName, ALastName, ADomicile: string);
  end;

implementation

constructor TPerson.Create(const id : integer; const AFirstName, ALastName, ADomicile: string);
begin
  FID := id;
  FFirstName := AFirstName;
  FLastName := ALastName;
  FDomicile := ADomicile;
end;

end.

