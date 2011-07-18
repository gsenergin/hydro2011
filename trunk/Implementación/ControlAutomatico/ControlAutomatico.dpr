program ControlAutomatico;

uses
  Forms,
  UI_ControlAutomatico in 'UI_ControlAutomatico.pas' {frm_ControlAutomatico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_ControlAutomatico, frm_ControlAutomatico);
  Application.Run;
end.
