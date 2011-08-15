unit GestorComandosRemotos;

interface

uses
  SysUtils, Classes, ScktComp,
  Log, ClienteObservador, Consigna, Secuencia, AccesoDatosRTU;

type
  TDM_GestorComandosRemotos = class(TDataModule)
    ServerSocket_GUIDesktop: TServerSocket;
    procedure ServerSocket_GUIDesktopClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket_GUIDesktopClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket_GUIDesktopClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket_GUIDesktopClientWrite(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }

  public
    function getTramas(mensaje: string): TStringList;
    function procesarTramaTCP(codFuncion: integer; mensaje:string): boolean;
    { Public declarations }

  end;

var
  DM_GestorComandosRemotos: TDM_GestorComandosRemotos;

  Observador: TClienteObservador;

  Logger: TLog;

  Consigna: TConsigna;

  Secuencia: TSecuencia;


  

implementation

{$R *.dfm}


procedure TDM_GestorComandosRemotos.DataModuleCreate(Sender: TObject);
begin
    ServerSocket_GUIDesktop.Active:= true;

    // Creo un log, deshabilitado
    Logger:= TLog.Create();
    // Creo un observador, deshabilitado
    Observador:= TClienteObservador.Create(false);

    // Creo una consigna, deshabilitada, dely=2000ms, de alta prioridad
    Consigna := TConsigna.Create(True,2000,tpHighest);
end;




procedure TDM_GestorComandosRemotos.ServerSocket_GUIDesktopClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     // Evento: Se conecta un cliente
    Logger.LogWrite('Se conectó un cliente! -> '+Socket.RemoteAddress);

    // Registro al observador y lo activo
    Observador.Asignar(Socket.RemoteAddress,Socket.RemotePort, true);
end;

procedure TDM_GestorComandosRemotos.ServerSocket_GUIDesktopClientDisconnect(Sender: TObject;  Socket: TCustomWinSocket);
begin
    Logger.LogWrite('Se desconectó un cliente!'+Socket.RemoteAddress);
    // Desactivo al observador
    Observador.Desactivar;
end;

procedure TDM_GestorComandosRemotos.ServerSocket_GUIDesktopClientWrite(Sender: TObject;  Socket: TCustomWinSocket);
begin
    // Se envía un mensaje al Observador
    Logger.Logwrite('  > Enviando Mensaje a '+Socket.RemoteAddress+' -> ');
end;

procedure TDM_GestorComandosRemotos.ServerSocket_GUIDesktopClientRead(Sender: TObject;  Socket: TCustomWinSocket);
var mensaje, subtrama: string;
    j: integer;
    tramas: TStringList;
begin
    // Se recibe mensaje de un cliente
    mensaje:= socket.ReceiveText;
    Logger.Logwrite('  < Recibido Mensaje de '+Socket.RemoteAddress+' -> '+mensaje);

    //tramas := TStringList.Create;
    tramas := getTramas(mensaje);

    for j:=0 to tramas.Count-1 do
    begin
      subtrama:= tramas[j];
      // Proceso los mensajes del cliente
      procesarTramaTCP( strtoint(subtrama[1]+subtrama[2]) ,subtrama);
    end;

    tramas.Free;
end;



function TDM_GestorComandosRemotos.procesarTramaTCP(codFuncion: integer; mensaje:string): boolean;
var param, offset, valor: integer;
begin

    case codFuncion of
      1: // 01= Consigna de Caudal
      begin
          try
            param:= strtoint(Copy(mensaje, 3, length(mensaje)-3+1));
            Consigna.SetConsignaCaudal(param, true);
            Consigna.RUN;
          except
            result:= false;
          end;
      end;

      2: // 02= Consigna de Voltaje
      begin
          try
            param:= strtoint(Copy(mensaje, 3, length(mensaje)-3+1));
            Consigna.SetConsignaVoltaje(param, true);
            Consigna.RUN;
          except
            result:= false;
          end;
      end;

      3: // 03= Consigna Manual
      begin
          Consigna.SetConsignaManual;
      end;

      4: // 04= Secuencia Encendido
      begin
          try
            Consigna.SetConsignaManual;
            Secuencia:= TSecuencia.Create(TSecuencia.ENCENDIDO, tpHighest, true);
          except
             result:= false;
          end;
      end;

      5: // 05= Secuencia Apagado
      begin
          try
            Consigna.SetConsignaManual;
            Secuencia:= TSecuencia.Create(TSecuencia.APAGADO, tpHighest, true);
          except
             result:= false;
          end;
      end;

      6: // 06: Seteo de Actuador
      // Formato: 6<ID-RTU><DirMem Ej: 40002>VALOR    -->06140001
      begin
          offset:= strtoint(Copy(mensaje, 4, 5))-40001;
          valor:= strtoint(Copy(mensaje, 9, length(mensaje)-9+1));
          //Logger.LogWrite(' offset= '+inttostr(offset)+' valor= '+inttostr(valor));
          // Ojo que no verifico q se defase en funcion si es actuador gradual o binario
          if offset>0 then
          try
              case mensaje[3] of
                '1':DM_AccesoDatosRTU.PLCBlock_RTU1.ValueRaw[offset]:= valor;
                '2':DM_AccesoDatosRTU.PLCBlock_RTU2.ValueRaw[offset]:= valor;
                '3':DM_AccesoDatosRTU.PLCBlock_RTU3.ValueRaw[offset]:= valor;
              end;
          except
              result:= false;
          end;
      end;

    end;//CASE

    result:= true;
end;

function TDM_GestorComandosRemotos.getTramas(mensaje: string): TStringList;
var tramas: TStringList;
    j,posI,posF: integer;
    abierto:boolean;
begin
    // Divide una tramalarga en subtramas, en caso que se acumulen en el socket
    // Ej: trama -> #05200##01##03500# --> 05200; 01; 03500
    tramas := TStringList.Create;

    abierto:=false;
    for j:=1 to length(mensaje) do
        if mensaje[j]='#' then
        begin
            abierto:= not abierto;
            if abierto then
            begin
              posI:= j;
            end else
            begin
              posF:= j;
              tramas.Add( copy(mensaje,posI+1,posF-posI-1) );
            end;
        end;
    result:= tramas;
end;



end.


