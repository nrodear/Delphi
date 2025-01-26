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
    procedure Add(const AFirstName, ALastName, ADomicile: string);
    procedure Delete(Index: Integer);
    function Get(Index: Integer): TPerson;
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

procedure TAddressController.Add(const AFirstName, ALastName,
  ADomicile: string);
begin
  FPersons.Add(TPerson.Create(-2,AFirstName, ALastName, ADomicile));
end;

procedure TAddressController.Delete(Index: Integer);
begin
  if (Index >= 0) and (Index < FPersons.Count) then
    FPersons.Delete(Index);
end;

function TAddressController.Get(Index: Integer): TPerson;
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
