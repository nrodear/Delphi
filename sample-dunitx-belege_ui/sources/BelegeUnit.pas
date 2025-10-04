unit BelegeUnit;

interface

uses
  Data.SqlExpr, SysUtils,
  System.Generics.Collections, BelegUnit;

type
  TBelege = class
  private
    FBelege: TObjectList<TBeleg>;
    FConnection: TSqlConnection;

  public
    constructor Create;
    destructor Destroy; override;
    procedure AddBeleg(Beleg: TBeleg);
    function GetBelege: TObjectList<TBeleg>;
    procedure SetDBConnection(Connection: TSqlConnection);
    procedure LoadFromDB;
  end;

implementation

constructor TBelege.Create;
begin
  FBelege := TObjectList<TBeleg>.Create;
end;

destructor TBelege.Destroy;
begin
  FBelege.Free;
  inherited;
end;

procedure TBelege.AddBeleg(Beleg: TBeleg);
begin
  FBelege.Add(Beleg);
end;

function TBelege.GetBelege: TObjectList<TBeleg>;
begin
  Result := FBelege;
end;

procedure TBelege.LoadFromDB;
var
  SQLQuery: TSQLQuery;
  Beleg: TBeleg;
begin
  SQLQuery := TSQLQuery.Create(nil);
  try
    SQLQuery.SQLConnection := FConnection;
    SQLQuery.SQL.Text := 'SELECT ID, Datum, Betrag FROM Belege';
    SQLQuery.Open;

    while not SQLQuery.EOF do
    begin
      Beleg := TBeleg.Create(SQLQuery.FieldByName('ID').AsInteger,
        StrToDate(SQLQuery.FieldByName('Datum').AsString),
        StrToFloat(SQLQuery.FieldByName('Betrag').AsString));
    end;
  finally
  end;
end;

procedure TBelege.SetDBConnection(Connection: TSqlConnection);
begin
  FConnection := Connection;
end;

end.
