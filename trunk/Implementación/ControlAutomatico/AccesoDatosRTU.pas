unit AccesoDatosRTU;

interface

uses
  SysUtils, Classes, CommPort, tcp_udpport, ProtocolDriver, ModBusDriver,
  ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock, PLCBlock,
  ScktComp, Sockets, WinSock, Windows;
  // Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
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
    function EstaAbierto(Host: string; Puerto: Integer): Boolean;
  end;

var
  DM_AccesoDatosRTU: TDM_AccesoDatosRTU;

implementation

{$R *.dfm}

{ TDM_AccesoDatosRTU }

function TDM_AccesoDatosRTU.EstaAbierto(Host: string; Puerto: Integer): Boolean;
var
  WSAData: TWSADATA;
  Address: u_long;
  HostEnt: phostent;
  Addr: sockaddr_in;
  CSocket: Tsocket;
begin
  Result:= FALSE;
  if WSAStartup(MAKEWORD(1, 1), WSADATA) = 0 then
  begin
    Address:= inet_addr(Pchar(Host));
    if Address = INADDR_NONE then
    begin
      HostEnt:= gethostbyname(PChar(Host));
      if HostEnt <> nil then
        Address:= PInteger(HostEnt.h_addr_list^)^;
    end;
    if Address <> INADDR_NONE then
    begin
      CSocket:= socket(AF_INET, SOCK_STREAM, 0);
      if CSocket <> INVALID_SOCKET then
      begin
        Addr.sin_family:= AF_INET;
        Addr.sin_addr.S_addr:= Address;
        Addr.sin_port:= htons(Puerto);
        Result:= connect(CSocket, Addr, Sizeof(Addr)) <> SOCKET_ERROR;
        Closesocket(CSocket);
      end;
    end;
    WSACleanup;
  end;
end;

end.
