unit UI_GeneracionDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CommPort, tcp_udpport, ProtocolDriver,
  ModBusDriver, ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock,
  PLCBlock, ScktComp, Sockets, Grids, DBGrids, DB, ADODB;

type

  TDatos = Array[1..30] of Double;
  TSensor = Array[1..15] of record
      LL,L,H,HH: double;
      nomenclatura: string;
      Valores: Array[1..10] of double; // Historico ultimos 10 valores
      index: integer;
  end;

  Tfrm_GeneracionDatos = class(TForm)
    btn_ComenzarGeneracion: TButton;
    btn_DetenerGeneracion: TButton;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    txt_Refresco: TEdit;
    txt_Host: TEdit;
    txt_Puerto: TEdit;
    ModBusTCPDriver1: TModBusTCPDriver;
    TCP_UDPPort1: TTCP_UDPPort;
    TimerGeneracion: TTimer;
    Panel1: TPanel;
    radioCaudalEntrada: TRadioGroup;
    radioRangoSensores: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cmbSensor: TComboBox;
    Label3: TLabel;
    txtValorSensor: TEdit;
    Button3: TButton;
    memoDetalleSensor: TMemo;
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
    DS_Sensores: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTable_Sensor: TADOTable;
    DBGrid1: TDBGrid;
    procedure btn_ComenzarGeneracionClick(Sender: TObject);
    procedure btn_DetenerGeneracionClick(Sender: TObject);
    procedure TimerGeneracionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarDatosBDenSensores();
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frm_GeneracionDatos: Tfrm_GeneracionDatos;
  Sensores: TSensor;



implementation

{$R *.dfm}

procedure Tfrm_GeneracionDatos.btn_ComenzarGeneracionClick(Sender: TObject);
begin
    // Levantar datos de la BD


    TCP_UDPPort1.Host:= txt_Host.text;
    TCP_UDPPort1.Port:= strtoint(txt_Puerto.Text);
    PLCBlock_RTU1.RefreshTime:= strtoint(txt_Refresco.text);
    PLCBlock_RTU2.RefreshTime:= strtoint(txt_Refresco.text);
    PLCBlock_RTU3.RefreshTime:= strtoint(txt_Refresco.text);
    TimerGeneracion.Interval:= strtoint(txt_Refresco.text);

    // Abro la conexión TCP/UDP
    TCP_UDPPort1.Active:= true;

    // Bloqueo los controles para setear configuraciones
    txt_Refresco.Enabled:= false;
    txt_Host.Enabled:= false;
    txt_Puerto.Enabled:= false;
    btn_ComenzarGeneracion.Enabled:= false;
    btn_DetenerGeneracion.Enabled:= true;

    // Disparo el timer
    TimerGeneracion.Enabled:= true
end;

procedure Tfrm_GeneracionDatos.btn_DetenerGeneracionClick(Sender: TObject);
begin
    // Cierro la conexión TCP/UDP
    TCP_UDPPort1.Active:= false;
    // Detengo el timer
    TimerGeneracion.Enabled:= false;
    
    // Desbloqueo los controles para setear configuraciones
    txt_Refresco.Enabled:= true;
    txt_Host.Enabled:= true;
    txt_Puerto.Enabled:= true;
    btn_ComenzarGeneracion.Enabled:= true;
    btn_DetenerGeneracion.Enabled:= false;
end;

procedure Tfrm_GeneracionDatos.CargarDatosBDenSensores;
var i:integer;
begin
    ADOConnection1.Connected:= true;
    ADOTable_Sensor.Active:= true;
    i:=1;
    ADOTable_Sensor.First;
    while not ADOTable_Sensor.Eof do
    begin
        Sensores[i].nomenclatura:= ADOTable_Sensor.FieldByName('nomenclatura').AsString;
        Sensores[i].LL:= ADOTable_Sensor.FieldByName('valorLL').AsFloat;
        Sensores[i].L:= ADOTable_Sensor.FieldByName('valorL').AsFloat;
        Sensores[i].H:= ADOTable_Sensor.FieldByName('valorH').AsFloat;
        Sensores[i].HH:= ADOTable_Sensor.FieldByName('valorHH').AsFloat;
        inc(i);
        ADOTable_Sensor.Next;
    end;
    ADOTable_Sensor.Active:= false;
    ADOConnection1.Connected:= false;
end;

procedure Tfrm_GeneracionDatos.FormCreate(Sender: TObject);
var i: integer;
begin
    for i:=1 to 15 do
      with Sensores[i] do
      begin
        index:=1;
        Valores[index]:= 0;
      end;
      
    CargarDatosBDenSensores();
end;

procedure Tfrm_GeneracionDatos.TimerGeneracionTimer(Sender: TObject);
begin
  //
end;

end.


(*
 RTU1_SCC0001.
    RTU1_SCC0002
    RTU1_ACC0003
    RTU1_ACC0004
    RTU1_SCC0003

    RTU2_ST10001
    RTU2_ST10002
    RTU2_AT10003
    RTU2_AT10004
    RTU2_ST10005
    RTU2_AT10006
    RTU2_AT10007
    RTU2_ST10008
    RTU2_ST10009
    RTU2_ST10010
    RTU2_AT10011
    RTU2_ST10012
    RTU2_ST10013
    RTU2_ST10014
    RTU2_AT10015
    RTU2_AT10016
    RTU2_AT10017
    RTU2_AT10018
    RTU2_AT10019
    RTU2_ST10020
    RTU2_ST10021


    RTU3_SSA0001
    RTU3_ASA0002

*)