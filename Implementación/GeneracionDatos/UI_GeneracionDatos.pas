unit UI_GeneracionDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CommPort, tcp_udpport, ProtocolDriver,
  ModBusDriver, ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock,
  PLCBlock, ScktComp, Sockets, Grids, DBGrids, DB, ADODB, HMILabel;

type

  TDatos = Array[1..30] of Double;
  TSensor = Array[1..15] of record
      LL,L,H,HH: double;
      nomenclatura: string;
      Valores: Array[0..9] of integer; // Historico ultimos 10 valores
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
    ADOConnection1: TADOConnection;
    ADOTable_Sensor: TADOTable;
    Label8: TLabel;
    HMILabel1: THMILabel;
    procedure btn_ComenzarGeneracionClick(Sender: TObject);
    procedure btn_DetenerGeneracionClick(Sender: TObject);
    procedure TimerGeneracionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarDatosBDenSensores();
    procedure ActualizarValoresSensores();
    procedure Button1Click(Sender: TObject);
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

    // Levanto los ultimos datos actuales de la RTU y los cargo en Sensores[i]
    PLCBlock_RTU1.Read;
    PLCBlock_RTU2.Read;
    PLCBlock_RTU3.Read;

        Sensores[1].Valores[0]:= trunc(RTU1_SCC0001.value);
        Sensores[2].Valores[0]:= trunc(RTU1_SCC0002.value);
        Sensores[3].Valores[0]:= trunc(RTU1_SCC0005.value);

        Sensores[4].Valores[0]:= trunc(RTU2_ST10001.value);
        Sensores[5].Valores[0]:= trunc(RTU2_ST10002.value);
        Sensores[6].Valores[0]:= trunc(RTU2_ST10005.value);
        Sensores[7].Valores[0]:= trunc(RTU2_ST10008.value);
        Sensores[8].Valores[0]:= trunc(RTU2_ST10009.value);
        Sensores[9].Valores[0]:= trunc(RTU2_ST10010.value);
        Sensores[10].Valores[0]:= trunc(RTU2_ST10012.value);
        Sensores[11].Valores[0]:= trunc(RTU2_ST10013.value);
        Sensores[12].Valores[0]:= trunc(RTU2_ST10014.value);
        Sensores[13].Valores[0]:= trunc(RTU2_ST10020.value);
        Sensores[14].Valores[0]:= trunc(RTU2_ST10021.value);

        Sensores[15].Valores[0]:= trunc(RTU3_SSA0001.value);

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

procedure Tfrm_GeneracionDatos.Button1Click(Sender: TObject);
begin
    Randomize;
    ShowMessage( floattostr(random(2)));
    ShowMessage( floattostr(random(2)));
    ShowMessage( floattostr(random(2)));
    ShowMessage( floattostr(random(2)));

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
var i,j: integer;
begin
    randomize();
    for i:=1 to 15 do
      with Sensores[i] do
      begin
        for j:=0 to 9 do
          begin
            index:=0;
            Valores[index]:= 0;
          end;
      end;
    // Cargo los Limites LL,L,H,HH para cada sensor
    CargarDatosBDenSensores();
end;



procedure Tfrm_GeneracionDatos.ActualizarValoresSensores;

  function antIndex(num: integer): integer;
  begin
    if num>=1 then
      result:= num-1
    else
      result:= 9;
  end;
  procedure incIndex(var index:integer);
  begin
    index := (index + 1) mod 10; // de 0 a 9
  end;

  function aleatorio(valorAnterior:integer;
                      LimiteInferior, LimiteSuperior: double;
                      probabilidadIncrementar, probabilidadMantenerse,
                      probabilidadDecrementar: double;
                      rangoIncremento:integer): integer;
  var valorNuevo: double;
      dado, dadoDelta: double;
  begin
       
       repeat
           dado:= random();
           if dado <= probabilidadMantenerse then
           begin
              // Se mantiene el valor anterior
              valorNuevo:= valorAnterior;
           end
           else
           begin
              repeat
                dadoDelta:= random(rangoIncremento)+1;
              until dadoDelta<>0;
              
              if dado<=(probabilidadMantenerse+probabilidadIncrementar) then
                  // Se incrementa el valor
                  valorNuevo:= valorAnterior + dadoDelta
               else
                  // Se decrementa el valor
                  valorNuevo:= valorAnterior - dadoDelta
           end;
       until (valorNuevo>=LimiteInferior) and(valorNuevo<=LimiteSuperior);

      result:= trunc(valorNuevo);
  end;


