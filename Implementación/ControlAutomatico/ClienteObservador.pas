unit ClienteObservador;

interface

const LIMITE_CLIENTES = 5;

type TClienteObservador = Class(TObject)
  public
    Clientes: Array[1..LIMITE_CLIENTES] of record
       RemoteAdress: string;
       RemotePort: string;
    end;

    cant: integer;

  
    procedure Add(ClientAdress,ClientPort:string);
    procedure Remove(ClientAdress:string);

  end;

implementation

{ TClienteObservador }

procedure TClienteObservador.Add(ClientAdress, ClientPort: string);
begin
    if cant<LIMITE_CLIENTES then
    begin
      cant:= cant+1;
      Clientes[cant].RemoteAdress:= ClientAdress;
      Clientes[cant].RemotePort:= ClientPort;
    end;
end;

procedure TClienteObservador.Remove(ClientAdress: string);
var i,j: integer;
begin
    for i:=1 to cant do
      if Clientes[i].RemoteAdress = ClientAdress then
      begin
          for j := i to cant-1 do
              Clientes[j]:= Clientes[j+1];
          cant:= cant-1;
          exit;
      end;
end;

end.
