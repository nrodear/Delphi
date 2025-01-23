unit Controller;

interface

uses
  System.Generics.Collections, Model;

type
  TAddressController = class
  private
    FPersons: TObjectList<TPerson>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddPerson(const AFirstName, ALastName, ADomicile: string);
    procedure DeletePerson(Index: Integer);
    function GetPerson(Index: Integer): TPerson;
    function Count: Integer;
  end;

implementation

constructor TAddressController.Create;
begin
  FPersons := TObjectList<TPerson>.Create;
end;

destructor TAddressController.Destroy;
begin
  FPersons.Free;
  inherited;
end;

procedure TAddressController.AddPerson(const AFirstName, ALastName, ADomicile: string);
begin
  FPersons.Add(TPerson.Create(AFirstName, ALastName, ADomicile));
end;

procedure TAddressController.DeletePerson(Index: Integer);
begin
  if (Index >= 0) and (Index < FPersons.Count) then
    FPersons.Delete(Index);
end;

function TAddressController.GetPerson(Index: Integer): TPerson;
begin
  if (Index >= 0) and (Index < FPersons.Count) then
    Result := FPersons[Index]
  else
    Result := nil;
end;

function TAddressController.Count: Integer;
begin
  Result := FPersons.Count;
end;

end.

