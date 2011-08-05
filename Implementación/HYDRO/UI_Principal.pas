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
    btn_CompuertaDesvio_OPEN: TcxButton;
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
    btn_CompuertaDesvio_CLOSE: TcxButton;
    btn_CompuertaIngreso_CLOSE: TcxButton;
    btn_CompuertaIngreso_OPEN: TcxButton;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    cxLabel55: TcxLabel;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    btn_USincronismo_ON: TcxButton;
    btn_USincronismo_OFF: TcxButton;
    btn_Generador_OFF: TcxButton;
    btn_Generador_ON: TcxButton;
    btn_EquipoExcitacion_OFF: TcxButton;
    btn_EquipoExcitacion_ON: TcxButton;
    btn_ReguladorVelocidad_OFF: TcxButton;
    btn_ReguladorVelocidad_ON: TcxButton;
    cxLabel58: TcxLabel;
    btn_Refrigeracion_ON: TcxButton;
    btn_Refrigeracion_OFF: TcxButton;
    btn_CompuertasMantenimiento_OPEN: TcxButton;
    btn_CompuertasMantenimiento_CLOSE: TcxButton;
    cxLabel59: TcxLabel;
    btn_Bypass_OPEN: TcxButton;
    btn_Bypass_CLOSE: TcxButton;
    cxLabel43: TcxLabel;
    cxLabel60: TcxLabel;
    btn_Mariposa_OPEN: TcxButton;
    btn_Mariposa_CLOSE: TcxButton;
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
    HMILabel4: THMILabel;
    HMILabel5: THMILabel;
    HMILabel6: THMILabel;
    HMILabel27: THMILabel;
    HMILabel28: THMILabel;
    HMILabel1: THMILabel;
    HMILabel7: THMILabel;
    HMILabel10: THMILabel;
    HMILabel13: THMILabel;
    HMILabel14: THMILabel;
    HMILabel15: THMILabel;
    HMILabel8: THMILabel;
    HMILabel9: THMILabel;
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
    Button1: TButton;
    HMICheckBox1: THMICheckBox;
    HMICheckBox2: THMICheckBox;
    HMICheckBox3: THMICheckBox;
    HMICheckBox4: THMICheckBox;
    HMICheckBox5: THMICheckBox;
    HMICheckBox6: THMICheckBox;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RTU1_ACC0003ValueChange(Sender: TObject);
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
    procedure RTU2_AT10019ValueChange(Sender: TObject);
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
    procedure RTU2_AT10004ValueChange(Sender: TObject);
    procedure RTU1_ACC0004ValueChange(Sender: TObject);
    procedure RTU3_ASA0002ValueChange(Sender: TObject);
    procedure RTU2_AT10003ValueChange(Sender: TObject);
    procedure RTU2_AT10011ValueChange(Sender: TObject);
    procedure RTU2_AT10016ValueChange(Sender: TObject);
    procedure RTU2_AT10017ValueChange(Sender: TObject);
    procedure RTU2_AT10018ValueChange(Sender: TObject);
    procedure btn_FrenosTurbinaClick(Sender: TObject);
    procedure btn_AperturaAlabeClick(Sender: TObject);
    procedure btn_FrenosGeneradorClick(Sender: TObject);


    procedure HabilitarBotonesActuadores(valor: boolean);
    procedure btn_CompuertaDesvio_OPENMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btn_CompuertaDesvio_CLOSEMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;
  btnHabilitados: boolean;

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
    SocketSuscripcion.Socket.SendText('01'+txtConsignaCaudal.text);
    // DESHabilito botones de comando de actuadores
//    HabilitarBotonesActuadores(false);
end;


procedure Tfrm_Principal.btn_ConsignaVoltajeClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('02'+txtConsignaVoltaje.text);
    // DESHabilito botones de comando de actuadores
//    HabilitarBotonesActuadores(false);
end;



procedure Tfrm_Principal.btn_ConsignaManualClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('03');
    // Habilito botones de comando de actuadores
  //  HabilitarBotonesActuadores(true);

end;

procedure Tfrm_Principal.btn_SecuenciaEncendidoClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('04');
end;

procedure Tfrm_Principal.btn_SecuenciaApagadoClick(Sender: TObject);
begin
    SocketSuscripcion.Socket.SendText('05');
end;

{$ENDREGION}

//////////////////////////////////////////////////////////
////             SETEO DE ACTUADORES                 /////
//////////////////////////////////////////////////////////

{$REGION 'Seteo de Actuadores -> Botones ON/OFF A/C'}
procedure Tfrm_Principal.SetValorActuador(IDRTU, DirMem, Valor: integer);
begin
     SocketSuscripcion.Socket.SendText('06'+inttostr(IDRTU)+inttostr(DirMem)+IntToStr(valor));
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
begin     /PRUEABAAAA
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
    try
      valor:= strtoint( InputBox('SetValor','Ingrese el Porcentaje de apertura de los álabes (0-100)','100'));
    except
      Showmessage('Valor Incorrecto');
      exit;
    end;
    SetValorActuador(2,40007,valor);
end;


{$ENDREGION}


{$REGION 'Actualizacion GUI según cambio de valores en Actuadores'}

procedure Tfrm_Principal.RTU1_ACC0003ValueChange(Sender: TObject);
begin
    // Compuerta de Desvío de Agua
    case trunc(RTU1_ACC0003.ValueRaw) of
      0: btn_CompuertaDesvio_CLOSE.Down:=true;
      1: btn_CompuertaDesvio_OPEN.Down:=true;
    end;
