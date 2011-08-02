unit Secuencia;

interface

uses  Classes, (*Thread*)
      SysUtils, (*Time / Sleep*)
      StdCtrls, (*Memo*)
      AccesoDatosRTU;


type
  TSecuencia = Class(TThread)
   private
      log: TMemo;
      enableLog: boolean;
      numeroSecuencia: integer;
      procedure SecuenciaApagado();   // ID = 0
      procedure SecuenciaEncendido(); // ID = 1

      
      procedure Execute; override;

   public
      constructor Create; reintroduce; overload;

      procedure LogEnable(var MemoLog:Tmemo);  overload;
      procedure LogEnable();  overload;
      procedure LogDisable();
      procedure LogWrite(mensaje: string);

      procedure EjecutarSecuencia(tipoSecuencia: integer); overload;

   const
      APAGADO = 0;
      ENCENDIDO = 1;

  end;


implementation


const ABIERTO=1; ENCENDIDO=1; ERROR=1;
		CERRADO=0; APAGADO=0;   CORRECTO=0;

 
constructor TSecuencia.Create;
begin
   inherited Create(True); // llamamos al constructor del padre (TThread)
   self.numeroSecuencia:= 1; // Encendido
   self.enableLog:= false;
   self.log:= nil;
end;

procedure TSecuencia.EjecutarSecuencia(tipoSecuencia: integer);
begin
    numeroSecuencia:= tipoSecuencia;
    Execute;
//    Resume; // Va a TSecuencia.Execute;
end;

procedure TSecuencia.Execute;
begin
  inherited;

  case numeroSecuencia of

      APAGADO: SecuenciaApagado;

      ENCENDIDO: SecuenciaEncendido;

  end;
  Suspend;
end;

procedure TSecuencia.LogDisable;
begin
     enableLog:= false;
end;

procedure TSecuencia.LogEnable;
begin
    if Log<>nil  then
       enableLog:= true;
end;

procedure TSecuencia.LogEnable(var MemoLog: Tmemo);
begin
     Log:= MemoLog;
     enableLog:= true;
end;

procedure TSecuencia.LogWrite(mensaje: string);
begin
    // Escribe en el log si esta habilitado el logueo
    if enableLog then
      log.lines.Add(mensaje);
end;



procedure TSecuencia.SecuenciaApagado;
begin
    (*
    1. Cerrar Compuerta de ingreso de Agua a la Tuber�a
    2. Colocar �labes al 100%
    3. Cuando Presion A=0, Cerrar V�lvula Mariposa

    4. Gradualmente
      . Aplicar Frenos de la turbina al 100%
      . Colocar frenos Generador al 100%

    5. Apagar Generador
    6. Apagar regulador de velocidad
    7. Apagar Equipo de Excitacion
    8. Apagar Unidad de Sincronizacion
    9. Apagar Sistema de Refrigeracion
    *)
  with DM_AccesoDatosRTU do
  begin

    LogWrite('INICIANDO SECUENCIA DE APAGADO...');

    // Cerrar Compuerta de ingreso de Agua a la Tuber�a
    RTU1_ACC0004.Value:= CERRADO;
    LogWrite(' :Cerrar Compuerta de ingreso de Agua a la Tuber�a');

    // Colocar �labes al 100%
    RTU2_AT10007.Value:= 100;
    LogWrite(' :Colocar �labes al 100%');
    LogWrite(' :Esperar a que la presi�n llegue a 0');

    // Cuando Presion A=0, Cerrar V�lvula Mariposa
    while RTU2_ST10001.Value <> 0 do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
    end;
    RTU2_AT10003.Value:= CERRADO;
    LogWrite(' :Cerrar V�lvula Mariposa');

    // Aplicar Frenos de la turbina al 100%
    RTU2_AT10006.Value:= 100;
    LogWrite(' :Aplicar Frenos de la turbina al 100%');

    // Colocar frenos Generador al 100%
    RTU2_AT10015.Value:= 100;
    LogWrite(' :Colocar frenos Generador al 100%');

    // Apagar Generador
    RTU2_AT10016. Value:= APAGADO;
    LogWrite(' :Apagar Generador');

    // Apagar regulador de velocidad
    RTU2_AT10017. Value:= APAGADO;
    LogWrite(' :Apagar regulador de velocidad');

    // Apagar Equipo de Excitacion
    RTU2_AT10018. Value:= APAGADO;
    LogWrite(' :Apagar Equipo de Excitacion');

    // Apagar Unidad de Sincronizacion
    RTU2_AT10019. Value:= APAGADO;
    LogWrite(' :Apagar Unidad de Sincronizacion');

    // Apagar Sistema de Refrigeracion
    RTU2_AT10011. Value:= APAGADO;
    LogWrite(' :Apagar Sistema de Refrigeracion');

    LogWrite('FIN SECUENCIA DE APAGADO!');
  end;
