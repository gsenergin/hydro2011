object frm_Grafico: Tfrm_Grafico
  Left = 0
  Top = 0
  Caption = 'HYDRO: Graficaci'#243'n'
  ClientHeight = 517
  ClientWidth = 1055
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1055
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = -6
    object Label2: TLabel
      Left = 264
      Top = 14
      Width = 71
      Height = 13
      Caption = 'Descripci'#243'n: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 14
      Width = 85
      Height = 13
      Caption = 'Nomenclatura: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNomenclatura: TLabel
      Left = 128
      Top = 14
      Width = 76
      Height = 13
      Caption = 'lblNomenclatura'
    end
    object lblDescripcion: TLabel
      Left = 360
      Top = 14
      Width = 529
      Height = 13
      Caption = 'lblDescripcion'
    end
    object bitbtn_Imprimir: TBitBtn
      Left = 1008
      Top = 8
      Width = 35
      Height = 25
      TabOrder = 0
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFC89662CA9865CA9765CA9765CA9765CA9764C99764C99764CA9865C895
        62FFFFFFFFFFFFFFFFFFA1A1A17A7A7A585858C79561F9F7F6F9F1ECF9F1EBF8
        F0E9F7EDE6F4EAE1F2E8DEFAF8F6C794612424244B4B4B9696966B6B6BA7A7A7
        B5B5B5818181AFACAAC5C0BDC5C0BDC5C0BDC5C0BDC5C0BDC5C0BDADAAA82C2C
        2CB5B5B59B9B9B232323707070B5B5B5B5B5B59595958181818181817979796E
        6E6E6161615252524343434242426E6E6EB5B5B5B5B5B5252525757575BBBBBB
        BBBBBB8D8D8DD4D4D4B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9B9D3D3D38383
        83BBBBBBBBBBBB2A2A2A7A7A7AD7D7D7D7D7D7979797D8D8D8BFBFBFBFBFBFBF
        BFBFBFBFBFBFBFBFBFBFBFD7D7D78E8E8ED7D7D7D7D7D73F3F3F7E7E7EF9F9F9
        F9F9F9ABABABDFDFDFCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBCBDFDFDFA3A3
        A3F9F9F9F9F9F9616161848484FCFCFCFCFCFCCBCBCBF2F2F2F2F2F2F2F2F2F2
        F2F2F2F2F2F2F2F2F2F2F2F2F2F2C6C6C6FCFCFCFCFCFC717171979797D2D2D2
        E8E8E87D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D7D
        7DE8E8E8C4C4C46D6D6DDDDDDD9A9A9ACCCCCCC78B4EF9F4EDFEE8D8FEE8D7FD
        E5D3FCE4D1FAE0C7F9DDC3FAF4EDC7854AC3C3C3747474CDCDCDFFFFFFCECECE
        878787C5894CF9F4EFFEE7D7FDE7D5FCE6D2FBE1CCF8DCC2F6DABDFAF4EFC483
        48616161BCBCBCFFFFFFFFFFFFFFFFFFFBFBFBC68C4FF9F4F0FCE6D3FDE7D3FB
        E3CDFAE0C8F5D6BBF3D4B5F8F4F0C4854AF9F9F9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC88D51F9F5F1FCE3CFFCE4CFFAE1CAF9DDC4F4E9DFF7F2ECF5EFE9C380
        48FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC88D52F9F5F1FCE3CDFBE3CDF9
        E0C8F8DCC2FDFBF8FCE6CDE2B684D5A884FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC5884DF7F2ECF8F4EEF8F3EDF8F3EDF8F2ECF2E6D7E2B27DDB9569FDFB
        FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8CEB9D7AA7CC88C50C88C4FCA
        9155CB9055C5894DDDAF8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object Chart_HistoricoSensado: TChart
    Left = 0
    Top = 41
    Width = 1055
    Height = 472
    AllowPanning = pmNone
    BackImage.Inside = True
    Legend.Symbol.Squared = True
    Legend.Title.Text.Strings = (
      'Ref.')
    MarginLeft = 0
    MarginTop = 5
    Title.Font.Height = -13
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Hist'#243'rico de Sensado')
    BottomAxis.Title.Caption = 'Tiempo'
    BottomAxis.Title.Font.Height = -12
    BottomAxis.Title.Font.Style = [fsItalic]
    LeftAxis.Title.Caption = 'Valor'
    LeftAxis.Title.Font.Height = -12
    LeftAxis.Title.Font.Style = [fsItalic]
    View3D = False
    View3DOptions.Orthogonal = False
    View3DWalls = False
    Zoom.Allow = False
    Zoom.Animated = True
    Align = alTop
    BevelInner = bvLowered
    Color = clMenuBar
    TabOrder = 1
    AutoSize = True
    ExplicitTop = 39
    PrintMargins = (
      15
      28
      15
      28)
    object Series2: TLineSeries
      ColorEachPoint = True
      Depth = 0
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = False
      Title = 'Historico'
      Pointer.InflateMargins = False
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        00190000000000000000987C4000000000001875400000000000987740000000
        0000F0794000000000005876400000000000E075400000000000007940000000
        0000387D400000000000807B4000000000000881400000000000088140000000
        0000187F400000000000E4814000000000009C83400000000000E08540000000
        0000948640000000000068854000000000001885400000000000CC8540000000
        00003C84400000000000D081400000000000D482400000000000048040000000
        00003482400000000000088140}
    end
  end
end
