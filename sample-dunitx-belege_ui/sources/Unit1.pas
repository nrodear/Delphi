unit Unit1;

interface

procedure CreateTable;

implementation

uses
  System.SysUtils, Data.DB, Data.SqlExpr, Data.DbxSqlite, Unit2;

procedure CreateTable;
const
  INFO1 = 'Große Neuigkeiten!';
  TEASER1 = 'Große Neuigkeiten! Unsere neueste Produktinnovation steht kurz vor dem Release. Bleibt gespannt – mehr Details folgen in Kürze!';
  INTERNAL_NOTE1 =
    'Die letzte Testphase läuft noch, bitte alle Bugs bis Freitag melden. Marketing bereitet die Kampagne für nächste Woche vor, daher keine externen Aussagen zu genauen Features vor der Freigabe.';

  INFO2 = 'Event-Ankündigung';
  TEASER2 = 'Event-Ankündigung: Am kommenden Wochenende erwarten euch spannende Talks und exklusive Networking-Möglichkeiten. Sichert euch jetzt euren Platz!';
  INTERNAL_NOTE2 =
    'Die Speaker-Liste wird finalisiert. Bitte bis Mittwoch alle technischen Anforderungen der Gäste klären, damit die Bühne und Präsentationstechnik rechtzeitig vorbereitet sind.';

  INFO3 = 'Neue Jobchancen!';
  TEASER3 = 'Neue Jobchancen! Wir wachsen weiter und suchen talentierte Teammitglieder. Lust auf eine neue Herausforderung? Jetzt bewerben!';
  INTERNAL_NOTE3 =
    'HR hat die finalen Stellenbeschreibungen ausgearbeitet – diese bitte erst nach der internen Freigabe veröffentlichen. Fokus liegt auf Marketing und Softwareentwicklung, weitere Bereiche werden später ergänzt.';

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
