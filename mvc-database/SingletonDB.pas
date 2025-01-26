unit SingletonDB;

interface

uses
  SyncObjs,
  System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Comp.Client;

type
  ISingleton = interface
    function GetConnection: TFDConnection;
  end;

function Singleton: ISingleton;

implementation

type
  TSingleton = class(TInterfacedObject, ISingleton)
  private
    function GetConnection: TFDConnection;
    function CreateConnection: TFDConnection;
  end;

  { TSingleton }

var
  Lock: TCriticalSection;
  _Singleton: ISingleton;

function Singleton: ISingleton;
begin
  Lock.Acquire;
  Try
    if not Assigned(_Singleton) then
    begin
      _Singleton := TSingleton.Create;
    end;

    Result := _Singleton;
  Finally
    Lock.Release;
  End;
end;

var
  FDConnection: TFDConnection;

function TSingleton.GetConnection: TFDConnection;
begin
  if not Assigned(FDConnection) then
  begin
    FDConnection := CreateConnection();
  end;
  Result := FDConnection;
end;

function TSingleton.CreateConnection: TFDConnection;
begin
  // Verbindung erstellen
  FDConnection := TFDConnection.Create(nil);
  // Verbindung konfigurieren
  FDConnection.DriverName := 'SQLite';
  FDConnection.Params.Database := 'D:\git-demos\delphi\database.db';
  FDConnection.Params.Add('LockingMode=Normal');
  // Optional: Konfiguration für SQLite
  FDConnection.LoginPrompt := False; // Keine Login-Abfrage
  FDConnection.Connected := True;

  Result := FDConnection;
end;

initialization

Lock := TCriticalSection.Create;

finalization

Lock.Free;
FDConnection.Free;

end.
