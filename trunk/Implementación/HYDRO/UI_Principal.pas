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
  TeeDBCrossTab, Series, TeeProcs, Chart,
  UI_Grafico, Mask, HMIUpDown, HMICheckBox;

type
  Tfrm_Principal = class(TForm)
    panel_Alertas: TPanel;
    PageControl: TcxPageControl;
    tab_Control: TcxTabSheet;
    tab_Historicos: TcxTabSheet;
    tab_Reportes: TcxTabSheet;
    tab_Simulacion: TcxTabSheet;
    tab_Configuracion: TcxTabSheet;
    panel_Usuario: TPanel;
    cxLabel1: TcxLabel;
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
    SG_Alertas: TStringGrid;
    cxLabel8: TcxLabel;
    cxLabel19: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel9: TcxLabel;
    img_GolpeAriete: TImage;
    btnSimular: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    cxTextEdit9: TcxTextEdit;
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
    btn_ConfiguracionCambiarValores: TcxButton;
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
    StoredProc_HistorialSensado_Insertar: TADOStoredProc;
    ADOConnectionHYDRODB: TADOConnection;
    ADOTable_Sensor: TADOTable;
    DS_Sensor: TDataSource;
    DBGrid_Sensor: TDBGrid;
    btnHistorico: TcxButton;
    ADOQuery_Grafico: TADOQuery;
    DataSource1: TDataSource;
    DBGrid_Configuracion: TDBGrid;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxLabel30: TcxLabel;
    cxLabel31: TcxLabel;
    cxLabel33: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel36: TcxLabel;
    cxLabel38: TcxLabel;
    DBText_SensoresMin: TDBText;
    DBText_SensoresLL: TDBText;
    DBText_SensoresL: TDBText;
    DBText_SensoresH: TDBText;
    DBText_SensoresHH: TDBText;
    DBText_SensoresMax: TDBText;
    ADOQuery_SensorUpdate: TADOQuery;
    DataSource2: TDataSource;
    txt_ConfiguracionSensoresMax: TEdit;
    txt_ConfiguracionSensoresHH: TEdit;
    txt_ConfiguracionSensoresH: TEdit;
    txt_ConfiguracionSensoresL: TEdit;
    txt_ConfiguracionSensoresLL: TEdit;
    txt_ConfiguracionSensoresMin: TEdit;
    TimerFechaHora: TTimer;
    Panel_SecuenciasConsignas: TPanel;
    Label40: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    btn_ConsignaCaudal: TButton;
    btn_ConsignaVoltaje: TButton;
    btn_ConsignaManual: TButton;
    txtConsignaVoltaje: TEdit;
    txtConsignaCaudal: TEdit;
    btn_SecuenciaEncendido: TButton;
    btn_SecuenciaApagado: TButton;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure btn_ConfiguracionCambiarValoresClick(Sender: TObject);
    procedure TimerFechaHoraTimer(Sender: TObject);
    procedure btn_LogoutClick(Sender: TObject);
    procedure btn_SecuenciaEncendidoClick(Sender: TObject);
    procedure btn_SecuenciaApagadoClick(Sender: TObject);
    procedure btn_ConsignaCaudalClick(Sender: TObject);
    procedure btn_ConsignaVoltajeClick(Sender: TObject);
    procedure btn_ConsignaManualClick(Sender: TObject);
    procedure btn_USincronismo_ONClick(Sender: TObject);
    procedure btn_USincronismo_OFFClick(Sender: TObject);

    procedure SetValorActuador(IDRTU,DirMem,Valor:integer);
    procedure btn_Generador_ONClick(Sender: TObject);
    procedure btn_Generador_OFFClick(Sender: TObject);
    procedure btn_EquipoExcitacion_ONClick(Sender: TObject);
    procedure btn_EquipoExcitacion_OFFClick(Sender: TObject);
    procedure btn_ReguladorVelocidad_ONClick(Sender: TObject);
    procedure btn_ReguladorVelocidad_OFFClick(Sender: TObject);
    procedure btn_Refrigeracion_ONClick(Sender: TObject);
    procedure btn_Refrigeracion_OFFClick(Sender: TObject);
    procedure btn_CompuertasMantenimiento_OPENClick(Sender: TObject);
    procedure btn_CompuertasMantenimiento_CLOSEClick(Sender: TObject);
    procedure btn_CompuertaDesvio_OPENClick(Sender: TObject);
    procedure btn_CompuertaDesvio_CLOSEClick(Sender: TObject);
    procedure btn_CompuertaIngreso_OPENClick(Sender: TObject);
    procedure btn_CompuertaIngreso_CLOSEClick(Sender: TObject);
    procedure btn_Mariposa_OPENClick(Sender: TObject);
    procedure btn_Mariposa_CLOSEClick(Sender: TObject);
    procedure btn_Bypass_OPENClick(Sender: TObject);
    procedure btn_Bypass_CLOSEClick(Sender: TObject);
    procedure btn_FrenosTurbinaClick(Sender: TObject);
    procedure btn_AperturaAlabeClick(Sender: TObject);
    procedure btn_FrenosGeneradorClick(Sender: TObject);


    procedure HabilitarBotonesActuadores(valor: boolean);
    procedure btn_CompuertaDesvio_OPENMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btn_CompuertaDesvio_CLOSEMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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



