object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Image Viewer'
  ClientHeight = 711
  ClientWidth = 1004
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
    Width = 1004
    Height = 34
    Align = alBottom
    Anchors = [akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      1004
      34)
    object Button1: TButton
      Left = 917
      Top = 8
      Width = 75
      Height = 21
      Anchors = [akRight, akBottom]
      Caption = 'Close'
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1004
    Height = 677
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      inline ImgViewerFrame1: TImgViewerFrame
        Left = 0
        Top = 0
        Width = 996
        Height = 647
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 315
        ExplicitTop = 20
        inherited Panel1: TPanel
          Width = 996
          StyleElements = [seFont, seClient, seBorder]
          inherited Edtfilename: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
        inherited pnlMain: TPanel
          Width = 996
          Height = 606
          StyleElements = [seFont, seClient, seBorder]
          inherited pnlCenterMain: TPanel
            Width = 996
            Height = 606
            StyleElements = [seFont, seClient, seBorder]
            inherited ScrollBox1: TScrollBox
              Width = 990
              Height = 600
              inherited Image1: TImage
                Width = 984
                Height = 594
              end
            end
          end
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      inline Frame31: TFrame3
        Left = 0
        Top = 0
        Width = 996
        Height = 647
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 353
        ExplicitTop = 173
        inherited gtPDFViewer1: TgtPDFViewer
          Width = 996
          Height = 606
          Cursor = 1
          ExplicitLeft = 0
          ExplicitTop = 41
          inherited gtPDFViewer2: TgtPDFViewer
            Cursor = 1
          end
        end
        inherited Panel1: TPanel
          Width = 996
          StyleElements = [seFont, seClient, seBorder]
          inherited Button3: TButton
            OnClick = nil
          end
          inherited Edtfilename: TEdit
            StyleElements = [seFont, seClient, seBorder]
          end
        end
      end
    end
  end
end
