unit ThreadGuardarDatos;

interface
uses  Classes, (*Thread*)
      SysUtils, (*Time / Sleep*)
      AccesoDatosRTU,
      AccesoDatosBD;


type TThreadGuardarDatos = Class(TThread)
private
      delayMS: Integer;
      cantRegistrosEscritos: int64;
      threadEnabled: boolean;

protected
      procedure Execute; override;
      
public
      constructor Create(deshabilitado: boolean; delay: integer; prioridad: TThreadPriority); reintroduce; overload;

      procedure GuardarDatos();
      procedure Start;
      Procedure Stop;

      function getCantidadRegistrosEscritos():int64;
end;


implementation

{ TThreadGuardarDatos }

constructor TThreadGuardarDatos.Create(deshabilitado: boolean; delay: integer; prioridad: TThreadPriority);
begin
    Inherited Create(deshabilitado); //Lo creo deshabilitado
    self.threadEnabled:= not deshabilitado;

    self.delayMS:= delay;
    self.Priority:= prioridad;
    self.cantRegistrosEscritos:= 0;
    if (self.threadEnabled) then Resume;
end;

procedure TThreadGuardarDatos.Execute;
begin
  inherited;
  while threadEnabled do
  begin
      GuardarDatos();
      sleep(delayMS);
  end;
end;

function TThreadGuardarDatos.getCantidadRegistrosEscritos: int64;
begin
    result:= cantRegistrosEscritos;
end;

procedure TThreadGuardarDatos.GuardarDatos;

  function InsV(id: integer; valor:double):string;
  begin
      result:= '('+inttostr(id)+','+inttostr(trunc(valor))+')';
  end;

begin

    //TS:= DateTimeToTimeStamp( Now());
    // Guardo Los sensores en la tabla HistorialSensado
    with DM_AccesoDatosBD.ADOQuery_Insertar do
    begin
        Close;
        SQL.Clear;
        SQL.Add( 'INSERT INTO historialSensado(FK_HistorialSensado_Sensor,valorSensado) VALUES '
          + InsV(1,DM_AccesoDatosRTU.RTU1_SCC0001.ValueRaw) + ','
          + InsV(2,DM_AccesoDatosRTU.RTU1_SCC0002.ValueRaw) + ','
          + InsV(3,DM_AccesoDatosRTU.RTU1_SCC0005.ValueRaw) + ','
          + InsV(4,DM_AccesoDatosRTU.RTU2_ST10001.ValueRaw) + ','
          + InsV(5,DM_AccesoDatosRTU.RTU2_ST10002.ValueRaw) + ','
          + InsV(6,DM_AccesoDatosRTU.RTU2_ST10005.ValueRaw) + ','
          + InsV(7,DM_AccesoDatosRTU.RTU2_ST10008.ValueRaw) + ','
          + InsV(8,DM_AccesoDatosRTU.RTU2_ST10009.ValueRaw) + ','
          + InsV(9,DM_AccesoDatosRTU.RTU2_ST10010.ValueRaw) + ','
          + InsV(10,DM_AccesoDatosRTU.RTU2_ST10012.ValueRaw) + ','
          + InsV(11,DM_AccesoDatosRTU.RTU2_ST10013.ValueRaw) + ','
          + InsV(12,DM_AccesoDatosRTU.RTU2_ST10014.ValueRaw) + ','
          + InsV(13,DM_AccesoDatosRTU.RTU2_ST10020.ValueRaw) + ','
          + InsV(14,DM_AccesoDatosRTU.RTU2_ST10021.ValueRaw) + ','
          + InsV(15,DM_AccesoDatosRTU.RTU3_SSA0001.ValueRaw)
        );
        
        ExecSQL;

        // Guardo los actuadores
        Close;
        SQL.Clear;
        SQL.Add( 'INSERT INTO registroeventos(FK_RegistroEventos_Actuador,valorSeteado) VALUES '
          + InsV(1,DM_AccesoDatosRTU.RTU1_ACC0003.ValueRaw) + ','
          + InsV(2,DM_AccesoDatosRTU.RTU1_ACC0004.ValueRaw) + ','
          + InsV(3,DM_AccesoDatosRTU.RTU2_AT10003.ValueRaw) + ','
          + InsV(4,DM_AccesoDatosRTU.RTU2_AT10004.ValueRaw) + ','
          + InsV(5,DM_AccesoDatosRTU.RTU2_AT10006.ValueRaw) + ','
          + InsV(6,DM_AccesoDatosRTU.RTU2_AT10007.ValueRaw) + ','
          + InsV(7,DM_AccesoDatosRTU.RTU2_AT10011.ValueRaw) + ','
          + InsV(8,DM_AccesoDatosRTU.RTU2_AT10015.ValueRaw) + ','
          + InsV(9,DM_AccesoDatosRTU.RTU2_AT10016.ValueRaw) + ','
          + InsV(10,DM_AccesoDatosRTU.RTU2_AT10017.ValueRaw) + ','
          + InsV(11,DM_AccesoDatosRTU.RTU2_AT10018.ValueRaw) + ','
          + InsV(12,DM_AccesoDatosRTU.RTU2_AT10019.ValueRaw) + ','
          + InsV(13,DM_AccesoDatosRTU.RTU3_ASA0002.ValueRaw) +';'
        );
        ExecSQL;

    end;
    // ID, timestamp, valor sensado
  (*
       // Guardo Los sensores en la tabla RegistroEventos
		   with DM_AccesoDatosRTU do
		   begin
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40003,1,RTU1_ACC0003.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40004,1,RTU1_ACC0004.ValueRaw);

			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40003,2,RTU2_AT10003.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40004,2,RTU2_AT10004.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40006,2,RTU2_AT10006.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40007,2,RTU2_AT10007.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40011,2,RTU2_AT10011.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40015,2,RTU2_AT10015.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40016,2,RTU2_AT10016.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40017,2,RTU2_AT10017.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40018,2,RTU2_AT10018.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40019,2,RTU2_AT10019.ValueRaw);

			  DM_AccesoDatosBD.SP_InsertarRegistroEventos(40002,3,RTU3_ASA0002.ValueRaw);
		   end;

        with DM_AccesoDatosRTU do
		   begin
			 // Datos de la RTU #1
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40001,1,RTU1_SCC0001.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40002,1,RTU1_SCC0002.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40005,1,RTU1_SCC0005.ValueRaw);
			// Datos de la RTU #2
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40001,2,RTU2_ST10001.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40002,2,RTU2_ST10002.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40005,2,RTU2_ST10005.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40008,2,RTU2_ST10008.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40009,2,RTU2_ST10009.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40012,2,RTU2_ST10012.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40013,2,RTU2_ST10013.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40014,2,RTU2_ST10014.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40020,2,RTU2_ST10020.ValueRaw);
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40021,2,RTU2_ST10021.ValueRaw);
			// Datos de la RTU #3
			  DM_AccesoDatosBD.SP_InsertarHistorialSensado(40001,3,RTU3_SSA0001.ValueRaw);
		   end;


  *)
		   cantRegistrosEscritos:= cantRegistrosEscritos + 14 + 13;
end;

procedure TThreadGuardarDatos.Start;
begin
    threadEnabled:= true;
    Self.Execute;
end;

procedure TThreadGuardarDatos.Stop;
begin
    threadEnabled:= false;
    Self.Suspend;
end;

end.
