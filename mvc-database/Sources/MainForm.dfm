object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 334
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object BtnDelete: TButton
    Left = 320
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 0
    OnClick = BtnDeleteClick
  end
  object BtnAdd: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 1
    OnClick = BtnAddClick
  end
  object EditFirstName: TEdit
    Left = 97
    Top = 10
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'FirstName'
  end
  object EditLastName: TEdit
    Left = 97
    Top = 39
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'LastName'
  end
  object EditDomicile: TEdit
    Left = 97
    Top = 68
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'Domicile'
  end
  object ListView: TListView
    Left = 97
    Top = 136
    Width = 250
    Height = 150
    Columns = <>
    TabOrder = 5
  end
  object BtnClose: TButton
    Left = 437
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = BtnCloseClick
  end
  object Button1: TButton
    Left = 441
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 7
    OnClick = Button1Click
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 432
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 432
    Top = 8
  end
end
