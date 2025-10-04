unit BelegUnit;

interface

type
  TBeleg = class
  private
    FID: Integer;
    FDatum: TDateTime;
    FBetrag: Double;
  public
    constructor Create(AID: Integer; ADatum: TDateTime; ABetrag: Double);
    property ID: Integer read FID write FID;
    property Datum: TDateTime read FDatum write FDatum;
    property Betrag: Double read FBetrag write FBetrag;
  end;

implementation

constructor TBeleg.Create(AID: Integer; ADatum: TDateTime; ABetrag: Double);
begin
  FID := AID;
  FDatum := ADatum;
  FBetrag := ABetrag;
end;

end.

