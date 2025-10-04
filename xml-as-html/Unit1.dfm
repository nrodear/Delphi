object Form1: TForm1
  Left = 633
  Top = 332
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 113
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 529
      Top = 76
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1xml: TEdit
      Left = 8
      Top = 18
      Width = 572
      Height = 23
      TabOrder = 1
      Text = 'D:\git-demos\delphi\xml-as-html\resources\books.xml'
    end
    object Edit2xsl: TEdit
      Left = 8
      Top = 47
      Width = 572
      Height = 23
      TabOrder = 2
      Text = 'D:\git-demos\delphi\xml-as-html\resources\books.xslt'
    end
    object Button2: TButton
      Left = 586
      Top = 16
      Width = 17
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 586
      Top = 45
      Width = 17
      Height = 25
      Caption = '...'
      TabOrder = 4
      OnClick = Button3Click
    end
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 113
    Width = 624
    Height = 328
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 176
    ExplicitTop = 168
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C0000007E400000E62100000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
end
