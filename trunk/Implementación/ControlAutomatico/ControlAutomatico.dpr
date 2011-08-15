program ControlAutomatico;

uses
  Forms,
  UI_ControlAutomatico in 'UI_ControlAutomatico.pas' {frm_ControlAutomatico},
  AccesoDatosRTU in 'AccesoDatosRTU.pas' {DM_AccesoDatosRTU: TDataModule},
  AccesoDatosBD in 'AccesoDatosBD.pas' {DM_AccesoDatosBD: TDataModule},
  ClienteObservador in 'ClienteObservador.pas',
  Secuencia in 'Secuencia.pas',
  Consigna in 'Consigna.pas',
  Dispositivo in 'Dispositivo.pas',
  Sensor in 'Sensor.pas',
  Actuador in 'Actuador.pas',
  Log in 'Log.pas',
  GestorComandosRemotos in 'GestorComandosRemotos.pas' {DM_GestorComandosRemotos: TDataModule},
  ThreadGuardarDatos in 'ThreadGuardarDatos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_ControlAutomatico, frm_ControlAutomatico);
  Application.CreateForm(TDM_AccesoDatosRTU, DM_AccesoDatosRTU);
  Application.CreateForm(TDM_AccesoDatosBD, DM_AccesoDatosBD);
  Application.CreateForm(TDM_GestorComandosRemotos, DM_GestorComandosRemotos);
  Application.Run;
end.
