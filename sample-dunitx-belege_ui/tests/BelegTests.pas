unit BelegTests;

interface

uses
  DUnitX.TestFramework, BelegUnit;

type

  [TestFixture]
  TBelegTests = class
  private
    FBeleg: TBeleg;
  public
    [Setup]
    procedure Setup;

    [Test]
    procedure TestBelegCreation;

    [Test]
    procedure TestBelegValues;
  end;

implementation

uses
  System.SysUtils;

procedure TBelegTests.Setup;
begin
  FBeleg := TBeleg.Create(1, Now, 100.50);
end;

procedure TBelegTests.TestBelegCreation;
begin
  Assert.IsNotNull(FBeleg, 'TBeleg wurde nicht korrekt erstellt.');
end;

procedure TBelegTests.TestBelegValues;
begin
  Assert.AreEqual(1, FBeleg.ID, 'ID stimmt nicht.');
end;

initialization

TDUnitX.RegisterTestFixture(TBelegTests);

end.
