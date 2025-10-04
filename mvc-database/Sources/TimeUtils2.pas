unit TimeUtils2;

interface

procedure Duration(StartTime, EndTime: TDateTime; id: integer);

implementation

uses
  System.SysUtils, DateUtils, Consts,
  System.Diagnostics;

procedure Duration(StartTime, EndTime: TDateTime; id: integer);
var
  duationSec: integer;
  Text: String;
  Marker: String;
begin

  duationSec := MilliSecondsBetween(StartTime, EndTime);
  Marker := ' ';

  if duationSec > 30000 then
  begin
    Marker := '!';
  end;

  Text := Marker + 'id:' + IntToStr(id) + '       Milli: ' +
    IntToStr(duationSec);

  Writeln(Text);
end;

end.
