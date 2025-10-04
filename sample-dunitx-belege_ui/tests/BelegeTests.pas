unit BelegeTests;

interface

uses
  DUnitX.TestFramework, BelegeUnit, BelegUnit;

type
  [TestFixture]
  TBelegeTests = class
  private
    FBelege: TBelege;
  public
    [Setup]
    procedure Setup;

    [Test]
    procedure TestAddBeleg;

    [Test]
    procedure TestBelegeCount;
  end;

implementation

uses
  System.SysUtils;

procedure TBelegeTests.Setup;
begin
  FBelege := TBelege.Create;
end;

procedure TBelegeTests.TestAddBeleg;
var
  Beleg: TBeleg;
begin
  Beleg := TBeleg.Create(2, Now, 200.75);
  FBelege.AddBeleg(Beleg);
  Assert.AreEqual(1, FBelege.GetBelege.Count, 'Beleg wurde nicht hinzugefügt.');
end;

procedure TBelegeTests.TestBelegeCount;
begin
  Assert.AreEqual(0, FBelege.GetBelege.Count, 'Belege-Liste sollte anfangs leer sein.');
end;

initialization
  TDUnitX.RegisterTestFixture(TBelegeTests);

end.

