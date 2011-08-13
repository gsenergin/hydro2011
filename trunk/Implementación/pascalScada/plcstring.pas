{:
  @abstract(Implementação para Tags String.)
  @author(Fabio Luis Girardi papelhigienico@gmail.com)
}
unit PLCString;

{$IFDEF FPC}
{$mode delphi}
{$ENDIF}

interface

uses
  SysUtils, Classes, Tag, TagBlock, ProtocolTypes, ProtocolDriver, Math,
  hsutils;

type
  {:
  @author(Fabio Luis Girardi papelhigienico@gmail.com)

  Define os possíveis tipos de strings.
  @value(stSIEMENS String no formato SIEMENS, onde os dois primeiros bytes da
  cadeia informam o tamanho máximo e quantos bytes desse tamanho já foram usados.)
  @value(stC A string só termina quando o código ASCII 0 é encontrado.)
  }
  TPLCStringTypes = (stSIEMENS, stC);

  {:
  @abstract(Tag de comunicação em formato String.)
  @author(Fabio Luis Girardi papelhigienico@gmail.com)
  }
  TPLCString = class(TTagBlock, IScanableTagInterface, ITagInterface, ITagString)
  private
    PValue:String;
    PByteSize:Byte;
    PStringType:TPLCStringTypes;
    PStringSize:Cardinal;

    procedure SetBlockSize(size:Cardinal);
    procedure SetStringSize(size:Cardinal);
    procedure SetByteSize(bsize:Byte);
    procedure SetStringType(stype:TPLCStringTypes);
    procedure SetDummySize(s:Cardinal);

    function  GetValue:String;
    procedure SetValue(Value:String);
    function  CalcBlockSize(IsWrite:Boolean):Cardinal;
    function  EncodeValues(values:TArrayOfDouble):String;
    function  DecodeValue(value:String):TArrayOfDouble;
    
    function  GetValueAsText(Prefix, Sufix, Format:string):String;
    function  GetVariantValue:Variant;
    procedure SetVariantValue(V:Variant);
    function  IsValidValue(Value:Variant):Boolean;
    function GetValueTimestamp:TDatetime;
  protected
    function IsMyCallBack(Cback: TTagCommandCallBack): Boolean; override;
    //: @seealso(TPLCTag.SetPLCHack)
    procedure SetPLCHack(v:Cardinal); override;
    //: @seealso(TPLCTag.SetPLCSlot)
    procedure SetPLCSlot(v:Cardinal); override;
    //: @seealso(TPLCTag.SetPLCStation)
    procedure SetPLCStation(v:Cardinal); override;
    //: @seealso(TPLCTag.SetMemFileDB)
    procedure SetMemFileDB(v:Cardinal); override;
    //: @seealso(TPLCTag.SetMemAddress)
    procedure SetMemAddress(v:Cardinal); override;
    //: @seealso(TPLCTag.SetMemSubElement)
    procedure SetMemSubElement(v:Cardinal); override;
    //: @seealso(TPLCTag.SetMemReadFunction)
    procedure SetMemReadFunction(v:Cardinal); override;
    //: @seealso(TPLCTag.SetMemWriteFunction)
    procedure SetMemWriteFunction(v:Cardinal); override;
    //: @seealso(TPLCTag.SetPath)
    procedure SetPath(v:String); override;
    //: @seealso(TPLCTag.SetProtocolDriver)
    procedure SetProtocolDriver(p:TProtocolDriver); override;
    //: @seealso(TPLCTag.TagCommandCallBack)
    procedure TagCommandCallBack(Values:TArrayOfDouble; ValuesTimeStamp:TDateTime; TagCommand:TTagCommand; LastResult:TProtocolIOResult; Offset:Integer); override;
  public
    //: @exclude
    constructor Create(AOwner:TComponent); override;
    //: @exclude
    destructor  Destroy; override;
    //: Lê/escreve uma string do equipamento de modo assincrono.
    property Value:String read PValue write SetValue;
  published
    //: Quantidade máxima de caracteres da string.
    property StringSize:Cardinal read PStringSize write SetStringSize;
    {:
    Tipo da String.
    @seealso(TPLCStringTypes)
    }
    property StringType:TPLCStringTypes read PStringType write SetStringType default stC;
    //: Tamanho em bits de cada caracter da string.
    property ByteSize:Byte read PByteSize write SetByteSize default 8;
    
    //: @seealso(TTag.OnValueChange)
    property OnValueChange;
    //: Tamanho do bloco (somente-leitura).
    property Size write SetDummySize;
    //: @seealso(TPLCTag.SyncWrites)
    property SyncWrites;
  end;

