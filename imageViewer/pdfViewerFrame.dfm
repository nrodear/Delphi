object Frame3: TFrame3
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  TabOrder = 0
  object gtPDFViewer1: TgtPDFViewer
    Left = 0
    Top = 41
    Width = 640
    Height = 439
    Cursor = crArrow
    Align = alClient
    Color = clGray
    DockOrientation = doNoOrient
    ParentColor = False
    TabOrder = 0
    TabStop = True
    About = 'Gnostice PDFtoolkit (www.gnostice.com)'
    Status = 'PDF Viewer loaded Successfully.'
    SearchHighlightColor = clGray
    Version = '5.0.0.916'
    ViewerMode = vmHand
    AllowImageCopy = False
    SelectedRegionColor = clSkyBlue
    HighlightRegionColor = clYellow
    TextSelectionColor = clSkyBlue
    HighlightRegionShape = stRectangle
    BackgroundRendering = False
    Caching.Enabled = True
    Caching.DocumentCount = 10
    HighlightFormFields = False
    ExplicitLeft = 53
    ExplicitTop = 70
    object gtPDFViewer2: TgtPDFViewer
      Left = 488
      Top = 216
      Width = 450
      Height = 300
      Cursor = crArrow
      Color = clGray
      DockOrientation = doNoOrient
      ParentColor = False
      TabOrder = 0
      TabStop = True
      About = 'Gnostice PDFtoolkit (www.gnostice.com)'
      Status = 'PDF Viewer loaded Successfully.'
      SearchHighlightColor = clGray
      Version = '5.0.0.916'
      ViewerMode = vmHand
      AllowImageCopy = False
      SelectedRegionColor = clSkyBlue
      HighlightRegionColor = clYellow
      TextSelectionColor = clSkyBlue
      HighlightRegionShape = stRectangle
      BackgroundRendering = False
      Caching.Enabled = True
      Caching.DocumentCount = 10
      HighlightFormFields = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 1
    ExplicitLeft = 112
    ExplicitTop = 3
    ExplicitWidth = 185
    object Button1: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 527
      Top = 8
      Width = 34
      Height = 25
      Caption = '...'
      TabOrder = 1
    end
    object Edtfilename: TEdit
      Left = 122
      Top = 12
      Width = 399
      Height = 23
      TabOrder = 2
      Text = 'C:\Users\ngerlach\Downloads\KurzanleitungVerfahren.pdf'
    end
  end
end
