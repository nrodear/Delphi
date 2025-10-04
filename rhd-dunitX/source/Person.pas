unit Person;



interface

type
  TPerson = class
  private
    FName: string;
    FAge: Integer;
  public
    constructor Create; overload;
    constructor Create(const AName: string; AAge: Integer); overload;

    function GetName: string;
    procedure SetName(const AName: string);

    function GetAge: Integer;
    procedure SetAge(AAge: Integer);

    property Name: string read GetName write SetName;
    property Age: Integer read GetAge write SetAge;
  end;

implementation

constructor TPerson.Create;
begin
  inherited Create;
  FName := '';
  FAge := 0;
end;

constructor TPerson.Create(const AName: string; AAge: Integer);
begin
  inherited Create;
  FName := AName;
  FAge := AAge;
end;

function TPerson.GetName: string;
begin
  Result := FName;
end;

procedure TPerson.SetName(const AName: string);
begin
  FName := AName;
end;

function TPerson.GetAge: Integer;
begin
  Result := FAge;
end;

procedure TPerson.SetAge(AAge: Integer);
begin
  FAge := AAge;
end;

end.

