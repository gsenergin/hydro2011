unit UI_Login;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, UI_Principal;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    Password: TEdit;
    btn_OK: TButton;
    btn_Cancel: TButton;
    User: TEdit;
    Label2: TLabel;
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
var frm_Principal: Tfrm_Principal;
begin
    // VALIDAR CONTRA LA DB
    // User= ?? Password= ??
  if (true) then
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
    User.Text:= '';
    password.Text := '';
end;

end.
 
