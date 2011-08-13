unit Sensor;



interface
uses Dispositivo;

type  TSensor = Class(TDispositivo)
    private
      fMin: integer;
      fMax: integer;
      fValorLL: integer;
      fValorL: integer;
      fValorH: integer;
      fValorHH: integer;
      fTipoAlerta: integer;
      fUnidad_Medida: string;
    function GetMax: integer;
    function GetMin: integer;
    function GetTipoAlerta: integer;
    function GetUnidad_Medida: string;
    function GetValorH: integer;
    function GetValorHH: integer;
    function GetValorL: integer;
    function GetValorLL: integer;
    procedure SetMax(const Value: integer);
    procedure SetMin(const Value: integer);
    procedure SetTipoAlerta(const Value: integer);
    procedure SetUnidad_Medida(const Value: string);
    procedure SetValorH(const Value: integer);
    procedure SetValorHH(const Value: integer);
    procedure SetValorL(const Value: integer);
    procedure SetValorLL(const Value: integer);
      
    protected

    public
      Property min:integer read GetMin write SetMin;
      Property max:integer read GetMax write SetMax;
      Property valorLL:integer read GetValorLL write SetValorLL;
      Property valorL:integer read GetValorL write SetValorL;
      Property valorH:integer read GetValorH write SetValorH;
      Property valorHH:integer read GetValorHH write SetValorHH;
      Property tipoAlerta:integer read GetTipoAlerta write SetTipoAlerta;
      Property unidad_Medida:string read GetUnidad_Medida write SetUnidad_Medida;



End;

implementation

{ TDispositivo }

function TSensor.GetMax: integer;
begin
    result:= fMax;
end;

function TSensor.GetMin: integer;
begin
    result:= fMin;
end;

function TSensor.GetTipoAlerta: integer;
begin
    result:= fTipoAlerta;
end;

function TSensor.GetUnidad_Medida: string;
begin
    result:= fUnidad_Medida;
end;

function TSensor.GetValorH: integer;
begin
    result:= fValorH;
end;

function TSensor.GetValorHH: integer;
begin
    result:= fValorHH;
end;

function TSensor.GetValorL: integer;
begin
    result:= fValorL;
end;

function TSensor.GetValorLL: integer;
begin
    result:= fValorLL;
end;

procedure TSensor.SetMax(const Value: integer);
begin
    fMax :=Value
end;

procedure TSensor.SetMin(const Value: integer);
begin
    fMin :=Value
end;

procedure TSensor.SetTipoAlerta(const Value: integer);
begin
    fTipoAlerta :=Value
end;

procedure TSensor.SetUnidad_Medida(const Value: string);
begin
    fUnidad_Medida :=Value
end;

procedure TSensor.SetValorH(const Value: integer);
begin
    fValorH :=Value
end;

procedure TSensor.SetValorHH(const Value: integer);
begin
    fValorHH :=Value
end;

procedure TSensor.SetValorL(const Value: integer);
begin
    fValorL :=Value
end;

procedure TSensor.SetValorLL(const Value: integer);
begin
    fValorLL :=Value
end;

end.
