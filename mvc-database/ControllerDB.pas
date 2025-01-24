unit ControllerDB;

interface

uses
  System.Generics.Collections, Model;

type
  TAddressControllerDB = class
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

constructor TAddressControllerDB.Create;
begin
  FPersons := TObjectList<TPerson>.Create;
end;

destructor TAddressControllerDB.Destroy;
begin
  FPersons.Free;
  inherited;
end;

procedure TAddressControllerDB.AddPerson(const AFirstName, ALastName, ADomicile: string);
begin
  // FPersons.Add(TPerson.Create(AFirstName, ALastName, ADomicile));
end;

procedure TAddressControllerDB.DeletePerson(Index: Integer);
begin
  //  if (Index >= 0) and (Index < FPersons.Count) then
  //    FPersons.Delete(Index);
end;

function TAddressControllerDB.GetPerson(Index: Integer): TPerson;
begin
//
 // if (Index >= 0) and (Index < FPersons.Count) then
 //   Result := FPersons[Index]
 // else
   // Result := nil;
    //
     Result := nil;
end;

function TAddressControllerDB.Count: Integer;
begin
  // Result := FPersons.Count;
   Result := 0;
end;

end.

