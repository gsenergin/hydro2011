unit UI_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  dxSkinMcSkin, dxSkinscxPCPainter, cxPC, cxControls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit, dxSkinsForm,
  cxButtons, cxLabel, dxGDIPlusClasses, dxSkinsCore, ScktComp,
  HMIControlDislocatorAnimation, CommPort, tcp_udpport, ProtocolDriver,
  ModBusDriver, ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock,
  PLCBlock, HMILabel, HMIText, DB, ADODB, DBCtrls, TeEngine, TeeDBEdit,
  TeeDBCrossTab, Series, TeeProcs, Chart, DateUtils,
  UI_Grafico, UI_AgregarUsuario,GestionUsuarios,

  Mask, HMIUpDown, HMICheckBox, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  AccesoDatos, mensajes,

  dblookup, cxListBox, cxMaskEdit, cxDropDownEdit,

  IniFiles, cxCalendar, cxSpinEdit, cxTimeEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid, cxPropertiesStore, cxImage, cxMemo;

type
  Tfrm_Principal = class(TForm)
    panel_Alertas: TPanel;
    PageControl_MenuPrincipal: TcxPageControl;
    tab_Control: TcxTabSheet;
    tab_Historicos: TcxTabSheet;
    tab_Simulacion: TcxTabSheet;
    tab_Configuracion: TcxTabSheet;
    panel_Usuario: TPanel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    btn_Logout: TcxButton;
    dxSkinController1: TdxSkinController;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    lblUsuario: TcxLabel;
    lblTipoUsuario: TcxLabel;
    lblFecha: TcxLabel;
    lblHora: TcxLabel;
    cxLabel8: TcxLabel;
    btnSimular: TcxButton;
    cxLabel11: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel34: TcxLabel;
    cxLabel37: TcxLabel;
    cxLabel41: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    cxLabel46: TcxLabel;
    cxLabel48: TcxLabel;
    cxLabel50: TcxLabel;
    cxLabel52: TcxLabel;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    cxLabel55: TcxLabel;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    cxLabel58: TcxLabel;
    cxLabel59: TcxLabel;
    cxLabel43: TcxLabel;
    cxLabel60: TcxLabel;
    SocketSuscripcion: TClientSocket;
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
    HMILabel2: THMILabel;
    HMILabel3: THMILabel;
    HMILabel6: THMILabel;
    HMILabel27: THMILabel;
    HMILabel1: THMILabel;
    HMILabel7: THMILabel;
    HMILabel10: THMILabel;
    HMILabel13: THMILabel;
    HMILabel14: THMILabel;
    HMILabel15: THMILabel;
    HMILabel11: THMILabel;
    HMILabel12: THMILabel;
    cxLabel10: TcxLabel;
    cxLabel12: TcxLabel;
    HMILabel18: THMILabel;
    HMILabel19: THMILabel;
    HMILabel20: THMILabel;
    HMILabel25: THMILabel;
    HMILabel26: THMILabel;
    cxLabel15: TcxLabel;
    TimerFechaHora: TTimer;
    Panel_SecuenciasConsignas: TPanel;
    Label40: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    txtConsignaVoltaje: TEdit;
    txtConsignaCaudal: TEdit;
    btn_FrenosGenerador: TcxButton;
    btn_AperturaAlabe: TcxButton;
    btn_FrenosTurbina: TcxButton;
    Image1: TImage;
    CLR_RTU2_AT10019: THMIText;
    CLR_RTU2_AT10016: THMIText;
    CLR_RTU2_AT10018: THMIText;
    CLR_RTU2_AT10017: THMIText;
    CLR_RTU2_AT10011: THMIText;
    CLR_RTU2_ST10012: THMIText;
    CLR_RTU1_ACC0003: THMIText;
    CLR_RTU1_ACC0004: THMIText;
    CLR_RTU2_AT10003: THMIText;
    CLR_RTU2_AT10004: THMIText;
    CLR_RTU3_ASA0002: THMIText;
    StatusBar: TStatusBar;
    TimerStatusBar: TTimer;
    lbl_ModoConsigna: TcxLabel;
    PageControl_Configuracion: TcxPageControl;
    TabConfiguracion_TabAlertas: TcxTabSheet;
    TabConfiguracion_TabUsuarios: TcxTabSheet;
    DBText_SensoresMin: TDBText;
    DBText_SensoresLL: TDBText;
    DBText_SensoresL: TDBText;
    DBText_SensoresH: TDBText;
    DBText_SensoresHH: TDBText;
    DBText_SensoresMax: TDBText;
    btn_ConfiguracionCambiarValores: TcxButton;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxLabel33: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel38: TcxLabel;
    txt_ConfiguracionSensoresMax: TEdit;
    txt_ConfiguracionSensoresHH: TEdit;
    txt_ConfiguracionSensoresH: TEdit;
    txt_ConfiguracionSensoresL: TEdit;
    txt_ConfiguracionSensoresLL: TEdit;
    txt_ConfiguracionSensoresMin: TEdit;
    PanelConfiguracionUsuariosActuales: TPanel;
    btn_ConfiguracionEliminar: TcxButton;
    btn_ConfiguracionResetearPassword: TcxButton;
    DBGrid_Usuarios: TDBGrid;
    DBLookupCombo_TipoUsuario: TDBLookupComboBox;
    cxLabel7: TcxLabel;
    PanelConfiguracionCambioClave: TPanel;
    cxLabel39: TcxLabel;
    btnCambiarPassword: TcxButton;
    cxLabel40: TcxLabel;
    cxLabel42: TcxLabel;
    cxLabel47: TcxLabel;
    txt_ConfiguracionClaveAnterior: TEdit;
    txt_ConfiguracionClaveNueva: TEdit;
    txt_ConfiguracionClaveNueva2: TEdit;
    cxLabel49: TcxLabel;
    PanelConfiguracionUsuariosNuevos: TPanel;
    btn_ConfiguracionAgregarUsuario: TcxButton;
    cxLabel51: TcxLabel;
    PanelConfiguracionExUsuarios: TPanel;
    btn_ConfiguracionRestaurarUsuario: TcxButton;
    DBGrid_ExUsuarios: TDBGrid;
    cxLabel63: TcxLabel;
    lblPassword: TcxLabel;
    DBGrid_Alertas: TDBGrid;
    cxGrid_Configuracion_Alertas: TcxGrid;
    cxGrid_Configuracion_AlertasDBTableView1: TcxGridDBTableView;
    cxGrid_Configuracion_AlertasLevel1: TcxGridLevel;
    cxGrid_Configuracion_AlertasDBTableView1FK_Sensor_RTU: TcxGridDBColumn;
    cxGrid_Configuracion_AlertasDBTableView1nomenclatura: TcxGridDBColumn;
    cxGrid_Configuracion_AlertasDBTableView1descripcion: TcxGridDBColumn;
    cxGrid_Configuracion_AlertasDBTableView1unidad_medida: TcxGridDBColumn;
    PageControl_Historicos: TcxPageControl;
    TabHistoricos_TabSensado: TcxTabSheet;
    TabHistoricos_TabAlertas: TcxTabSheet;
    btnHistorico: TcxButton;
    cxLabel6: TcxLabel;
    cxHistoricoHoraDesde: TcxTimeEdit;
    cxHistoricoHoraHasta: TcxTimeEdit;
    cxHistoricoFechaHasta: TcxDateEdit;
    cxHistoricoFechaDesde: TcxDateEdit;
    cxLabel1: TcxLabel;
    TabHistoricos_TabActividadUsuario: TcxTabSheet;
    cxGrid_Configuracion_Actividad: TcxGrid;
    cxGrid_Configuracion_ActividadDBTableView1: TcxGridDBTableView;
    cxGrid_Configuracion_ActividadLevel1: TcxGridLevel;
    cxGrid_Historicos_Alertas: TcxGrid;
    cxGrid_Historicos_AlertasDBTableView1: TcxGridDBTableView;
    cxGrid_Historicos_AlertasLevel1: TcxGridLevel;
    cxGrid_Historicos_AlertasDBTableView1SensorNombre: TcxGridDBColumn;
    cxGrid_Historicos_AlertasDBTableView1descripcion: TcxGridDBColumn;
    cxGrid_Historicos_AlertasDBTableView1Fecha: TcxGridDBColumn;
    cxGrid_Historicos_AlertasDBTableView1Hora: TcxGridDBColumn;
    cxGrid_Historicos_SensadoDBTableView1: TcxGridDBTableView;
    cxGrid_Historicos_SensadoLevel1: TcxGridLevel;
    cxGrid_Historicos_Sensado: TcxGrid;
    cxGrid_Historicos_SensadoDBTableView1FK_Sensor_RTU: TcxGridDBColumn;
    cxGrid_Historicos_SensadoDBTableView1nomenclatura: TcxGridDBColumn;
    cxGrid_Historicos_SensadoDBTableView1descripcion: TcxGridDBColumn;
    cxGrid_Historicos_SensadoDBTableView1unidad_medida: TcxGridDBColumn;
    cxGrid_Configuracion_ActividadDBTableView1Descripcion: TcxGridDBColumn;
    cxGrid_Configuracion_ActividadDBTableView1Login: TcxGridDBColumn;
    cxGrid_Configuracion_ActividadDBTableView1Fecha: TcxGridDBColumn;
    cxGrid_Configuracion_ActividadDBTableView1Hora: TcxGridDBColumn;
    cxPropertiesStore1: TcxPropertiesStore;
    btn_Secuencia_Encendido: TcxButton;
    bt_Secuencia_Apagado: TcxButton;
    btn_Consigna_Caudal: TcxButton;
    btn_Consigna_Voltaje: TcxButton;
    btn_Consigna_Manual: TcxButton;
    cxMemoSimulacion: TcxMemo;
    cxImage1: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnHistoricoClick(Sender: TObject);
    procedure btn_ConfiguracionCambiarValoresClick(Sender: TObject);
    procedure TimerFechaHoraTimer(Sender: TObject);
    procedure btn_LogoutClick(Sender: TObject);
    procedure SetValorActuador(IDRTU,DirMem,Valor:integer);
    procedure btn_FrenosTurbinaClick(Sender: TObject);
    procedure btn_AperturaAlabeClick(Sender: TObject);
    procedure btn_FrenosGeneradorClick(Sender: TObject);

    procedure HabilitarBotonesActuadores(valor: boolean);

    procedure CLR_RTU2_AT10011DblClick(Sender: TObject);
    procedure CLR_RTU2_AT10017DblClick(Sender: TObject);
    procedure CLR_RTU2_AT10018DblClick(Sender: TObject);
    procedure CLR_RTU2_AT10016DblClick(Sender: TObject);
    procedure CLR_RTU2_AT10019DblClick(Sender: TObject);
    procedure CLR_RTU1_ACC0003DblClick(Sender: TObject);
    procedure CLR_RTU1_ACC0004DblClick(Sender: TObject);
    procedure CLR_RTU2_AT10004DblClick(Sender: TObject);
    procedure CLR_RTU2_AT10003DblClick(Sender: TObject);
    procedure CLR_RTU3_ASA0002DblClick(Sender: TObject);
    procedure TimerStatusBarTimer(Sender: TObject);
    procedure SocketSuscripcionError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure btn_ConfiguracionResetearPasswordClick(Sender: TObject);
    procedure btn_ConfiguracionEliminarClick(Sender: TObject);
    procedure btn_ConfiguracionAgregarUsuarioClick(Sender: TObject);
    procedure btn_ConfiguracionRestaurarUsuarioClick(Sender: TObject);
    procedure btnCambiarPasswordClick(Sender: TObject);
    procedure btnSimularClick(Sender: TObject);
    procedure tab_HistoricosShow(Sender: TObject);
    procedure TabConfiguracion_TabActividadEnter(Sender: TObject);
    procedure TabConfiguracion_TabActividadExit(Sender: TObject);
    procedure btn_Secuencia_EncendidoClick(Sender: TObject);
    procedure bt_Secuencia_ApagadoClick(Sender: TObject);
    procedure btn_Consigna_CaudalClick(Sender: TObject);
    procedure btn_Consigna_VoltajeClick(Sender: TObject);
    procedure btn_Consigna_ManualClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;
  btnHabilitados: boolean;
  modoManual: boolean = false;

