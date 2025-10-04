unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.FMTBcd,
  Data.DB, Datasnap.Provider, Datasnap.DBClient, Data.SqlExpr, Data.DbxSqlite,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors,
  Vcl.DBCGrids, Data.Bind.Components, Vcl.Buttons;

type
  TForm2 = class(TForm)
    SQLQuery1: TSQLQuery;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSource1: TDataSource;
    SQLConnection1: TSQLConnection;
    DBGrid1: TDBGrid;
    ClientDataSet1id: TWideMemoField;
    ClientDataSet1Teaser: TWideMemoField;
    ClientDataSet1Info: TWideMemoField;
    ClientDataSet1Internal: TWideMemoField;
    DBCtrlGrid1: TDBCtrlGrid;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Panel1: TPanel;
    DBText1: TDBText;
    DBText2: TDBText;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form2: TForm2;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TForm2.FormShow(Sender: TObject);
begin

  SQLConnection1.LoginPrompt := False;
  SQLConnection1.Open;

  //CreateTable;

  SQLQuery1.Open;
  ClientDataSet1.Open;

end;

end.
