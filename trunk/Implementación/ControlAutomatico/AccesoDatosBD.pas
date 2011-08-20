unit AccesoDatosBD;

interface

uses
  SysUtils, Classes, DB, ADODB, AccesoDatosRTU, ExtCtrls;



type TThreadGuardarDatos = Class(TThread)
public
      cantRegistrosEscritos: int64;
      constructor Create(deshabilitado: boolean; prioridad: TThreadPriority); reintroduce; overload;

      procedure GuardarDatos();
      procedure Start;
      Procedure Stop;

protected
      procedure Execute; override;
end;


type  TDM_AccesoDatosBD = class(TDataModule)
    StoredProc_HistorialSensado_Insertar: TADOStoredProc;
    StoredProc_RegistroEventos_Insertar: TADOStoredProc;
    ADOConnection1: TADOConnection;
    ADOQuery_Insertar: TADOQuery;
    TimerGuardaDatos: TTimer;

    procedure DataModuleCreate(Sender: TObject);
    procedure TimerGuardaDatosTimer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure SP_InsertarHistorialSensado(direccionMemoria, numeroRTU, valor: variant);
    procedure SP_InsertarRegistroEventos(direccionMemoria, numeroRTU, valor: variant);

    procedure HabilitarGuardaEnBD(valor: boolean); overload;
    procedure HabilitarGuardaEnBD(); overload;
    function getCantidadRegistrosEscritos():int64;
  end;


var
  DM_AccesoDatosBD: TDM_AccesoDatosBD;



implementation

{$R *.dfm}

var TTGuardarDatos: TThreadGuardarDatos;

{$REGION 'ThreadGuardarDatos'}
constructor TThreadGuardarDatos.Create(deshabilitado: boolean; prioridad: TThreadPriority);
begin
    Inherited Create(deshabilitado); //Lo creo deshabilitado
    Priority:= prioridad;
    cantRegistrosEscritos:= 0;
    if not deshabilitado then Resume;
end;

procedure TThreadGuardarDatos.Execute;
begin
      GuardarDatos();
      Suspend;
end;

procedure TThreadGuardarDatos.GuardarDatos;

  function InsV(id: integer; valor:double):string;
  begin
      result:= '('+inttostr(id)+','+inttostr(trunc(valor))+')';
  end;

begin
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
    cantRegistrosEscritos:= cantRegistrosEscritos + 14 + 13;
end;

procedure TThreadGuardarDatos.Start;
begin
    Execute;
end;

procedure TThreadGuardarDatos.Stop;
begin
    Suspend;
end;


{$ENDREGION}




{ TDM_AccesoDatosBD }

procedure TDM_AccesoDatosBD.DataModuleCreate(Sender: TObject);
begin
//    ADOConnection1.Connected:= true;
    TTGuardarDatos:= TThreadGuardarDatos.Create(true, tpTimeCritical);
end;


procedure TDM_AccesoDatosBD.HabilitarGuardaEnBD(valor: boolean);
begin
    TimerGuardaDatos.Enabled:= valor;
end;

procedure TDM_AccesoDatosBD.HabilitarGuardaEnBD;
begin
       TimerGuardaDatos.Enabled:= (ADOConnection1.Connected and DM_AccesoDatosRTU.TCP_UDPPort1.Active)
end;

procedure TDM_AccesoDatosBD.TimerGuardaDatosTimer(Sender: TObject);
begin
    if TTGuardarDatos.Suspended then
        TTGuardarDatos.Start;
end;


function TDM_AccesoDatosBD.getCantidadRegistrosEscritos: int64;
begin
    result:= TTGuardarDatos.cantRegistrosEscritos;
end;



procedure TDM_AccesoDatosBD.SP_InsertarHistorialSensado(direccionMemoria, numeroRTU, valor: variant);
begin
    with StoredProc_HistorialSensado_Insertar do
    begin
      Close;
      Parameters[0].Value:= direccionMemoria;
      Parameters[1].Value:= numeroRTU;
      Parameters[2].Value:= valor;
      ExecProc;
    end;
end;


procedure TDM_AccesoDatosBD.SP_InsertarRegistroEventos(direccionMemoria,
  numeroRTU, valor: variant);
begin
    with StoredProc_RegistroEventos_Insertar do
    begin
      Close;
      Parameters[0].Value:= direccionMemoria;
      Parameters[1].Value:= numeroRTU;
      Parameters[2].Value:= valor;
      ExecProc;
    end;
end;


end.
