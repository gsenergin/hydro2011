unit UI_GeneracionDatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CommPort, tcp_udpport, ProtocolDriver,
  ModBusDriver, ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock,
  PLCBlock, ScktComp, Sockets, Grids, DBGrids, DB, ADODB, HMILabel, PLCTagNumber,
  ComCtrls;

type

//  TDatos = Array[1..30] of Double;
  TSensor = Array[1..15] of record
      LL,L,H,HH: integer;
      max,min: integer;
      LimiteInferior, LimiteSuperior: integer;
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
    TimerGeneracion: TTimer;
    Panel1: TPanel;
    radioCaudalEntrada: TRadioGroup;
    radioRangoSensores: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ADOConnection1: TADOConnection;
    ADOTable_Sensor: TADOTable;
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
    TCP_UDPPort1: TTCP_UDPPort;
    StatusBar1: TStatusBar;
    chkErrorEnfriamiento: TCheckBox;
    procedure btn_ComenzarGeneracionClick(Sender: TObject);
    procedure btn_DetenerGeneracionClick(Sender: TObject);
    procedure TimerGeneracionTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarDatosBDenSensores();
    procedure ActualizarValoresSensores();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure radioRangoSensoresClick(Sender: TObject);
    procedure radioCaudalEntradaClick(Sender: TObject);
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
    TCP_UDPPort1.Lock(ModBusTCPDriver1.DriverID);
    
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

    // Cargo los datos actuales de la RTU en memoria
        //Sensores[1].Valores[0]:= trunc(RTU1_SCC0001.value);
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
        Sensores[i].LL:= ADOTable_Sensor.FieldByName('valorLL').AsInteger;
        Sensores[i].L:= ADOTable_Sensor.FieldByName('valorL').AsInteger;
        Sensores[i].H:= ADOTable_Sensor.FieldByName('valorH').AsInteger;
        Sensores[i].HH:= ADOTable_Sensor.FieldByName('valorHH').AsInteger;
        Sensores[i].Min:= ADOTable_Sensor.FieldByName('min').AsInteger;
        Sensores[i].Max:= ADOTable_Sensor.FieldByName('max').AsInteger;

        inc(i);
        ADOTable_Sensor.Next;
    end;
    ADOTable_Sensor.Active:= false;
    ADOConnection1.Connected:= false;

    // Actualizo los limites de generacion en funcion de las alertas que quiere provocar el usuario
    radioRangoSensoresClick(self);
    radioCaudalEntradaClick(self);
end;

procedure Tfrm_GeneracionDatos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    TCP_UDPPort1.Active:= false;
    ModBusTCPDriver1.Free;
    TCP_UDPPort1.Free;
end;

procedure Tfrm_GeneracionDatos.FormCreate(Sender: TObject);
var i,j: integer;
begin
    frm_GeneracionDatos.Width:= 410;
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
    // Cargo los Limites min,LL,L,H,HH,max para cada sensor
    CargarDatosBDenSensores();
end;




procedure Tfrm_GeneracionDatos.radioCaudalEntradaClick(Sender: TObject);
begin
    
     case radioCaudalEntrada.ItemIndex of
        // Poco Caudal
        0: begin
          Sensores[1].LimiteInferior:= Sensores[1].min;
          Sensores[1].LimiteSuperior:= Sensores[1].max div 3;
        end;
        // Mucho Caudal
        1: begin
          Sensores[1].LimiteInferior:= Sensores[1].max div 3;
          Sensores[1].LimiteSuperior:= Sensores[1].max;
        end;
        // Valor Fijo
        2: begin
            Sensores[1].LimiteInferior:= 30;
            Sensores[1].LimiteSuperior:= 30;
            Sensores[1].Valores[ Sensores[1].index ]:= 30;
        end;
        3: begin
            Sensores[1].LimiteInferior:= 60;
            Sensores[1].LimiteSuperior:= 60;
            Sensores[1].Valores[ Sensores[1].index ]:= 60;
        end;
     end;
end;

