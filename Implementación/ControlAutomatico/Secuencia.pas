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
    Resume; // Va a TSecuencia.Execute;
end;

procedure TSecuencia.Execute;
begin
  inherited;

  case numeroSecuencia of

      APAGADO: SecuenciaApagado;

      ENCENDIDO: SecuenciaApagado;

  end;

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

    if enableLog then log.Lines.Add('INICIANDO SECUENCIA DE APAGADO...');

    // Cerrar Compuerta de ingreso de Agua a la Tubería
    RTU1_ACC0004.Value:= CERRADO;
    if enableLog then log.Lines.Add(' :Cerrar Compuerta de ingreso de Agua a la Tubería');

    // Colocar álabes al 100%
    RTU2_AT10007.Value:= 100;
    if enableLog then log.Lines.Add(' :Colocar álabes al 100%');
    if enableLog then log.Lines.Add(' :Esperar a que la presión llegue a 0');

    // Cuando Presion A=0, Cerrar Válvula Mariposa
    while RTU2_ST10001.Value <> 0 do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
    end;
    RTU2_AT10003.Value:= CERRADO;
    if enableLog then log.Lines.Add(' :Cerrar Válvula Mariposa');

    // Aplicar Frenos de la turbina al 100%
    RTU2_AT10006.Value:= 100;
    if enableLog then log.Lines.Add(' :Aplicar Frenos de la turbina al 100%');

    // Colocar frenos Generador al 100%
    RTU2_AT10015.Value:= 100;
    if enableLog then log.Lines.Add(' :Colocar frenos Generador al 100%');

    // Apagar Generador
    RTU2_AT10016. Value:= APAGADO;
    if enableLog then log.Lines.Add(' :Apagar Generador');

    // Apagar regulador de velocidad
    RTU2_AT10017. Value:= APAGADO;
    if enableLog then log.Lines.Add(' :Apagar regulador de velocidad');

    // Apagar Equipo de Excitacion
    RTU2_AT10018. Value:= APAGADO;
    if enableLog then  log.Lines.Add(' :Apagar Equipo de Excitacion');

    // Apagar Unidad de Sincronizacion
    RTU2_AT10019. Value:= APAGADO;
    if enableLog then log.Lines.Add(' :Apagar Unidad de Sincronizacion');

    // Apagar Sistema de Refrigeracion
    RTU2_AT10011. Value:= APAGADO;
    if enableLog then log.Lines.Add(' :Apagar Sistema de Refrigeracion');

    if enableLog then log.Lines.Add('FIN SECUENCIA DE APAGADO!');
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

    if enableLog then log.Lines.Add('INICIANDO SECUENCIA DE ENCENDIDO...');

    // Encender Sistema de Refrigeracion
    RTU2_AT10011. Value:= ENCENDIDO;
    if enableLog then log.Lines.Add(' :Encender Sistema de Refrigeracion');

    // Aplicar Frenos de la turbina al 0%
    RTU2_AT10006.Value:= 0;
    if enableLog then log.Lines.Add(' :Aplicar Frenos de la turbina al 0%');

    // Colocar álabes al 0%
    RTU2_AT10007.Value:= 0;
    if enableLog then log.Lines.Add(' :Colocar álabes al 0%');

    // Colocar frenos Generador al 0%
    RTU2_AT10015.Value:= 0;
    if enableLog then log.Lines.Add(' :Colocar frenos Generador al 0%');

    // Encender Generador
    RTU2_AT10016.Value:= ENCENDIDO;
    if enableLog then log.Lines.Add(' :Encender Generador');

    // Encender regulador de velocidad
    RTU2_AT10017.Value:= ENCENDIDO;
    if enableLog then log.Lines.Add(' :Encender regulador de velocidad');

    // Encender Equipo de Excitacion
    RTU2_AT10018.Value:= ENCENDIDO;
    if enableLog then log.Lines.Add(' :Encender Equipo de Excitacion');

    // Encender Unidad de Sincronizacion
    RTU2_AT10019.Value:= ENCENDIDO;
    if enableLog then log.Lines.Add(' :Encender Unidad de Sincronizacion');

    // Abrir Compuertas de Mantenimiento
    RTU3_ASA0002.Value:= ABIERTO;
    if enableLog then log.Lines.Add(' :Abrir Compuertas de Mantenimiento');

    // Cerrar Válvula Mariposa
    RTU2_AT10003.Value:= CERRADO;
    if enableLog then log.Lines.Add(' :Cerrar Válvula Mariposa');

    // Abrir Compuerta de ingreso de Agua a la Tubería
    RTU1_ACC0004.Value:= ABIERTO;
    if enableLog then log.Lines.Add(' :Abrir Compuerta de ingreso de Agua a la Tubería');

    // Esperar que llegue al máximo de presión
    if enableLog then log.Lines.Add(' :Esperar que llegue al máximo de presión...');
    while RTU2_ST10001.Value < 15 do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
    end;

    // Abrir bypass válvula mariposa
    RTU2_AT10004.Value:= ABIERTO;
    if enableLog then log.Lines.Add(' :Abrir bypass válvula mariposa');

    // Cuando PresionA=PresionB, Abrir Válvula Mariposa y Cerrar Bypass
    while RTU2_ST10001.Value <> RTU2_ST10002.Value do
    begin
       Sleep(1000);
       RTU2_ST10001.Read;
       RTU2_ST10002.Read;
    end;
    if enableLog then log.Lines.Add(' :Abrir Válvula Mariposa y Cerrar Bypass');
    RTU2_AT10003.Value:= ABIERTO;
    RTU2_AT10004.Value:= CERRADO;

    if enableLog then log.Lines.Add('FIN SECUENCIA DE ENCENDIDO!');
  end;
end;







end.


