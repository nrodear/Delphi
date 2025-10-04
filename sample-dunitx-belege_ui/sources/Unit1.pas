unit Unit1;

interface

procedure CreateTable;

implementation

uses
  System.SysUtils, Data.DB, Data.SqlExpr, Data.DbxSqlite, Unit2;

procedure CreateTable;
const
  INFO1 = 'Gro�e Neuigkeiten!';
  TEASER1 = 'Gro�e Neuigkeiten! Unsere neueste Produktinnovation steht kurz vor dem Release. Bleibt gespannt � mehr Details folgen in K�rze!';
  INTERNAL_NOTE1 =
    'Die letzte Testphase l�uft noch, bitte alle Bugs bis Freitag melden. Marketing bereitet die Kampagne f�r n�chste Woche vor, daher keine externen Aussagen zu genauen Features vor der Freigabe.';

  INFO2 = 'Event-Ank�ndigung';
  TEASER2 = 'Event-Ank�ndigung: Am kommenden Wochenende erwarten euch spannende Talks und exklusive Networking-M�glichkeiten. Sichert euch jetzt euren Platz!';
  INTERNAL_NOTE2 =
    'Die Speaker-Liste wird finalisiert. Bitte bis Mittwoch alle technischen Anforderungen der G�ste kl�ren, damit die B�hne und Pr�sentationstechnik rechtzeitig vorbereitet sind.';

  INFO3 = 'Neue Jobchancen!';
  TEASER3 = 'Neue Jobchancen! Wir wachsen weiter und suchen talentierte Teammitglieder. Lust auf eine neue Herausforderung? Jetzt bewerben!';
  INTERNAL_NOTE3 =
    'HR hat die finalen Stellenbeschreibungen ausgearbeitet � diese bitte erst nach der internen Freigabe ver�ffentlichen. Fokus liegt auf Marketing und Softwareentwicklung, weitere Bereiche werden sp�ter erg�nzt.';

  InsertSQL = 'INSERT INTO Kommentare (id, Teaser, Info, Internal) VALUES ' +
    ' (''1'', ''' + TEASER1 + ''', ''' + INFO1 + ''', ''' + INTERNAL_NOTE1 + '''),' +
    ' (''2'', ''' + TEASER2 + ''', ''' + INFO2 + ''', ''' + INTERNAL_NOTE2 + '''),' +
    ' (''3'', ''' + TEASER3 + ''', ''' + INFO3 + ''', ''' + INTERNAL_NOTE3 + ''');';
var
  SQLQuery: TSQLQuery;

begin
  SQLQuery := TSQLQuery.Create(nil);
  try

    SQLQuery.SQLConnection := Form2.SQLConnection1;
    SQLQuery.SQL.Text := 'CREATE TABLE IF NOT EXISTS Kommentare ' +
      '(id TEXT PRIMARY KEY NOT NULL, Teaser TEXT, Info TEXT, Internal TEXT)';

    SQLQuery.SQLConnection.LoginPrompt := False;
    SQLQuery.SQLConnection.Open;

    SQLQuery.ExecSQL;

    SQLQuery.SQL.Text := InsertSQL;
    SQLQuery.ExecSQL;

  finally
    SQLQuery.Free;
  end;
end;

end.