procedure Tfrm_Principal.btnHistoricoClick(Sender: TObject);
var frmGrafico: Tfrm_Grafico;
    ID, TimeStamp: string;
    valor:integer;
    cont: integer;
begin
  //ADOQuery_Grafico
  frmGrafico:= Tfrm_Grafico.Create(self);

  frmGrafico.lblNomenclatura.Caption:= ADOTable_Sensor.FieldByName('nomenclatura').AsString;
  frmGrafico.lblDescripcion.Caption:= ADOTable_Sensor.FieldByName('descripcion').AsString;

//  frmGrafico.Chart_HistoricoSensado.Visible:= false;
  frmGrafico.Chart_HistoricoSensado.Series[0].Clear;

  ID:= ADOTable_Sensor.FieldByName('ID_sensor').AsString;
  with ADOQuery_Grafico do
  begin
      Close;
      Parameters.ParamByName('ID').Value:= ID;
      Open;
      execsql;
      First;
  end;
  cont:= 1;
  while not ADOQuery_Grafico.Eof do
  begin
        valor:= ADOQuery_Grafico.FieldByName('valorSensado').AsInteger;
        TimeStamp:=ADOQuery_Grafico.FieldByName('TimeStamp').AsString;
        //showmessage(inttostr(valor));

        frmGrafico.Chart_HistoricoSensado.Series[0].AddXY(cont,valor,Timestamp,clBlue);
        //frmGrafico.Chart_HistoricoSensado.Series[0].Add(valor);
        ADOQuery_Grafico.Next;
        cont:= cont+1;
  end;

  frmGrafico.Chart_HistoricoSensado.Visible:= true;
  frmGrafico.Chart_HistoricoSensado.refresh;
  frmGrafico.Show;
end;



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


    ID:= ADOTable_Sensor.FieldByName('ID_sensor').AsString;

    with ADOQuery_SensorUpdate do
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
    ADOTable_Sensor.Active:= false;ADOTable_Sensor.Active:= true;
    ShowMessage('Valores Actualizados con éxito');
    txt_ConfiguracionSensoresMin.text:='';
    txt_ConfiguracionSensoresLL.text:='';
    txt_ConfiguracionSensoresL.text:='';
    txt_ConfiguracionSensoresH.text:='';
    txt_ConfiguracionSensoresHH.text:='';
    txt_ConfiguracionSensoresmax.text:='';
end;



//////////////////////////////////////////////////////////
////             CONSIGNAS - SECUENCIAS              /////
//////////////////////////////////////////////////////////

{$REGION 'CONSIGNAS - SECUENCIAS'}

procedure Tfrm_Principal.btn_ConsignaCaudalClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('#01'+txtConsignaCaudal.text+'#');
    // DESHabilito botones de comando de actuadores
//    HabilitarBotonesActuadores(false);
    modoManual:= false;
    lbl_ModoConsigna.Caption:= 'Modo Automático';
end;


procedure Tfrm_Principal.btn_ConsignaVoltajeClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('#02'+txtConsignaVoltaje.text+'#');
    // DESHabilito botones de comando de actuadores
//    HabilitarBotonesActuadores(false);
    modoManual:= false;
    lbl_ModoConsigna.Caption:= 'Modo Automático';
end;



procedure Tfrm_Principal.btn_ConsignaManualClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('#03#');
    // Habilito botones de comando de actuadores
  //  HabilitarBotonesActuadores(true);
    modoManual:= true;
    lbl_ModoConsigna.Caption:= 'Modo Manual';
end;

procedure Tfrm_Principal.btn_SecuenciaEncendidoClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('#04#');
end;

procedure Tfrm_Principal.btn_SecuenciaApagadoClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('#05#');
end;