end;

procedure TSecuencia.SecuenciaEncendido;
begin
    (*
    1. Encender Sistema de Refrigeracion
    2. Colocar Frenos de la turbina al 0%
    3. Colocar �labes al 0%
    4. Colocar frenos Generador al 0%
    5. Encender Generador
    6. Encender regulador de velocidad
    7. Encender Equipo de Excitacion
    8. Encender Unidad de Sincronizacion

    9. Abrir Compuertas de Mantenimiento
    10. Cerrar V�lvula Mariposa
    11. Abrir Compuerta de ingreso de Agua a la Tuber�a
    12. Abrir bypass v�lvula mariposa
    13. Cuando PresionA=PresionB, Abrir V�lvula Mariposa y Cerrar Bypass

    *)
  with DM_AccesoDatosRTU do
  begin

    LogWrite('INICIANDO SECUENCIA DE ENCENDIDO...');

    // Encender Sistema de Refrigeracion
    RTU2_AT10011. Value:= ENCENDIDO;
    LogWrite(' :Encender Sistema de Refrigeracion');

    // Aplicar Frenos de la turbina al 0%
    RTU2_AT10006.Value:= 0;
    LogWrite(' :Aplicar Frenos de la turbina al 0%');

    // Colocar �labes al 0%
    RTU2_AT10007.Value:= 0;
    LogWrite(' :Colocar �labes al 0%');

    // Colocar frenos Generador al 0%
    RTU2_AT10015.Value:= 0;
    LogWrite(' :Colocar frenos Generador al 0%');

    // Encender Generador
    RTU2_AT10016.Value:= ENCENDIDO;
    LogWrite(' :Encender Generador');

    // Encender regulador de velocidad
    RTU2_AT10017.Value:= ENCENDIDO;
    LogWrite(' :Encender regulador de velocidad');

    // Encender Equipo de Excitacion
    RTU2_AT10018.Value:= ENCENDIDO;
    LogWrite(' :Encender Equipo de Excitacion');

    // Encender Unidad de Sincronizacion
    RTU2_AT10019.Value:= ENCENDIDO;
    LogWrite(' :Encender Unidad de Sincronizacion');

    // Abrir Compuertas de Mantenimiento
    RTU3_ASA0002.Value:= ABIERTO;
    LogWrite(' :Abrir Compuertas de Mantenimiento');

    // Cerrar V�lvula Mariposa
    RTU2_AT10003.Value:= CERRADO;
    LogWrite(' :Cerrar V�lvula Mariposa');

    // Abrir Compuerta de ingreso de Agua a la Tuber�a
    RTU1_ACC0004.Value:= ABIERTO;
    LogWrite(' :Abrir Compuerta de ingreso de Agua a la Tuber�a');

    // Esperar que llegue al m�ximo de presi�n
    LogWrite(' :Esperar que llegue al m�ximo de presi�n...');
    while RTU2_ST10001.Value < 15 do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
    end;

    // Abrir bypass v�lvula mariposa
    RTU2_AT10004.Value:= ABIERTO;
    LogWrite(' :Abrir bypass v�lvula mariposa');

    // Cuando PresionA=PresionB, Abrir V�lvula Mariposa y Cerrar Bypass
    while RTU2_ST10001.Value <> RTU2_ST10002.Value do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
       RTU2_ST10002.Read;
    end;
    LogWrite(' :Abrir V�lvula Mariposa y Cerrar Bypass');
    RTU2_AT10003.Value:= ABIERTO;
    RTU2_AT10004.Value:= CERRADO;

    LogWrite('FIN SECUENCIA DE ENCENDIDO!');
  end;
end;







end.


