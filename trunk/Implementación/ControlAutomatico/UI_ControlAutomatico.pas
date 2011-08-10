unit UI_ControlAutomatico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Tag, PLCTag, TagBlock, PLCString, CommPort,
  tcp_udpport, ProtocolDriver, ModBusDriver, ModBusTCP, PLCBlock, ExtCtrls,
  HMILabel, PLCNumber, PLCBlockElement, HMIEdit, ComCtrls, HMIUpDown,
  HMIAnimation, HMICheckBox, ExtDlgs, ScktComp,


  Consigna, ClienteObservador, Secuencia;

type

  Tfrm_ControlAutomatico = class(TForm)
    TimerStatusBar: TTimer;
    StatusBar1: TStatusBar;
    PanelRTU1: TPanel;
    HMILabel2: THMILabel;
    HMILabel3: THMILabel;
    HMILabel4: THMILabel;
    HMILabel5: THMILabel;
    HMILabel6: THMILabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    HMILabel27: THMILabel;
    HMILabel28: THMILabel;
    Panel2: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    HMILabel1: THMILabel;
    HMILabel7: THMILabel;
    HMILabel8: THMILabel;
    HMILabel9: THMILabel;
    HMILabel10: THMILabel;
    HMILabel11: THMILabel;
    HMILabel12: THMILabel;
    HMILabel13: THMILabel;
    HMILabel14: THMILabel;
    HMILabel15: THMILabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    HMILabel16: THMILabel;
    HMILabel17: THMILabel;
    HMILabel18: THMILabel;
    HMILabel19: THMILabel;
    HMILabel20: THMILabel;
    HMILabel21: THMILabel;
    HMILabel22: THMILabel;
    HMILabel23: THMILabel;
    HMILabel24: THMILabel;
    HMILabel25: THMILabel;
    HMILabel26: THMILabel;
    Panel3: TPanel;
    Label37: TLabel;
    Panel4: TPanel;
    Label35: TLabel;
    btn_DesconectarBD: TButton;
    btn_ConectarBD: TButton;
    txt_Refresco: TEdit;
    Label1: TLabel;
    btn_ConectarRTU: TButton;
    btn_DesconectarRTU: TButton;
    Label2: TLabel;
    txt_Host: TEdit;
    Label3: TLabel;
    txt_Puerto: TEdit;
    txt_LogPath: TEdit;
    Label36: TLabel;
    chk_Log: TCheckBox;
    btn_SaveLog: TButton;
    SaveLogDialog: TSaveTextFileDialog;
    TimerGuardaDatos: TTimer;
    log: TMemo;
    Panel_SecuenciasConsignas: TPanel;
    Label40: TLabel;
    btn_ConsignaCaudal: TButton;
    btn_ConsignaVoltaje: TButton;
    btn_ConsignaManual: TButton;
    txtConsignaVoltaje: TEdit;
    txtConsignaCaudal: TEdit;
    Label38: TLabel;
    Label39: TLabel;
    btn_SecuenciaEncendido: TButton;
    btn_SecuenciaApagado: TButton;
    ServerSocket_GUIDesktop: TServerSocket;
    Button1: TButton;
   // procedure btn_CambiarDatosConexionClick(Sender: TObject);
   // procedure Button2Click(Sender: TObject);
   // procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerStatusBarTimer(Sender: TObject);
    procedure btn_SaveLogClick(Sender: TObject);
    procedure chk_LogClick(Sender: TObject);
    procedure btn_ConectarRTUClick(Sender: TObject);
    procedure btn_DesconectarRTUClick(Sender: TObject);
    procedure btn_ConectarBDClick(Sender: TObject);
    procedure btn_DesconectarBDClick(Sender: TObject);
    procedure TimerGuardaDatosTimer(Sender: TObject);
    procedure btn_SecuenciaEncendidoClick(Sender: TObject);


    procedure btn_SecuenciaApagadoClick(Sender: TObject);
    procedure btn_ConsignaCaudalClick(Sender: TObject);
    procedure btn_ConsignaVoltajeClick(Sender: TObject);
    procedure btn_ConsignaManualClick(Sender: TObject);
    procedure ServerSocket_GUIDesktopClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket_GUIDesktopClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket_GUIDesktopClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket_GUIDesktopClientWrite(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);


  private
    { Private declarations }
    cantRegistrosEscritos: int64;
    Observador: TClienteObservador;
    Consigna: TConsigna;
    Secuencia: TSecuencia;

  public
    { Public declarations }


  end;

var
  frm_ControlAutomatico: Tfrm_ControlAutomatico;

