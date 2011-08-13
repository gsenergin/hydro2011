{:
  @author(Fabio Luis Girardi <papelhigienico@gmail.com>)

  @abstract(Implementa o componente de escalonamento linear.)
}
unit LinearScaleProcessor;

{$IFDEF FPC}
{$mode delphi}
{$ENDIF}

interface

uses
  SysUtils, Classes, ValueProcessor;

type
  {:
  @author(Fabio Luis Girardi <papelhigienico@gmail.com>)

  Componente de escalas lineares.
  @seealso(TPIPE)
  @seealso(TScaleProcessor)
  }
  TLinearScaleProcessor = class(TScaleProcessor)
  private
    function GetSysMin:Double;
    function GetSysMax:Double;
    function GetPLCMin:Double;
    function GetPLCMax:Double;
    procedure SetSysMin(v:double);
    procedure SetSysMax(v:double);
    procedure SetPLCMin(v:double);
    procedure SetPLCMax(v:double);
  protected
    //: @exclude
    procedure Loaded; override;
  public
    //: @exclude
    constructor Create(AOwner:TComponent); override;
    {:
    Fornece a saida em função de um valor de entrada.
    @param(sender Objeto que chamou a função.)
    @param(Entrada Valor a ser convertido para saida.)
    }
    function SetInGetOut(Sender:TComponent; Entrada:Double):Double; override;
    {:
    Fornece a entrada em função um valor de saida.
    @param(sender Objeto que chamou função.)
    @param(Saida Valor a ser convertido para entrada.)
    }
    function SetOutGetIn(Sender:TComponent; Saida:Double):Double; override;
  published
    //Valor minimo de escala do sistema (Saida).
    property SysMin:Double read GetSysMin write SetSysMin Stored true;
    //Valor máximo de escala do sistema (Saida).
    property SysMax:Double read GetSysMax write SetSysMax Stored true;
    //Valor minimo de escala do PLC (Entrada).
    property PLCMin:Double read GetPLCMin write SetPLCMin Stored true;
    //Valor máximo de escala do PLC (Entrada).
    property PLCMax:Double read GetPLCMax write SetPLCMax Stored true;
  end;

implementation

uses hsstrings;

constructor TLinearScaleProcessor.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  if csDesigning in ComponentState then begin
    FProperts[0] := 0;
    FProperts[1] := 100;
    FProperts[2] := 0;
    FProperts[3] := 32000;
  end else begin
    FProperts[0] := 0;
    FProperts[1] := 0;
    FProperts[2] := 0;
    FProperts[3] := 0;
  end;
end;

function TLinearScaleProcessor.GetSysMin:Double;
begin
  Result := FProperts[0];
end;

function TLinearScaleProcessor.GetSysMax:Double;
begin
  Result := FProperts[1];
end;

function TLinearScaleProcessor.GetPLCMin:Double;
begin
  Result := FProperts[2];
end;

function TLinearScaleProcessor.GetPLCMax:Double;
begin
  Result := FProperts[3];
end;

procedure TLinearScaleProcessor.SetSysMin(v:double);
begin
  FProperts[0] := v;
end;

procedure TLinearScaleProcessor.SetSysMax(v:double);
begin
  FProperts[1] := v;
end;

procedure TLinearScaleProcessor.SetPLCMin(v:double);
begin
  FProperts[2] := v;
end;

procedure TLinearScaleProcessor.SetPLCMax(v:double);
begin
  FProperts[3] := v;
end;

function  TLinearScaleProcessor.SetInGetOut(Sender:TComponent; Entrada:Double):Double;
var
  divisor:Double;
begin
  divisor := (FProperts[3]-FProperts[2]);
  if divisor=0 then divisor:=1;
  Result := (Entrada-FProperts[2])*(FProperts[1]-FProperts[0])/divisor+FProperts[0];
end;

function TLinearScaleProcessor.SetOutGetIn(Sender:TComponent; Saida:Double):Double;
var
  divisor:Double;
begin
  divisor := (FProperts[1]-FProperts[0]);
  if divisor=0 then divisor:=1;
  Result := (Saida-FProperts[0])*(FProperts[3]-FProperts[2])/divisor+FProperts[2];
end;

procedure TLinearScaleProcessor.Loaded;
begin
  inherited Loaded;
  if (FProperts[0]=FProperts[1]) or (FProperts[2]=FProperts[3]) then
    raise Exception.Create(SinvalidValue);
end;

end.
