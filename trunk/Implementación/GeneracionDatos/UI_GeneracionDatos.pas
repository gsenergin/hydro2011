unit UI_GeneracionDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CommPort, tcp_udpport, ProtocolDriver,
  ModBusDriver, ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock,
  PLCBlock, ScktComp, Sockets, Grids, DBGrids, DB, ADODB, HMILabel, PLCTagNumber;

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
    ADOConnection1: TADOConnection;
    ADOTable_Sensor: TADOTable;
    Label8: TLabel;
    HMILabel1: THMILabel;
    RTU1_SCC0001: TPLCTagNumber;
    RTU1_SCC0002: TPLCTagNumber;
    RTU1_ACC0003: TPLCTagNumber;
    RTU1_ACC0004: TPLCTagNumber;
    RTU1_SCC0005: TPLCTagNumber;
    RTU2_ST10001: TPLCTagNumber;
    RTU2_ST10002: TPLCTagNumber;
    RTU2_AT10003: TPLCTagNumber;
    RTU2_AT10004: TPLCTagNumber;
    RTU2_ST10005: TPLCTagNumber;
    RTU2_AT10006: TPLCTagNumber;
    RTU2_AT10007: TPLCTagNumber;
    RTU2_ST10008: TPLCTagNumber;
    RTU2_ST10009: TPLCTagNumber;
    RTU2_ST10010: TPLCTagNumber;
    RTU2_AT10011: TPLCTagNumber;
    RTU2_ST10012: TPLCTagNumber;
    RTU2_ST10013: TPLCTagNumber;
    RTU2_ST10014: TPLCTagNumber;
    RTU2_AT10015: TPLCTagNumber;
    RTU2_AT10016: TPLCTagNumber;
    RTU2_AT10017: TPLCTagNumber;
    RTU2_AT10018: TPLCTagNumber;
    RTU2_AT10019: TPLCTagNumber;
    RTU2_ST10020: TPLCTagNumber;
    RTU2_ST10021: TPLCTagNumber;
    RTU3_SSA0001: TPLCTagNumber;
    RTU3_ASA0002: TPLCTagNumber;
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

const ABIERTO=1; ENCENDIDO=1; ERROR=1;
		CERRADO=0; APAGADO=0;   CORRECTO=0;



implementation

{$R *.dfm}




procedure Tfrm_GeneracionDatos.btn_ComenzarGeneracionClick(Sender: TObject);

begin
    TCP_UDPPort1.Host:= txt_Host.text;
    TCP_UDPPort1.Port:= strtoint(txt_Puerto.Text);
//    PLCBlock_RTU1.RefreshTime:= strtoint(txt_Refresco.text);
//    PLCBlock_RTU2.RefreshTime:= strtoint(txt_Refresco.text);
//    PLCBlock_RTU3.RefreshTime:= strtoint(txt_Refresco.text);
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
//    PLCBlock_RTU1.Read;
//    PLCBlock_RTU2.Read;
//    PLCBlock_RTU3.Read;

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
              begin
                  // Se incrementa el valor
                  valorNuevo:= valorAnterior + dadoDelta;
                  if valorNuevo>LimiteSuperior then valorNuevo:= LimiteSuperior;
              end
              else
              begin
                  // Se decrementa el valor
                  valorNuevo:= valorAnterior - dadoDelta;
                  if valorNuevo<LimiteInferior then valorNuevo:= LimiteInferior;
              end;
                  
           end;
       until (valorNuevo>=LimiteInferior) and(valorNuevo<=LimiteSuperior);

      result:= trunc(valorNuevo);
  end;


var i: integer;
    probAumentar,probMantener,probDisminuir: double;
    porcentajeTotalAnterior, porcentajeTotalActual: double;
