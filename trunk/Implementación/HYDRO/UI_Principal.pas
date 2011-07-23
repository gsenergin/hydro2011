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
  UI_Grafico, Mask;

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
    cxButton5: TcxButton;
    dxSkinController1: TdxSkinController;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    lblUsuario: TcxLabel;
    lblTipoUsuario: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
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
    Image1: TImage;
    cxLabel11: TcxLabel;
    cxLabel13: TcxLabel;
    btnCompuertaDesvioAbierta: TcxButton;
    cxLabel14: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel34: TcxLabel;
    UpDown1: TUpDown;
    cxLabel37: TcxLabel;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    cxLabel41: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    cxLabel46: TcxLabel;
    cxLabel48: TcxLabel;
    cxLabel50: TcxLabel;
    cxLabel52: TcxLabel;
    btnCompuertaDesvioCerrada: TcxButton;
    btnCompuertaIngresoCerrada: TcxButton;
    btnCompuertaIngresoAbierta: TcxButton;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    cxLabel55: TcxLabel;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    cxButton14: TcxButton;
    cxButton15: TcxButton;
    cxButton16: TcxButton;
    cxButton17: TcxButton;
    cxButton18: TcxButton;
    cxButton19: TcxButton;
    cxButton20: TcxButton;
    cxButton21: TcxButton;
    cxLabel58: TcxLabel;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxLabel59: TcxLabel;
    cxButton6: TcxButton;
    cxButton11: TcxButton;
    cxLabel43: TcxLabel;
    cxLabel60: TcxLabel;
    cxButton22: TcxButton;
    cxButton23: TcxButton;
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
    cxLabel15: TcxLabel;
    StoredProc_HistorialSensado_Insertar: TADOStoredProc;
    ADOConnectionHYDRODB: TADOConnection;
    ADOTable_Sensor: TADOTable;
    DS_Sensor: TDataSource;
    DBGrid_Sensor: TDBGrid;
    btnHistorico: TcxButton;
    DBCrossTabSource1: TDBCrossTabSource;
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RTU1_ACC0003ValueChange(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure img_GolpeArieteClick(Sender: TObject);
    procedure btn_ConfiguracionCambiarValoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

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

procedure Tfrm_Principal.Button1Click(Sender: TObject);
begin
    TCP_UDPPort1.Active:= true;
end;



procedure Tfrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SocketSuscripcion.Socket.SendText('BAJA');
end;

procedure Tfrm_Principal.FormCreate(Sender: TObject);
begin
    // Activo el Socket
    //TCP_UDPPort1.Active:= true;


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
//    SocketSuscripcion.Active:= false;
//    SocketSuscripcion.Host:= '127.0.0.1';
//    SocketSuscripcion.Port:= 9000;
 //   SocketSuscripcion.Active:= true;

     frm_Principal.Width:= 767;
end;


procedure Tfrm_Principal.img_GolpeArieteClick(Sender: TObject);
begin

end;

// Cambio en La compuerta de Desvio
procedure Tfrm_Principal.RTU1_ACC0003ValueChange(Sender: TObject);
begin
    if trunc(RTU1_ACC0003.Value)=1 then
        btnCompuertaDesvioAbierta.SetFocus
    else
        btnCompuertaDesvioCerrada.SetFocus;

end;


end.