const ABIERTO=1; ENCENDIDO=1; ERROR=1;
		CERRADO=0; APAGADO=0;   CORRECTO=0;


implementation

{$R *.dfm}
uses 
  AccesoDatosRTU,AccesoDatosBD,AccesoDatosObservador;

//////////////////////////////////////////////////////
//////              FROM CREATE                ///////
//////////////////////////////////////////////////////
procedure Tfrm_ControlAutomatico.FormCreate(Sender: TObject);

begin
(*
   En el Form Create no se puede hacer esto xq al parecer aun no se crean estos componentes
    DM_AccesoDatosBD.ADOConnection1.Connected:= False;

    DM_AccesoDatosRTU.TCP_UDPPort1.Active:= False;
     DM_AccesoDatosObservador.ServerSocket1.Active:= true;
  *)
    TimerGuardaDatos.Enabled:= false;
    cantRegistrosEscritos:=0;

    // Activo la escucha de clientes
    ServerSocket_GUIDesktop.Active:= true;


    // Creo una consigna, deshabilitada
    Consigna := TConsigna.Create(True);
    Consigna.setDelay(2000);
    Consigna.LogEnable(log);
    Consigna.Priority:= tpHighest;


    // Creo un observador, deshabilitado
    Observador:= TClienteObservador.Create();
    Observador.active:= false;
end;


////////////////////////////////////////////////////////////////
/////          SERVER TCP SOCKET -> GUI DESKTOP             ////
////////////////////////////////////////////////////////////////

procedure Tfrm_ControlAutomatico.ServerSocket_GUIDesktopClientConnect(
  Sender: TObject; Socket: TCustomWinSocket);
begin
    // Se conecta un cliente
    log.Lines.Add('Se conect� un cliente! -> '+Socket.RemoteAddress);
    Observador.RemoteAdress:= Socket.RemoteAddress;
    Observador.RemotePort:= Socket.RemotePort;
    Observador.active:= true;
end;
    
procedure Tfrm_ControlAutomatico.ServerSocket_GUIDesktopClientDisconnect(
  Sender: TObject; Socket: TCustomWinSocket);
begin
    // Se desconecta un cliente
    log.Lines.Add('Se desconect� un cliente!'+Socket.RemoteAddress);
    Observador.active:= false;
end;

procedure Tfrm_ControlAutomatico.ServerSocket_GUIDesktopClientRead(
  Sender: TObject; Socket: TCustomWinSocket);
var mensaje: string;
    codFuncion,param, offset,valor: integer;
begin
    // Se recibe mensaje de un cliente
    mensaje:= socket.ReceiveText;
    log.Lines.Add('  < Recibido Mensaje de '+Socket.RemoteAddress+' -> '+mensaje);



    5555 agregar delimitador inicio y fin trama
    // Proceso los mensajes del cliente
    codFuncion:= strtoint(mensaje[1]+mensaje[2]);
    case codFuncion of

      1: // 01= Consigna de Caudal
      begin
          try
            param:= strtoint(Copy(mensaje, 3, length(mensaje)-3+1));
            Consigna.SetConsignaCaudal(param, true);
          except
            exit;
          end;
      end;

      2: // 02= Consigna de Voltaje
      begin
          try
            param:= strtoint(Copy(mensaje, 3, length(mensaje)-3+1));
            Consigna.SetConsignaVoltaje(param, true);
          except
            exit;
          end;
      end;

      3: // 03= Consigna Manual
      begin
          Consigna.SetConsignaManual;
      end;

      4: // 04= Secuencia Encendido
      begin
          Secuencia:= TSecuencia.Create();
          Secuencia.LogEnable(log);
          Secuencia.Priority:= tpHighest;
          Consigna.SetConsignaManual;
          Secuencia.EjecutarSecuencia(TSecuencia.ENCENDIDO);
      end;

      5: // 05= Secuencia Apagado
      begin
          Secuencia:= TSecuencia.Create();
          Secuencia.LogEnable(log);
          Secuencia.Priority:= tpHighest;
          Consigna.SetConsignaManual;
          Secuencia.EjecutarSecuencia(TSecuencia.APAGADO);
      end;

      6: // 06: Seteo de Actuador
      // Formato: 6<ID-RTU><DirMem Ej: 40002>VALOR    -->06140001
      begin
          offset:= strtoint(Copy(mensaje, 4, 5))-40001;
          valor:= strtoint(Copy(mensaje, 9, length(mensaje)-9+1));
          log.Lines.Add(' offset= '+inttostr(offset)+' valor= '+inttostr(valor));
          // Ojo que no verifico q se defase en funcion si es actuador gradual o binario
          if offset>0 then
          try
              case mensaje[3] of
                '1':begin
                  DM_AccesoDatosRTU.PLCBlock_RTU1.ValueRaw[offset]:= valor;
                end;
                '2':begin
                  DM_AccesoDatosRTU.PLCBlock_RTU2.ValueRaw[offset]:= valor;
                end;
                '3':begin
                  DM_AccesoDatosRTU.PLCBlock_RTU3.ValueRaw[offset]:= valor;
                end;
              end;
          except

          end;
      end;

    end;//CASE