(*TEMP*)  PCAnterior , PACCAnterior, PCActual , PACCActual: integer; 


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
	 // Afectado por Sensores[1], y por los actuadores RTU1_ACC0003 y RTU1_ACC0004
	 // RTU1_ACC0003 = Compuerta desvio
	 // RTU1_ACC0004 = Compuerta ingreso a tuberia forzada
	 
	 incIndex(Sensores[2].index);
   i:= Sensores[2].index;

	 if (trunc(RTU1_ACC0003.Value)=CERRADO) and (trunc(RTU1_ACC0004.Value)=CERRADO) then
	 begin
		  // Disminuye el Nivel de Desborde (+Agua en Camara de Carga)
		  Sensores[2].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[2].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[2].LL,
                  (* Limite Superior *) Sensores[2].HH,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.0,
                  (* Probabilidad -- *) 1.0,
                  (* Delta Cambio    *) 1);
	 end
	 else 
	 if (trunc(RTU1_ACC0003.Value)=CERRADO) and (trunc(RTU1_ACC0004.Value)=ABIERTO) then
	 begin
		  // Aumenta el Nivel de Desborde (-Agua en Camara de Carga)
		  Sensores[2].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[2].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[2].LL,
                  (* Limite Superior *) Sensores[2].HH,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 1.0, ///OJO ACA...debuguear
                  (* Probabilidad -- *) 0.0,
                  (* Delta Cambio    *) 3);
	 end
   else
	 if (trunc(RTU1_ACC0003.Value)=ABIERTO) and (trunc(RTU1_ACC0004.Value)= CERRADO) then
	 begin
		  // Disminuye el Nivel de Desborde (+Agua en Camara de Carga)
		  Sensores[2].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[2].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[2].LL,
                  (* Limite Superior *) Sensores[2].HH,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.2,
                  (* Probabilidad -- *) 0.8,
                  (* Delta Cambio    *) 1);
	 end
   else
	 if (trunc(RTU1_ACC0003.Value)=ABIERTO) and (trunc(RTU1_ACC0004.Value)=ABIERTO) then
	 begin
		  // ? el Nivel de Desborde (Agua en Camara de Carga)

		  // Depende del vaor anterior del caudal de entrada
		  if (Sensores[2].valores[antIndex(i)] < Sensores[2].valores[antIndex(antIndex(i))]) then
		  begin
				// Viene en aumento
				probAumentar:= 0.6;
				probMantener:= 0.2;
				probDisminuir:= 0.2;
		  end else
		  if (Sensores[2].valores[antIndex(i)] > Sensores[2].valores[antIndex(antIndex(i))]) then
		  begin
				// Viene en disminucion
				probAumentar:= 0.2;
				probMantener:= 0.2;
				probDisminuir:= 0.6;
		  end else
		  begin
				// Se mantiene
				probAumentar:= 0.2;
				probMantener:= 0.6;
				probDisminuir:= 0.2;
		  end;
		  
		  Sensores[2].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[2].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[2].LL,
                  (* Limite Superior *) Sensores[2].HH,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);
		  
	 end; 
	 
   (*----      SCC005 - Sensores[3] - Presion Tuberia Forzada   ----*)
	 // Afectado por Sensores[1] y Sensores[2], y por el actuador RTU1_ACC0004
	 // RTU1_ACC0004 = Compuerta ingreso a tuberia forzada
	 incIndex(Sensores[3].index);
   i:= Sensores[3].index;
	  
	 if (RTU1_ACC0004.Value = CERRADO) then
	 begin
		  // Si la compuerta de ingreso a la tuberia forzada ha sido cerrada, el agua
		  // y la presion disminuyen drásticamente		
		  Sensores[3].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[3].valores[antIndex(i)],
                  (* Limite Inferior *) 0,
                  (* Limite Superior *) Sensores[3].HH,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.0,
                  (* Probabilidad -- *) 1.0,
                  (* Delta Cambio    *) 1);
	  end
	  else
	  begin
			// Aca hay que tener en cuenta el caudal de entrada y
			// el nivel de desborde
		//	try
