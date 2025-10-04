object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 543
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 368
    Height = 93
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Info'
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Teaser'
        Width = 136
        Visible = True
      end>
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 8
    Top = 107
    Width = 385
    Height = 417
    DataSource = DataSource1
    PanelBorder = gbNone
    PanelHeight = 208
    PanelWidth = 368
    TabOrder = 1
    RowCount = 2
    SelectedColor = clBtnHighlight
    StyleName = 'Windows'
    object DBMemo1: TDBMemo
      Left = 0
      Top = 41
      Width = 368
      Height = 72
      Align = alTop
      DataField = 'Teaser'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object DBMemo2: TDBMemo
      Left = 0
      Top = 131
      Width = 368
      Height = 77
      Align = alClient
      DataField = 'Internal'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 368
      Height = 25
      Align = alTop
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 2
      TabStop = True
      StyleName = 'Windows'
      object DBText1: TDBText
        Left = 8
        Top = 2
        Width = 52
        Height = 17
        DataField = 'id'
        DataSource = DataSource1
      end
      object DBText2: TDBText
        Left = 66
        Top = 2
        Width = 287
        Height = 17
        DataField = 'Info'
        DataSource = DataSource1
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 25
      Width = 368
      Height = 16
      Align = alTop
      Caption = 'Panel2'
      Color = clCream
      ParentBackground = False
      TabOrder = 3
      object Label1: TLabel
        Left = 8
        Top = 0
        Width = 32
        Height = 15
        Caption = 'Teaser'
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 113
      Width = 368
      Height = 18
      Align = alTop
      Caption = 'Panel3'
      Color = clCream
      ParentBackground = False
      TabOrder = 4
      ExplicitTop = 119
      object Label2: TLabel
        Left = 8
        Top = 2
        Width = 40
        Height = 15
        Caption = 'Internal'
      end
    end
  end
  object SQLQuery1: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * from kommentare')
    SQLConnection = SQLConnection1
    Left = 80
    Top = 416
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'id'
        Attributes = [faRequired]
        DataType = ftWideMemo
      end
      item
        Name = 'Teaser'
        DataType = ftWideMemo
      end
      item
        Name = 'Info'
        DataType = ftWideMemo
      end
      item
        Name = 'Internal'
        DataType = ftWideMemo
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 168
    Top = 416
    object ClientDataSet1id: TWideMemoField
      FieldName = 'id'
      Required = True
      BlobType = ftWideMemo
      DisplayValue = dvFullText
    end
    object ClientDataSet1Info: TWideMemoField
      FieldName = 'Info'
      BlobType = ftWideMemo
      DisplayValue = dvFullText
    end
    object ClientDataSet1Teaser: TWideMemoField
      FieldName = 'Teaser'
      BlobType = ftWideMemo
      DisplayValue = dvFull
    end
    object ClientDataSet1Internal: TWideMemoField
      FieldName = 'Internal'
      BlobType = ftWideMemo
      DisplayValue = dvFit
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = SQLQuery1
    Left = 120
    Top = 464
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 208
    Top = 464
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'Sqlite3AppConnection'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'DriverUnit=Data.DbxSqlite'
      
        'DriverPackageLoader=TDBXSqliteDriverLoader,DBXSqliteDriver290.bp' +
        'l'
      
        'MetaDataPackageLoader=TDBXSqliteMetaDataCommandFactory,DbxSqlite' +
        'Driver290.bpl'
      'FailIfMissing=True'
      'Database=D:\git-demos\delphi\mvc-database\data\datafile64.db'
      'HostName=localhost')
    Left = 40
    Top = 360
  end
end
