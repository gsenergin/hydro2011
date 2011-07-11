unit AccesoDatos;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr, ADODB;

type
  TDM_Hydro = class(TDataModule)
    ADOConnection1: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Hydro: TDM_Hydro;

implementation

{$R *.dfm}

end.