{$ENDREGION}

//////////////////////////////////////////////////////////
////             SETEO DE ACTUADORES                 /////
//////////////////////////////////////////////////////////

{$REGION 'Seteo de Actuadores -> Botones ON/OFF A/C'}
procedure Tfrm_Principal.SetValorActuador(IDRTU, DirMem, Valor: integer);
begin
     if modoManual then
       SocketSuscripcion.Socket.SendText('#06'+inttostr(IDRTU)+inttostr(DirMem)+IntToStr(valor)+'#');
end;

procedure Tfrm_Principal.btn_CompuertaDesvio_CLOSEClick(Sender: TObject);
begin
    if btnHabilitados then
      SetValorActuador(1,40003,0);
end;

//   /PRUEABAAAA
procedure Tfrm_Principal.btn_CompuertaDesvio_CLOSEMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin       //PRUEABAAAA
    if btnHabilitados then
      (Sender As TcxButton).Down:= true
    else
      (Sender As TcxButton).Down:= false;
end;


 //PRUEABAAAA
procedure Tfrm_Principal.btn_CompuertaDesvio_OPENMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin     //PRUEABAAAA
    if btnHabilitados then
      (Sender As TcxButton).Down:= true
    else
      (Sender As TcxButton).Down:= false;
end;






procedure Tfrm_Principal.btn_CompuertaDesvio_OPENClick(Sender: TObject);
begin
    if btnHabilitados then
      SetValorActuador(1,40003,1);
end;

procedure Tfrm_Principal.btn_CompuertaIngreso_CLOSEClick(Sender: TObject);
begin
    SetValorActuador(1,40004,0);
end;

procedure Tfrm_Principal.btn_CompuertaIngreso_OPENClick(Sender: TObject);
begin
    SetValorActuador(1,40004,1);
end;


procedure Tfrm_Principal.btn_Mariposa_CLOSEClick(Sender: TObject);
begin
    SetValorActuador(2,40003,0);
end;

procedure Tfrm_Principal.btn_Mariposa_OPENClick(Sender: TObject);
begin
    SetValorActuador(2,40003,1);
end;



procedure Tfrm_Principal.btn_Bypass_CLOSEClick(Sender: TObject);
begin
    SetValorActuador(2,40004,0);
end;

procedure Tfrm_Principal.btn_Bypass_OPENClick(Sender: TObject);
begin
    SetValorActuador(2,40004,1);
end;



procedure Tfrm_Principal.btn_Refrigeracion_OFFClick(Sender: TObject);
begin
    SetValorActuador(2,40011,0);
end;

procedure Tfrm_Principal.btn_Refrigeracion_ONClick(Sender: TObject);
begin
    SetValorActuador(2,40011,1);
end;


procedure Tfrm_Principal.btn_Generador_OFFClick(Sender: TObject);
begin
    SetValorActuador(2,40016,0);
end;

procedure Tfrm_Principal.btn_Generador_ONClick(Sender: TObject);
begin
    SetValorActuador(2,40016,1);
end;

procedure Tfrm_Principal.btn_ReguladorVelocidad_OFFClick(Sender: TObject);
begin
    SetValorActuador(2,40017,0);
end;

procedure Tfrm_Principal.btn_ReguladorVelocidad_ONClick(Sender: TObject);
begin
    SetValorActuador(2,40017,1);
end;

procedure Tfrm_Principal.btn_EquipoExcitacion_OFFClick(Sender: TObject);
begin
    SetValorActuador(2,40018,0);
end;

procedure Tfrm_Principal.btn_EquipoExcitacion_ONClick(Sender: TObject);
begin
    SetValorActuador(2,40018,1);
end;


procedure Tfrm_Principal.btn_USincronismo_OFFClick(Sender: TObject);
begin
    SetValorActuador(2,40019,0);
end;

procedure Tfrm_Principal.btn_USincronismo_ONClick(Sender: TObject);
begin
    SetValorActuador(2,40019,1);
end;

procedure Tfrm_Principal.btn_CompuertasMantenimiento_CLOSEClick(
  Sender: TObject);
begin
    SetValorActuador(3,40002,0);
end;

procedure Tfrm_Principal.btn_CompuertasMantenimiento_OPENClick(Sender: TObject);
begin
    SetValorActuador(3,40002,1);
end;

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


