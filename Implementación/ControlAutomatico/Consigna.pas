unit Consigna;

interface
uses  Classes, (*Thread*)
      SysUtils, (*Time / Sleep*)
      StdCtrls, (*Memo*)
      AccesoDatosRTU;


type
  TConsigna = Class(TThread)
   private
      enabled: boolean;
      Caudal: integer;
      Voltaje: Integer;
      delay: Integer;
      esCaudal, esVoltaje: boolean;
      log: TMemo;
      enableLog: boolean;
      
      procedure Execute; override;

   public

      procedure RUN;
      procedure STOP;

      constructor Create; reintroduce; overload;

      procedure AjustarConsigna();

      procedure SetConsignaCaudal(valor:integer; Start:boolean = true);
      procedure SetConsignaVoltaje(valor:integer; Start:boolean = true);
      procedure SetConsignaManual();

      procedure LogEnable(var MemoLog:Tmemo);  overload;
      procedure LogEnable();  overload;

      procedure LogDisable();
      procedure setDelay(milisegundos:cardinal);
  end;

implementation

(*
try
       t:= StrToInt(txtConsignaVoltaje.text);
       if (t>0) and (t<24000) then
       begin
         Consigna.Voltaje:= t;
         Consigna.esCaudal:= false;
         Consigna.esVoltaje:= true;
         Consigna.enabled:= true;
         //TimerConsigna.Enabled:= true;
         Consigna.Resume;

       end;
       log.Lines.Add('Consigna de Voltaje: '+inttostr(t)+' Volts');
    except
       log.Lines.Add('Error al Setear consigna de Voltaje');
    end;
*)


constructor TConsigna.Create;
begin
    inherited Create(True); // llamamos al constructor del padre (TThread)

    self.enabled:= false; // Lo creo deshabilitado
    self.delay:= 2000;    // Por defecto, cada 2000 ms
    self.enableLog:= false;
    self.log:= nil;
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


procedure TConsigna.LogDisable;
begin
     enableLog:= false;
end;

procedure TConsigna.LogEnable;
begin
    if Log<>nil  then
       enableLog:= true;
end;

procedure TConsigna.LogEnable(var MemoLog: Tmemo);
begin
     Log:= MemoLog;
     enableLog:= true;
end;

procedure TConsigna.RUN;
begin
    enabled:= true;
    Resume;
end;


procedure TConsigna.SetConsignaCaudal(valor: integer; Start: boolean = true);
begin
     // Se deberia checkear aca contra la BD OJOO!!!!!!!!!!!!!!!!!!!!!!!!!
     if (valor>=0) and (valor<=40) then
     begin
         self.Caudal:= valor;
         self.esCaudal:= true;
         self.esVoltaje:= false;

         if enableLog then
             log.Lines.Add('Consigna de Caudal: '+inttostr(valor)+' m^3/seg');
     end
     else
     if enableLog then
       log.Lines.Add('Error al Setear consigna de caudal');

    if Start then RUN;
end;


procedure TConsigna.SetConsignaVoltaje(valor: integer; Start: boolean);
begin
     // Se deberia checkear aca contra la BD OJOO!!!!!!!!!!!!!!!!!!!!!!!!!
     if (valor>=0) and (valor<=40000) then
     begin
         self.Voltaje:= valor;
         self.esCaudal:= false;
         self.esVoltaje:= true;

         if enableLog then
             log.Lines.Add('Consigna de Voltaje: '+inttostr(valor)+' Volts');
     end
     else
     if enableLog then
       log.Lines.Add('Error al Setear consigna de voltaje');

    if Start then RUN;

end;


procedure TConsigna.SetConsignaManual;
begin
    STOP;
    if enableLog then
       log.Lines.Add('Consigna Deshabilitada. Modo Manual');
end;


procedure TConsigna.setDelay(milisegundos: cardinal);
begin
    delay:= milisegundos;
end;

procedure TConsigna.STOP;
begin
    enabled:= false;
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

var delta: integer;
    valorAnt: double;
begin
    if enableLog then
      log.lines.add('Revisando Consigna'+TimeToStr(now));

    with DM_AccesoDatosRTU do
    begin
        // Consigna de Caudal


        // Consigna de Voltaje
        if esVoltaje then
        begin
          // Estoy produciendo menos de lo que debo producir.
          if Voltaje > RTU2_ST10021.Value then
          begin
            // Relajar Frenos Generador (RTU2_AT10015)
            valorAnt:= RTU2_AT10015.Value;
            delta:= tryDec(valorAnt,random(3)+1);
            if delta<>0 then
            begin
                // Si no estan al 0%, los decremento
                RTU2_AT10015.Value:= valorAnt-delta;
            end
            else
            begin
              // Si estaban al 0%, pruebo con abrir más los álabes
                valorAnt:= RTU2_AT10007.Value;
                delta:= tryInc(valorAnt,random(3)+1);
                if delta<>0 then
                begin
                    // Si no estan al 0%, los decremento
                    RTU2_AT10007.Value:= valorAnt+delta;
                end
                else
                begin
                   // Si estaban al 0%, pruebo con relajar los frenos de la turbina
                   valorAnt:= RTU2_AT10006.Value;
                   delta:= tryDec(valorAnt,random(3)+1);
                   if delta<>0 then
                    begin
                      // Si no estan al 0%, los decremento
                      RTU2_AT10006.Value:= valorAnt-delta;
                    end
                end;
            end;
        end else

        // Estoy produciendo MAS de lo que debo producir.
        if Voltaje < RTU2_ST10021.Value then
        begin
            // Aumento Frenos Generador (RTU2_AT10015)
            valorAnt:= RTU2_AT10015.Value;
            delta:= tryInc(valorAnt,random(3)+1);
            if delta<>0 then
            begin
                // Si no estan al 100%, los decremento
                RTU2_AT10015.Value:= valorAnt+delta;
            end
            else
            begin
                // Si estaban al 100%, pruebo con cerrar más los álabes
                valorAnt:= RTU2_AT10007.Value;
                delta:= tryDec(valorAnt,random(3)+1);
                if delta<>0 then
                begin
                    // Si no estan al 100%, los decremento
                    RTU2_AT10007.Value:= valorAnt-delta;
                end
                else
                begin
                   // Si estaban al 100%, pruebo con incrementar los frenos de la turbina
                   valorAnt:= RTU2_AT10006.Value;
                   delta:= tryInc(valorAnt,random(3)+1);
                   if delta<>0 then
                    begin
                      // Si no estan al 100%, los incrementar
                      RTU2_AT10006.Value:= valorAnt+delta;
                    end
                end;
            end;
        end;

      end;
    end;


    if enableLog then
      log.lines.add('FIN Revisando Consigna'+TimeToStr(now));

end;


end.
