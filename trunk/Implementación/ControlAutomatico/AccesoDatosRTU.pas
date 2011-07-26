unit AccesoDatosRTU;

interface

uses
  SysUtils, Classes, CommPort, tcp_udpport, ProtocolDriver, ModBusDriver,
  ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock, PLCBlock,
  ScktComp, Sockets;

type
  TDM_AccesoDatosRTU = class(TDataModule)
    PLCBlock_RTU2: TPLCBlock;
    RTU2_ST10001: TPLCBlockElement;
    RTU2_ST10002: TPLCBlockElement;
    RTU2_AT10003: TPLCBlockElement;
    RTU2_AT10004: TPLCBlockElement;
    RTU2_ST10005: TPLCBlockElement;
    RTU2_AT10006: TPLCBlockElement;
    RTU2_AT10007: TPLCBlockElement;
    RTU2_ST10008: TPLCBlockElement;
    RTU2_ST10009: TPLCBlockElement;
    RTU2_ST10010: TPLCBlockElement;
    RTU2_AT10011: TPLCBlockElement;
    RTU2_ST10012: TPLCBlockElement;
    RTU2_ST10013: TPLCBlockElement;
    RTU2_ST10014: TPLCBlockElement;
    RTU2_AT10015: TPLCBlockElement;
    RTU2_AT10016: TPLCBlockElement;
    RTU2_AT10017: TPLCBlockElement;
    RTU2_AT10018: TPLCBlockElement;
    RTU2_AT10019: TPLCBlockElement;
    RTU2_ST10020: TPLCBlockElement;
    RTU2_ST10021: TPLCBlockElement;
    PLCBlock_RTU3: TPLCBlock;
    RTU3_ASA0002: TPLCBlockElement;
    RTU3_SSA0001: TPLCBlockElement;
    PLCBlock_RTU1: TPLCBlock;
    RTU1_SCC0001: TPLCBlockElement;
    RTU1_SCC0002: TPLCBlockElement;
    RTU1_ACC0003: TPLCBlockElement;
    RTU1_ACC0004: TPLCBlockElement;
    RTU1_SCC0005: TPLCBlockElement;
    ModBusTCPDriver1: TModBusTCPDriver;
    TCP_UDPPort1: TTCP_UDPPort;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_AccesoDatosRTU: TDM_AccesoDatosRTU;

implementation

{$R *.dfm}

end.
