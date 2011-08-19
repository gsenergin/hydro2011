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
    ADOQuery_UsuarioExistente: TADOQuery;
    ADOQuery_ExUsuarios: TADOQuery;
    DS_ExUsuarios: TDataSource;
    StoredProc_UsuarioRestaurar: TADOStoredProc;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ADOQuery_ExUsuarios_REFRESH();
    { Private declarations }
  public
    procedure SP_Usuario_Delete(nombre_usuario:string);
    procedure SP_Usuario_Insert(nombre_usuario:string; IDTipoUsuario:integer);
    procedure SP_Usuario_RestorePassword(nombre_usuario, nueva_clave:string);
    procedure SP_Usuario_Restaurar(nombre_usuario:string);


   // function SF_Usuario_Existente(nombre_usuario:string):boolean;
    function AQ_Usuario_Existente(nombre_usuario:string):boolean;
    { Public declarations }
  end;

var
  DM_AccesoDatos: TDM_AccesoDatos;

const
  comilla = chr(39);

implementation

{$R *.dfm}

procedure TDM_AccesoDatos.DataModuleCreate(Sender: TObject);
begin
    ADOConnectionHYDRODB.Connected:= true;
    ADOTable_Sensor.Active:= true;
    ADOTable_Usuario.Active:= true;
    ADOTable_TipoUsuario.Active:= true;
    ADOQuery_ExUsuarios.Open;

end;

procedure TDM_AccesoDatos.ADOQuery_ExUsuarios_REFRESH;
begin
    ADOQuery_ExUsuarios.Close;
    ADOQuery_ExUsuarios.Open;
    ADOQuery_ExUsuarios.Refresh;
end;

function TDM_AccesoDatos.AQ_Usuario_Existente(nombre_usuario: string): boolean;
var cantidad:integer;
begin
    cantidad:= 0;
    with ADOQuery_UsuarioExistente do
    begin
        Close;
        //Parameters[0].Value:= nombre_usuario;
        SQL.Clear;
        SQL.ADD('SELECT COUNT(*) AS cantidad FROM usuario WHERE usuario.user='+comilla+nombre_usuario+comilla);
        Open;
        ExecSQL;
        cantidad:= FieldByName('cantidad').AsInteger;
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
    ADOTable_Usuario.Close;
    ADOTable_Usuario.Open;
    ADOQuery_ExUsuarios_REFRESH();
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
    ADOTable_Usuario.Close;
    ADOTable_Usuario.Open;
end;

procedure TDM_AccesoDatos.SP_Usuario_Restaurar(nombre_usuario: string);
begin
    with StoredProc_UsuarioRestaurar do
    begin
        Close;
        Parameters[0].Value:= nombre_usuario;
        ExecProc;
    end;
    ADOTable_Usuario.Close;
    ADOTable_Usuario.Open;
    ADOQuery_ExUsuarios_REFRESH();
end;



procedure TDM_AccesoDatos.SP_Usuario_RestorePassword(nombre_usuario,
  nueva_clave: string);
begin
    with StoredProc_Usuario_RestorePassword do
    begin
        Close;
        Parameters[0].Value:= nombre_usuario;
        Parameters[1].Value:= nueva_clave;
        ExecProc;
    end;
end;

end.