var i: integer;
begin

     ///////////////////////////////////////////////////
     ///         RTU 1 - Camara de Carga             ///
     ///////////////////////////////////////////////////

     (*----      SCC001 - Sensores[1] - Caudal de Entrada    ----*)

      incIndex(Sensores[1].index);
      i:= Sensores[1].index;
      
      case radioCaudalEntrada.ItemIndex of

        0: (* Poco Caudal: Entre 1 y 40 m^3/seg *)
        begin
            Sensores[1].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[1].valores[antIndex(i)],
                  (* Limite Inferior *) 1,
                  (* Limite Superior *) 40,
                  (* Probabilidad ++ *) 0.30,
                  (* Probabilidad == *) 0.50,
                  (* Probabilidad -- *) 0.20,
                  (* Delta Cambio    *) 1);
        end;

        1: (* Mucho Caudal: +40 m^3/seg*)
        begin
            Sensores[1].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[1].valores[antIndex(i)],
                  (* Limite Inferior *) 40,
                  (* Limite Superior *) 80,
                  (* Probabilidad ++ *) 0.33,
                  (* Probabilidad == *) 0.33,
                  (* Probabilidad -- *) 0.34,
                  (* Delta Cambio    *) 1);
        end;
      end;


     (*----      SCC002 - Sensores[2] - Nivel Desborde en Camara    ----*)

     (*----      SCC005 - Sensores[3] - Presion Tuberia Forzada   ----*)

     ///////////////////////////////////////////////////
     ///         RTU 2 - Turbina 1                   ///
     ///////////////////////////////////////////////////

     (*----      ST10001 - Sensores[4]    ----*)

     (*----      ST10002 - Sensores[5]    ----*)

     (*----      ST10005 - Sensores[6]    ----*)

     (*----      ST10008 - Sensores[7]    ----*)

     (*----      ST10009 - Sensores[8]    ----*)

     (*----      ST10010 - Sensores[9]    ----*)

     (*----      ST10012 - Sensores[10]    ----*)

     (*----      ST10013 - Sensores[11]    ----*)

     (*----      ST10014 - Sensores[12]    ----*)

     (*----      ST10020 - Sensores[13]    ----*)

     (*----      ST10021 - Sensores[14]    ----*)

     ///////////////////////////////////////////////////
     ///         RTU 3 - Salida                      ///
     ///////////////////////////////////////////////////

     (*----      SSA0001 - Sensores[15]    ----*)

     

end;




procedure Tfrm_GeneracionDatos.TimerGeneracionTimer(Sender: TObject);
begin
      ActualizarValoresSensores();
      Label8.Caption:= floattostr( Sensores[1].Valores[ Sensores[1].index ] );
      
      // RTU 1
      RTU1_SCC0001.value:= Sensores[1].Valores[ Sensores[1].index ];


 (*     RTU1_SCC0002.value:= Sensores[2].Valores[1];
      RTU1_SCC0005.value:= Sensores[3].Valores[1];
      // RTU 2
      RTU2_ST10001.value:= Sensores[4].Valores[1];
      RTU2_ST10002.value:= Sensores[5].Valores[1];
      RTU2_ST10005.value:= Sensores[6].Valores[1];
      RTU2_ST10008.value:= Sensores[7].Valores[1];
      RTU2_ST10009.value:= Sensores[8].Valores[1];
      RTU2_ST10010.value:= Sensores[9].Valores[1];
      RTU2_ST10012.value:= Sensores[10].Valores[1];
      RTU2_ST10013.value:= Sensores[11].Valores[1];
      RTU2_ST10014.value:= Sensores[12].Valores[1];
      RTU2_ST10020.value:= Sensores[13].Valores[1];
      RTU2_ST10021.value:= Sensores[14].Valores[1];
      // RTU 3
      RTU3_SSA0001.value:= Sensores[15].Valores[1];
      *)


end;

end.


(*
    RTU1_SCC0001.
    RTU1_SCC0002
    RTU1_ACC0003
    RTU1_ACC0004
    RTU1_SCC0005

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