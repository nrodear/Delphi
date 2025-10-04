object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 711
  ClientWidth = 978
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnResize = FormResize
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 677
    Width = 978
    Height = 34
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
    ExplicitTop = 653
    ExplicitWidth = 923
    DesignSize = (
      978
      34)
    object Button1: TButton
      Left = 891
      Top = 8
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      TabOrder = 0
      ExplicitLeft = 836
    end
  end
  inline ImgViewerFrame1: TImgViewerFrame
    Left = 0
    Top = 0
    Width = 978
    Height = 677
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 32
    ExplicitTop = 26
    ExplicitWidth = 923
    ExplicitHeight = 653
    inherited Panel1: TPanel
      Width = 978
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 923
      inherited Edtfilename: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited pnlMain: TPanel
      Width = 978
      Height = 636
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 0
      ExplicitTop = 41
      ExplicitWidth = 923
      ExplicitHeight = 612
      inherited ScrollBar1: TScrollBar
        Left = 960
        Height = 634
        ExplicitLeft = 905
        ExplicitTop = 1
        ExplicitHeight = 610
      end
      inherited pnlCenterMain: TPanel
        Width = 959
        Height = 634
        StyleElements = [seFont, seClient, seBorder]
        ExplicitLeft = 89
        ExplicitTop = 1
        ExplicitWidth = 728
        ExplicitHeight = 610
        inherited ScrollBox1: TScrollBox
          Width = 953
          Height = 628
          ExplicitLeft = 3
          ExplicitTop = 3
          ExplicitWidth = 722
          ExplicitHeight = 604
          DesignSize = (
            949
            624)
          inherited Image1: TImage
            Width = 946
            Height = 689
          end
        end
      end
    end
  end
end
