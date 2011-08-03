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
  Free;   //Suspend
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
    1. Cerrar Compuerta de ingreso de Agua a la Tubería
    2. Colocar álabes al 100%
    3. Cuando Presion A=0, Cerrar Válvula Mariposa

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

    // Cerrar Compuerta de ingreso de Agua a la Tubería
    LogWrite(' :Cerrar Compuerta de ingreso de Agua a la Tubería');
    if trunc(RTU1_ACC0004.ValueRaw) <> CERRADO then
      RTU1_ACC0004.Value:= CERRADO;

    // Colocar álabes al 100%
    LogWrite(' :Colocar álabes al 100%');
    if trunc(RTU2_AT10007.ValueRaw) <> 100 then
      RTU2_AT10007.Value:= 100;

    LogWrite(' :Esperar a que la presión llegue a 0');

    // Cuando Presion A=0, Cerrar Válvula Mariposa
    while RTU2_ST10001.Value <> 0 do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
    end;
    LogWrite(' :Cerrar Válvula Mariposa');
    RTU2_AT10003.Value:= CERRADO;

    // Aplicar Frenos de la turbina al 100%
    LogWrite(' :Aplicar Frenos de la turbina al 100%');
    if trunc(RTU2_AT10006.ValueRaw) <> 100 then
        RTU2_AT10006.Value:= 100;

    // Colocar frenos Generador al 100%
    LogWrite(' :Colocar frenos Generador al 100%');
    if trunc(RTU2_AT10015.ValueRaw) <> 100 then
      RTU2_AT10015.Value:= 100;

    // Apagar Generador
    LogWrite(' :Apagar Generador');
    if trunc(RTU2_AT10016.ValueRaw) <> APAGADO then
        RTU2_AT10016. Value:= APAGADO;

    // Apagar regulador de velocidad
    LogWrite(' :Apagar regulador de velocidad');
    if trunc(RTU2_AT10017.ValueRaw) <> APAGADO then
        RTU2_AT10017. Value:= APAGADO;

    // Apagar Equipo de Excitacion
    LogWrite(' :Apagar Equipo de Excitacion');
    if trunc(RTU2_AT10018.ValueRaw) <> APAGADO then
      RTU2_AT10018. Value:= APAGADO;

    // Apagar Unidad de Sincronizacion
    LogWrite(' :Apagar Unidad de Sincronizacion');
    if trunc(RTU2_AT10019.ValueRaw) <> APAGADO then
      RTU2_AT10019. Value:= APAGADO;

    // Apagar Sistema de Refrigeracion
    LogWrite(' :Apagar Sistema de Refrigeracion');
    if trunc(RTU2_AT10011.ValueRaw) <> APAGADO then
      RTU2_AT10011. Value:= APAGADO;

    LogWrite('FIN SECUENCIA DE APAGADO!');
  end;
end;

procedure TSecuencia.SecuenciaEncendido;
begin
    (*
    1. Encender Sistema de Refrigeracion
    2. Colocar Frenos de la turbina al 0%
    3. Colocar álabes al 0%
    4. Colocar frenos Generador al 0%
    5. Encender Generador
    6. Encender regulador de velocidad
    7. Encender Equipo de Excitacion
    8. Encender Unidad de Sincronizacion

    9. Abrir Compuertas de Mantenimiento
    10. Cerrar Válvula Mariposa
    11. Abrir Compuerta de ingreso de Agua a la Tubería
    12. Abrir bypass válvula mariposa
    13. Cuando PresionA=PresionB, Abrir Válvula Mariposa y Cerrar Bypass

    *)
  with DM_AccesoDatosRTU do
  begin

    LogWrite('INICIANDO SECUENCIA DE ENCENDIDO...');

    // Encender Sistema de Refrigeracion
    LogWrite(' :Encender Sistema de Refrigeracion');
    if trunc(RTU2_AT10011.ValueRaw) <> ENCENDIDO then
      RTU2_AT10011. Value:= ENCENDIDO;

    // Aplicar Frenos de la turbina al 0%
    LogWrite(' :Aplicar Frenos de la turbina al 0%');
    if trunc(RTU2_AT10006.ValueRaw) <> 0 then
      RTU2_AT10006.Value:= 0;

    // Colocar álabes al 0%
    LogWrite(' :Colocar álabes al 0%');
    if trunc(RTU2_AT10007.ValueRaw) <> 0 then
       RTU2_AT10007.Value:= 0;

    // Colocar frenos Generador al 0%
    LogWrite(' :Colocar frenos Generador al 0%');
    if trunc(RTU2_AT10015.ValueRaw) <> 0 then
        RTU2_AT10015.Value:= 0;

    // Encender Generador
    LogWrite(' :Encender Generador');
    if trunc(RTU2_AT10016.ValueRaw) <> ENCENDIDO then
        RTU2_AT10016.Value:= ENCENDIDO;

    // Encender regulador de velocidad
    LogWrite(' :Encender regulador de velocidad');
    if trunc(RTU2_AT10017.ValueRaw) <> ENCENDIDO then
        RTU2_AT10017.Value:= ENCENDIDO;

    // Encender Equipo de Excitacion
    LogWrite(' :Encender Equipo de Excitacion');
    if trunc(RTU2_AT10018.ValueRaw) <> ENCENDIDO then
        RTU2_AT10018.Value:= ENCENDIDO;

    // Encender Unidad de Sincronizacion
    LogWrite(' :Encender Unidad de Sincronizacion');
    if trunc(RTU2_AT10019.ValueRaw) <> ENCENDIDO then
        RTU2_AT10019.Value:= ENCENDIDO;

    // Abrir Compuertas de Mantenimiento
    LogWrite(' :Abrir Compuertas de Mantenimiento');
    if trunc(RTU3_ASA0002.ValueRaw) <> ABIERTO then
        RTU3_ASA0002.Value:= ABIERTO;

    // Cerrar Válvula Mariposa
    LogWrite(' :Cerrar Válvula Mariposa');
    if trunc(RTU2_AT10003.ValueRaw) <> CERRADO then
        RTU2_AT10003.Value:= CERRADO;

    // Abrir Compuerta de ingreso de Agua a la Tubería
    LogWrite(' :Abrir Compuerta de ingreso de Agua a la Tubería');
    if trunc(RTU1_ACC0004.ValueRaw) <> ABIERTO then
        RTU1_ACC0004.Value:= ABIERTO;

    // Esperar que llegue al máximo de presión
    LogWrite(' :Esperar que llegue al máximo de presión...');
    while RTU2_ST10001.Value < 15 do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
    end;

    // Abrir bypass válvula mariposa
    RTU2_AT10004.Value:= ABIERTO;
    LogWrite(' :Abrir bypass válvula mariposa');

    // Cuando PresionA=PresionB, Abrir Válvula Mariposa y Cerrar Bypass
    while RTU2_ST10001.Value <> RTU2_ST10002.Value do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
       RTU2_ST10002.Read;
    end;
    LogWrite(' :Abrir Válvula Mariposa y Cerrar Bypass');
    RTU2_AT10003.Value:= ABIERTO;
    RTU2_AT10004.Value:= CERRADO;

    LogWrite('FIN SECUENCIA DE ENCENDIDO!');
  end;
end;







end.


