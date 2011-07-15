object frm_GeneracionDatos: Tfrm_GeneracionDatos
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'HYDRO - Modulo de Generacion de Datos'
  ClientHeight = 360
  ClientWidth = 1000
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
  object Label8: TLabel
    Left = 384
    Top = 320
    Width = 31
    Height = 13
    Caption = 'Label8'
  end
  object HMILabel1: THMILabel
    Left = 384
    Top = 339
    Width = 47
    Height = 13
    NumberFormat = '#0.0'
  end
  object btn_ComenzarGeneracion: TButton
    Left = 232
    Top = 320
    Width = 121
    Height = 25
    Caption = 'Comenzar Generaci'#243'n'
    TabOrder = 0
    OnClick = btn_ComenzarGeneracionClick
  end
  object btn_DetenerGeneracion: TButton
    Left = 47
    Top = 320
    Width = 123
    Height = 25
    Caption = 'Detener Generaci'#243'n'
    Enabled = False
    TabOrder = 1
    OnClick = btn_DetenerGeneracionClick
  end
  object Panel4: TPanel
    Left = 8
    Top = 8
    Width = 201
    Height = 153
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Locked = True
    TabOrder = 2
    object Label4: TLabel
      Left = 64
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
    object Label5: TLabel
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
    object Label6: TLabel
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
    object Label7: TLabel
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
    object txt_Refresco: TEdit
      Left = 106
      Top = 37
      Width = 87
      Height = 21
      TabOrder = 0
      Text = '1000'
    end
    object txt_Host: TEdit
      Left = 106
      Top = 69
      Width = 87
      Height = 21
      TabOrder = 1
      Text = '127.0.0.1'
    end
    object txt_Puerto: TEdit
      Left = 106
      Top = 96
      Width = 87
      Height = 21
      TabOrder = 2
      Text = '502'
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 167
    Width = 392
    Height = 138
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object Label1: TLabel
      Left = 106
      Top = 2
      Width = 168
      Height = 16
      Caption = 'Tendencias de Generaci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object radioCaudalEntrada: TRadioGroup
      Left = 16
      Top = 24
      Width = 169
      Height = 105
      Caption = 'Caudal de Entrada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Poco'
        'Mucho')
      ParentFont = False
      TabOrder = 0
    end
    object radioRangoSensores: TRadioGroup
      Left = 207
      Top = 24
      Width = 162
      Height = 105
      Caption = 'Rango Sensores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Sin Problemas'
        'Alerta Leve'
        'Alerta Grave')
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 215
    Top = 8
    Width = 185
    Height = 153
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object Label2: TLabel
      Left = 32
      Top = 2
      Width = 129
      Height = 16
      Caption = 'Generaci'#243'n de Error'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 99
      Width = 84
      Height = 13
      Caption = 'Valor a Inserar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cmbSensor: TComboBox
      Left = 16
      Top = 24
      Width = 153
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cmbSensor'
    end
    object txtValorSensor: TEdit
      Left = 106
      Top = 96
      Width = 63
      Height = 21
      TabOrder = 1
      Text = 'txtValorSensor'
    end
    object Button3: TButton
      Left = 47
      Top = 118
      Width = 75
      Height = 25
      Caption = 'Insertar'
      TabOrder = 2
    end
    object memoDetalleSensor: TMemo
      Left = 16
      Top = 51
      Width = 153
      Height = 42
      Color = clGradientInactiveCaption
      Lines.Strings = (
        'memoDetalleSensor')
      TabOrder = 3
    end
  end
  object ModBusTCPDriver1: TModBusTCPDriver
    Tag = 1
    CommunicationPort = TCP_UDPPort1
    Left = 104
    Top = 124
  end
  object TCP_UDPPort1: TTCP_UDPPort
    Host = 'localhost'
    Port = 502
    Timeout = 0
    ExclusiveDevice = False
    Left = 64
    Top = 124
  end
  object TimerGeneracion: TTimer
    Enabled = False
    OnTimer = TimerGeneracionTimer
    Left = 24
    Top = 124
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB'
    ConnectionTimeout = 0
    DefaultDatabase = 'hydrodb'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 816
    Top = 44
  end
  object ADOTable_Sensor: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    IndexName = 'PRIMARY'
    TableName = 'sensor'
    Left = 848
    Top = 40
  end
  object RTU1_SCC0001: TPLCTagNumber
    TagGUID = '{3B90BA67-220C-479C-9CB7-50D8B8399BE8}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 1
    MemFile_DB = 0
    MemAddress = 0
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 416
    Top = 24
  end
  object RTU1_SCC0002: TPLCTagNumber
    TagGUID = '{3307ABDF-9FDD-428E-A32B-BD410BB28F41}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 1
    MemFile_DB = 0
    MemAddress = 1
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 416
    Top = 56
  end
  object RTU1_ACC0003: TPLCTagNumber
    TagGUID = '{E6F85AEC-D702-4449-BE5A-D65E20609F84}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 1
    MemFile_DB = 0
    MemAddress = 2
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 416
    Top = 88
  end
  object RTU1_ACC0004: TPLCTagNumber
    TagGUID = '{E08FBE43-AC87-4A78-9845-043B61194542}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 1
    MemFile_DB = 0
    MemAddress = 3
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 416
    Top = 120
  end
  object RTU1_SCC0005: TPLCTagNumber
    TagGUID = '{1ACE5EFD-A0C1-4801-AB61-E107A644F83D}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 1
    MemFile_DB = 0
    MemAddress = 4
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 416
    Top = 152
  end
  object RTU2_ST10001: TPLCTagNumber
    TagGUID = '{1ACE5EFD-A0C1-4801-AB61-E107A644F83D}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 0
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 488
    Top = 24
  end
  object RTU2_ST10002: TPLCTagNumber
    TagGUID = '{57448682-D726-4231-B54F-77687D09FC97}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 1
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 488
    Top = 56
  end
  object RTU2_AT10003: TPLCTagNumber
    TagGUID = '{06E2FBD0-2F2B-4E91-812A-5EA367797D18}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 2
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 488
    Top = 88
  end
  object RTU2_AT10004: TPLCTagNumber
    TagGUID = '{50B2B7AE-8E78-4E82-B7F7-3B5BAC0F0D6B}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 3
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 488
    Top = 120
  end
  object RTU2_ST10005: TPLCTagNumber
    TagGUID = '{B62C0C48-38CF-40D3-8CA5-0890D4BA5BFB}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 4
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 488
    Top = 152
  end
  object RTU2_AT10006: TPLCTagNumber
    TagGUID = '{1C842F8C-67DF-42ED-B299-C480723DE5DE}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 5
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 520
    Top = 24
  end
  object RTU2_AT10007: TPLCTagNumber
    TagGUID = '{A5784B31-1DAB-48F1-8E9D-BE896844B75B}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 6
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 520
    Top = 56
  end
  object RTU2_ST10008: TPLCTagNumber
    TagGUID = '{57924CBE-21A7-46D8-AB51-29554650C243}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 7
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 520
    Top = 88
  end
  object RTU2_ST10009: TPLCTagNumber
    TagGUID = '{F7F761E5-74D0-4FDC-A784-049560D0E972}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 8
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 520
    Top = 120
  end
  object RTU2_ST10010: TPLCTagNumber
    TagGUID = '{75369396-CFC7-42BC-B89F-B5BAE89B2F91}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 9
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 520
    Top = 152
  end
  object RTU2_AT10011: TPLCTagNumber
    TagGUID = '{4E1BA708-D958-4F95-A27A-77C04A4C1723}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 10
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 552
    Top = 24
  end
  object RTU2_ST10012: TPLCTagNumber
    TagGUID = '{76E1E425-FD11-4AE2-B1CB-854F8622F119}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 11
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 552
    Top = 56
  end
  object RTU2_ST10013: TPLCTagNumber
    TagGUID = '{80F3159D-591E-4333-9A76-093BD42344A0}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 12
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 552
    Top = 88
  end
  object RTU2_ST10014: TPLCTagNumber
    TagGUID = '{95131A9E-0887-4EA6-ABA0-D373ABB57EEE}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 13
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 552
    Top = 120
  end
  object RTU2_AT10015: TPLCTagNumber
    TagGUID = '{42E27FDA-21FD-4D00-BDD1-670414169E96}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 14
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 552
    Top = 152
  end
  object RTU2_AT10016: TPLCTagNumber
    TagGUID = '{B980D308-3A1B-485A-8A0E-6EFC365BDDC4}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 15
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 584
    Top = 24
  end
  object RTU2_AT10017: TPLCTagNumber
    TagGUID = '{0BEF21B8-1DF7-410D-977B-79A0BD53B92E}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 16
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 584
    Top = 56
  end
  object RTU2_AT10018: TPLCTagNumber
    TagGUID = '{1D7C95EE-29EE-4AA7-899A-1E8C2FBDEFED}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 17
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 584
    Top = 88
  end
  object RTU2_AT10019: TPLCTagNumber
    TagGUID = '{745839C4-E8B0-4D45-99C4-EE2EB210F3E9}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 18
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 584
    Top = 120
  end
  object RTU2_ST10020: TPLCTagNumber
    TagGUID = '{9F26CC02-DA61-4E7B-92DC-76E013923E6D}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 19
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 584
    Top = 152
  end
  object RTU2_ST10021: TPLCTagNumber
    TagGUID = '{9714D29B-9B08-4ADD-95D6-EFD5B9147AC2}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 2
    MemFile_DB = 0
    MemAddress = 20
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 624
    Top = 24
  end
  object RTU3_SSA0001: TPLCTagNumber
    TagGUID = '{E08FBE43-AC87-4A78-9845-043B61194542}'
    AutoRead = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 3
    MemFile_DB = 0
    MemAddress = 0
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 672
    Top = 24
  end
  object RTU3_ASA0002: TPLCTagNumber
    TagGUID = '{1ACE5EFD-A0C1-4801-AB61-E107A644F83D}'
    AutoWrite = False
    PLCRack = 0
    PLCSlot = 0
    PLCStation = 3
    MemFile_DB = 0
    MemAddress = 1
    MemSubElement = 0
    MemReadFunction = 3
    MemWriteFunction = 16
    ProtocolDriver = ModBusTCPDriver1
    Left = 672
    Top = 56
  end
end
