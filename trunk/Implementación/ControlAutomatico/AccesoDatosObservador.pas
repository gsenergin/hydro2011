unit AccesoDatosObservador;

interface

uses
  SysUtils, Classes, ScktComp, Sockets;

type
  TDM_AccesoDatosObservador = class(TDataModule)
    UdpSocket1: TUdpSocket;
    ServerSocket1: TServerSocket;
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_AccesoDatosObservador: TDM_AccesoDatosObservador;

implementation

{$R *.dfm}

procedure TDM_AccesoDatosObservador.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    // Client Connect
end;

end.


  (*
procedure Tfrm_ControlAutomatico.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    log.Lines.Add('Se conectó un cliente! -> '+Socket.RemoteAddress);
    Observador.RemoteAdress:= Socket.RemoteAddress;
    Observador.RemotePort:= Socket.RemotePort;
    Observador.active:= true;
end;

procedure Tfrm_ControlAutomatico.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    log.Lines.Add('Se desconectó un cliente!'+Socket.RemoteAddress);
    Observador.active:= false;
end;

procedure Tfrm_ControlAutomatico.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    log.Lines.Add('  < Recibido Mensaje de '+Socket.RemoteAddress+' -> '+Socket.ReceiveText);
end;

procedure Tfrm_ControlAutomatico.ServerSocket1ClientWrite(Sender: TObject;
  Socket: TCustomWinSocket);
begin
    log.Lines.Add('  > Enviando Mensaje a '+Socket.RemoteAddress+' -> ');
end;
*)