(*TEMP*) PCAnterior:= trunc(Sensores[1].Valores[antIndex(i)]*100/Sensores[1].HH); //porcentajeCaudal
         
         PACCAnterior:= trunc((Sensores[2].Valores[antIndex(i)]+0.25)*100/Sensores[2].HH); //porcentajeAguaCC  
      
	   	   porcentajeTotalAnterior:= PCAnterior * PACCAnterior;  //porcentajeAguaCC

         PCActual:= trunc(Sensores[1].Valores[i]*100/Sensores[1].HH); //porcentajeCaudal
         PACCActual:= trunc((Sensores[2].Valores[i]+0.25)*100/Sensores[2].HH); //porcentajeAguaCC  
      
	   	   porcentajeTotalAnterior:= PCActual * PACCActual;  //porcentajeAguaCC

                
				if (porcentajeTotalAnterior<=porcentajeTotalActual) then
				begin
					// Viene en aumento
					probAumentar:= 0.8;
					probMantener:= 0.1;
					probDisminuir:= 0.1;
				end else
				if (porcentajeTotalAnterior>porcentajeTotalActual) then
				begin
					// Viene en disminucion
					probAumentar:= 0.1;
					probMantener:= 0.1;
					probDisminuir:= 0.8;
				end;
				
	(*		except
				// Producido por division por 0, porque el caudal de entrada es 0
				probAumentar:= 0.0;
				probMantener:= 0.1;
				probDisminuir:= 0.9;
			end;
	 *)		
			Sensores[3].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[3].valores[antIndex(i)],
                  (* Limite Inferior *) 0,
                  (* Limite Superior *) Sensores[3].HH,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);
			
	  end;
	  
	  
	  
     ///////////////////////////////////////////////////
     ///         RTU 2 - Turbina 1                   ///
     ///////////////////////////////////////////////////

     (*----      ST10001 - Sensores[4] - Presión A de la Válvula Mariposa    ----*)
	  incIndex(Sensores[4].index);
      i:= Sensores[4].index;
	  // Toma el valor del segundo anterior de la presion de la tuberia forzada
	  Sensores[4].Valores[i]:= Sensores[3].Valores[antIndex(i)];
	    
	  
     (*----      ST10002 - Sensores[5] - Presión B de la Válvula Mariposa    ----*)
	  // Afectado por Sensores[4] y por los actuadores 
	  // RTU2_AT10003 = Válvula Mariposa
      // RTU2_AT10004 = Bypass Válvula Mariposa
	  // Estos 2 actuadores no pueden estar abiertos a la vez
	  
	  incIndex(Sensores[5].index);
      i:= Sensores[5].index;
	  
	  if (RTU2_AT10003.Value = ABIERTO) then
	  begin
		  // Si la Valvula está abierta
		  // La presion es la misma que en el lado A
		  Sensores[5].Valores[i]:= Sensores[4].Valores[i];
	  end
	  else
	  if (RTU2_AT10004.Value = ABIERTO) then
	  begin
		  // Si el Bypass está abierto
		  // La presion en B aumenta hasta llegar a la del lado A	
	      Sensores[5].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[5].valores[antIndex(i)],
                  (* Limite Inferior *) 0,
                  (* Limite Superior *) Sensores[4].Valores[i],
                  (* Probabilidad ++ *) 1.0,
                  (* Probabilidad == *) 0.0,
                  (* Probabilidad -- *) 0.0,
                  (* Delta Cambio    *) 3);
	  end
	  else 
	  begin
		  // Bypass & Valvula cerrados
		  // La persion diminuye
		  Sensores[5].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[5].valores[antIndex(i)],
                  (* Limite Inferior *) 0,
                  (* Limite Superior *) Sensores[5].HH,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.0,
                  (* Probabilidad -- *) 1.0,
                  (* Delta Cambio    *) 3);
	  end;
	 
	  	  
     (*----      ST10005 - Sensores[6] - Presión Sobre Tapa Turbina    ----*)
	  incIndex(Sensores[6].index);
      i:= Sensores[6].index;
	  // La presion es igual a la del lado B de la valvula mariposa
	  Sensores[6].Valores[i]:= Sensores[5].Valores[i];
	
	
	
	
	 (*Se calcula antes porque se usa para las temperaturas*)
	 (*---!!!!   ST10014 - Sensores[12] - Estado Sistema Enfriamiento   ----*)
	 incIndex(Sensores[12].index);
     i:= Sensores[12].index;
	 // Es igual al valor anterior
	 Sensores[12].Valores[i]:= Sensores[12].Valores[antIndex(i)];
	 
	 	 
	  
     (*----      ST10008 - Sensores[7] - Temperatura Cojinetes Superiores   ----*)
	 // Afectado por Sensor[12] y Actuador
	 // RTU_ST10012 = Sistema de Refrigeracion
	 incIndex(Sensores[7].index);
     i:= Sensores[7].index;
	 
	 if (Sensores[12].Valores[i] = ERROR) or (trunc(RTU2_AT10011.Value) = APAGADO) then
	 begin
		 // La temperatura Aumenta
		 Sensores[7].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[7].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[7].LL,
                  (* Limite Superior *) 100,
                  (* Probabilidad ++ *) 0.8,
                  (* Probabilidad == *) 0.2,
                  (* Probabilidad -- *) 0.0,
                  (* Delta Cambio    *) 1);
	 end
	 else
	 begin
	     // La temperatura se Mantiene o Baja
		 Sensores[7].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[7].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[7].L,
                  (* Limite Superior *) 100,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.3,
                  (* Probabilidad -- *) 0.7,
                  (* Delta Cambio    *) 1);
	 end;

     (*----      ST10009 - Sensores[8] - Temperatura Cojinetes Inferiores     ----*)
	 // Afectado por Sensor[12] y Actuador
	 // RTU_ST10012 = Sistema de Refrigeracion
	 incIndex(Sensores[8].index);
     i:= Sensores[8].index;
	 
	 if (Sensores[12].Valores[i] = ERROR) or (trunc(RTU2_AT10011.Value) = APAGADO) then
	 begin
		 // La temperatura Aumenta
		 Sensores[8].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[8].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[8].LL,
                  (* Limite Superior *) 100,
                  (* Probabilidad ++ *) 0.8,
                  (* Probabilidad == *) 0.2,
                  (* Probabilidad -- *) 0.0,
                  (* Delta Cambio    *) 1);
	 end
	 else
	 begin
	     // La temperatura se Mantiene o Baja
		 Sensores[8].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[8].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[7].L,
                  (* Limite Superior *) 100,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.3,
                  (* Probabilidad -- *) 0.7,
                  (* Delta Cambio    *) 1);
	 end;
	 
	 
     (*----      ST10010 - Sensores[9] - Temperatura Cojinetes Turbina     ----*)
     // Afectado por Sensor[12] y Actuador
	 // RTU_ST10012 = Sistema de Refrigeracion
	 incIndex(Sensores[9].index);
     i:= Sensores[9].index;	
	 
	 if (Sensores[12].Valores[i] = ERROR) or (trunc(RTU2_AT10011.Value) = APAGADO) then
	 begin
		 // La temperatura Aumenta
		 Sensores[9].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[9].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[9].LL,
                  (* Limite Superior *) 100,
                  (* Probabilidad ++ *) 0.8,
                  (* Probabilidad == *) 0.2,
                  (* Probabilidad -- *) 0.0,
                  (* Delta Cambio    *) 1);
	 end
	 else
	 begin
	     // La temperatura se Mantiene o Baja
		 Sensores[9].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[9].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[7].L,
                  (* Limite Superior *) 100,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.3,
                  (* Probabilidad -- *) 0.7,
                  (* Delta Cambio    *) 1);
	 end;
	 
	 
     (*----      ST10012 - Sensores[10] - Caudal Turbinado   ----*)
	 // La turbina aguanta hasta 40 m^3 / s
	 // Depende de la apertura de los alabes y de la presion en la tuberia forzada
	 // algo mas??	

	 
     (*----      ST10013 - Sensores[11] - Velocidad Giro Turbina   ----*)

     

     (*----      ST10020 - Sensores[13] - Intensidad Corriente   ----*)

     (*----      ST10021 - Sensores[14] - Voltaje Generado   ----*)

     ///////////////////////////////////////////////////
     ///         RTU 3 - Salida                      ///
     ///////////////////////////////////////////////////

     (*----      SSA0001 - Sensores[15] - Nivel Desfogue   ----*)
     incIndex(Sensores[15].index);
     i:= Sensores[15].index;
	 // Debe ser igual al caudar turbinado
     Sensores[15].Valores[i]:= Sensores[10].Valores[i];

