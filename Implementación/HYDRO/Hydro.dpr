program Hydro;

uses
  Forms,
  UI_Principal in 'UI_Principal.pas' {frm_Principal},
  AccesoDatos in 'AccesoDatos.pas' {DM_Hydro: TDataModule},
  UI_Login in 'UI_Login.pas' {PasswordDlg},
  UI_Splash in 'UI_Splash.pas' {frm_splashScreen},
  UI_Grafico in 'UI_Grafico.pas' {frm_Grafico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'HYDRO';

  //Application.CreateForm(Tfrm_Grafico, frm_Grafico);
  //  Application.CreateForm(Tfrm_splashScreen, frm_splashScreen);
  if TPasswordDlg.Execute then
  begin
 //   Tfrm_SplashScreen.Execute;
    Application.Initialize;
    Application.CreateForm(Tfrm_Principal, frm_Principal);
    Application.Run;
  end
  else
  begin
    Application.MessageBox('Usuario o Password incorrecto', 'HYDRO');
  end;


end.