implementation

{$R *.dfm}


(* Busca los datos históricos del sensor seleccionado, arma un grafico en
frmGrafico y lo muestra *)
procedure Tfrm_Principal.btnHistoricoClick(Sender: TObject);
var frmGrafico: Tfrm_Grafico;
    ID, TimeStamp: string;
    valor:integer;
    cont: integer;
    TSDesde, TSHasta: TDatetime;
begin
  // Escribo en la bitácora lo que hace el usuario
  DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Consulta de Histórico');

  TSDesde:= cxHistoricoFechaDesde.Date + cxHistoricoHoraDesde.Time ;
  TSHasta:= cxHistoricoFechaHasta.Date + cxHistoricoHoraHasta.Time ;

  if CompareDateTime(TSDesde,TSHasta) <> -1 then
  begin
      msError('Las fechas ingresadas no son válidas');
      exit;
  end;
  
  //ADOQuery_Grafico
  frmGrafico:= Tfrm_Grafico.Create(self);

  frmGrafico.lblNomenclatura.Caption:= DM_AccesoDatos.ADOTable_Sensor.FieldByName('nomenclatura').AsString;
  frmGrafico.lblDescripcion.Caption:= DM_AccesoDatos.ADOTable_Sensor.FieldByName('descripcion').AsString;

