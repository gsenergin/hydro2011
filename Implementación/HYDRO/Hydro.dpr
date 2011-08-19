program Hydro;

uses
  Forms, Controls,
  UI_Principal in 'UI_Principal.pas' {frm_Principal},
  AccesoDatos in 'AccesoDatos.pas' {DM_AccesoDatos: TDataModule},
  UI_Login in 'UI_Login.pas' {PasswordDlg},
  UI_Splash in 'UI_Splash.pas' {frm_splashScreen},
  UI_Grafico in 'UI_Grafico.pas' {frm_Grafico},
  Mensajes in 'Mensajes.pas',
  UI_AgregarUsuario in 'UI_AgregarUsuario.pas' {frm_ABMUsuarios},
  GestionUsuarios in 'GestionUsuarios.pas';

{$R *.res}

var usuarioActual, tipoUsuarioActual, passwordActual: string;
    modalResult: integer;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Hydro Desktop';


  repeat
    Application.CreateForm(TDM_AccesoDatos, DM_AccesoDatos);
//    Application.CreateForm(Tfrm_ABMUsuarios, frm_ABMUsuarios);
    Application.CreateForm(Tfrm_Principal, frm_Principal);
    Application.CreateForm(TPasswordDlg, PasswordDlg);



    PasswordDlg.Showmodal;
    modalResult:= PasswordDlg.ModalResult;
    
    if modalResult = mrOk then  //OK
    begin
    //   Tfrm_SplashScreen.Execute;
      usuarioActual:= PasswordDlg.User.Text;
      tipoUsuarioActual:= PasswordDlg.lbltipoUsuario.Caption;
      passwordActual:= PasswordDlg.Password.Text;

      PasswordDlg.free;
      frm_Principal.lblUsuario.Caption:= usuarioActual;
      frm_Principal.lblTipoUsuario.Caption:= tipoUsuarioActual;
      frm_Principal.lblPassword.Caption:= passwordActual;

      // Habilitar o desabilitar funciones según tipo de usuario

        if (tipoUsuarioActual='Visitante') then
        begin
          with frm_Principal do
          begin
            tab_Configuracion.TabVisible:= false;
            tab_Simulacion.TabVisible:= false;
            Panel_SecuenciasConsignas.Visible:= false;
          end;
        end

        else if (tipoUsuarioActual='Operario') then
        begin
          with frm_Principal do
          begin
            tab_Configuracion.TabVisible:= true;
              TabConfiguracion_TabAlertas.TabVisible:= false;
              TabConfiguracion_TabUsuarios.TabVisible:= TRUE;
                PanelConfiguracionUsuariosActuales.Visible:= false;
                PanelConfiguracionUsuariosNuevos.Visible:= false;
                PanelConfiguracionExUsuarios.Visible:= false;
            tab_Simulacion.TabVisible:= false;
            Panel_SecuenciasConsignas.Visible:= TRUE;
              btn_ConsignaManual.Visible:= false;
          end;
        end

        else if (tipoUsuarioActual='Jefe de Planta') or (tipoUsuarioActual='Administrador') then
        begin
          with frm_Principal do
          begin
            tab_Configuracion.TabVisible:= TRUE;
              TabConfiguracion_TabAlertas.TabVisible:= TRUE;
              TabConfiguracion_TabUsuarios.TabVisible:= TRUE;
                PanelConfiguracionUsuariosActuales.Visible:= TRUE;
                PanelConfiguracionUsuariosNuevos.Visible:= TRUE;
                PanelConfiguracionExUsuarios.Visible:= TRUE;
            tab_Simulacion.TabVisible:= TRUE;
            Panel_SecuenciasConsignas.Visible:= TRUE;
              btn_ConsignaManual.Visible:= TRUE;
          end;
        end;

      //Application.Run;
      frm_Principal.ShowModal;

      frm_Principal.Free;
      DM_AccesoDatos.Free;
      frm_ABMUsuarios.Free;
    end
    else
    if modalResult = mrAbort then // mrAbort
    begin
      PasswordDlg.free;
      frm_Principal.Free;
      DM_AccesoDatos.Free;
      frm_ABMUsuarios.Free;
      Application.MessageBox('Usuario o Password incorrecto', 'Hydro Desktop');
    end;

   until modalResult = mrCancel; //Cancel

   try
    Application.Terminate;
   except

   end;
end.