{$ENDREGION}

     
procedure Tfrm_Principal.Button1Click(Sender: TObject);
begin
// PUREBA!!
    // Me suscribo a la distribución de información del control automatico
    SocketSuscripcion.Active:= false;
    SocketSuscripcion.Host:= '192.168.1.103';
    SocketSuscripcion.Port:= 9000;
    SocketSuscripcion.Active:= true;
end;

procedure Tfrm_Principal.CLR_RTU1_ACC0003DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(1,40003,0)
    else
        SetValorActuador(1,40003,1);
end;

procedure Tfrm_Principal.CLR_RTU1_ACC0004DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(1,40004,0)
    else
        SetValorActuador(1,40004,1);
end;

procedure Tfrm_Principal.CLR_RTU2_AT10003DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(2,40003,0)
    else
        SetValorActuador(2,40003,1);
end;

procedure Tfrm_Principal.CLR_RTU2_AT10004DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(2,40004,0)
    else
        SetValorActuador(2,40004,1);
end;

procedure Tfrm_Principal.CLR_RTU2_AT10011DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
        SetValorActuador(2,40011,0)
    else
        SetValorActuador(2,40011,1);
    

end;

procedure Tfrm_Principal.CLR_RTU2_AT10016DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
      SetValorActuador(2,40016,0)
    else
      SetValorActuador(2,40016,1);
end;

procedure Tfrm_Principal.CLR_RTU2_AT10017DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
        SetValorActuador(2,40017,0)
    else
        SetValorActuador(2,40017,1);
end;

procedure Tfrm_Principal.CLR_RTU2_AT10018DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
        SetValorActuador(2,40018,0)
    else
        SetValorActuador(2,40018,1);
end;

procedure Tfrm_Principal.CLR_RTU2_AT10019DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'ON' then
      SetValorActuador(2,40019,0)
    else
      SetValorActuador(2,40019,1);
end;

procedure Tfrm_Principal.CLR_RTU3_ASA0002DblClick(Sender: TObject);
begin
    if (Sender as THMIText).Caption = 'A' then
        SetValorActuador(3,40002,0)
    else
        SetValorActuador(3,40002,1);
end;

procedure Tfrm_Principal.btn_LogoutClick(Sender: TObject);
begin
    //ADOConnectionHYDRODB.Connected:= false;
    //ADOTable_Sensor.Active:= false;
    try
      frm_Principal.Close;
      //Application.Terminate;
    except

    end;

end;





procedure Tfrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//    SocketSuscripcion.Socket.SendText('BAJA');
end;

procedure Tfrm_Principal.FormCreate(Sender: TObject);
begin
    // Activo el Socket
    TCP_UDPPort1.Active:= true;


    ADOConnectionHYDRODB.Connected:= true;
    ADOTable_Sensor.Active:= true;


    // StringGrid Alertas
    SG_Alertas.Cells[1,0]:= 'Fecha';
    SG_Alertas.Cells[2,0]:= 'Hora';
    SG_Alertas.Cells[3,0]:= 'Evento';
    SG_Alertas.Cells[4,0]:= 'RTU';
    SG_Alertas.Cells[5,0]:= 'Elemento';
    SG_Alertas.Cells[6,0]:= 'Valor';

    // Me suscribo a la distribución de información del control automatico
    SocketSuscripcion.Active:= false;
    SocketSuscripcion.Host:= '127.0.0.1';
    SocketSuscripcion.Port:= 9000;
    SocketSuscripcion.Active:= true;

   //  frm_Principal.Width:= 767;
     TimerFechaHoraTimer(self);

//     HabilitarBotonesActuadores(false);
     btnHabilitados:= false;
end;


procedure Tfrm_Principal.HabilitarBotonesActuadores(valor: boolean);
begin
    btn_FrenosGenerador.Enabled:= valor;
    btn_AperturaAlabe.Enabled:= valor;
    btn_FrenosTurbina.Enabled:= valor;
end;

procedure Tfrm_Principal.TimerFechaHoraTimer(Sender: TObject);
begin
    lblFecha.Caption:= datetostr(now);
    lblHora.Caption:= FormatDateTime('hh:nn', now);
end;

procedure Tfrm_Principal.TimerStatusBarTimer(Sender: TObject);
begin
      StatusBar.Panels[0].text:= 'C.A: Online: '+ BoolToStr(SocketSuscripcion.Active,true);
      StatusBar.Panels[1].text:= 'BD Online: '+ BoolToStr(ADOConnectionHYDRODB.Connected,true);
      StatusBar.Panels[2].text:= 'RTU Online: '+ BoolToStr( TCP_UDPPort1.Active,true);
end;

end.
