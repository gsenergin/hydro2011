object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'MODBUS sobre TCP-IP'
  ClientHeight = 558
  ClientWidth = 1076
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 12
    Top = 392
    Width = 15
    Height = 13
    Caption = 'Rx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 12
    Top = 230
    Width = 14
    Height = 13
    Caption = 'Tx'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCodFuncion: TLabel
    Left = 483
    Top = 23
    Width = 88
    Height = 13
    Caption = 'Codigo de Funci'#243'n'
    Enabled = False
  end
  object Label4: TLabel
    Left = 163
    Top = 104
    Width = 93
    Height = 13
    Caption = 'Log Puerto Serie'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 53
    Top = 20
    Width = 39
    Height = 13
    Caption = 'TCP/IP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object memoTX: TMemo
    Left = 12
    Top = 249
    Width = 607
    Height = 137
    BevelInner = bvLowered
    BevelKind = bkSoft
    Color = clGradientActiveCaption
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object memoRX: TMemo
    Left = 12
    Top = 411
    Width = 608
    Height = 137
    BevelInner = bvLowered
    BevelKind = bkSoft
    Color = clGradientActiveCaption
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 729
    Top = 23
    Width = 329
    Height = 531
    DefaultColWidth = 60
    FixedCols = 0
    RowCount = 10
    TabOrder = 2
  end
  object formatoTX: TRadioGroup
    Left = 626
    Top = 249
    Width = 89
    Height = 115
    Caption = 'Formato Log TX'
    ItemIndex = 0
    Items.Strings = (
      'Decimal'
      'Binario'
      'Hexadecimal')
    TabOrder = 3
    OnClick = formatoTXClick
  end
  object formatoRX: TRadioGroup
    Left = 626
    Top = 411
    Width = 89
    Height = 113
    Caption = 'Formato Log RX'
    ItemIndex = 0
    Items.Strings = (
      'Decimal'
      'Binario'
      'Hexadecimal')
    TabOrder = 4
    OnClick = formatoRXClick
  end
  object btnLimpiarTX: TButton
    Left = 625
    Top = 370
    Width = 90
    Height = 25
    Caption = 'Limpiar'
    TabOrder = 5
    OnClick = btnLimpiarTXClick
  end
  object btnLimpiarRX: TButton
    Left = 626
    Top = 530
    Width = 89
    Height = 25
    Caption = 'Limpiar'
    TabOrder = 6
    OnClick = btnLimpiarRXClick
  end
  object LE_MBSlave: TLabeledEdit
    Left = 163
    Top = 39
    Width = 41
    Height = 21
    EditLabel.Width = 83
    EditLabel.Height = 13
    EditLabel.Caption = 'ID Slave (1~255)'
    Enabled = False
    TabOrder = 7
    Text = '1'
  end
  object LE_MBDirMem: TLabeledEdit
    Left = 259
    Top = 39
    Width = 105
    Height = 21
    EditLabel.Width = 101
    EditLabel.Height = 13
    EditLabel.Caption = 'Direcci'#243'n de Memoria'
    Enabled = False
    TabOrder = 8
    Text = '0000'
  end
  object LE_MBCantidadRegistros: TLabeledEdit
    Left = 379
    Top = 39
    Width = 89
    Height = 21
    EditLabel.Width = 91
    EditLabel.Height = 13
    EditLabel.Caption = 'Cantidad Registros'
    Enabled = False
    TabOrder = 9
    Text = '01'
  end
  object combo_MBFuncion: TComboBox
    Left = 483
    Top = 39
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Text = '03: HOLDING REGISTER'
    OnChange = combo_MBFuncionChange
    Items.Strings = (
      '03: HOLDING REGISTER'
      '06: WRITE SINGLE REGISTER'
      '16: WRITE MULTIPLE REGISTER')
  end
  object btn_Solicitar: TButton
    Left = 634
    Top = 32
    Width = 75
    Height = 25
    Caption = 'Solicitar'
    Enabled = False
    TabOrder = 11
    OnClick = btn_SolicitarClick
  end
  object LE_MBValor: TLabeledEdit
    Left = 163
    Top = 79
    Width = 465
    Height = 21
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor'
    Enabled = False
    TabOrder = 12
    Text = '0'
    Visible = False
  end
  object memoPort: TMemo
    Left = 163
    Top = 120
    Width = 552
    Height = 104
    BevelInner = bvLowered
    BevelKind = bkSoft
    Color = clMoneyGreen
    ScrollBars = ssVertical
    TabOrder = 13
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 137
    Height = 216
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvNone
    Color = clMenuBar
    Enabled = False
    TabOrder = 14
    object LE_IPAdress: TLabeledEdit
      Left = 22
      Top = 48
      Width = 85
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = 'IP Adress'
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object LE_Puerto: TLabeledEdit
      Left = 22
      Top = 94
      Width = 85
      Height = 21
      EditLabel.Width = 32
      EditLabel.Height = 13
      EditLabel.Caption = 'Puerto'
      TabOrder = 1
      Text = '502'
    end
  end
  object btn_Conectar: TButton
    Left = 40
    Top = 174
    Width = 75
    Height = 25
    Caption = 'Conectar'
    TabOrder = 15
    OnClick = btn_ConectarClick
  end
  object TCPSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    Left = 664
    Top = 72
  end
end