//  frmGrafico.Chart_HistoricoSensado.Visible:= false;
  frmGrafico.Chart_HistoricoSensado.Series[0].Clear;





  ID:= DM_AccesoDatos.ADOTable_Sensor.FieldByName('ID_sensor').AsString;
  with DM_AccesoDatos.ADOQuery_Grafico do
  begin
      Close;
      Parameters.ParamByName('ID').Value:= ID;
      Parameters.ParamByName('TSDesde').Value:= FormatDatetime('yyyy-mm-dd HH:MM:SS',TSDesde);   // '"'+   +'"'
      Parameters.ParamByName('TSHasta').Value:= FormatDatetime('yyyy-mm-dd HH:MM:SS',TSHasta);

      Open;
      execsql;
      //Filter:= 'Timestamp Between "'+ FormatDatetime('yyyy-mm-dd HH:MM:SS',TSDesde) +'" and "'+ FormatDatetime('yyyy-mm-dd HH:MM:SS',TSHasta) +'"';
      //msInfo(Filter);
      First;
  end;
  cont:= 1;
  while not DM_AccesoDatos.ADOQuery_Grafico.Eof do
  begin
        valor:= DM_AccesoDatos.ADOQuery_Grafico.FieldByName('valorSensado').AsInteger;
        //TimeStamp:=DM_AccesoDatos.ADOQuery_Grafico.FieldByName('TimeStamp').AsString;
        TimeStamp:= FormatDatetime('mm-dd HH:MM:SS',DM_AccesoDatos.ADOQuery_Grafico.FieldByName('TimeStamp').AsDateTime);


        //showmessage(inttostr(valor));

        frmGrafico.Chart_HistoricoSensado.Series[0].AddXY(cont,valor,Timestamp,clBlue);

        //frmGrafico.Chart_HistoricoSensado.Series[0].Add(valor);
        DM_AccesoDatos.ADOQuery_Grafico.Next;
        cont:= cont+1;
  end;

  frmGrafico.Chart_HistoricoSensado.Visible:= true;
  frmGrafico.Chart_HistoricoSensado.refresh;
  frmGrafico.Show;
