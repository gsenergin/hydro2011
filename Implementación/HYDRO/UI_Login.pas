unit UI_Login;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, UI_Principal, DB, ADODB;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    btn_OK: TButton;
    btn_Cancel: TButton;
    User: TEdit;
    Label2: TLabel;
    ADOConnectionHYDROLogin: TADOConnection;
    lbltipoUsuario: TLabel;
    ADOQueryUsuario: TADOQuery;
    lblPassword: TLabel;
    procedure btn_OKClick(Sender: TObject);
    class function Execute: boolean;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

{$R *.dfm}

procedure TPasswordDlg.btn_OKClick(Sender: TObject);
var tipoUsuario: integer;
begin
    // VALIDAR CONTRA LA DB
    // User= ?? Password= ??
    ADOConnectionHYDROLogin.Connected:= true;
    with ADOQueryUsuario do
    begin
      Close;
      //Parameters.ParamByName('user').Value:= user.Text;
      //Parameters.ParamByName('password').Value:= Password.Text;
     // Parameters.ParamByName('tipoUsuario').Value:= 0;
      SQL.Clear;
      SQL.Add('SELECT FK_Usuario_TipoUsuario AS TIPOUSUARIO FROM usuario WHERE user="'+user.Text+'" and password="'+Password.Text+'"');
      Open;
      ExecSQL;
      tipoUsuario:= FieldByName('TIPOUSUARIO').AsInteger;

      SQL.Clear;
      SQL.Add('SELECT Descripcion FROM tipousuario WHERE ID_TipoUsuario='+inttostr(tipoUsuario));
      Open;
      ExecSQL;
      lbltipoUsuario.Caption:= FieldByName('Descripcion').AsString;
      lblPassword.Caption:= Password.Text;

    end;
    ADOConnectionHYDROLogin.Connected:= false;


    if (tipoUsuario>0) then
      ModalResult := mrOK
    else
      ModalResult := mrAbort;

end;



class function TPasswordDlg.Execute: boolean;
begin
  with TPasswordDlg.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;      
end;

procedure TPasswordDlg.FormCreate(Sender: TObject);
begin
    User.Text:= 'admin';
    password.Text := '1234';
end;

end.
 
