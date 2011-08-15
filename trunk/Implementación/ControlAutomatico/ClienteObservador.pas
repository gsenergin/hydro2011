unit ClienteObservador;

interface

type TClienteObservador = Class(TObject)

      RemoteAdress:string;
      RemotePort: integer;
      active: boolean;

      constructor Create (activo:boolean); overload;

      procedure Asignar(IP:string; puerto:integer; activar:boolean);

      procedure Activar;
      procedure Desactivar;
      

End;

implementation

{ TClienteObservador }

procedure TClienteObservador.Activar;
begin
    self.active:= true;
end;

procedure TClienteObservador.Desactivar;
begin
    self.active:= false;
end;

procedure TClienteObservador.Asignar(IP: string; puerto: integer;
  activar: boolean);
begin
    self.RemoteAdress:= IP;
    self.RemotePort:= puerto;
    self.active:= activar;
end;

constructor TClienteObservador.Create(activo: boolean);
begin
    self.active:= activo;
end;



end.