end;




procedure Tfrm_Principal.btnSimularClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Simulación de Escenarios');

    WinExec(PChar('simulador.bat'),SW_SHOWNORMAL);
end;

(* Cambia los valores de las alertas para un sensor determinado, a partir
de los ingresados por el usuario  *)
procedure Tfrm_Principal.btn_ConfiguracionCambiarValoresClick(Sender: TObject);
var min,max,LL,L,H,HH: integer;
    ID: string;
begin
    try
       min:= strtoint(txt_ConfiguracionSensoresMin.text);
       LL:= strtoint(txt_ConfiguracionSensoresLL.text);
       L:= strtoint(txt_ConfiguracionSensoresL.text);
       H:= strtoint(txt_ConfiguracionSensoresH.text);
       HH:= strtoint(txt_ConfiguracionSensoresHH.text);
       max:= strtoint(txt_ConfiguracionSensoresMax.text);
    except
       ShowMessage('Error en los Valores Ingresados');
       exit;
    end;
    if not ((min<=LL)and(LL<=L)and(L<=H)and(H<=HH)and(HH<=max) ) then
    begin
       ShowMessage('Se debe cumplir que Min <= LL <= L <= H <= HH <= Max');
       exit;
    end;

    // Si llego hasta aca, no hay errores

    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Cambio de Parametros de Alertas. Min='+inttostr(min)+
      ' LL='+inttostr(LL)+' L='+inttostr(L)+' H='+inttostr(H)+' HH='+inttostr(HH)+' Max='+inttostr(Max));

   ID:= DM_AccesoDatos.ADOTable_Sensor.FieldByName('ID_sensor').AsString;

    with DM_AccesoDatos.ADOQuery_SensorUpdate do
    begin
      Close;
      Parameters.ParamByName('ID').Value:= ID;
      Parameters.ParamByName('MIN').Value:= min;
      Parameters.ParamByName('VALORLL').Value:= LL;
      Parameters.ParamByName('VALORL').Value:= L;
      Parameters.ParamByName('VALORH').Value:= H;
      Parameters.ParamByName('VALORHH').Value:= HH;
      Parameters.ParamByName('MAX').Value:= max;
      Execsql;
    end;
    // Refresh
    DM_AccesoDatos.ADOTable_Sensor.Active:= false;
    DM_AccesoDatos.ADOTable_Sensor.Active:= true;
    ShowMessage('Valores Actualizados con éxito');
    txt_ConfiguracionSensoresMin.text:='';
    txt_ConfiguracionSensoresLL.text:='';
    txt_ConfiguracionSensoresL.text:='';
    txt_ConfiguracionSensoresH.text:='';
    txt_ConfiguracionSensoresHH.text:='';
    txt_ConfiguracionSensoresmax.text:='';