implementation

uses variants, hsstrings;

constructor TPLCString.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  PStringSize := 10;
  PByteSize := 8;
  PStringType := stC;
  SetBlockSize(11);
end;

destructor TPLCString.Destroy;
begin
  inherited Destroy;
  SetLength(PValues,0);
end;

//codifica uma array de valores em uma string
function  TPLCString.EncodeValues(values:TArrayOfDouble):String;
var
  aux1, maxbits, bit:Integer;
  ValueAux2, ValueP, ByteP, ValueBitP, ByteBitP:Integer;
  ValueAux, strLen, BitsByType :Byte;
begin
  //use a funcao de leitura
  if PProtocolDriver<>nil then
    BitsByType := Min(PProtocolDriver.SizeOfTag(Self, false, FProtocolTagType),32)
  else
    BitsByType := 8;

  if Length(values)<=0 then begin
    Result := '';
    exit;
  end;

  case PStringType of
      //string formato SIEMENS de 7 ou 8 bits
     stSIEMENS:
     begin
       maxbits := length(values)*BitsByType;
       bit := 0;
       ByteP := 0;
       ByteBitP := 0;
       ValueP := 0;
       ValueBitP := 0;
       ValueAux := 0;
       strlen := 255;
       ValueAux2 := FloatToInteger(values[ValueP]);
       //passa bit a bit para montar a string
       while bit<maxbits do begin
         aux1 := Power(2,ValueBitP);
         if ((ValueAux2 and aux1)=aux1) then
           ValueAux := ValueAux + Power(2,ByteBitP);

         inc(bit);
         inc(ByteBitP);
         inc(ValueBitP);

         //incrementa os ponteiros
         if ByteBitP>=PByteSize then begin
           //se esta nos primeiros 2 bytes
           //acha o tamanho real da string
           //(o menor dos dois primeiros bytes)
           if ByteP<2 then begin
             strlen := min(strlen,ValueAux);
           end else begin
             Result := Result + char(ValueAux);
             //se alcançou o tamanho da string.
             if Length(Result)>=strlen then
               exit;
           end;
           inc(ByteP);
           ByteBitP := 0;
           ValueAux := 0;
         end;
         if ValueBitP>=BitsByType then begin
           ValueBitP := 0;
           Inc(ValueP);
           ValueAux2 := FloatToInteger(values[ValueP]);
         end;
       end;
       if ByteBitP<PByteSize then begin
         Result := Result + char(ValueAux);
       end;
     end;

      //string formato C de 7 ou 8 bits
     stC:
     begin
       maxbits := length(values)*BitsByType;
       bit := 0;
       //ByteP := 1;
       ByteBitP := 0;
       ValueP := 0;
       ValueBitP := 0;
       ValueAux := 0;
       ValueAux2 := FloatToInteger(values[ValueP]);
       //passa bit a bit para montar a string
       while bit<maxbits do begin
         aux1 := Power(2,ValueBitP);
         if ((ValueAux2 and aux1)=aux1) then
           ValueAux := ValueAux + Power(2,ByteBitP);

         inc(bit);
         inc(ByteBitP);
         inc(ValueBitP);

         //incrementa os ponteiros
         if ByteBitP>=PByteSize then begin
           //se encontrou um byte ZERO (fim de string)
           //para de processar os valores.
           if ValueAux=0 then
             exit
           else
             Result := Result + char(ValueAux);
           //inc(ByteP);
           ByteBitP := 0;
           ValueAux := 0;
         end;
         if ValueBitP>=BitsByType then begin
           ValueBitP := 0;
           Inc(ValueP);
           ValueAux2 := FloatToInteger(values[ValueP]);           
         end;
       end;
       if ByteBitP<PByteSize then begin
         Result := Result + char(ValueAux);
       end;
     end;
     else
       Result := '';
  end;
end;

//codifica uma uma string em array de valores
function  TPLCString.DecodeValue(value:String):TArrayOfDouble;
var
  ValueAux, aux1, maxbits, bit, bs:Integer;
  ValueP, ByteP, ValueBitP, ByteBitP:Integer;
  strLen, BitsByType :Byte;
