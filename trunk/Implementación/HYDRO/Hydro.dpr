program Hydro;

uses
  Forms,
  UI_Principal in 'UI_Principal.pas' {frm_Principal},
  AccesoDatos in 'AccesoDatos.pas' {DM_Hydro: TDataModule},
  UI_Login in 'UI_Login.pas' {PasswordDlg},
  UI_Splash in 'UI_Splash.pas' {frm_splashScreen},
  UI_Grafico in 'UI_Grafico.pas' {frm_Grafico};

{$R *.res}

var usuarioActual, tipoUsuarioActual: string;
    modalResult: integer;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'HYDRO';

  //Application.CreateForm(Tfrm_Grafico, frm_Grafico);
  //  Application.CreateForm(Tfrm_splashScreen, frm_splashScreen);
   Application.CreateForm(Tfrm_Principal, frm_Principal);
   Application.CreateForm(TPasswordDlg, PasswordDlg);
 // repeat
    PasswordDlg.Showmodal;
    modalResult:= PasswordDlg.ModalResult;

    if modalResult = 1 then  //OK
    //if TPasswordDlg.Execute then
    begin
    //   Tfrm_SplashScreen.Execute;
      usuarioActual:= PasswordDlg.User.Text;
      tipoUsuarioActual:= PasswordDlg.lbltipoUsuario.Caption;

      PasswordDlg.free;

    //  Application.CreateForm(Tfrm_Principal, frm_Principal);
      frm_Principal.lblUsuario.Caption:= usuarioActual;
      frm_Principal.lblTipoUsuario.Caption:= tipoUsuarioActual;

      // Habilitar o desabilitar funciones según tipo de usuario
      if (tipoUsuarioActual='Visitante') or (tipoUsuarioActual='Operario') then
      begin
        frm_Principal.tab_Configuracion.Enabled:= false;
      end;

      Application.Run;

    end
    else
    begin
      Application.MessageBox('Usuario o Password incorrecto', 'HYDRO');
    end;

 // until modalResult = 2; //Cancel

end.
