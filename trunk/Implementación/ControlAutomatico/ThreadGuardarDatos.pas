unit ThreadGuardarDatos;

interface
uses  Classes, (*Thread*)
      SysUtils, (*Time / Sleep*)
      AccesoDatosRTU,
      AccesoDatosBD;


type TThreadGuardarDatos = Class(TThread)
private
      delayMS: Integer;
      procedure Execute; override;
public
      constructor Create(delay:integer; prioridad: TThreadPriority; activar:boolean); reintroduce; overload;

      procedure GuardarDatos();
      procedure Start;
      Procedure Stop;
end;


implementation

{ TThreadGuardarDatos }

constructor TThreadGuardarDatos.Create(delay: integer; prioridad: TThreadPriority; activar:boolean);
begin
    Inherited Create(True);
    
    self.delayMS:= delay;
    self.Priority:= prioridad;
    
    if activar then Resume;
    
end;

procedure TThreadGuardarDatos.Execute;
begin
  inherited;
  while true do
  begin
      GuardarDatos;

      sleep(delayMS);
  end;
end;

procedure TThreadGuardarDatos.GuardarDatos;
begin
    // Guardo Los sensores en la tabla HistorialSensado
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
end;

procedure TThreadGuardarDatos.Start;
begin
    Execute;
end;

procedure TThreadGuardarDatos.Stop;
begin
    Suspend;
end;

end.