end;


(* Evento que se genera cuando no se puede conectar al modulo de control *)
procedure Tfrm_Principal.SocketSuscripcionError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
    showmessage('Error al establecer conexión con el Módulo de Control Automático');

    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar('N/A','Error al Conectarse con M.C.A.');

//    Application.Terminate;
end;





procedure Tfrm_Principal.tab_HistoricosShow(Sender: TObject);
var fecha: TDate;
    hora: TTime;
begin
    // Refresco los valores de los filtros para  el último minuto
    hora:= now();

    cxHistoricoFechaDesde.Text:= DateToStr(now());
    cxHistoricoHoraDesde.Text:= TimeToStr(IncMinute(hora,-1));

    cxHistoricoFechaHasta.Text:= DateToStr(now());
    cxHistoricoHoraHasta.Text:= TimeToStr( hora );

    //Refresco las tablas
    DM_AccesoDatos.RefrescarHistoricos();

end;

//////////////////////////////////////////////////////////
////             CONSIGNAS - SECUENCIAS              /////
//////////////////////////////////////////////////////////
{$REGION 'CONSIGNAS - SECUENCIAS'}

(* Envía al Módulo de control automático la consigna de caudal,
e inhabilita los comandos manuales *)
procedure Tfrm_Principal.btn_Consigna_CaudalClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Consigna Caudal: '+txtConsignaCaudal.text+' m^3/s');

    SocketSuscripcion.Socket.SendText('#01'+txtConsignaCaudal.text+'#');
    // DESHabilito botones de comando de actuadores
    // HabilitarBotonesActuadores(false);
    btn_FrenosGenerador.Visible:= false;
    btn_FrenosTurbina.Visible:= false;
    btn_AperturaAlabe.Visible:= false;

    modoManual:= false;
    lbl_ModoConsigna.Caption:= 'Modo Automático';
