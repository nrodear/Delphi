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
  KeyPreview = True
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 677
    Width = 978
    Height = 34
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
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
    end
  end
  inline ImgViewerFrame1: TImgViewerFrame
    Left = 0
    Top = 0
    Width = 978
    Height = 677
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 978
    ExplicitHeight = 677
    inherited Panel1: TPanel
      Width = 978
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 978
      inherited Edtfilename: TEdit
        StyleElements = [seFont, seClient, seBorder]
      end
    end
    inherited pnlMain: TPanel
      Width = 978
      Height = 636
      StyleElements = [seFont, seClient, seBorder]
      ExplicitWidth = 978
      ExplicitHeight = 636
      inherited pnlCenterMain: TPanel
        Width = 978
        Height = 636
        StyleElements = [seFont, seClient, seBorder]
        ExplicitWidth = 978
        ExplicitHeight = 636
        inherited ScrollBox1: TScrollBox
          Width = 972
          Height = 630
          ExplicitWidth = 972
          ExplicitHeight = 630
          DesignSize = (
            968
            626)
          inherited Image1: TImage
            Width = 965
            Height = 691
            ExplicitWidth = 965
            ExplicitHeight = 691
          end
        end
      end
    end
  end
end
