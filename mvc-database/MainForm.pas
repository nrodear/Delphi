unit MainForm;

interface

uses
  Vcl.Forms, Vcl.StdCtrls, Vcl.ComCtrls, Controller,Model, System.Classes,
  Vcl.Controls;

type
  TFormMain = class(TForm)
    BtnDelete: TButton;
    BtnAdd: TButton;
    EditFirstName: TEdit;
    EditLastName: TEdit;
    EditDomicile: TEdit;
    ListView: TListView;
    BtnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
  private
    FController: TAddressController;
    procedure RefreshListView;
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FController := TAddressController.Create;

  // Configure ListView
  ListView.ViewStyle := vsReport;
  ListView.Columns.Add.Caption := 'First Name';
  ListView.Columns.Add.Caption := 'Last Name';
  ListView.Columns.Add.Caption := 'Domicile';
end;

procedure TFormMain.BtnAddClick(Sender: TObject);
begin
  FController.AddPerson(EditFirstName.Text, EditLastName.Text, EditDomicile.Text);
  RefreshListView;
end;

procedure TFormMain.BtnDeleteClick(Sender: TObject);
var
  SelectedIndex: Integer;
begin
  if ListView.ItemIndex >= 0 then
  begin
    SelectedIndex := ListView.ItemIndex;
    FController.DeletePerson(SelectedIndex);
    RefreshListView;
  end;
end;

procedure TFormMain.RefreshListView;
var
  I: Integer;
  Person: TPerson;
  ListItem: TListItem;
begin
  ListView.Clear;
  for I := 0 to FController.Count - 1 do
  begin
    Person := FController.GetPerson(I);
    ListItem := ListView.Items.Add;
    ListItem.Caption := Person.FirstName;
    ListItem.SubItems.Add(Person.LastName);
    ListItem.SubItems.Add(Person.Domicile);
  end;
end;

end.
