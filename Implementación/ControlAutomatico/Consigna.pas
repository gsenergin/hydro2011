unit Consigna;

interface
uses  Classes, (*Thread*)
      SysUtils, (*Time / Sleep*)
      StdCtrls, (*Memo*)
      AccesoDatosRTU,
      Log;


type
  TConsigna = Class(TThread)
   private
      enabled: boolean;
      Caudal: integer;
      Voltaje: Integer;
      delay: Integer;
      esCaudal, esVoltaje: boolean;
   protected
      procedure Execute; override;

   public

      procedure RUN;
      procedure STOP;

      constructor Create; reintroduce; overload;
      constructor Create(deshabilitada: boolean; delay:integer; prioridad: TThreadPriority); reintroduce; overload;
      procedure AjustarConsigna();

      procedure SetConsignaCaudal(valor:integer; Start:boolean);
      procedure SetConsignaVoltaje(valor:integer; Start:boolean);
      procedure SetConsignaManual();

      procedure setDelay(milisegundos:cardinal);
  end;

implementation


constructor TConsigna.Create;
begin
    inherited Create(True); // llamamos al constructor del padre (TThread)
    self.enabled:= false; // Lo creo deshabilitado
    self.delay:= 2000;    // Por defecto, cada 2000 ms
end;

constructor TConsigna.Create(deshabilitada: boolean; delay:integer; prioridad: TThreadPriority);
begin
    inherited Create(deshabilitada);
    self.enabled:= false; // Lo creo deshabilitado
    self.delay:= delay;
    self.Priority:= prioridad;
end;

procedure TConsigna.Execute;
begin
  inherited;
  while enabled do
  begin
    AjustarConsigna();
    sleep(delay);
  end;
end;

procedure TConsigna.RUN;
begin
    enabled:= true;
    Resume;
end;


procedure TConsigna.SetConsignaCaudal(valor: integer; Start: boolean);
var Logger: TLog;
begin
     Logger:=  TLog.Create;
     // Se deberia checkear aca contra la BD OJOO!!!!!!!!!!!!!!!!!!!!!!!!!
     if (valor>=0) and (valor<=40) then
     begin
         self.Caudal:= valor;
         self.esCaudal:= true;
         self.esVoltaje:= false;
         Logger.LogWrite('Consigna de Caudal: '+inttostr(valor)+' m^3/seg');
         if Start then
            Self.RUN;
     end
     else
         Logger.LogWrite('Error al Setear consigna de caudal');
end;


procedure TConsigna.SetConsignaVoltaje(valor: integer; Start: boolean);
var Logger: TLog;
begin
     Logger:=  TLog.Create;
     // Se deberia checkear aca contra la BD OJOO!!!!!!!!!!!!!!!!!!!!!!!!!
     if (valor>=0) and (valor<=24000) then
     begin
         self.Voltaje:= valor;
         self.esCaudal:= false;
         self.esVoltaje:= true;
         Logger.LogWrite('Consigna de Voltaje: '+inttostr(valor)+' Volts');
         if Start then
            Self.RUN;
     end
     else
        Logger.LogWrite('Error al Setear consigna de voltaje');
end;


procedure TConsigna.SetConsignaManual;
var Logger: TLog;
begin
     Logger:=  TLog.Create;
     STOP;
     Logger.LogWrite('Consigna Deshabilitada. Modo Manual');
end;


procedure TConsigna.setDelay(milisegundos: cardinal);
begin
    delay:= milisegundos;
end;

procedure TConsigna.STOP;
begin
    enabled:= false;
    Suspend;
end;

procedure TConsigna.AjustarConsigna();

  function tryDec(actuador: double; cant:integer):integer;
  begin
      // Funcion que devuelve cuanto le puedo restar sin bajar de 0
      if actuador=0 then result:= 0
      else if actuador-cant<0 then result:= trunc(actuador)
      else result:= cant;
  end;
  function tryInc(actuador: double; cant:integer):integer;
  begin
      // Funcion que devuelve cuanto le puedo aumentar sin pasar de 100
      if actuador=100 then result:= 0
      else if actuador+cant>100 then result:= 100-trunc(actuador)
      else result:= cant;
  end;
  

  function getDelta( valorAnt:double; directamenteProporcional: boolean; diferencia, ValorConsigna: integer): integer;
  var delta : integer;
      porcentajeDiferencia: double;
  begin
      porcentajeDiferencia:= abs(diferencia)/ValorConsigna;
      delta:= random(trunc(porcentajeDiferencia*35))+1;

      if ((diferencia>0) and (not directamenteProporcional))or ((diferencia<0) and (directamenteProporcional)) then
          result:= - tryDec(valorAnt, delta)
      else
          result:= tryInc(valorAnt, delta);
  end;