begin
  if PProtocolDriver<>nil then
    BitsByType := Min(PProtocolDriver.SizeOfTag(Self,true,FProtocolTagType),32)
  else
    BitsByType := 8;


  //usa a WriteFunction
  bs := CalcBlockSize(true);
  SetLength(Result,bs);

  case PStringType of
    //formato de String SIEMENS de 7 ou  8 bits
    stSIEMENS:
    begin
      strlen := Min(PStringSize, power(2,PByteSize)-1);
      strlen := Min(strLen,Length(value));
      maxbits := PByteSize * (strlen+2);
      bit := 0;
      ByteBitP := 0;
      ByteP := 1;
      ValueBitP := 0;
      ValueP := 0;
      ValueAux := 0;

      while bit<maxbits do begin
        //processa os dois primeiros bytes do formato siemens
        //que dizem o tamanho da string;
        if bit<(2*PByteSize) then begin
          aux1 := Power(2,ByteBitP);
          if (strLen and aux1)=aux1 then
            ValueAux := ValueAux + Power(2,ValueBitP);
        end else begin
          if bit=(2*PByteSize) then begin
            ByteBitP := 0;
            ByteP := 1;
          end;
          //processa os bytes da string
          aux1 := Power(2,ByteBitP);
          if (ord(value[ByteP]) and aux1)=aux1 then begin
            ValueAux := ValueAux + Power(2,ValueBitP);
          end;
        end;


        inc(bit);
        inc(ByteBitP);
        inc(ValueBitP);

        //incrementa os ponteiros
        if ByteBitP>=PByteSize then begin
          inc(ByteP);
          ByteBitP := 0;
        end;
        if ValueBitP>=BitsByType then begin
          Result[ValueP] := ValueAux;
          ValueAux :=0;
          ValueBitP := 0;
          Inc(ValueP);
        end;
      end;
      if (ValueP<bs) and (ValueBitP<BitsByType) then begin
        Result[ValueP] := ValueAux;
      end;
    end;
    //formato de String C de 7 ou  8 bits
    stC:
    begin
      strlen := Min(Length(value), power(2,PByteSize)-1);
      maxbits := PByteSize * (strlen);
      bit := 0;
      ByteBitP := 0;
      ByteP := 1;
      ValueBitP := 0;
      ValueP := 0;
      ValueAux := 0;
      while bit<maxbits do begin
        //processa os bytes da string
        aux1 := Power(2,ByteBitP);
        if (ord(value[ByteP]) and aux1)=aux1 then
          ValueAux := ValueAux + Power(2,ValueBitP);

        inc(bit);
        inc(ByteBitP);
        inc(ValueBitP);

        //incrementa os ponteiros
        if ByteBitP>=PByteSize then begin
          inc(ByteP);
          ByteBitP := 0;
        end;
        if ValueBitP>=BitsByType then begin
          Result[ValueP] := ValueAux;
          ValueAux :=0;
          ValueBitP := 0;
          Inc(ValueP);
        end;
      end;
      if (ValueP<bs)and (ValueBitP<BitsByType) then begin
        Result[ValueP] := ValueAux;
      end;
    end;
  end;

end;

function TPLCString.GetValueAsText(Prefix, Sufix, Format:string):String;
begin
   Result := Prefix + Value + Sufix;
end;

function TPLCString.IsMyCallBack(Cback: TTagCommandCallBack): Boolean;
begin
  Result:=inherited IsMyCallBack(Cback) and (TMethod(Cback).Code=@TPLCString.TagCommandCallBack);
end;