procedure Tfrm_GeneracionDatos.radioRangoSensoresClick(Sender: TObject);
var i: integer;
begin
    for i:= 2 to 15 do
    begin
          Sensores[i].LimiteInferior:= Sensores[i].min;
          Sensores[i].LimiteSuperior:= Sensores[i].max;
    end;

    for i:= 3 to 6 do   // Presiones
          Sensores[i].LimiteSuperior:= Sensores[i].HH;

    case radioRangoSensores.ItemIndex of
      // Sin Alertas  L < x < H 
      0: begin
            for i:= 7 to 9 do // temperaturras
              Sensores[i].LimiteSuperior:= Sensores[i].H;
      end;
      // Alertas Leves LL < x < HH
      1: begin
            for i:= 7 to 9 do // temperaturras
              Sensores[i].LimiteSuperior:= Sensores[i].HH;
      end;
      // Alertas Graves   min < x < max
      2:begin
          for i:= 7 to 9 do // temperaturras
            Sensores[i].LimiteInferior:= Sensores[i].min;
      end;

    end;(*END CASE*)

end;

procedure Tfrm_GeneracionDatos.ActualizarValoresSensores;

  function antIndex(num: integer): integer;
  begin
    if num>=1 then
      result:= num-1
    else
      result:= 9;
  end;
  function incIndex(var index:integer): integer;
  begin
    index := (index + 1) mod 10; // de 0 a 9
    result:= index;
  end;

  function aleatorio(valorAnterior:integer;
                      LimiteInferior, LimiteSuperior: integer;
                      probabilidadIncrementar, probabilidadMantenerse,
                      probabilidadDecrementar: double;
                      rangoIncremento:integer): integer;
  var valorNuevo: double;
      dado, dadoDelta: double;
  begin
       
      // repeat
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

              if (dado<=(probabilidadMantenerse+probabilidadIncrementar)) or
                 (valorAnterior<LimiteInferior) then
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
      // until (valorNuevo>=LimiteInferior) and(valorNuevo<=LimiteSuperior);

      result:= trunc(valorNuevo);
  end;


var i: integer;
    probAumentar,probMantener,probDisminuir: double;
    delta: integer;
    porcentajeTotalAnterior, porcentajeTotalActual: double;
(*TEMP*)  PCAnterior , PACCAnterior, PCActual , PACCActual: integer;
    Xfrenos, Xalaves: double;


