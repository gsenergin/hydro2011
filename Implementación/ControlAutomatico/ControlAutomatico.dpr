program ControlAutomatico;

uses
  Forms,
  UI_ControlAutomatico in 'UI_ControlAutomatico.pas' {frm_ControlAutomatico},
  AccesoDatosRTU in 'AccesoDatosRTU.pas' {DM_AccesoDatosRTU: TDataModule},
  AccesoDatosBD in 'AccesoDatosBD.pas' {DM_AccesoDatosBD: TDataModule},
  AccesoDatosObservador in 'AccesoDatosObservador.pas' {DM_AccesoDatosObservador: TDataModule},
  ClienteObservador in 'ClienteObservador.pas',
  Consigna in 'Consigna.pas',
  Secuencia in 'Secuencia.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_ControlAutomatico, frm_ControlAutomatico);
  Application.CreateForm(TDM_AccesoDatosRTU, DM_AccesoDatosRTU);
  Application.CreateForm(TDM_AccesoDatosBD, DM_AccesoDatosBD);
  Application.CreateForm(TDM_AccesoDatosObservador, DM_AccesoDatosObservador);
  Application.Run;
end.
