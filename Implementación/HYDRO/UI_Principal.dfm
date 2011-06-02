object frm_Principal: Tfrm_Principal
  Left = 0
  Top = 0
  Caption = 'HYDRO'
  ClientHeight = 580
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panel_Usuario: TPanel
    Left = 16
    Top = 8
    Width = 673
    Height = 105
    BevelInner = bvLowered
    Caption = 'panel_Usuario'
    TabOrder = 0
  end
  object panel_Alertas: TPanel
    Left = 16
    Top = 450
    Width = 673
    Height = 105
    BevelInner = bvLowered
    Caption = 'Alertas'
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 561
    Width = 721
    Height = 19
    Panels = <>
  end
  object BitBtn_Configuracion_EditarValores: TBitBtn
    Left = 512
    Top = 56
    Width = 99
    Height = 25
    Caption = 'Editar Valores...'
    TabOrder = 3
  end
  object PageControl: TcxPageControl
    Left = 16
    Top = 119
    Width = 673
    Height = 325
    ActivePage = tab_Configuracion
    TabOrder = 4
    ClientRectBottom = 325
    ClientRectRight = 673
    ClientRectTop = 24
    object tab_Control: TcxTabSheet
      Caption = 'Control'
      ImageIndex = 0
      ExplicitWidth = 289
      ExplicitHeight = 169
    end
    object tab_Historicos: TcxTabSheet
      Caption = 'Hist'#243'ricos'
      ImageIndex = 1
      ExplicitLeft = 32
      ExplicitTop = 96
    end
    object tab_Reportes: TcxTabSheet
      Caption = 'Reportes'
      ImageIndex = 2
    end
    object tab_Simulacion: TcxTabSheet
      Caption = 'Simulaci'#243'n'
      ImageIndex = 3
      ExplicitTop = 21
    end
    object tab_Configuracion: TcxTabSheet
      Caption = 'Configuraci'#243'n'
      ImageIndex = 4
    end
  end
end
