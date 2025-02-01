unit CheckException;

interface

uses
  sysutils;

Type
  ECheckException = class
    constructor Create;
  public
    class procedure Throw(param: integer); overload;
    class procedure Throw(param: string); overload;
  end;

implementation

constructor ECheckException.Create;
begin
  raise Exception.Create('Error constructor ECheckException; dont use this;');
end;

class procedure ECheckException.Throw(param: integer);
begin
  raise Exception.Create(format('This is an exception with param %d', [param]));
end;

class procedure ECheckException.Throw(param: string);
begin
  raise Exception.Create(format('This is an exception with param %s', [param]));
end;

end.
