object frm_ABMUsuarios: Tfrm_ABMUsuarios
  Left = 0
  Top = 0
  Caption = 'Agregar Usuario'
  ClientHeight = 243
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object txt_NombreUsuario: TcxTextEdit
    Left = 35
    Top = 46
    Properties.OnChange = txt_NombreUsuarioPropertiesChange
    TabOrder = 0
    Width = 142
  end
  object cxLabel2: TcxLabel
    Left = 35
    Top = 135
    Caption = 'Tipo de Usuario'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel1: TcxLabel
    Left = 35
    Top = 23
    Caption = 'Nombre de Usuario'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object btnAgregar: TBitBtn
    Left = 120
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Agregar'
    TabOrder = 3
    OnClick = btnAgregarClick
    Kind = bkYes
  end
  object btnCancelar: TBitBtn
    Left = 24
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    Kind = bkCancel
  end
  object txt_ClaveInicial: TcxTextEdit
    Left = 35
    Top = 102
    Enabled = False
    TabOrder = 5
    Width = 142
  end
  object cxLabel3: TcxLabel
    Left = 35
    Top = 79
    Caption = 'Clave Inicial'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cmb_TipoUsuario: TcxComboBox
    Left = 35
    Top = 160
    TabOrder = 7
    Text = 'cmb_TipoUsuario'
    Width = 142
  end
  object cmb_IDTipoUsuario: TComboBox
    Left = 132
    Top = 133
    Width = 49
    Height = 21
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 8
    Text = 'cmb_IDTipoUsuario'
    Visible = False
  end
end