var delta, diferencia: integer;
    valorAnt, porcentajeDiferencia: double;
    Logger: TLog;
begin
    Logger:= TLog.Create;

    with DM_AccesoDatosRTU do
    begin
        // Consigna de Caudal
        if esCaudal then
        begin

          //RTU2_ST10013.Read; // Leo el caudal actual
          diferencia:= Caudal - trunc(RTU2_ST10013.ValueRaw);
          if diferencia<>0 then
          begin
              // Alaves  (RTU2_AT10007)
              valorAnt:= RTU2_AT10007.ValueRaw;
              delta:= getDelta(valorAnt,TRUE,diferencia,Caudal);
              if delta <>0 then
              begin
                 RTU2_AT10007.Value:= valorAnt + delta;
                 Logger.LogWrite('Revisando Consigna de Caudal - %Alaves '+inttostr(delta));
              end
              else
              begin
                //  Frenos Turbina (RTU2_AT10006)
                valorAnt:= RTU2_AT10006.ValueRaw;
                delta:= getDelta(valorAnt,FALSE,diferencia,Caudal);
                if delta<> 0 then
                begin
                  RTU2_AT10006.Value:= valorAnt + delta;
                  Logger.LogWrite('Revisando Consigna de Caudal - %Frenos Turbina '+inttostr(delta));
                end;
              end;
          end;
        end;

        // Consigna de Voltaje
        if esVoltaje then
        begin
          //(*D*)RTU2_ST10021.Read;  // Leo el voltaje actual
          diferencia := Voltaje - trunc(RTU2_ST10021.ValueRaw);
          porcentajeDiferencia:= abs(diferencia)/voltaje;

          if porcentajeDiferencia>0.01 then
          begin
              // Alaves  (RTU2_AT10007)
              valorAnt:= RTU2_AT10007.ValueRaw;
              delta:= getDelta(valorAnt,TRUE,diferencia,voltaje);
              if delta <>0 then
              begin
                 RTU2_AT10007.Value:= valorAnt + delta;
                 Logger.LogWrite('Revisando Consigna de Voltaje - %Alaves '+inttostr(delta));
              end
              else
              begin
                  // Frenos de la turbina (RTU2_AT10006)
                  valorAnt:= RTU2_AT10006.ValueRaw;
                  delta:= getDelta(valorAnt,FALSE,diferencia,voltaje);
                  if delta <>0 then
                  begin
                      RTU2_AT10006.Value:= valorAnt + delta;
                      Logger.LogWrite('Revisando Consigna de Voltaje - %Frenos Turbina '+inttostr(delta));
                  end
                  else
                  begin
                    // Frenos Generador (RTU2_AT10015)
                    valorAnt:= RTU2_AT10015.ValueRaw;
                    delta:= getDelta(valorAnt,FALSE,diferencia,voltaje);
                    if delta <>0 then
                    begin
                        RTU2_AT10015.Value:= valorAnt + delta;
                        Logger.LogWrite('Revisando Consigna de Voltaje - %Frenos Generador '+inttostr(delta));
                    end;
                  end;
              end;
          end
          else
          begin
                    // Frenos Generador (RTU2_AT10015)
                    valorAnt:= RTU2_AT10015.ValueRaw;
                    delta:= getDelta(valorAnt,FALSE,diferencia,voltaje);
                    if delta <>0 then
                    begin
                        RTU2_AT10015.Value:= valorAnt + delta;
                        Logger.LogWrite('Revisando Consigna de Voltaje - %Frenos Generador '+inttostr(delta));
                    end;
          end;
        end; // es Voltaje
       
    end; // with DM_AccesoDatosRTU do

end;


end.
