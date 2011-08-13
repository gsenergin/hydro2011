unit Actuador;

interface
uses Dispositivo;

type  TActuador = Class(TDispositivo)
    private
      fesGradual: boolean;
    function GetEsGradual: boolean;
    procedure SetEsGradual(const Value: boolean);
    protected

    public
      property esGradual: boolean read GetEsGradual write SetEsGradual;
End;
implementation

{ TActuador }

function TActuador.GetEsGradual: boolean;
begin
    result:= fesGradual;
end;

procedure TActuador.SetEsGradual(const Value: boolean);
begin
    fesGradual:= Value;
end;

end.
