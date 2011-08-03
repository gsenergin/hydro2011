object frm_ControlAutomatico: Tfrm_ControlAutomatico
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Modulo de Control Autom'#225'tico'
  ClientHeight = 511
  ClientWidth = 880
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 488
    Width = 880
    Height = 23
    BorderWidth = 1
    Color = clGray
    Panels = <
      item
        Width = 80
      end
      item
        Width = 100
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 80
      end
      item
        Width = 105
      end
      item
        Width = 105
      end>
    ExplicitWidth = 957
  end
  object PanelRTU1: TPanel
    Left = 8
    Top = 8
    Width = 149
    Height = 193
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 1
    object HMILabel2: THMILabel
      Left = 96
      Top = 40
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU1_SCC0001
    end
    object HMILabel3: THMILabel
      Left = 96
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU1_SCC0002
    end
    object HMILabel4: THMILabel
      Left = 96
      Top = 90
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU1_ACC0003
    end
    object HMILabel5: THMILabel
      Left = 96
      Top = 115
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU1_ACC0004
    end
    object HMILabel6: THMILabel
      Left = 96
      Top = 140
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU1_SCC0005
    end
    object Label4: TLabel
      Left = 8
      Top = 40
      Width = 52
      Height = 13
      Caption = 'SCC 0001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 65
      Width = 52
      Height = 13
      Caption = 'SCC 0002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 90
      Width = 53
      Height = 13
      Caption = 'ACC 0003'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 8
      Top = 115
      Width = 53
      Height = 13
      Caption = 'ACC 0004'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 140
      Width = 52
      Height = 13
      Caption = 'SCC 0005'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 48
      Top = 2
      Width = 55
      Height = 16
      Caption = 'RTU N'#186' 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 198
    Width = 149
    Height = 121
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 2
    object Label10: TLabel
      Left = 8
      Top = 40
      Width = 53
      Height = 13
      Caption = 'SSA 0001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 65
      Width = 54
      Height = 13
      Caption = 'ASA 0002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 48
      Top = 0
      Width = 55
      Height = 16
      Caption = 'RTU N'#186' 3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object HMILabel27: THMILabel
      Left = 88
      Top = 38
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU3_SSA0001
    end
    object HMILabel28: THMILabel
      Left = 88
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU3_ASA0002
    end
  end
  object Panel2: TPanel
    Left = 157
    Top = 8
    Width = 292
    Height = 312
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 3
    object Label12: TLabel
      Left = 8
      Top = 40
      Width = 52
      Height = 13
      Caption = 'ST1 0001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 9
      Top = 65
      Width = 52
      Height = 13
      Caption = 'ST1 0002'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 90
      Width = 53
      Height = 13
      Caption = 'AT1 0003'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 8
      Top = 115
      Width = 53
      Height = 13
      Caption = 'AT1 0004'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 8
      Top = 140
      Width = 52
      Height = 13
      Caption = 'ST1 0005'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 87
      Top = 2
      Width = 118
      Height = 16
      Caption = 'RTU N'#186' 2 (turbina)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 9
      Top = 165
      Width = 53
      Height = 13
      Caption = 'AT1 0006'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 9
      Top = 190
      Width = 53
      Height = 13
      Caption = 'AT1 0007'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 10
      Top = 240
      Width = 52
      Height = 13
      Caption = 'ST1 0009'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 10
      Top = 215
      Width = 52
      Height = 13
      Caption = 'ST1 0008'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 10
      Top = 265
      Width = 52
      Height = 13
      Caption = 'ST1 0010'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object HMILabel1: THMILabel
      Left = 87
      Top = 40
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10001
    end
    object HMILabel7: THMILabel
      Left = 87
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10002
    end
    object HMILabel8: THMILabel
      Left = 87
      Top = 90
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10003
    end
    object HMILabel9: THMILabel
      Left = 87
      Top = 115
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10004
    end
    object HMILabel10: THMILabel
      Left = 87
      Top = 140
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10005
    end
    object HMILabel11: THMILabel
      Left = 87
      Top = 165
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10006
    end
    object HMILabel12: THMILabel
      Left = 87
      Top = 190
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10007
    end
    object HMILabel13: THMILabel
      Left = 87
      Top = 215
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10008
    end
    object HMILabel14: THMILabel
      Left = 87
      Top = 240
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10009
    end
    object HMILabel15: THMILabel
      Left = 87
      Top = 265
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10010
    end
    object Label24: TLabel
      Left = 160
      Top = 40
      Width = 53
      Height = 13
      Caption = 'AT1 0011'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 160
      Top = 65
      Width = 52
      Height = 13
      Caption = 'ST1 0012'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label26: TLabel
      Left = 160
      Top = 90
      Width = 52
      Height = 13
      Caption = 'ST1 0013'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label27: TLabel
      Left = 160
      Top = 115
      Width = 52
      Height = 13
      Caption = 'ST1 0014'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 160
      Top = 165
      Width = 53
      Height = 13
      Caption = 'AT1 0016'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label29: TLabel
      Left = 160
      Top = 140
      Width = 53
      Height = 13
      Caption = 'AT1 0015'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label30: TLabel
      Left = 160
      Top = 215
      Width = 53
      Height = 13
      Caption = 'AT1 0018'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label31: TLabel
      Left = 160
      Top = 190
      Width = 53
      Height = 13
      Caption = 'AT1 0017'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label32: TLabel
      Left = 160
      Top = 240
      Width = 53
      Height = 13
      Caption = 'AT1 0019'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label33: TLabel
      Left = 160
      Top = 290
      Width = 52
      Height = 13
      Caption = 'ST1 0021'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label34: TLabel
      Left = 160
      Top = 265
      Width = 52
      Height = 13
      Caption = 'ST1 0020'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object HMILabel16: THMILabel
      Left = 239
      Top = 40
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10011
    end
    object HMILabel17: THMILabel
      Left = 239
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10012
    end
    object HMILabel18: THMILabel
      Left = 239
      Top = 90
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10013
    end
    object HMILabel19: THMILabel
      Left = 239
      Top = 115
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10014
    end
    object HMILabel20: THMILabel
      Left = 239
      Top = 140
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10015
    end
    object HMILabel21: THMILabel
      Left = 239
      Top = 165
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10016
    end
    object HMILabel22: THMILabel
      Left = 239
      Top = 190
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10017
    end
    object HMILabel23: THMILabel
      Left = 239
      Top = 215
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10018
    end
    object HMILabel24: THMILabel
      Left = 239
      Top = 240
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_AT10019
    end
    object HMILabel25: THMILabel
      Left = 240
      Top = 265
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10020
    end
    object HMILabel26: THMILabel
      Left = 239
      Top = 290
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = DM_AccesoDatosRTU.RTU2_ST10021
    end
  end
  object Panel3: TPanel
    Left = 455
    Top = 237
    Width = 250
    Height = 82
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 4
    object Label37: TLabel
      Left = 72
      Top = 0
      Width = 93
      Height = 16
      Caption = 'Base de Datos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_DesconectarBD: TButton
      Left = 129
      Top = 38
      Width = 96
      Height = 25
      Caption = 'Desconectar BD'
      Enabled = False
      TabOrder = 0
      OnClick = btn_DesconectarBDClick
    end
    object btn_ConectarBD: TButton
      Left = 21
      Top = 39
      Width = 92
      Height = 25
      Caption = 'Conectar BD'
      TabOrder = 1
      OnClick = btn_ConectarBDClick
    end
  end
  object Panel4: TPanel
    Left = 455
    Top = 8
    Width = 250
    Height = 223
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 5
    object Label35: TLabel
      Left = 96
      Top = 0
      Width = 63
      Height = 16
      Caption = 'RTU / PLC'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 12
      Top = 40
      Width = 80
      Height = 13
      Caption = 'Refresco [ms]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 72
      Width = 65
      Height = 13
      Caption = 'Host (IPv4)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 12
      Top = 99
      Width = 38
      Height = 13
      Caption = 'Puerto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label36: TLabel
      Left = 12
      Top = 131
      Width = 42
      Height = 13
      Caption = 'Log I/O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object txt_Refresco: TEdit
      Left = 106
      Top = 37
      Width = 87
      Height = 21
      TabOrder = 0
      Text = '1000'
    end
    object btn_ConectarRTU: TButton
      Left = 20
      Top = 185
      Width = 93
      Height = 25
      Caption = 'Conectar RTU'
      TabOrder = 1
      OnClick = btn_ConectarRTUClick
    end
    object btn_DesconectarRTU: TButton
      Left = 132
      Top = 185
      Width = 93
      Height = 25
      Caption = 'Desconectar RTU'
      Enabled = False
      TabOrder = 2
      OnClick = btn_DesconectarRTUClick
    end
    object txt_Host: TEdit
      Left = 106
      Top = 69
      Width = 87
      Height = 21
      TabOrder = 3
      Text = '127.0.0.1'
    end
    object txt_Puerto: TEdit
      Left = 106
      Top = 96
      Width = 87
      Height = 21
      TabOrder = 4
      Text = '502'
    end
    object txt_LogPath: TEdit
      Left = 8
      Top = 150
      Width = 185
      Height = 21
      ReadOnly = True
      TabOrder = 5
      Text = 'c:\HydroDBLog.txt'
    end
    object chk_Log: TCheckBox
      Left = 107
      Top = 130
      Width = 17
      Height = 17
      TabOrder = 6
      OnClick = chk_LogClick
    end
    object btn_SaveLog: TButton
      Left = 199
      Top = 150
      Width = 30
      Height = 24
      Caption = '...'
      Enabled = False
      TabOrder = 7
      OnClick = btn_SaveLogClick
    end
  end
  object log: TMemo
    Left = 8
    Top = 326
    Width = 441
    Height = 155
    BevelInner = bvLowered
    BevelKind = bkSoft
    Color = clInactiveCaption
    Lines.Strings = (
      'log')
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object Panel_SecuenciasConsignas: TPanel
    Left = 455
    Top = 325
    Width = 250
    Height = 157
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Enabled = False
    Locked = True
    TabOrder = 7
    object Label40: TLabel
      Left = 56
      Top = 0
      Width = 151
      Height = 16
      Caption = 'Secuencias - Consignas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label38: TLabel
      Left = 8
      Top = 72
      Width = 98
      Height = 13
      Caption = 'Caudal Turbinado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label39: TLabel
      Left = 9
      Top = 99
      Width = 98
      Height = 13
      Caption = 'Voltaje Generado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_ConsignaCaudal: TButton
      Left = 175
      Top = 65
      Width = 65
      Height = 25
      Caption = 'Set Caudal'
      TabOrder = 0
      OnClick = btn_ConsignaCaudalClick
    end
    object btn_ConsignaVoltaje: TButton
      Left = 175
      Top = 92
      Width = 65
      Height = 25
      Caption = 'Set Voltaje'
      TabOrder = 1
      OnClick = btn_ConsignaVoltajeClick
    end
    object btn_ConsignaManual: TButton
      Left = 175
      Top = 123
      Width = 65
      Height = 25
      Caption = 'Set Manual'
      TabOrder = 2
      OnClick = btn_ConsignaManualClick
    end
    object txtConsignaVoltaje: TEdit
      Left = 113
      Top = 96
      Width = 56
      Height = 21
      TabOrder = 3
    end
    object txtConsignaCaudal: TEdit
      Left = 112
      Top = 69
      Width = 57
      Height = 21
      TabOrder = 4
    end
    object btn_SecuenciaEncendido: TButton
      Left = 23
      Top = 22
      Width = 99
      Height = 25
      Caption = 'Sec. de Encendido'
      TabOrder = 5
      OnClick = btn_SecuenciaEncendidoClick
    end
    object btn_SecuenciaApagado: TButton
      Left = 136
      Top = 22
      Width = 97
      Height = 25
      Caption = 'Sec. de Apagado'
      TabOrder = 6
      OnClick = btn_SecuenciaApagadoClick
    end
  end
  object TimerStatusBar: TTimer
    OnTimer = TimerStatusBarTimer
    Left = 672
    Top = 20
  end
  object SaveLogDialog: TSaveTextFileDialog
    DefaultExt = 'txt'
    Title = 'Log de Entrada y Salida'
    Left = 624
    Top = 156
  end
  object TimerGuardaDatos: TTimer
    Enabled = False
    OnTimer = TimerGuardaDatosTimer
    Left = 664
    Top = 228
  end
  object ServerSocket_GUIDesktop: TServerSocket
    Active = False
    Port = 9000
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket_GUIDesktopClientConnect
    OnClientDisconnect = ServerSocket_GUIDesktopClientDisconnect
    OnClientRead = ServerSocket_GUIDesktopClientRead
    OnClientWrite = ServerSocket_GUIDesktopClientWrite
    Left = 672
    Top = 64
  end
end
