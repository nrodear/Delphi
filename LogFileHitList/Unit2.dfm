object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 684
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 113
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 624
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 34
      Height = 15
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 34
      Height = 15
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 80
      Top = 21
      Width = 353
      Height = 23
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 80
      Top = 61
      Width = 353
      Height = 23
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 113
    Width = 522
    Height = 505
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 64
    ExplicitTop = 61
    ExplicitWidth = 575
    ExplicitHeight = 273
    DesignSize = (
      522
      505)
    object ListBox1: TListBox
      Left = 80
      Top = 6
      Width = 353
      Height = 493
      Anchors = [akLeft, akTop, akBottom]
      BevelEdges = [beTop, beBottom]
      ItemHeight = 15
      TabOrder = 0
      ExplicitHeight = 393
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 618
    Width = 522
    Height = 47
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 320
    ExplicitWidth = 575
    DesignSize = (
      522
      47)
    object Button1: TButton
      Left = 394
      Top = 6
      Width = 113
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'CLose'
      TabOrder = 0
      ExplicitLeft = 496
    end
    object Button2: TButton
      Left = 256
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 665
    Width = 522
    Height = 19
    Panels = <>
    ExplicitLeft = 360
    ExplicitTop = 24
    ExplicitWidth = 0
  end
end