begin
     
     ///////////////////////////////////////////////////
     ///         RTU 1 - Camara de Carga             ///
     ///////////////////////////////////////////////////

     (*----      SCC001 - Sensores[1] - Caudal de Entrada    ----*)

      i:= incIndex(Sensores[1].index);

      case radioCaudalEntrada.ItemIndex of
        0: (* Poco Caudal*)
        begin
            probAumentar:= 0.3;
            probMantener:= 0.5;
            probDisminuir:= 0.2;
        end;
        1: (* Mucho Caudal*)
        begin
            probAumentar:= 0.33;
            probMantener:= 0.33;
            probDisminuir:= 0.34;
        end;
        2,3: (*Valor Fijo*)
        begin
            probAumentar:= 0.0;
            probMantener:= 1.0;
            probDisminuir:= 0.0;
        end;
      end;


      Sensores[1].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[1].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[1].LimiteInferior,
                  (* Limite Superior *) Sensores[1].LimiteSuperior,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);




     (*----      SCC002 - Sensores[2] - Nivel Desborde en Camara    ----*)
	   // Afectado por Sensores[1], y por los actuadores RTU1_ACC0003 y RTU1_ACC0004
  	 // RTU1_ACC0003 = Compuerta desvio
	   // RTU1_ACC0004 = Compuerta ingreso a tuberia forzada

	   i:= incIndex(Sensores[2].index);

	   if (trunc(RTU1_ACC0003.Value)=CERRADO) and (trunc(RTU1_ACC0004.Value)=CERRADO) then
	   begin
         // Disminuye el Nivel de Desborde (+Agua en Camara de Carga)
         probAumentar:=  0.0;
         probMantener:=  0.0;
         probDisminuir:= 1.0;
         delta:= 1;
	   end
	   else
	   if (trunc(RTU1_ACC0003.Value)=CERRADO) and (trunc(RTU1_ACC0004.Value)=ABIERTO) then
	   begin
		     // Mantiene
         probAumentar:=  0.0;
         probMantener:=  1.0;   ///OJO ACA...debuguear
         probDisminuir:= 0.0;
         delta:= 3;
  	 end
     else
  	 if (trunc(RTU1_ACC0003.Value)=ABIERTO) and (trunc(RTU1_ACC0004.Value)= CERRADO) then
   	 begin
		     // Aumenta el Nivel de Desborde (-Agua en Camara de Carga)
         probAumentar:=  0.8;
         probMantener:=  0.2;   ///OJO ACA...debuguear
         probDisminuir:= 0.0;
         delta:= 1;
  	 end
     else
   	 if (trunc(RTU1_ACC0003.Value)=ABIERTO) and (trunc(RTU1_ACC0004.Value)=ABIERTO) then
   	 begin
		     // Rl Nivel de Desborde (Agua en Camara de Carga)
         // Depende del vaor anterior del caudal de entrada
  		  if (Sensores[2].valores[antIndex(i)] < Sensores[2].valores[antIndex(antIndex(i))]) then
	  	  begin
		  		  // Viene en aumento
			  	  probAumentar:= 0.2;
			  	  probMantener:= 0.2;
  	  			probDisminuir:= 0.6;
	  	  end else
		    if (Sensores[2].valores[antIndex(i)] > Sensores[2].valores[antIndex(antIndex(i))]) then
		    begin
			  	  // Viene en disminucion
  	  			probAumentar:= 0.6;
	    			probMantener:= 0.2;
		    		probDisminuir:= 0.2;
		    end else
  		  begin
	    			// Se mantiene
	      		probAumentar:= 0.15;
	  		  	probMantener:= 0.7;
		  		  probDisminuir:= 0.15;
  		  end;
        delta:= 1;
  	 end;

   		  
		 Sensores[2].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[2].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[2].LimiteInferior,
                  (* Limite Superior *) Sensores[2].LimiteSuperior,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) delta);



                  
     (*----      SCC005 - Sensores[3] - Presion Tuberia Forzada   ----*)
  	 // Afectado por Sensores[1] y Sensores[2], y por el actuador RTU1_ACC0004
	   // RTU1_ACC0004 = Compuerta ingreso a tuberia forzada
  	 i:= incIndex(Sensores[3].index);

	   if (RTU1_ACC0004.Value = CERRADO) then
	   begin
		     // Si la compuerta de ingreso a la tuberia forzada ha sido cerrada, el agua
		     // y la presion disminuyen drásticamente
	       probAumentar:=  0.0;
	  		 probMantener:=  0.0;
		  	 probDisminuir:= 1.0;
     end
	   else
	   begin
			   // Aca hay que tener en cuenta el % de Caudal de Entrada y % Agua en camara de carga
         // del instante actual, y del anterior
         //	try
         PCAnterior:= trunc(Sensores[1].Valores[antIndex(i)]*100/Sensores[1].HH);
         PACCAnterior:= trunc((Sensores[2].Valores[antIndex(i)]+0.25)*100/Sensores[2].HH);
	   	   porcentajeTotalAnterior:= PCAnterior * PACCAnterior;

         PCActual:= trunc(Sensores[1].Valores[i]*100/Sensores[1].HH);
         PACCActual:= trunc((Sensores[2].Valores[i]+0.25)*100/Sensores[2].HH);
	   	   porcentajeTotalActual:= PCActual * PACCActual;

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
	  end;

    Sensores[3].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[3].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[3].LimiteInferior,
                  (* Limite Superior *) Sensores[3].LimiteSuperior,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);







    ///////////////////////////////////////////////////
    ///         RTU 2 - Turbina 1                   ///
    ///////////////////////////////////////////////////

    (*----      ST10001 - Sensores[4] - Presión A de la Válvula Mariposa    ----*)
	  i:= incIndex(Sensores[4].index);

	  // Toma el valor del segundo anterior de la presion de la tuberia forzada
	  Sensores[4].Valores[i]:= Sensores[3].Valores[antIndex(i)];





    (*----      ST10002 - Sensores[5] - Presión B de la Válvula Mariposa    ----*)
	  // Afectado por Sensores[4] y por los actuadores
	  // RTU2_AT10003 = Válvula Mariposa
    // RTU2_AT10004 = Bypass Válvula Mariposa
	  // Estos 2 actuadores no pueden estar abiertos a la vez
	  
	  i:= incIndex(Sensores[5].index);

	  if (RTU2_AT10003.Value = ABIERTO) then
	  begin
		  // Si la Valvula está abierta, la presion es la misma que en el lado A
		  Sensores[5].Valores[i]:= Sensores[4].Valores[i];
	  end
	  else
	  if (RTU2_AT10004.Value = ABIERTO) then
	  begin
		  // Si el Bypass está abierto
		  // La presion en B aumenta hasta llegar a la del lado A	
	      Sensores[5].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[5].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[5].LimiteInferior,
                  (* Limite Superior *) Sensores[4].Valores[i],            // <-----------
                  (* Probabilidad ++ *) 1.0,
                  (* Probabilidad == *) 0.0,
                  (* Probabilidad -- *) 0.0,
                  (* Delta Cambio    *) 3);
	  end
	  else
	  begin
		  // Bypass & Valvula cerrados:  La persion diminuye
		  Sensores[5].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[5].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[5].LimiteInferior,
                  (* Limite Superior *) Sensores[5].LimiteSuperior,
                  (* Probabilidad ++ *) 0.0,
                  (* Probabilidad == *) 0.0,
                  (* Probabilidad -- *) 1.0,
                  (* Delta Cambio    *) 3);
	  end;
	 



    (*----      ST10005 - Sensores[6] - Presión Sobre Tapa Turbina    ----*)
	  i:= incIndex(Sensores[6].index);

	  // La presion es igual a la del lado B de la valvula mariposa
	  Sensores[6].Valores[i]:= Sensores[5].Valores[i];



   (*---!!!!   ST10012 - Sensores[10] - Estado Sistema Enfriamiento   ----*)
	 (*Se calcula antes porque se usa para las temperaturas*)
	 i:= incIndex(Sensores[10].index);
   // Depende si se elige poner o no un error
   if chkErrorEnfriamiento.Checked then
    	 Sensores[10].Valores[i]:= ERROR
   else
       Sensores[10].Valores[i]:= CORRECTO;



       
   (*----      ST10008 - Sensores[7] - Temperatura Cojinetes Superiores    ----*)
   (*----      ST10009 - Sensores[8] - Temperatura Cojinetes Inferiores    ----*)
   (*----      ST10010 - Sensores[9] - Temperatura Cojinetes Guia Turbina  ----*)
	 // Afectado por Sensor[12] y Actuador
	 // RTU_ST10012 = Sistema de Refrigeracion
	 i:= incIndex(Sensores[7].index);
   i:= incIndex(Sensores[8].index);
   i:= incIndex(Sensores[9].index);

	 if (Sensores[10].Valores[i] = ERROR) or (trunc(RTU2_AT10011.Value) = APAGADO) then
	 begin
   		 // La temperatura Aumenta
	 	   probAumentar:= 0.8;
	 	   probMantener:= 0.2;
	 	   probDisminuir:= 0.0;
	 end
	 else
	 begin
	     // La temperatura se Mantiene o Baja
	 	   probAumentar:= 0.0;
	 	   probMantener:= 0.3;
	 	   probDisminuir:= 0.7;
	 end;

   Sensores[7].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[7].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[7].LimiteInferior,
                  (* Limite Superior *) Sensores[7].LimiteSuperior,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);

   Sensores[8].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[8].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[8].LimiteInferior,
                  (* Limite Superior *) Sensores[8].LimiteSuperior,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);

   Sensores[9].Valores[i] := aleatorio(
                  (* Valor Anterior  *) Sensores[9].valores[antIndex(i)],
                  (* Limite Inferior *) Sensores[9].LimiteInferior,
                  (* Limite Superior *) Sensores[9].LimiteSuperior,
                  (* Probabilidad ++ *) probAumentar,
                  (* Probabilidad == *) probMantener,
                  (* Probabilidad -- *) probDisminuir,
                  (* Delta Cambio    *) 1);




   (*----      ST10013 - Sensores[11] - Caudal Turbinado   ----*)
   // Afectado por Sensores:
       // Sensores[5] - Presión B de la Válvula Mariposa
       //
   // Actuadores:
  	   // RTU2_AT10006 = Frenos Turbina
       // RTU2_AT10007 = Apertura de Álaves Turbina

   i:= incIndex(Sensores[11].index);

   Xalaves:= ( RTU2_AT10007.Value * Sensores[11].max) / 100;
   Xfrenos:= ( (100-RTU2_AT10006.Value) * Sensores[11].max) / 100;
   //Xpresion:= Sensores[5].Valores [ Sensores[5].index ] * Sensores[5].LimiteSuperior / 100;
   Sensores[11].valores[i]:= trunc((Xalaves+XFrenos)/2);


   (*----      ST10014 - Sensores[12] - Velocidad Giro Turbina   ----*)
   i:= incIndex(Sensores[12].index);
   // Calculado a partir del Caudal Turbinado por regla de 3
   Sensores[12].valores[i]:= Sensores[11].valores[i]*Sensores[12].max div Sensores[11].max;



   (*----      ST10021 - Sensores[14] - Voltaje Generado   ----*)
   i:= incIndex(Sensores[14].index);

   if (trunc(RTU2_AT10016.Value) = APAGADO) or (trunc(RTU2_AT10017.Value) = APAGADO) or
      (trunc(RTU2_AT10018.Value) = APAGADO) or (trunc(RTU2_AT10019.Value) = APAGADO) then
   begin
       // Si alguno de los elementos (generador, equipo excitacion, regulador o U. Sinc)
       // Esta apagado, dejo de generar,
       Sensores[14].valores[i]:= 0;
   end
   else
   begin
       // Estoy Generando Corriente!
       Sensores[14].valores[i]:= trunc(
                  // Regla de 3 segun Caudal
                  Sensores[11].valores[ Sensores[11].index ] * Sensores[14].max / Sensores[11].max
                  // Disminucion por frenos del generador
                  * ((100-RTU2_AT10015.Value)/100));
   end;




   (*----      ST10020 - Sensores[13] - Intensidad Corriente   ----*)
   i:= incIndex(Sensores[13].index);
   // Calculado por regla de 3 a partir del volteje generado
   Sensores[13].valores[i]:= Sensores[14].valores[i] * Sensores[13].max div Sensores[14].max;


   ///////////////////////////////////////////////////
   ///         RTU 3 - Salida                      ///
   ///////////////////////////////////////////////////

   (*----      SSA0001 - Sensores[15] - Nivel Desfogue   ----*)
   i:= incIndex(Sensores[15].index);
   // Igual al maximo de caudal turbinado
   Sensores[15].valores[i]:= Sensores[11].max;

