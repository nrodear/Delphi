object Form2: TForm2
  Left = 204
  Top = 125
  Caption = 'Form2'
  ClientHeight = 608
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 97
    Height = 608
    Align = alLeft
    TabOrder = 0
    object Button1: TButton
      Left = 8
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Print'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 8
      Top = 79
      Width = 75
      Height = 25
      Caption = 'Save Comp.'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 8
      Top = 121
      Width = 75
      Height = 25
      Caption = 'Apply Com.'
      TabOrder = 2
      OnClick = Button3Click
    end
  end
  object Panel2: TPanel
    Left = 97
    Top = 0
    Width = 835
    Height = 608
    Align = alClient
    TabOrder = 1
    object QuickRep1: TQuickRep
      Left = 6
      Top = 8
      Width = 816
      Height = 1056
      ShowingPreview = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Functions.Strings = (
        'PAGENUMBER'
        'COLUMNNUMBER'
        'REPORTTITLE')
      Functions.DATA = (
        '0'
        '0'
        #39#39)
      Options = [FirstPageHeader, LastPageFooter]
      Page.Columns = 1
      Page.Orientation = poPortrait
      Page.PaperSize = Letter
      Page.Continuous = False
      Page.Values = (
        100.000000000000000000
        2794.000000000000000000
        100.000000000000000000
        2159.000000000000000000
        100.000000000000000000
        100.000000000000000000
        0.000000000000000000)
      PrinterSettings.Copies = 1
      PrinterSettings.OutputBin = Auto
      PrinterSettings.Duplex = False
      PrinterSettings.FirstPage = 0
      PrinterSettings.LastPage = 0
      PrinterSettings.UseStandardprinter = False
      PrinterSettings.UseCustomBinCode = False
      PrinterSettings.CustomBinCode = 0
      PrinterSettings.ExtendedDuplex = 0
      PrinterSettings.UseCustomPaperCode = False
      PrinterSettings.CustomPaperCode = 0
      PrinterSettings.PrintMetaFile = False
      PrinterSettings.MemoryLimit = 1000000
      PrinterSettings.Collate = 0
      PrinterSettings.ColorOption = 2
      PrintIfEmpty = True
      SnapToGrid = True
      Units = MM
      Zoom = 100
      PrevFormStyle = fsNormal
      PreviewInitialState = wsNormal
      PreviewWidth = 500
      PreviewHeight = 500
      PrevInitialZoom = qrZoomToFit
      PreviewDefaultSaveType = stPDF
      PreviewLeft = 0
      PreviewTop = 0
      object QRBand1: TQRBand
        Left = 38
        Top = 38
        Width = 740
        Height = 40
        AlignToBottom = False
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          105.833333333333300000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
      end
      object QRBand2: TQRBand
        Left = 38
        Top = 78
        Width = 740
        Height = 107
        AlignToBottom = False
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          283.104166666666700000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
      end
      object QRHoverBandPanel1: TQRHoverBandPanel
        Left = 38
        Top = 185
        Width = 740
        Height = 112
        AlignToBottom = False
        TransparentBand = False
        ForceNewColumn = False
        ForceNewPage = False
        Size.Values = (
          296.333333333333300000
          1957.916666666667000000)
        PreCaluculateBandHeight = False
        KeepOnOnePage = False
        BandType = rbTitle
        object QRHoverLabel1: TQRHoverLabel
          Left = 512
          Top = 8
          Width = 145
          Height = 24
          Size.Values = (
            63.500000000000000000
            1354.666666666667000000
            21.166666666666670000
            383.645833333333300000)
          XLColumn = 0
          XLNumFormat = nfGeneral
          ActiveInPreview = False
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'QRHoverLabel1'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          VerticalAlignment = tlTop
          FontSize = 10
        end
        object QRHoverLabel2: TQRHoverLabel
          Left = 512
          Top = 38
          Width = 185
          Height = 24
          Size.Values = (
            63.500000000000000000
            1354.666666666667000000
            100.541666666666700000
            489.479166666666700000)
          XLColumn = 0
          XLNumFormat = nfGeneral
          ActiveInPreview = False
          Alignment = taLeftJustify
          AlignToBand = False
          AutoSize = False
          Caption = 'QRHoverLabel2'
          Color = clWhite
          Transparent = False
          ExportAs = exptText
          WrapStyle = BreakOnSpaces
          VerticalAlignment = tlTop
          FontSize = 10
        end
      end
    end
  end
end
