unit AccesoDatosBD;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM_AccesoDatosBD = class(TDataModule)
    StoredProc_HistorialSensado_Insertar: TADOStoredProc;
    ADOConnection1: TADOConnection;
    StoredProc_RegistroEventos_Insertar: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SP_InsertarHistorialSensado(direccionMemoria, numeroRTU, valor: variant);
    procedure SP_InsertarRegistroEventos(direccionMemoria, numeroRTU, valor: variant);
  end;

var
  DM_AccesoDatosBD: TDM_AccesoDatosBD;

implementation

{$R *.dfm}



{ TDM_AccesoDatosBD }

procedure TDM_AccesoDatosBD.SP_InsertarHistorialSensado(direccionMemoria, numeroRTU, valor: variant);
begin
    with StoredProc_HistorialSensado_Insertar do
    begin
      Close;
      Parameters[0].Value:= direccionMemoria;
      Parameters[1].Value:= numeroRTU;
      Parameters[2].Value:= valor;
      ExecProc;
    end;
end;


procedure TDM_AccesoDatosBD.SP_InsertarRegistroEventos(direccionMemoria,
  numeroRTU, valor: variant);
begin
    with StoredProc_RegistroEventos_Insertar do
    begin
      Close;
      Parameters[0].Value:= direccionMemoria;
      Parameters[1].Value:= numeroRTU;
      Parameters[2].Value:= valor;
      ExecProc;
    end;
end;

end.
