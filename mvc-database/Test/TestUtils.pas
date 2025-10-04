unit TestUtils;

interface

uses
 System.Diagnostics, System.SysUtils;

function StartwatchStop: TStopwatch;

implementation


procedure WriteWtchStop(sw: TStopwatch);
var
  Caption: String;
  span1, span2, span3: TTimeSpan;
begin

  Caption := sw.ElapsedMilliseconds.ToString;
  sw.Stop;
  WriteLn(Caption);

  sw := TStopwatch.StartNew;
  Sleep(5000);
  sw.Stop;
  // Read the timing

  WriteLn('span1 = {0}', sw.Elapsed.ToString);

  span1 := TimeSpan.Create(8, 30, 0); // 8 hours 30 mins
  span2 := TimeSpan.Create(17, 0, 0, 0); // 17 days
  span3 := System.TimeSpan.Create(0, 0, 0, 0, 1234); // 1234 millis

  Console.WriteLine('span1 = {0}', span1.ToString);
  Console.WriteLine('span2 = {0}', span2.ToString);
  Console.WriteLine('span3 = {0}', span3.ToString);

end;

function StartwatchStop: TStopwatch;
var
  sw: TStopwatch;
begin
  sw := TStopwatch.StartNew;
  // sw.Start;

end;

end.