end;




procedure Tfrm_GeneracionDatos.TimerGeneracionTimer(Sender: TObject);
var i:integer;
begin
     if TCP_UDPPort1.Active then
        StatusBar1.Panels[0].Text:='TCP Conectado'
     else
        StatusBar1.Panels[0].Text:='TCP Desconectado';


      ActualizarValoresSensores();

      i:= Sensores[1].index;
      // RTU 1
      RTU1_SCC0001.value:= Sensores[1].Valores[ i ];
      RTU1_SCC0002.value:= Sensores[2].Valores[ i ];
      RTU1_SCC0005.value:= Sensores[3].Valores[ i ];
      // RTU 2
      RTU2_ST10001.value:= Sensores[4].Valores[ i ];
      RTU2_ST10002.value:= Sensores[5].Valores[ i ];
      RTU2_ST10005.value:= Sensores[6].Valores[ i ];
      RTU2_ST10008.value:= Sensores[7].Valores[ i ];
      RTU2_ST10009.value:= Sensores[8].Valores[ i ];
      RTU2_ST10010.value:= Sensores[9].Valores[ i ];

      RTU2_ST10012.value:= Sensores[10].Valores[ i ];
      RTU2_ST10013.value:= Sensores[11].Valores[ i ];
      RTU2_ST10014.value:= Sensores[12].Valores[ i ];
      RTU2_ST10020.value:= Sensores[13].Valores[ i ];
      RTU2_ST10021.value:= Sensores[14].Valores[ i ];
      // RTU 3
      RTU3_SSA0001.value:= Sensores[15].Valores[ i ];

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