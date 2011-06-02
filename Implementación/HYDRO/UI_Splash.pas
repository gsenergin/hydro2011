unit UI_Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls;

type
  Tfrm_splashScreen = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
    class function Execute: boolean;
  end;

var
  frm_splashScreen: Tfrm_splashScreen;

implementation


{$R *.dfm}

{ Tfrm_splashScreen }

class function Tfrm_splashScreen.Execute: boolean;
var i:integer;
begin
  frm_SplashScreen:= Tfrm_splashScreen.Create(nil);
  frm_SplashScreen.Show;
  frm_SplashScreen.Image1.BringToFront;
    Sleep(2000);
  frm_SplashScreen.Free;
end;


end.
