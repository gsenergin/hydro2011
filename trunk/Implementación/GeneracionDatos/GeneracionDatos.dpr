program GeneracionDatos;

uses
  Forms,
  UI_GeneracionDatos in 'UI_GeneracionDatos.pas' {frm_GeneracionDatos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Generacion de Datos';
  Application.CreateForm(Tfrm_GeneracionDatos, frm_GeneracionDatos);
  Application.Run;
end.
