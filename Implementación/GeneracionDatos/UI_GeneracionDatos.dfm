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
        'Mucho'
        'Valor Fijo')
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
  object DBGrid1: TDBGrid
    Left = 606
    Top = 48
    Width = 339
    Height = 307
    DataSource = DS_Sensores
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
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
    OnTimer = TimerGeneracionTimer
    Left = 24
    Top = 124
  end
  object PLCBlock_RTU2: TPLCBlock
    TagGUID = '{F21E3504-B7C7-4012-B518-6BF1DB39B550}'
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
    Size = 21
    SyncWrites = True
    Left = 512
    Top = 33
  end
  object RTU2_ST10001: TPLCBlockElement
    TagGUID = '{6BB4D01B-756F-4135-AF91-CEE19A1AFD12}'
    PLCBlock = PLCBlock_RTU2
    Index = 0
    Left = 448
    Top = 65
  end
  object RTU2_ST10002: TPLCBlockElement
    TagGUID = '{5A798831-605E-445C-8553-041986388EEE}'
    PLCBlock = PLCBlock_RTU2
    Index = 1
    Left = 448
    Top = 97
  end
  object RTU2_AT10003: TPLCBlockElement
    TagGUID = '{F4CD7470-5C16-45AA-B70C-495F792BA308}'
    PLCBlock = PLCBlock_RTU2
    Index = 2
    Left = 448
    Top = 129
  end
  object RTU2_AT10004: TPLCBlockElement
    TagGUID = '{B6AEA738-B57D-493A-9DBA-594B6485E3EE}'
    PLCBlock = PLCBlock_RTU2
    Index = 3
    Left = 448
    Top = 161
  end
  object RTU2_ST10005: TPLCBlockElement
    TagGUID = '{11DD8031-67A7-4BAC-91B9-637D48F550BF}'
    PLCBlock = PLCBlock_RTU2
    Index = 4
    Left = 448
    Top = 193
  end
  object RTU2_AT10006: TPLCBlockElement
    TagGUID = '{6B3BD249-C8FC-4690-A8D9-81654D60977D}'
    PLCBlock = PLCBlock_RTU2
    Index = 5
    Left = 480
    Top = 65
  end
  object RTU2_AT10007: TPLCBlockElement
    TagGUID = '{7ECACFCE-1ED1-4D44-8A46-7D6AE883FEE6}'
    PLCBlock = PLCBlock_RTU2
    Index = 6
    Left = 480
    Top = 97
  end
  object RTU2_ST10008: TPLCBlockElement
    TagGUID = '{40E07825-907B-45FE-8325-2FEDAA6ACD4E}'
    PLCBlock = PLCBlock_RTU2
    Index = 7
    Left = 480
    Top = 129
  end
  object RTU2_ST10009: TPLCBlockElement
    TagGUID = '{1B076C7C-1CC2-4DC8-A2F3-E41742AC1CF6}'
    PLCBlock = PLCBlock_RTU2
    Index = 8
    Left = 480
    Top = 161
  end
  object RTU2_ST10010: TPLCBlockElement
    TagGUID = '{D0108BF7-5F6C-44CC-81C0-888AA24DF3CF}'
    PLCBlock = PLCBlock_RTU2
    Index = 9
    Left = 480
    Top = 193
  end
  object RTU2_AT10011: TPLCBlockElement
    TagGUID = '{3F5863AA-86DE-492C-9B8C-91B289766281}'
    PLCBlock = PLCBlock_RTU2
    Index = 10
    Left = 512
    Top = 65
  end
  object RTU2_ST10012: TPLCBlockElement
    TagGUID = '{0A99D121-2652-4847-8D68-D10B86B05137}'
    PLCBlock = PLCBlock_RTU2
    Index = 11
    Left = 512
    Top = 97
  end
  object RTU2_ST10013: TPLCBlockElement
    TagGUID = '{956BCF18-71A4-45C1-AA99-5788F6794CB8}'
    PLCBlock = PLCBlock_RTU2
    Index = 12
    Left = 512
    Top = 129
  end
  object RTU2_ST10014: TPLCBlockElement
    TagGUID = '{DA4516F0-7DA9-42CF-AC93-2E6C1B4C6304}'
    PLCBlock = PLCBlock_RTU2
    Index = 13
    Left = 512
    Top = 161
  end
  object RTU2_AT10015: TPLCBlockElement
    TagGUID = '{0946AEE2-6E41-41AD-AD46-89CCAE087248}'
    PLCBlock = PLCBlock_RTU2
    Index = 14
    Left = 512
    Top = 193
  end
  object RTU2_AT10016: TPLCBlockElement
    TagGUID = '{A75D22CC-40C9-444D-A6F3-436AC2547439}'
    PLCBlock = PLCBlock_RTU2
    Index = 15
    Left = 544
    Top = 65
  end
  object RTU2_AT10017: TPLCBlockElement
    TagGUID = '{AE8F86AF-7ADB-4AA9-A7F5-F4CAA91DF23D}'
    PLCBlock = PLCBlock_RTU2
    Index = 16
    Left = 544
    Top = 97
  end
  object RTU2_AT10018: TPLCBlockElement
    TagGUID = '{2038AFB5-E3B2-434F-96E4-16DAAAFA5FB7}'
    PLCBlock = PLCBlock_RTU2
    Index = 17
    Left = 544
    Top = 129
  end
  object RTU2_AT10019: TPLCBlockElement
    TagGUID = '{DB6C3F85-F90F-4864-B3B9-A1696E0B0553}'
    PLCBlock = PLCBlock_RTU2
    Index = 18
    Left = 544
    Top = 161
  end
  object RTU2_ST10020: TPLCBlockElement
    TagGUID = '{8CF5E3AD-CD4B-4398-8DC2-0F0505158235}'
    PLCBlock = PLCBlock_RTU2
    Index = 19
    Left = 544
    Top = 193
  end
  object RTU2_ST10021: TPLCBlockElement
    TagGUID = '{870F6C6A-BA25-4747-A105-098C903C6775}'
    PLCBlock = PLCBlock_RTU2
    Index = 20
    Left = 576
    Top = 65
  end
  object PLCBlock_RTU3: TPLCBlock
    TagGUID = '{93EA29A6-498D-4981-AE9A-C48E3920CD43}'
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
    Size = 2
    SyncWrites = True
    Left = 608
    Top = 32
  end
  object RTU3_ASA0002: TPLCBlockElement
    TagGUID = '{63E9CF73-2245-412A-B395-B32BFB889183}'
    PLCBlock = PLCBlock_RTU3
    Index = 1
    Left = 608
    Top = 96
  end
  object RTU3_SSA0001: TPLCBlockElement
    TagGUID = '{C50B11E5-15A1-4F4C-8EA3-C1D4217BABEA}'
    PLCBlock = PLCBlock_RTU3
    Index = 0
    Left = 608
    Top = 64
  end
  object PLCBlock_RTU1: TPLCBlock
    TagGUID = '{9323DC12-ACEF-41F6-9FC2-B72E302C804D}'
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
    Size = 5
    SyncWrites = True
    Left = 416
    Top = 32
  end
  object RTU1_SCC0001: TPLCBlockElement
    TagGUID = '{BB0CFBD1-8C93-4E13-A10E-2AC6980045AE}'
    PLCBlock = PLCBlock_RTU1
    Index = 0
    Left = 416
    Top = 64
  end
  object RTU1_SCC0002: TPLCBlockElement
    TagGUID = '{FEB9CA3C-4376-497F-A60C-9A5E9B07B5BE}'
    PLCBlock = PLCBlock_RTU1
    Index = 1
    Left = 416
    Top = 96
  end
  object RTU1_ACC0003: TPLCBlockElement
    TagGUID = '{270E8ACD-4E1F-4C9E-ABF5-D09753F2F0D7}'
    PLCBlock = PLCBlock_RTU1
    Index = 2
    Left = 416
    Top = 128
  end
  object RTU1_ACC0004: TPLCBlockElement
    TagGUID = '{BEF91A26-5724-4C8A-93BF-3F4EDAEE4490}'
    PLCBlock = PLCBlock_RTU1
    Index = 3
    Left = 416
    Top = 160
  end
  object RTU1_SCC0005: TPLCBlockElement
    TagGUID = '{134E1786-B331-418E-A16B-E83365776D1F}'
    PLCBlock = PLCBlock_RTU1
    Index = 4
    Left = 416
    Top = 192
  end
  object DS_Sensores: TDataSource
    AutoEdit = False
    DataSet = ADOTable_Sensor
    Left = 712
    Top = 8
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB'
    ConnectionTimeout = 0
    DefaultDatabase = #15552#6446#58220#18#35017#30271#34957#30271#46059#21358
    LoginPrompt = False
    Left = 648
    Top = 12
  end
  object ADOTable_Sensor: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    IndexName = 'PRIMARY'
    TableName = 'sensor'
    Left = 680
    Top = 8
  end
end
