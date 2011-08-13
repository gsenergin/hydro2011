unit Dispositivo;

interface

// Valores para ftipo para llevar control de la herencia
const
    tdNull = 0;
    tdSensor = 1;
    tdActuador = 2;

type  TDispositivo = Class(TObject)
    private
      fID: integer;
      fnomenclatura: string;
      fdescripcion: string;
      fdireccion_memoria:integer;
      fRTU_numero: integer;
      ftipo: integer;
      fValorActual: integer;
    function GetRTU_numero: integer;
    procedure SetRTU_numero(const Value: integer);
    function GetID: integer;
    function GetTipo: integer;
    procedure SetID(const Value: integer);
    procedure SetTipo(const Value: integer);
    function GetValorActual: integer;
    procedure SetValorActual(const Value: integer);

    protected
      function GetNomenclatura: string;
      procedure SetNomenclatura(const Value: string);
      function GetDescripcion: string;
      procedure SetDescripcion(const Value: string);
      function GetDireccion_memoria: integer;
      procedure SetDireccion_memoria(const Value: integer);

    public
       Constructor Create(id, tipo, RTU_numero, direccion_memoria: integer; nomenclatura, descripcion:String);
       Property ID:integer read GetID write SetID;
       Property tipo:integer read GetTipo write SetTipo;
       Property nomenclatura:string read GetNomenclatura write SetNomenclatura;
       Property descripcion:string read GetDescripcion write SetDescripcion;
       Property direccion_memoria:integer read GetDireccion_memoria write SetDireccion_memoria;
       Property RTU_numero:integer read GetRTU_numero write SetRTU_numero;
       Property ValorActual:integer read GetValorActual write SetValorActual;

(*
    // Sensor
    unidad_medida
    min
    valorLL
    valorL
    valorH
    valorHH
    max
    TipoAlerta

    //actuador
    gradual        *)

End;

implementation

{ TDispositivo }

constructor TDispositivo.Create(id, tipo, RTU_numero,
  direccion_memoria: integer; nomenclatura, descripcion: String);
begin
    fID:= id;
    ftipo:= tipo;
    fRTU_numero:= RTU_numero;
    fdireccion_memoria:= direccion_memoria;
    fnomenclatura:= nomenclatura;
    fdescripcion:= descripcion;
end;

function TDispositivo.GetDescripcion: string;
begin
    result:= fdescripcion;
end;

function TDispositivo.GetDireccion_memoria: integer;
begin
    result:= fdireccion_memoria;
end;

function TDispositivo.GetID: integer;
begin
    result:= fID;
end;

function TDispositivo.GetNomenclatura: string;
begin
    result:= fnomenclatura;
end;

function TDispositivo.GetRTU_numero: integer;
begin
    result:= fRTU_numero;
end;

function TDispositivo.GetTipo: integer;
begin
    result:= ftipo;
end;

function TDispositivo.GetValorActual: integer;
begin
    result:= fValorActual;
end;

procedure TDispositivo.SetDescripcion(const Value: string);
begin
    fdescripcion:= value;
end;

procedure TDispositivo.SetDireccion_memoria(const Value: integer);
begin
    fdireccion_memoria:= Value;
end;

procedure TDispositivo.SetID(const Value: integer);
begin
    fID:= Value;
end;

procedure TDispositivo.SetNomenclatura(const Value: string);
begin
    fnomenclatura:= Value;
end;

procedure TDispositivo.SetRTU_numero(const Value: integer);
begin
    fRTU_numero:= Value;
end;

procedure TDispositivo.SetTipo(const Value: integer);
begin
    ftipo:= Value;
end;

procedure TDispositivo.SetValorActual(const Value: integer);
begin
    fValorActual:= Value;
end;

end.