end;



procedure Tfrm_Principal.btn_Consigna_VoltajeClick(Sender: TObject);
begin
     // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Consigna Voltaje: '+txtConsignaVoltaje.text+' Volts');

    SocketSuscripcion.Socket.SendText('#02'+txtConsignaVoltaje.text+'#');
    // DESHabilito botones de comando de actuadores
   //  HabilitarBotonesActuadores(false);
    btn_FrenosGenerador.Visible:= false;
    btn_FrenosTurbina.Visible:= false;
    btn_AperturaAlabe.Visible:= false;

    modoManual:= false;
    lbl_ModoConsigna.Caption:= 'Modo Automático';
end;



(* Envía al Módulo de control automático la consigna de modo Manual,
y habilita los comandos manuales *)
procedure Tfrm_Principal.btn_Consigna_ManualClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Consigna Manual');

    SocketSuscripcion.Socket.SendText('#03#');
    // Habilito botones de comando de actuadores
    btn_FrenosGenerador.Visible:= true;
    btn_FrenosTurbina.Visible:= true;
    btn_AperturaAlabe.Visible:= true;

  //  HabilitarBotonesActuadores(true);
    modoManual:= true;
    lbl_ModoConsigna.Caption:= 'Modo Manual';
end;

(* Envía al Módulo de control automático la consigna realizar una
secuencia de encendido *)
procedure Tfrm_Principal.btn_Secuencia_EncendidoClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Secuencia de Encendido');

    SocketSuscripcion.Socket.SendText('#04#');
end;

(* Envía al Módulo de control automático la consigna realizar una
secuencia de apagado *)
procedure Tfrm_Principal.bt_Secuencia_ApagadoClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Secuencia de Apagado');

    SocketSuscripcion.Socket.SendText('#05#');
end;


{$ENDREGION}


//////////////////////////////////////////////////////////
////    CONTROL DE ACTUADORES  EN MODO MANUAL        /////
//////////////////////////////////////////////////////////
{$REGION 'Control de Actuadores Modo Manual'}

(* Habilita o Deshabilita botones del modo manual *)
procedure Tfrm_Principal.HabilitarBotonesActuadores(valor: boolean);
begin
    btn_FrenosGenerador.Enabled:= valor;
    btn_AperturaAlabe.Enabled:= valor;
    btn_FrenosTurbina.Enabled:= valor;
end;


(* Envía al Módulo de control automático el cambio de valor
en un actuador. Solo para modo manual *)
procedure Tfrm_Principal.SetValorActuador(IDRTU, DirMem, Valor: integer);
begin
     if modoManual then
     begin
       SocketSuscripcion.Socket.SendText('#06'+inttostr(IDRTU)+inttostr(DirMem)+IntToStr(valor)+'#');

       // Escribo en la bitácora lo que hace el usuario
       DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Set Valor. RTU #'+inttostr(IDRTU)+' @'+inttostr(DirMem)+' = '+IntToStr(valor));
   end;
end;

(* Envía al Módulo de control automático el cambio de valor en los frenos
del generador, si esta habilitado el modo manual y el valor es correcto *)
procedure Tfrm_Principal.btn_FrenosGeneradorClick(Sender: TObject);
var valor: integer;
begin
    if modoManual then
    try
      valor:= strtoint( InputBox('SetValor','Ingrese el Porcentaje de aplicación de Frenos del Generador (0-100)','0'));
    except
      Showmessage('Valor Incorrecto');
      exit;
    end;
    SetValorActuador(2,40015,valor);
end;

(* Envía al Módulo de control automático el cambio de valor en los frenos
de la turbina, si esta habilitado el modo manual y el valor es correcto *)
procedure Tfrm_Principal.btn_FrenosTurbinaClick(Sender: TObject);
var valor: integer;
begin
    if modoManual then
    try
      valor:= strtoint( InputBox('SetValor','Ingrese el Porcentaje de aplicación de Frenos de la Turbina (0-100)','0'));
    except
      Showmessage('Valor Incorrecto');
      exit;
    end;
    SetValorActuador(2,40006,valor);
end;

