unit AccesoDatos;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, ADODB;

type
  TDM_AccesoDatos = class(TDataModule)
    StoredProc_Usuario_Delete: TADOStoredProc;
    StoredProc_Usuario_Insertar: TADOStoredProc;
    StoredProc_Usuario_RestorePassword: TADOStoredProc;

    ADOConnectionHYDRODB: TADOConnection;
    ADOTable_Sensor: TADOTable;
    DS_Sensor: TDataSource;
    ADOQuery_Grafico: TADOQuery;
    DS_Grafico: TDataSource;
    ADOQuery_SensorUpdate: TADOQuery;
    DS_SensorUpdate: TDataSource;
    ADOTable_TipoUsuario: TADOTable;
    DS_TipoUsuario: TDataSource;
    DS_Usuario: TDataSource;
    ADOTable_Usuario: TADOTable;
    StoredFunc_Usuario_Existente: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SP_Usuario_Delete(nombre_usuario:string);
    procedure SP_Usuario_Insert(nombre_usuario:string; IDTipoUsuario:integer);
    procedure SP_Usuario_RestorePassword(nombre_usuario:string);
    function SF_Usuario_Existente(nombre_usuario:string):boolean;

    { Public declarations }
  end;

var
  DM_AccesoDatos: TDM_AccesoDatos;

implementation

{$R *.dfm}

procedure TDM_AccesoDatos.DataModuleCreate(Sender: TObject);
begin
    ADOConnectionHYDRODB.Connected:= true;
    ADOTable_Sensor.Active:= true;
    ADOTable_Usuario.Active:= true;
    ADOTable_TipoUsuario.Active:= true;

end;

function TDM_AccesoDatos.SF_Usuario_Existente(nombre_usuario: string): boolean;
var cantidad:integer;
begin
    cantidad:= 0;
    with StoredFunc_Usuario_Existente do
    begin
        Close;
        Parameters[0].Value:= nombre_usuario;
        Parameters[1].Value:= cantidad;
        ExecProc;
        cantidad:= Parameters.ParamValues['cantidad'];

        aca se cuelga esta verga 
    end;
    if cantidad=0 then
      result:= false
    else
      result:= true;

end;

procedure TDM_AccesoDatos.SP_Usuario_Delete(nombre_usuario: string);
begin
    with StoredProc_Usuario_Delete do
    begin
        Close;
        Parameters[0].Value:= nombre_usuario;
        ExecProc;
    end;
end;

procedure TDM_AccesoDatos.SP_Usuario_Insert(nombre_usuario: string;
  IDTipoUsuario: integer);
begin
    with StoredProc_Usuario_Insertar do
    begin
        Close;
        Parameters[0].Value:= nombre_usuario;
        Parameters[1].Value:= IDTipoUsuario;
        ExecProc;
    end;
end;

procedure TDM_AccesoDatos.SP_Usuario_RestorePassword(nombre_usuario: string);
begin
    with StoredProc_Usuario_RestorePassword do
    begin
        Close;
        Parameters[0].Value:= nombre_usuario;
        ExecProc;
    end;
end;

end.