end;

procedure Tfrm_ControlAutomatico.ServerSocket_GUIDesktopClientWrite(
  Sender: TObject; Socket: TCustomWinSocket);
begin
    // Se envia un mensaje al cliente
    log.Lines.Add('  > Enviando Mensaje a '+Socket.RemoteAddress+' -> ');
end;





procedure Tfrm_ControlAutomatico.btn_ConectarBDClick(Sender: TObject);
begin
    DM_AccesoDatosBD.ADOConnection1.Connected:= true;

    btn_ConectarBD.Enabled:= false;
    btn_DesconectarBD.Enabled:= true;

    // Disparo el timer si estoy recibiendo datos de la RTU
    if DM_AccesoDatosRTU.TCP_UDPPort1.Active then
      TimerGuardaDatos.Enabled:= true
    else
      TimerGuardaDatos.Enabled:= false;
end;

procedure Tfrm_ControlAutomatico.btn_DesconectarBDClick(Sender: TObject);
begin
    DM_AccesoDatosBD.ADOConnection1.Connected:= false;
    TimerGuardaDatos.Enabled:= false;

    btn_ConectarBD.Enabled:= true;
    btn_DesconectarBD.Enabled:= false;
end;

procedure Tfrm_ControlAutomatico.btn_SaveLogClick(Sender: TObject);
begin
 if SaveLogDialog.Execute() then
    begin
      txt_LogPath.Text:= SaveLogDialog.FileName;
    end;
end;


procedure Tfrm_ControlAutomatico.btn_ConectarRTUClick(Sender: TObject);
begin
    with DM_AccesoDatosRTU do
    begin
        // Capto la configuraci�n de la conexi�n
        TCP_UDPPort1.Host:= txt_Host.text;
        TCP_UDPPort1.Port:= strtoint(txt_Puerto.Text);
        PLCBlock_RTU1.RefreshTime:= strtoint(txt_Refresco.text);
        PLCBlock_RTU2.RefreshTime:= strtoint(txt_Refresco.text);
        PLCBlock_RTU3.RefreshTime:= strtoint(txt_Refresco.text);
        TimerGuardaDatos.Interval:= strtoint(txt_Refresco.text);

        if chk_Log.Checked then
          TCP_UDPPort1.LogFile:= txt_LogPath.text;
        TCP_UDPPort1.LogIOActions:= chk_Log.Checked;

        // Abro la conexi�n TCP/UDP
        TCP_UDPPort1.Active:= true;
    end;

    // Bloqueo los controles para setear configuraciones
    txt_Refresco.Enabled:= false;
    txt_Host.Enabled:= false;
    txt_Puerto.Enabled:= false;
    chk_Log.Enabled:= false;
    btn_ConectarRTU.Enabled:= false;
    btn_DesconectarRTU.Enabled:= true;

    // Disparo el timer si la DB esta activa
    if DM_AccesoDatosBD.ADOConnection1.Connected then
      TimerGuardaDatos.Enabled:= true
    else
      TimerGuardaDatos.Enabled:= false;

    Panel_SecuenciasConsignas.Enabled:= true;
      
end;

procedure Tfrm_ControlAutomatico.btn_ConsignaCaudalClick(Sender: TObject);
var t:integer;
begin
    try
       t:= StrToInt(txtConsignaCaudal.text);
       Consigna.SetConsignaCaudal(t,true);
    except
        exit;
    end;
end;

procedure Tfrm_ControlAutomatico.btn_ConsignaManualClick(Sender: TObject);
begin
    Consigna.SetConsignaManual;
end;

procedure Tfrm_ControlAutomatico.btn_ConsignaVoltajeClick(Sender: TObject);
var t:integer;
begin
    try
       t:= StrToInt(txtConsignaVoltaje.text);
       Consigna.SetConsignaVoltaje(t,true);
    except
        exit;
    end;
end;

 procedure Tfrm_ControlAutomatico.btn_DesconectarRTUClick(Sender: TObject);