(* Envía al Módulo de control automático el cambio de valor en la apertura
de los alabes, si esta habilitado el modo manual y el valor es correcto *)
procedure Tfrm_Principal.btn_AperturaAlabeClick(Sender: TObject);
var valor: integer;
begin
    if modoManual then
    try
      valor:= strtoint( InputBox('SetValor','Ingrese el Porcentaje de apertura de los álabes (0-100)','100'));
    except
      Showmessage('Valor Incorrecto');
      exit;
    end;
    SetValorActuador(2,40007,valor);
end;


(* Envía al Módulo de control automático el cambio de valor en un actuador,
(abierto o cerrado) *)
procedure Tfrm_Principal.CLR_RTU1_ACC0003DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(1,40003,0)
    else
        SetValorActuador(1,40003,1);
end;

(* Envía al Módulo de control automático el cambio de valor en un actuador,
(abierto o cerrado) *)
procedure Tfrm_Principal.CLR_RTU1_ACC0004DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(1,40004,0)
    else
        SetValorActuador(1,40004,1);
end;

(* Envía al Módulo de control automático el cambio de valor en un actuador,
(abierto o cerrado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10003DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(2,40003,0)
    else
        SetValorActuador(2,40003,1);
end;
                      
(* Envía al Módulo de control automático el cambio de valor en un actuador,
(abierto o cerrado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10004DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(2,40004,0)
    else
        SetValorActuador(2,40004,1);
end;
                      
(* Envía al Módulo de control automático el cambio de valor en un actuador,
(abierto o cerrado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10011DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
        SetValorActuador(2,40011,0)
    else
        SetValorActuador(2,40011,1);
end;
            
(* Envía al Módulo de control automático el cambio de valor en un actuador,
(encendido o apagado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10016DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
      SetValorActuador(2,40016,0)
    else
      SetValorActuador(2,40016,1);
end;

(* Envía al Módulo de control automático el cambio de valor en un actuador,
(encendido o apagado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10017DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
        SetValorActuador(2,40017,0)
    else
        SetValorActuador(2,40017,1);
end;
    
(* Envía al Módulo de control automático el cambio de valor en un actuador,
(encendido o apagado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10018DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
        SetValorActuador(2,40018,0)
    else
        SetValorActuador(2,40018,1);
end;
      
(* Envía al Módulo de control automático el cambio de valor en un actuador,
(encendido o apagado) *)
procedure Tfrm_Principal.CLR_RTU2_AT10019DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
      SetValorActuador(2,40019,0)
    else
      SetValorActuador(2,40019,1);
end;
         
(* Envía al Módulo de control automático el cambio de valor en un actuador,
(encendido o apagado) *)
procedure Tfrm_Principal.CLR_RTU3_ASA0002DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(3,40002,0)
    else
        SetValorActuador(3,40002,1);
end;

procedure Tfrm_Principal.TabConfiguracion_TabActividadEnter(Sender: TObject);
begin
  DM_AccesoDatos.ADOTable_Bitacora.Active:= true;
end;

procedure Tfrm_Principal.TabConfiguracion_TabActividadExit(Sender: TObject);
begin
    DM_AccesoDatos.ADOTable_Bitacora.Active:= false;
end;

{$ENDREGION }

            
//////////////////////////////////////////////////////////
////              GESTIÓN DE USUARIOS                /////
//////////////////////////////////////////////////////////
{$REGION 'Gestion de Usuarios'}

(* Llama a la unidad de gestión de usuarios, para cambiar la clave
según los valores ingresados *)
procedure Tfrm_Principal.btnCambiarPasswordClick(Sender: TObject);
begin
    GestionUsuarios_CambiarClave(lblUsuario.Caption,
                                 lblPassword.Caption,
                                 txt_ConfiguracionClaveAnterior.text,
                                 txt_ConfiguracionClaveNueva.text,
                                 txt_ConfiguracionClaveNueva2.text);
end;

(* Llama a la unidad de gestión de usuarios, para eliminar al usuario *)
procedure Tfrm_Principal.btn_ConfiguracionEliminarClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Eliminado el usuario '+DM_AccesoDatos.ADOTable_Usuario.FieldByName('user').AsString);

    GestionUsuarios_EliminarUsuario('');
end;

(* Llama a la unidad de gestión de usuarios, para resetear la clave del usuario *)
procedure Tfrm_Principal.btn_ConfiguracionResetearPasswordClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Reseteada la Clave a '+DM_AccesoDatos.ADOTable_Usuario.FieldByName('user').AsString);

    GestionUsuarios_ResetearPassword('');
end;

(* Llama a la unidad de gestión de usuarios, para restaurar al usuario seleccionado
previamente eliminado *)
procedure Tfrm_Principal.btn_ConfiguracionRestaurarUsuarioClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Restaurado el usuario '+DM_AccesoDatos.ADOTable_Usuario.FieldByName('user').AsString);

    GestionUsuarios_RestaurarUsuario(DBGrid_ExUsuarios.SelectedField.AsString);
end;

(* Llama a la unidad de gestión de usuarios, para agregar un nuevo usuario *)
procedure Tfrm_Principal.btn_ConfiguracionAgregarUsuarioClick(Sender: TObject);
begin
    GestionUsuarios_AgregarUsuario(lblUsuario.Caption);
end;

{$ENDREGION}


(*Click en LOGOUT. Sale del sistema*)
procedure Tfrm_Principal.btn_LogoutClick(Sender: TObject);
begin
    // Escribo en la bitácora lo que hace el usuario
    DM_AccesoDatos.SP_Bitacora_Insertar(lblUsuario.Caption,'Logout');

    //ADOConnectionHYDRODB.Connected:= false;
    //ADOTable_Sensor.Active:= false;
    try
      frm_Principal.Close;
      //Application.Terminate;
    except

    end;

end;

(*Click en LOGOUT/[X]. Libera recursos*)
procedure Tfrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    SocketSuscripcion.Socket.SendText('BAJA');

    SocketSuscripcion.Active:= false;
    TCP_UDPPort1.Active:= false;
    ModBusTCPDriver1.Free;
end;

(*Ingreso al sistema. Habilita las comunicaciones*)
procedure Tfrm_Principal.FormCreate(Sender: TObject);
var
   IniFile : TIniFile;
   IP: string;
   PUERTO: integer;
begin
    // Activo el Socket
    TCP_UDPPort1.Active:= true;

    //DM_AccesoDatos.ADOConnectionHYDRODB.Connected:= true;
    //DM_AccesoDatos.ADOTable_Sensor.Active:= true;

    // Me suscribo a la distribución de información del control automatico
    SocketSuscripcion.Active:= false;

    IniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini')) ;
      IP := IniFile.ReadString('CONFIG','IP','127.0.0.1');
      PUERTO := IniFile.ReadInteger('CONFIG','PUERTO',9000);
    IniFile.Free;

    SocketSuscripcion.Host:= IP;
    SocketSuscripcion.Port:= PUERTO;

    //SocketSuscripcion.Host:= '127.0.0.1';
    //SocketSuscripcion.Port:= 9000;
    SocketSuscripcion.Active:= true;

   //  frm_Principal.Width:= 767;
     TimerFechaHoraTimer(self);

     btnHabilitados:= false;
end;



(*Actualiza la fecha y hora cada 1 minuto*)
procedure Tfrm_Principal.TimerFechaHoraTimer(Sender: TObject);
begin
    lblFecha.Caption:= datetostr(now);
    lblHora.Caption:= FormatDateTime('hh:nn', now);
end;

(*Actualiza la barra de estados.*)
procedure Tfrm_Principal.TimerStatusBarTimer(Sender: TObject);
begin
      DM_AccesoDatos.RefrescarAlertas();
      StatusBar.Panels[0].text:= 'C.A: Online: '+ BoolToStr(SocketSuscripcion.Active,true);
      StatusBar.Panels[1].text:= 'BD Online: '+ BoolToStr(DM_AccesoDatos.ADOConnectionHYDRODB.Connected,true);
      StatusBar.Panels[2].text:= 'RTU Online: '+ BoolToStr( TCP_UDPPort1.Active,true);
end;

end.


