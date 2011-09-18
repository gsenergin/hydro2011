unit UI_ControlAutomatico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Tag, PLCTag, TagBlock, PLCString, CommPort,
  tcp_udpport, ProtocolDriver, ModBusDriver, ModBusTCP, PLCBlock, ExtCtrls,
  HMILabel, PLCNumber, PLCBlockElement, HMIEdit, ComCtrls, HMIUpDown,
  HMIAnimation, HMICheckBox, ExtDlgs, ScktComp,
  GestorComandosRemotos,
  ClienteObservador, Dialogs,
  Log,
  ThreadGuardarDatos;

type

  Tfrm_ControlAutomatico = class(TForm)
  {$REGION 'BOTONES DEL FORM'}
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

    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure TimerStatusBarTimer(Sender: TObject);
    procedure btn_SaveLogClick(Sender: TObject);
    procedure chk_LogClick(Sender: TObject);
    procedure btn_ConectarRTUClick(Sender: TObject);
    procedure btn_DesconectarRTUClick(Sender: TObject);
    procedure btn_ConectarBDClick(Sender: TObject);
    procedure btn_DesconectarBDClick(Sender: TObject);
    procedure btn_SecuenciaEncendidoClick(Sender: TObject);


    procedure btn_SecuenciaApagadoClick(Sender: TObject);
    procedure btn_ConsignaCaudalClick(Sender: TObject);
    procedure btn_ConsignaVoltajeClick(Sender: TObject);
    procedure btn_ConsignaManualClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ControlAutomatico: Tfrm_ControlAutomatico;
  TTGuardarDatos: TThreadGuardarDatos;

  Logger: TLog;

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
    DM_GestorComandosRemotos.ServerSocket_GUIDesktop.Active:= True;

    *)

    // Creo un thread para guardar datos, deshabilitado
    TTGuardarDatos:= TThreadGuardarDatos.Create(true, 1000, tpHigher);

    // Activo el logueo
    Logger:= TLog.Create;
    Logger.LogEnable(log);
end;

procedure Tfrm_ControlAutomatico.btn_ConectarBDClick(Sender: TObject);
begin
    DM_AccesoDatosBD.ADOConnection1.Connected:= true;
    btn_DesconectarBD.Enabled:= true;
    btn_ConectarBD.Enabled:= false;
end;

procedure Tfrm_ControlAutomatico.btn_DesconectarBDClick(Sender: TObject);
begin
    // Desconecto la BD
    DM_AccesoDatosBD.ADOConnection1.Connected:= false;
    // Actualizo botones en la GUI
    btn_ConectarBD.Enabled:= true;
    btn_DesconectarBD.Enabled:= false;
end;



procedure Tfrm_ControlAutomatico.btn_ConectarRTUClick(Sender: TObject);
begin
    with DM_AccesoDatosRTU do
    begin
        // Capto la configuración de la conexión
        TCP_UDPPort1.Host:= txt_Host.text;
        TCP_UDPPort1.Port:= strtoint(txt_Puerto.Text);
        PLCBlock_RTU1.RefreshTime:= strtoint(txt_Refresco.text);
        PLCBlock_RTU2.RefreshTime:= strtoint(txt_Refresco.text);
        PLCBlock_RTU3.RefreshTime:= strtoint(txt_Refresco.text);
       // TimerGuardaDatos.Interval:= strtoint(txt_Refresco.text);

        if chk_Log.Checked then
          TCP_UDPPort1.LogFile:= txt_LogPath.text;
        TCP_UDPPort1.LogIOActions:= chk_Log.Checked;

        // Abro la conexión TCP/UDP
        TCP_UDPPort1.Active:= true;
    end;

    // Bloqueo los controles para setear configuraciones
    txt_Refresco.Enabled:= false;
    txt_Host.Enabled:= false;
    txt_Puerto.Enabled:= false;
    chk_Log.Enabled:= false;
    btn_ConectarRTU.Enabled:= false;
    btn_DesconectarRTU.Enabled:= true;
    Panel_SecuenciasConsignas.Enabled:= true;
end;


 procedure Tfrm_ControlAutomatico.btn_DesconectarRTUClick(Sender: TObject);
begin
    // Cierro la conexión TCP/UDP
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





{$REGION 'Panel -Consignas-Secuencias '}

procedure Tfrm_ControlAutomatico.btn_ConsignaCaudalClick(Sender: TObject);
begin
    try
        DM_GestorComandosRemotos.procesarTramaTCP(01,'01'+txtConsignaCaudal.text);
    except
        exit;
    end;
end;
   
procedure Tfrm_ControlAutomatico.btn_ConsignaVoltajeClick(Sender: TObject);
begin
    try
        DM_GestorComandosRemotos.procesarTramaTCP(02,'02'+txtConsignaVoltaje.text);
    except
        exit;
    end;
end;

procedure Tfrm_ControlAutomatico.btn_ConsignaManualClick(Sender: TObject);
begin
    try
        DM_GestorComandosRemotos.procesarTramaTCP(03,'--Consigna Manual--');
    except
        exit;
    end;
end;

procedure Tfrm_ControlAutomatico.btn_SecuenciaEncendidoClick(Sender: TObject);
begin
    DM_GestorComandosRemotos.procesarTramaTCP(04,'--Secuencia Encendido--');
end;
  
procedure Tfrm_ControlAutomatico.btn_SecuenciaApagadoClick(Sender: TObject);
begin
    DM_GestorComandosRemotos.procesarTramaTCP(05,'--Secuencia Apagado--');
end;


{$ENDREGION }


procedure Tfrm_ControlAutomatico.chk_LogClick(Sender: TObject);
begin
    if chk_Log.Checked then
      btn_SaveLog.Enabled:= true
    else
      btn_SaveLog.Enabled:= false;
end;


procedure Tfrm_ControlAutomatico.btn_SaveLogClick(Sender: TObject);
begin
 if SaveLogDialog.Execute() then
    begin
      txt_LogPath.Text:= SaveLogDialog.FileName;
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
      StatusBar1.Panels[5].Text:= 'Reg: '+inttostr(TTGuardarDatos.getCantidadRegistrosEscritos());
      StatusBar1.Panels[6].text:= 'BD Online: '+ BoolToStr(DM_AccesoDatosBD.ADOConnection1.Connected,true);
      StatusBar1.Panels[7].text:= 'RTU Online: '+ BoolToStr( TCP_UDPPort1.Active,true);
   end;

   //Guardo en la BD si estoy conectado a las RTU y a la BD
   if (DM_AccesoDatosBD.ADOConnection1.Connected and DM_AccesoDatosRTU.TCP_UDPPort1.Active) then
     TTGuardarDatos.GuardarDatos();

   
end;

end.

      