begin
    // Detengo la guarda de datos en BD
    TimerGuardaDatos.Enabled:= false;

    // Cierro la conexi�n TCP/UDP
    DM_AccesoDatosRTU.TCP_UDPPort1.Active:= false;

    // Habilito los controles para setear configuraciones
    txt_Refresco.Enabled:= true;
    txt_Host.Enabled:= true;
    txt_Puerto.Enabled:= true;
    chk_Log.Enabled:= true;
    btn_ConectarRTU.Enabled:= true;
    btn_DesconectarRTU.Enabled:= false;

    Panel_SecuenciasConsignas.Enabled:= false;
end;




procedure Tfrm_ControlAutomatico.chk_LogClick(Sender: TObject);
begin
    if chk_Log.Checked then
      btn_SaveLog.Enabled:= true
    else
      btn_SaveLog.Enabled:= false;
end;




procedure Tfrm_ControlAutomatico.btn_SecuenciaApagadoClick(Sender: TObject);
begin
    // Creo una secuencia.
    Secuencia:= TSecuencia.Create();
    Secuencia.LogEnable(log);

    Consigna.SetConsignaManual;

    Secuencia.EjecutarSecuencia(TSecuencia.APAGADO);
   // Secuencia.Free;
end;

procedure Tfrm_ControlAutomatico.btn_SecuenciaEncendidoClick(Sender: TObject);
begin
    // Creo una secuencia.
    Secuencia:= TSecuencia.Create();
    Secuencia.LogEnable(log);

    Consigna.SetConsignaManual;

    Secuencia.EjecutarSecuencia(TSecuencia.ENCENDIDO);
  //  Secuencia.Free;
end;



procedure Tfrm_ControlAutomatico.Button1Click(Sender: TObject);
var mensaje:string;
codFuncion,param:integer;
begin
  // BOTON DE PRUEBA
    mensaje:= '0120000';
    codFuncion:= strtoint(mensaje[1]+mensaje[2]);
    param:= strtoint(Copy(mensaje, 3, length(mensaje)-3));
    showmessage('length='+inttostr(length(mensaje)));
    showmessage('codfuncion='+inttostr(codfuncion));
    showmessage('param='+inttostr(param));

end;

procedure Tfrm_ControlAutomatico.TimerGuardaDatosTimer(Sender: TObject);
begin
   with DM_AccesoDatosRTU do
   begin
     // Datos de la RTU #1
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40001,1,RTU1_SCC0001.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40002,1,RTU1_SCC0002.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40005,1,RTU1_SCC0005.Value);
    // Datos de la RTU #2
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40001,2,RTU2_ST10001.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40002,2,RTU2_ST10002.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40005,2,RTU2_ST10005.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40008,2,RTU2_ST10008.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40009,2,RTU2_ST10009.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40012,2,RTU2_ST10012.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40013,2,RTU2_ST10013.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40014,2,RTU2_ST10014.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40020,2,RTU2_ST10020.Value);
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40021,2,RTU2_ST10021.Value);
    // Datos de la RTU #3
      DM_AccesoDatosBD.SP_InsertarHistorialSensado(40001,3,RTU3_SSA0001.Value);
   end;
end;

procedure Tfrm_ControlAutomatico.TimerStatusBarTimer(Sender: TObject);
begin
   with DM_AccesoDatosRTU do
   begin
      StatusBar1.Panels[0].Text:= 'Com./seg: '+FormatFloat('#0',TCP_UDPPort1.CommandsPerSecond);
      StatusBar1.Panels[1].Text:= 'RX: '+FormatFloat('#0.0',TCP_UDPPort1.RXBytesSecond/1024)+' KB/s';
      StatusBar1.Panels[2].Text:= 'TX: '+FormatFloat('#0.0',TCP_UDPPort1.TXBytesSecond/1024)+' KB/s';
      StatusBar1.Panels[3].Text:= 'RX: '+FormatFloat('#0.0',TCP_UDPPort1.RXBytes/1024)+' KB';
      StatusBar1.Panels[4].Text:= 'TX: '+FormatFloat('#0.0',TCP_UDPPort1.TXBytes/1024)+' KB';
      StatusBar1.Panels[5].Text:= 'Reg: '+inttostr(cantRegistrosEscritos);
      StatusBar1.Panels[6].text:= 'BD Online: '+ BoolToStr(DM_AccesoDatosBD.ADOConnection1.Connected,true);
      StatusBar1.Panels[7].text:= 'RTU Online: '+ BoolToStr( TCP_UDPPort1.Active,true);
   end;
end;





{ TConsigna }



end.








(*
count:integer;
begin
count := ServerSocket1.Socket.ActiveConnections;
ShowMessage(IntToStr(Count));
end;

and when your sending text, you have to specify which connection your sending it to

begin
ServerSocket1.Socket.Connections[0].SendText('Blabla');
end;

*)
