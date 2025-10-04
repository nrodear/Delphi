unit PersonTests;

interface

uses
  DUnitX.TestFramework, Person;

type

  [TestFixture]
  TPersonTests = class
  private
    FPerson: TPerson;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure TestSetAndGetName;

    [Test]
    procedure TestSetAndGetAge;
  end;

implementation

procedure TPersonTests.Setup;
begin
  FPerson := TPerson.Create;
end;

procedure TPersonTests.TearDown;
begin
  FPerson.Free;
end;

procedure TPersonTests.TestSetAndGetName;
begin
  FPerson.Name := 'Nicolas';
  Assert.AreEqual('Nicolas', FPerson.Name,
    'Name sollte korrekt gespeichert werden.');
end;

procedure TPersonTests.TestSetAndGetAge;
begin
  FPerson.Age := 30;
  Assert.AreEqual(30, FPerson.Age, 'Alter sollte korrekt gespeichert werden.');
end;

initialization

TDUnitX.RegisterTestFixture(TPersonTests);

end.
