unit ControllerDB;

interface

uses
  System.Generics.Collections,
  Person,
  SingletonDB,
  System.SysUtils,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI,
  FireDAC.Comp.UI,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Param,
  FireDAC.Phys,
  FireDAC.Stan.Async,
  FireDAC.Phys.SQLite,
  FireDAC.Comp.Client;

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
    function TryGet(Index: integer; person: TPerson): Boolean;
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

function TPersonControllerDB.TryGet(Index: integer; person: TPerson): Boolean;
var
  query: String;
  name: string;
  lastname: string;
  domicile: string;
  Success: Boolean;
begin

  query := 'SELECT * FROM person WHERE id = :Params0 ORDER BY id';

  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := Singleton.GetConnection;
  FDQuery.SQL.Text := query;
  FDQuery.ParamByName('Params0').AsInteger := Index;

  Success := False;
  FDQuery.Open;
  if (not FDQuery.eof) then
  begin
    name := FDQuery.FieldByName('firstname').AsString;
    lastname := FDQuery.FieldByName('lastname').AsString;
    domicile := FDQuery.FieldByName('domicile').AsString;

    Success := TPerson.TryGetNewTPerson(-1, name, lastname, domicile, person);
  end;
  Result := Success;
end;

function TPersonControllerDB.Count: integer;
begin
  // Result := FPersons.Count;
  Result := 0;
end;

end.
