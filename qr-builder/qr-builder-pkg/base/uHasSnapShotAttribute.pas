unit uHasSnapShotAttribute;

interface

type
  HasSnapShotAttribute = class(TCustomAttribute)
  end;

  TSnapshotType = (STDefault, STInvoice, STDunning);

type
  TSnapshotEnums = record
    class function GetNameByType(Index: TSnapshotType): string; static;
  end;

const
  SnapshotTypeNames: array[TSnapshotType] of string = ('Default', 'Invoice', 'Dunning');

implementation

{ TSnapshotEnums }

class function TSnapshotEnums.GetNameByType(Index: TSnapshotType): string;
begin
  Result := SnapshotTypeNames[Index]
end;

end.