end;

procedure Tfrm_Principal.RTU1_ACC0004ValueChange(Sender: TObject);
begin
    // Compuerta de Ingreso de Agua a Tubería Forzada
    case trunc(RTU1_ACC0004.ValueRaw) of
      0: btn_CompuertaIngreso_CLOSE.Down:=true;
      1: btn_CompuertaIngreso_OPEN.Down:=true;
    end;
end;

procedure Tfrm_Principal.RTU2_AT10003ValueChange(Sender: TObject);
begin
    //  Válvula mariposa
    case trunc(RTU2_AT10003.ValueRaw) of
      0: btn_Mariposa_CLOSE.Down:=true;
      1: btn_Mariposa_OPEN.Down:=true;
    end;
end;

procedure Tfrm_Principal.RTU2_AT10004ValueChange(Sender: TObject);
begin
    // Bypass Válvula mariposa
    case trunc(RTU2_AT10004.ValueRaw) of
      0: btn_Bypass_CLOSE.Down:=true;
      1: btn_Bypass_OPEN.Down:=true;
    end;
end;


procedure Tfrm_Principal.RTU2_AT10011ValueChange(Sender: TObject);
begin
    // Sistema de Refrigeracion
    case trunc(RTU2_AT10011.ValueRaw) of
      0: btn_Refrigeracion_OFF.Down:=true;
      1: btn_Refrigeracion_ON.Down:=true;
    end;
end;


procedure Tfrm_Principal.RTU2_AT10016ValueChange(Sender: TObject);
begin
    // Generador
    case trunc(RTU2_AT10016.ValueRaw) of
      0: btn_Generador_OFF.Down:=true; //OFF
      1: btn_Generador_ON.Down:=true;  //ON
    end;
end;

procedure Tfrm_Principal.RTU2_AT10017ValueChange(Sender: TObject);
begin
    // Regulador de Velocidad
    case trunc(RTU2_AT10017.ValueRaw) of
      0: btn_ReguladorVelocidad_OFF.Down:=true; //OFF
      1: btn_ReguladorVelocidad_ON.Down:=true;  //ON
    end;
end;

procedure Tfrm_Principal.RTU2_AT10018ValueChange(Sender: TObject);
begin
    // Equipo de Excitacion
    case trunc(RTU2_AT10018.ValueRaw) of
      0: btn_EquipoExcitacion_OFF.Down:=true; //OFF
      1: btn_EquipoExcitacion_ON.Down:=true;  //ON
    end;
end;

procedure Tfrm_Principal.RTU2_AT10019ValueChange(Sender: TObject);
begin
    // Unidad de Sincronizacion
    case trunc(RTU2_AT10019.ValueRaw) of
      0: btn_USincronismo_OFF.Down:=true;
      1: btn_USincronismo_ON.Down:=true;
    end;
end;

procedure Tfrm_Principal.RTU3_ASA0002ValueChange(Sender: TObject);
begin
    // Compuertas de Mantenimiento
    case trunc(RTU3_ASA0002.ValueRaw) of
      0: btn_CompuertasMantenimiento_CLOSE.Down:=true;
      1: btn_CompuertasMantenimiento_OPEN.Down:=true;
    end;
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
 //   SocketSuscripcion.Active:= false;
  //  SocketSuscripcion.Host:= '127.0.0.1';
   // SocketSuscripcion.Port:= 9000;
   // SocketSuscripcion.Active:= true;

   //  frm_Principal.Width:= 767;
     TimerFechaHoraTimer(self);

//     HabilitarBotonesActuadores(false);
     btnHabilitados:= false;
end;


procedure Tfrm_Principal.HabilitarBotonesActuadores(valor: boolean);
begin
    btn_CompuertaDesvio_OPEN.Enabled:= valor;
    btn_CompuertaDesvio_CLOSE.Enabled:= valor;
    btn_CompuertaIngreso_CLOSE.Enabled:= valor;
    btn_CompuertaIngreso_OPEN.Enabled:= valor;
    btn_USincronismo_ON.Enabled:= valor;
    btn_USincronismo_OFF.Enabled:= valor;
    btn_Generador_OFF.Enabled:= valor;
    btn_Generador_ON.Enabled:= valor;
    btn_EquipoExcitacion_OFF.Enabled:= valor;
    btn_EquipoExcitacion_ON.Enabled:= valor;
    btn_ReguladorVelocidad_OFF.Enabled:= valor;
    btn_ReguladorVelocidad_ON.Enabled:= valor;
    btn_Refrigeracion_ON.Enabled:= valor;
    btn_Refrigeracion_OFF.Enabled:= valor;
    btn_CompuertasMantenimiento_OPEN.Enabled:= valor;
    btn_CompuertasMantenimiento_CLOSE.Enabled:= valor;
    btn_Bypass_OPEN.Enabled:= valor;
    btn_Bypass_CLOSE.Enabled:= valor;
    btn_Mariposa_OPEN.Enabled:= valor;
    btn_Mariposa_CLOSE.Enabled:= valor;
    btn_FrenosGenerador.Enabled:= valor;
    btn_AperturaAlabe.Enabled:= valor;
    btn_FrenosTurbina.Enabled:= valor;
end;

procedure Tfrm_Principal.TimerFechaHoraTimer(Sender: TObject);
begin
    lblFecha.Caption:= datetostr(now);
    lblHora.Caption:= FormatDateTime('hh:nn', now);
end;

end.
