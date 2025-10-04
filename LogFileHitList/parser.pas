unit parser;

interface

type
  TExceptionInfo = record
    ExceptionType: string;
    ExceptionText: string;
    Counter: Integer;

    class function Create(pExceptionType, pExceptionText: string)
      : TExceptionInfo;static;
  end;

  TParser = class
    procedure ExtractTopExceptions(const FileName: string;
      const TopN: Integer = 10);
  end;

implementation

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Generics.Defaults,  AnsiStrings, Math;

procedure TParser.ExtractTopExceptions(const FileName: string;
  const TopN: Integer = 10);
var
  LogLines: TStringList;
  Info: TExceptionInfo;
  EntryCounts: TDictionary<string, TExceptionInfo>;
  i: Integer;
  InBlock: Boolean;
  Line, ExceptionText: string;
  Pair: TPair<string, TExceptionInfo>;
  SortedList: TList<TPair<string, TExceptionInfo>>;

begin
  LogLines := TStringList.Create;
  EntryCounts := TDictionary<string, TExceptionInfo>.Create;
  SortedList := TList < TPair < string, TExceptionInfo >>.Create;
  try
    LogLines.LoadFromFile(FileName);
    InBlock := False;

    for i := 0 to LogLines.Count - 1 do
    begin
      Line := Trim(LogLines[i]);
      if Line = '-------------------------------' then
      begin
        InBlock := not InBlock; // Start oder Ende eines Blocks
      end
      else if InBlock then
      begin
        if Pos('Exception:', Line) = 1 then
        begin
          ExceptionText := Trim(Copy(Line, Length('Exception:') + 1, MaxInt));
          if ExceptionText <> '' then
          begin
            if EntryCounts.ContainsKey(ExceptionText) then
            begin
              Info := EntryCounts[ExceptionText];
              Info.Counter := Info.Counter + 1
            end
            else
              Info := TExceptionInfo.Create(ExceptionText,'');
              EntryCounts.Add(ExceptionText, info);
          end;
        end;
      end;
    end;

    // Sortieren
    for Pair in EntryCounts do
      SortedList.Add(Pair);

    SortedList.Sort(TComparer < TPair < string, TExceptionInfo >>.Construct(
      function(const L, R: TPair<string, TExceptionInfo>): Integer
      begin
        Result := R.Value.Counter - L.Value.Counter; // Absteigend
      end));

    // Ausgabe
    Writeln('10 Top ', TopN, ' Exception-Meldungen:');
    for i := 0 to Min(TopN - 1, SortedList.Count - 1) do

      Writeln(Format('%d. [%d×] %s', [i + 1, SortedList[i].Value.ExceptionType,
        SortedList[i].Key]));

  finally
    LogLines.Free;
    EntryCounts.Free;
    SortedList.Free;
  end;
end;

{ TExceptionInfo }

class function TExceptionInfo.Create(pExceptionType, pExceptionText: string)
  : TExceptionInfo;
begin
  Result.ExceptionType := '';
  Result.ExceptionText := '';
  Result.Counter := 1;
end;

end.
