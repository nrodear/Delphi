unit ControllerDB;

interface

uses
  System.Generics.Collections, Model,SingletonDB,
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Comp.Client,
  FireDACSample;

type
  TPersonControllerDB = class
  private
    FDQuery: TFDQuery;
    FPersons: TObjectList<TPerson>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AFirstName, ALastName, ADomicile: string);
    procedure Delete(Index: integer);
    function Get(Index: integer): TPerson;
    function Count: integer;
  end;

implementation

constructor TPersonControllerDB.Create;
begin
  FPersons := TObjectList<TPerson>.Create;
end;

destructor TPersonControllerDB.Destroy;
begin
  FPersons.Free;
  inherited;
end;

procedure TPersonControllerDB.Add(const AFirstName, ALastName,
  ADomicile: string);
begin
  // FPersons.Add(TPerson.Create(AFirstName, ALastName, ADomicile));
end;

procedure TPersonControllerDB.Delete(Index: integer);
begin
  // if (Index >= 0) and (Index < FPersons.Count) then
  // FPersons.Delete(Index);
end;

function TPersonControllerDB.Get(Index: integer): TPerson;
var
  query: String;
  person: TPerson;
  name: string;
  lastname: string;
  domicile: string;

begin

  SQLiteExample;

  query := 'SELECT * FROM person WHERE id = :Params0 ORDER BY id';

  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := Singleton.GetConnection;
  FDQuery.SQL.Text := query;
  FDQuery.ParamByName('Params0').AsInteger := Index;

  FDQuery.Open;

  if (not FDQuery.eof) then
  begin
    name := FDQuery.FieldByName('firstname').AsString;
    lastname := FDQuery.FieldByName('lastname').AsString;
    domicile := FDQuery.FieldByName('domicile').AsString;

    person := TPerson.Create(-1, name, lastname, domicile)

  end;
  Result := person;
end;

function TPersonControllerDB.Count: integer;
begin
  // Result := FPersons.Count;
  Result := 0;
end;

end.
