object frm_ControlAutomatico: Tfrm_ControlAutomatico
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Modulo de Control Autom'#225'tico'
  ClientHeight = 344
  ClientWidth = 707
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
    Top = 321
    Width = 707
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
    ExplicitWidth = 1052
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
      PLCTag = RTU1_SCC0001
    end
    object HMILabel3: THMILabel
      Left = 96
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU1_SCC0002
    end
    object HMILabel4: THMILabel
      Left = 96
      Top = 90
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU1_ACC0003
    end
    object HMILabel5: THMILabel
      Left = 96
      Top = 115
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU1_ACC0004
    end
    object HMILabel6: THMILabel
      Left = 96
      Top = 140
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU1_SCC0005
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
      PLCTag = RTU3_SSA0001
    end
    object HMILabel28: THMILabel
      Left = 88
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU3_ASA0002
    end
  end
  object Panel2: TPanel
    Left = 149
    Top = 8
    Width = 300
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
      PLCTag = RTU2_ST10001
    end
    object HMILabel7: THMILabel
      Left = 87
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10002
    end
    object HMILabel8: THMILabel
      Left = 87
      Top = 90
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10003
    end
    object HMILabel9: THMILabel
      Left = 87
      Top = 115
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU1_ACC0004
    end
    object HMILabel10: THMILabel
      Left = 87
      Top = 140
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10005
    end
    object HMILabel11: THMILabel
      Left = 87
      Top = 165
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10006
    end
    object HMILabel12: THMILabel
      Left = 87
      Top = 190
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10007
    end
    object HMILabel13: THMILabel
      Left = 87
      Top = 215
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10008
    end
    object HMILabel14: THMILabel
      Left = 87
      Top = 240
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10009
    end
    object HMILabel15: THMILabel
      Left = 87
      Top = 265
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10010
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
      PLCTag = RTU2_AT10011
    end
    object HMILabel17: THMILabel
      Left = 239
      Top = 65
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10012
    end
    object HMILabel18: THMILabel
      Left = 239
      Top = 90
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10013
    end
    object HMILabel19: THMILabel
      Left = 239
      Top = 115
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10014
    end
    object HMILabel20: THMILabel
      Left = 239
      Top = 140
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10015
    end
    object HMILabel21: THMILabel
      Left = 239
      Top = 165
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10016
    end
    object HMILabel22: THMILabel
      Left = 239
      Top = 190
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10017
    end
    object HMILabel23: THMILabel
      Left = 239
      Top = 215
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10018
    end
    object HMILabel24: THMILabel
      Left = 239
      Top = 240
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_AT10019
    end
    object HMILabel25: THMILabel
      Left = 239
      Top = 265
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10020
    end
    object HMILabel26: THMILabel
      Left = 239
      Top = 290
      Width = 47
      Height = 13
      NumberFormat = '#0.0'
      PLCTag = RTU2_ST10021
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
  object Button1: TButton
    Left = 776
    Top = 5
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 6
    OnClick = Button1Click
  end
  object ModBusTCPDriver1: TModBusTCPDriver
    Tag = 1
    CommunicationPort = TCP_UDPPort1
    Left = 672
    Top = 84
  end
  object TCP_UDPPort1: TTCP_UDPPort
    Host = 'localhost'
    Port = 502
    Timeout = 0
    ExclusiveDevice = False
    Left = 672
    Top = 52
  end
  object TimerStatusBar: TTimer
    OnTimer = TimerStatusBarTimer
    Left = 672
    Top = 20
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB'
    ConnectionTimeout = 0
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 632
    Top = 244
  end
  object StoredProc_HistorialSensado_Insertar: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'HistorialSensado_Insertar'
    Parameters = <
      item
        Name = 'dirMem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'rtu_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'valor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 664
    Top = 244
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
    Left = 680
    Top = 212
  end
  object UdpSocket1: TUdpSocket
    BlockMode = bmNonBlocking
    LocalHost = '127.0.0.1'
    LocalPort = '9001'
    Left = 728
    Top = 48
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 9000
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 728
    Top = 16
  end
  object PLCBlock_RTU2: TPLCBlock
    TagGUID = '{F21E3504-B7C7-4012-B518-6BF1DB39B550}'
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 0
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Size = 21
    SyncWrites = True
    Left = 856
    Top = 73
  end
  object RTU2_ST10001: TPLCBlockElement
    TagGUID = '{6BB4D01B-756F-4135-AF91-CEE19A1AFD12}'
    PLCBlock = PLCBlock_RTU2
    Index = 0
    Left = 792
    Top = 105
  end
  object RTU2_ST10002: TPLCBlockElement
    TagGUID = '{5A798831-605E-445C-8553-041986388EEE}'
    PLCBlock = PLCBlock_RTU2
    Index = 1
    Left = 792
    Top = 137
  end
  object RTU2_AT10003: TPLCBlockElement
    TagGUID = '{F4CD7470-5C16-45AA-B70C-495F792BA308}'
    PLCBlock = PLCBlock_RTU2
    Index = 2
    Left = 792
    Top = 169
  end
  object RTU2_AT10004: TPLCBlockElement
    TagGUID = '{B6AEA738-B57D-493A-9DBA-594B6485E3EE}'
    PLCBlock = PLCBlock_RTU2
    Index = 3
    Left = 792
    Top = 201
  end
  object RTU2_ST10005: TPLCBlockElement
    TagGUID = '{11DD8031-67A7-4BAC-91B9-637D48F550BF}'
    PLCBlock = PLCBlock_RTU2
    Index = 4
    Left = 792
    Top = 233
  end
  object RTU2_AT10006: TPLCBlockElement
    TagGUID = '{6B3BD249-C8FC-4690-A8D9-81654D60977D}'
    PLCBlock = PLCBlock_RTU2
    Index = 5
    Left = 824
    Top = 105
  end
  object RTU2_AT10007: TPLCBlockElement
    TagGUID = '{7ECACFCE-1ED1-4D44-8A46-7D6AE883FEE6}'
    PLCBlock = PLCBlock_RTU2
    Index = 6
    Left = 824
    Top = 137
  end
  object RTU2_ST10008: TPLCBlockElement
    TagGUID = '{40E07825-907B-45FE-8325-2FEDAA6ACD4E}'
    PLCBlock = PLCBlock_RTU2
    Index = 7
    Left = 824
    Top = 169
  end
  object RTU2_ST10009: TPLCBlockElement
    TagGUID = '{1B076C7C-1CC2-4DC8-A2F3-E41742AC1CF6}'
    PLCBlock = PLCBlock_RTU2
    Index = 8
    Left = 824
    Top = 201
  end
  object RTU2_ST10010: TPLCBlockElement
    TagGUID = '{D0108BF7-5F6C-44CC-81C0-888AA24DF3CF}'
    PLCBlock = PLCBlock_RTU2
    Index = 9
    Left = 824
    Top = 233
  end
  object RTU2_AT10011: TPLCBlockElement
    TagGUID = '{3F5863AA-86DE-492C-9B8C-91B289766281}'
    PLCBlock = PLCBlock_RTU2
    Index = 10
    Left = 856
    Top = 105
  end
  object RTU2_ST10012: TPLCBlockElement
    TagGUID = '{0A99D121-2652-4847-8D68-D10B86B05137}'
    PLCBlock = PLCBlock_RTU2
    Index = 11
    Left = 856
    Top = 137
  end
  object RTU2_ST10013: TPLCBlockElement
    TagGUID = '{956BCF18-71A4-45C1-AA99-5788F6794CB8}'
    PLCBlock = PLCBlock_RTU2
    Index = 12
    Left = 856
    Top = 169
  end
  object RTU2_ST10014: TPLCBlockElement
    TagGUID = '{DA4516F0-7DA9-42CF-AC93-2E6C1B4C6304}'
    PLCBlock = PLCBlock_RTU2
    Index = 13
    Left = 856
    Top = 201
  end
  object RTU2_AT10015: TPLCBlockElement
    TagGUID = '{0946AEE2-6E41-41AD-AD46-89CCAE087248}'
    PLCBlock = PLCBlock_RTU2
    Index = 14
    Left = 856
    Top = 233
  end
  object RTU2_AT10016: TPLCBlockElement
    TagGUID = '{A75D22CC-40C9-444D-A6F3-436AC2547439}'
    PLCBlock = PLCBlock_RTU2
    Index = 15
    Left = 888
    Top = 105
  end
  object RTU2_AT10017: TPLCBlockElement
    TagGUID = '{AE8F86AF-7ADB-4AA9-A7F5-F4CAA91DF23D}'
    PLCBlock = PLCBlock_RTU2
    Index = 16
    Left = 888
    Top = 137
  end
  object RTU2_AT10018: TPLCBlockElement
    TagGUID = '{2038AFB5-E3B2-434F-96E4-16DAAAFA5FB7}'
    PLCBlock = PLCBlock_RTU2
    Index = 17
    Left = 888
    Top = 169
  end
  object RTU2_AT10019: TPLCBlockElement
    TagGUID = '{DB6C3F85-F90F-4864-B3B9-A1696E0B0553}'
    PLCBlock = PLCBlock_RTU2
    Index = 18
    Left = 888
    Top = 201
  end
  object RTU2_ST10020: TPLCBlockElement
    TagGUID = '{8CF5E3AD-CD4B-4398-8DC2-0F0505158235}'
    PLCBlock = PLCBlock_RTU2
    Index = 19
    Left = 888
    Top = 233
  end
  object RTU2_ST10021: TPLCBlockElement
    TagGUID = '{870F6C6A-BA25-4747-A105-098C903C6775}'
    PLCBlock = PLCBlock_RTU2
    Index = 20
    Left = 920
    Top = 105
  end
  object PLCBlock_RTU3: TPLCBlock
    TagGUID = '{93EA29A6-498D-4981-AE9A-C48E3920CD43}'
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 3
    MemFile_DB = 0
    MemAddress = 0
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Size = 2
    SyncWrites = True
    Left = 1008
    Top = 72
  end
  object RTU3_ASA0002: TPLCBlockElement
    TagGUID = '{63E9CF73-2245-412A-B395-B32BFB889183}'
    PLCBlock = PLCBlock_RTU3
    Index = 1
    Left = 1008
    Top = 136
  end
  object RTU3_SSA0001: TPLCBlockElement
    TagGUID = '{C50B11E5-15A1-4F4C-8EA3-C1D4217BABEA}'
    PLCBlock = PLCBlock_RTU3
    Index = 0
    Left = 1008
    Top = 104
  end
  object PLCBlock_RTU1: TPLCBlock
    TagGUID = '{9323DC12-ACEF-41F6-9FC2-B72E302C804D}'
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 1
    MemFile_DB = 0
    MemAddress = 0
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Size = 5
    SyncWrites = True
    Left = 960
    Top = 72
  end
  object RTU1_SCC0001: TPLCBlockElement
    TagGUID = '{BB0CFBD1-8C93-4E13-A10E-2AC6980045AE}'
    PLCBlock = PLCBlock_RTU1
    Index = 0
    Left = 960
    Top = 104
  end
  object RTU1_SCC0002: TPLCBlockElement
    TagGUID = '{FEB9CA3C-4376-497F-A60C-9A5E9B07B5BE}'
    PLCBlock = PLCBlock_RTU1
    Index = 1
    Left = 960
    Top = 136
  end
  object RTU1_ACC0003: TPLCBlockElement
    TagGUID = '{270E8ACD-4E1F-4C9E-ABF5-D09753F2F0D7}'
    PLCBlock = PLCBlock_RTU1
    Index = 2
    Left = 960
    Top = 168
  end
  object RTU1_ACC0004: TPLCBlockElement
    TagGUID = '{BEF91A26-5724-4C8A-93BF-3F4EDAEE4490}'
    PLCBlock = PLCBlock_RTU1
    Index = 3
    Left = 960
    Top = 200
  end
  object RTU1_SCC0005: TPLCBlockElement
    TagGUID = '{134E1786-B331-418E-A16B-E83365776D1F}'
    PLCBlock = PLCBlock_RTU1
    Index = 4
    Left = 960
    Top = 232
  end
end
