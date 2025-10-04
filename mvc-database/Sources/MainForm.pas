unit MainForm;

interface

uses
  Vcl.Forms,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  ControllerDB,
  Controller,
  Person,
  System.Classes,
  FireDAC.DApt,
  FireDAC.Comp.UI,
  Vcl.Controls,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Error,
  FireDAC.Stan.Error,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf;

type
  TFormMain = class(TForm)
    BtnDelete: TButton;
    BtnAdd: TButton;
    EditFirstName: TEdit;
    EditLastName: TEdit;
    EditDomicile: TEdit;
    ListView: TListView;
    BtnClose: TButton;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FController: TAddressController;
    PersonControllerDB: TPersonControllerDB;
    procedure RefreshListView;
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  Resolver,
  Consts;

procedure TFormMain.FormCreate(Sender: TObject);
begin

  PersonControllerDB := TPersonControllerDB.Create;
  FController := TAddressController.Create;

  // Configure ListView
  ListView.ViewStyle := vsReport;
  ListView.Columns.Add.Caption := 'First Name';
  ListView.Columns.Add.Caption := 'Last Name';
  ListView.Columns.Add.Caption := 'Domicile';

end;

procedure TFormMain.BtnAddClick(Sender: TObject);
begin
  FController.Add(EditFirstName.Text, EditLastName.Text, EditDomicile.Text);
  RefreshListView;
end;

procedure TFormMain.BtnCloseClick(Sender: TObject);
begin
  FormMain.Close;
end;

procedure TFormMain.BtnDeleteClick(Sender: TObject);
var
  SelectedIndex: Integer;
begin
  if ListView.ItemIndex >= 0 then
  begin
    SelectedIndex := ListView.ItemIndex;
    FController.Delete(SelectedIndex);
    RefreshListView;
  end;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  FResolver: TResolver;
begin
  FResolver := TResolver.Create;
  FResolver.Start(FMatrixSimple);
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
    Person := FController.Get(I);
    ListItem := ListView.Items.Add;
    ListItem.Caption := Person.FirstName;
    ListItem.SubItems.Add(Person.LastName);
    ListItem.SubItems.Add(Person.Domicile);
  end;
end;

end.
