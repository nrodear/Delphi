object ImgViewerFrame: TImgViewerFrame
  Left = 0
  Top = 0
  Width = 681
  Height = 627
  TabOrder = 0
  OnMouseWheel = FrameMouseWheel
  OnResize = ScrollBox1Resize
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 681
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edtfilename: TEdit
      Left = 178
      Top = 12
      Width = 399
      Height = 23
      TabOrder = 1
      Text = 'C:\Users\ngerlach\Pictures\vlcsnap-2023-04-02-01h29m37s842.png'
    end
    object Button3: TButton
      Left = 583
      Top = 10
      Width = 34
      Height = 25
      Caption = '...'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button2: TButton
      Left = 136
      Top = 10
      Width = 36
      Height = 25
      Caption = 'OUT'
      TabOrder = 3
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 97
      Top = 10
      Width = 36
      Height = 25
      Caption = 'IN'
      TabOrder = 4
      OnClick = Button4Click
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 681
    Height = 586
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object ScrollBar1: TScrollBar
      Left = 662
      Top = 0
      Width = 19
      Height = 586
      Align = alRight
      Kind = sbVertical
      PageSize = 0
      TabOrder = 0
      OnChange = ScrollBar1Change
      ExplicitLeft = 661
      ExplicitTop = 1
      ExplicitHeight = 584
    end
    object pnlCenterMain: TPanel
      Left = 0
      Top = 0
      Width = 662
      Height = 586
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ScrollBox1: TScrollBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 656
        Height = 580
        VertScrollBar.Color = clDarkorchid
        VertScrollBar.ParentColor = False
        VertScrollBar.Smooth = True
        Align = alClient
        AutoSize = True
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clDeeppink
        ParentColor = False
        TabOrder = 0
        UseWheelForScrolling = True
        OnResize = ScrollBox1Resize
        DesignSize = (
          652
          576)
        object Image1: TImage
          Left = 3
          Top = 11
          Width = 628
          Height = 612
          Anchors = [akLeft, akTop, akRight, akBottom]
          Center = True
          Transparent = True
        end
      end
    end
  end
end