end;




procedure Tfrm_GeneracionDatos.TimerGeneracionTimer(Sender: TObject);
begin
     ActualizarValoresSensores();
      Label8.Caption:= floattostr( Sensores[1].Valores[ Sensores[1].index ] );
      
      // RTU 1
      RTU1_SCC0001.value:= Sensores[1].Valores[ Sensores[1].index ];
      RTU1_SCC0002.value:= Sensores[2].Valores[ Sensores[2].index ];
      RTU1_SCC0005.value:= Sensores[3].Valores[ Sensores[3].index ];
      // RTU 2
      RTU2_ST10001.value:= Sensores[4].Valores[ Sensores[4].index ];
      RTU2_ST10002.value:= Sensores[5].Valores[ Sensores[5].index ];
      RTU2_ST10005.value:= Sensores[6].Valores[ Sensores[6].index ];
      RTU2_ST10008.value:= Sensores[7].Valores[ Sensores[7].index ];
      RTU2_ST10009.value:= Sensores[8].Valores[ Sensores[8].index ];
      RTU2_ST10010.value:= Sensores[9].Valores[ Sensores[9].index ];
      RTU2_ST10012.value:= Sensores[10].Valores[ Sensores[10].index ];
      RTU2_ST10013.value:= Sensores[11].Valores[ Sensores[11].index ];
      RTU2_ST10014.value:= Sensores[12].Valores[ Sensores[12].index ];
      RTU2_ST10020.value:= Sensores[13].Valores[ Sensores[13].index ];
      RTU2_ST10021.value:= Sensores[14].Valores[ Sensores[14].index ];
      // RTU 3
      RTU3_SSA0001.value:= Sensores[15].Valores[ Sensores[15].index ];
  
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