procedure TPLCString.SetPLCHack(v:Cardinal);
begin
  inherited SetPLCHack(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetPLCSlot(v:Cardinal);
begin
  inherited SetPLCSlot(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetPLCStation(v:Cardinal);
begin
  inherited SetPLCStation(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetMemFileDB(v:Cardinal);
begin
  inherited SetMemFileDB(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetMemAddress(v:Cardinal);
begin
  inherited SetMemAddress(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetMemSubElement(v:Cardinal);
begin
  inherited SetMemSubElement(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetMemReadFunction(v:Cardinal);
begin
  inherited SetMemReadFunction(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetMemWriteFunction(v:Cardinal);
begin
  inherited SetMemWriteFunction(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetPath(v:String);
begin
  inherited SetPath(v);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetProtocolDriver(p:TProtocolDriver);
begin
  inherited SetProtocolDriver(p);
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.TagCommandCallBack(Values:TArrayOfDouble; ValuesTimeStamp:TDateTime; TagCommand:TTagCommand; LastResult:TProtocolIOResult; Offset:Integer);
var
  c:Integer;
  notify:Boolean;
begin
  if (csDestroying in ComponentState) then exit;
  try
    notify := false;
    case TagCommand of
      tcScanRead, tcRead, tcInternalUpdate:
      begin
        if LastResult in [ioOk, ioNullDriver] then begin
          for c := 0 to Length(Values) - 1 do begin
            notify := notify or (PValues[c+Offset]<>values[c]);
            PValues[c+Offset]:=values[c];
          end;
          PValueTimeStamp := ValuesTimeStamp;
          if (TagCommand<>tcInternalUpdate) AND (LastResult=ioOk) then
           IncCommReadOK(1);
        end else begin
          if (TagCommand<>tcInternalUpdate) then begin
            IncCommReadFaults(1);
          end;
        end;
      end;
      tcScanWrite,tcWrite:
      begin
        if LastResult in [ioOk, ioNullDriver] then begin
          if LastResult=ioOk then
             IncCommWriteOK(1);
          for c := 0 to Length(Values) - 1 do begin
            notify := notify or (PValues[c+Offset]<>values[c]);
            PValues[c+Offset]:=values[c]
          end;
        end else
          IncCommWriteFaults(1);
      end;
    end;

    case TagCommand of
      tcScanRead:
        PLastASyncReadCmdResult := LastResult;
      tcScanWrite:
        PLastASyncWriteCmdResult := LastResult;
      tcRead:
        PLastSyncReadCmdResult := LastResult;
      tcWrite:
        PLastSyncWriteCmdResult := LastResult;
    end;

    if notify then begin
      PValue := EncodeValues(PValues);
      NotifyChange;
    end;
  finally
  end;
end;

procedure TPLCString.SetBlockSize(size:Cardinal);
begin
  if size>0 then begin
    PSize := size;
    SetLength(PValues, PSize);
    if PProtocolDriver<>nil then begin
       PProtocolDriver.RemoveTag(Self);
       PProtocolDriver.AddTag(Self);
    end;
  end;
end;

procedure TPLCString.SetStringSize(size:Cardinal);
begin
   if size>255 then
     raise Exception.Create(SstringSizeOutOfBounds);
   PStringSize := size;
   SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetByteSize(bsize:Byte);
begin
   if (bsize<7) or (bsize>8) then
     raise Exception.Create(SsizeMustBe7or8);
   
   PByteSize := bsize;
   SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetStringType(stype:TPLCStringTypes);
begin
  PStringType := stype;
  SetBlockSize(CalcBlockSize(false));
end;

procedure TPLCString.SetDummySize(s:Cardinal);
begin

end;

function  TPLCString.GetValue:String;
begin
  Result := PValue;
end;

procedure TPLCString.SetValue(Value:String);
var
  x:TArrayOfDouble;
begin
  x:=DecodeValue(Value);
  if FSyncWrites then
    Write(x,Length(x),0)
  else
    ScanWrite(x,Length(x),0);
  SetLength(x,0);
end;

function TPLCString.CalcBlockSize(IsWrite:Boolean):Cardinal;
var
  BitsByType:Byte;
  strlen:integer;
begin
  if PProtocolDriver<>nil then begin
    BitsByType := PProtocolDriver.SizeOfTag(Self,IsWrite,FProtocolTagType);
    BitsByType := IfThen(BitsByType=0,1,BitsByType);
  end else
    BitsByType := 8;

  //calcula o tamanho da string conforme o tipo
  case PStringType of
    stSIEMENS:
      strlen := (PStringSize + 2)*PByteSize;
    stC:
      strlen := (PStringSize + 1)*PByteSize;
    else
      strlen := 1;
  end;

  Result := strlen div BitsByType + IfThen((strlen mod BitsByType)>0,1,0);
end;

function  TPLCString.GetVariantValue:Variant;
begin
   Result := Value;
end;

procedure TPLCString.SetVariantValue(V:Variant);
begin
   Value := V
end;

function  TPLCString.IsValidValue(Value:Variant):Boolean;
begin
  Result := VarIsNumeric(Value) or VarIsStr(Value) or
            VarIsType(Value,vardate) or VarIsType(Value,varboolean);
end;

function  TPLCString.GetValueTimestamp:TDatetime;
begin
   Result := PValueTimeStamp;
end;

end.
