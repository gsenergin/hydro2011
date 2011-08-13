{:
  @abstract(Implmentação do driver West n6100 ASCII.)
  @author(Fabio Luis Girardi <papelhigienico@gmail.com>)
}
unit WestASCIIDriver;

{$IFDEF FPC}
{$MODE DELPHI}
{$ENDIF}

interface

uses
  Classes, SysUtils, ProtocolDriver, Tag, ProtocolTypes, commtypes
  {$IFNDEF FPC}, Windows{$ENDIF};

type
  {:
  Identifica um parametro West n6100.
  @member ParameterID identifica o parametro West.
  @member FunctionAllowed funções West permitidas para esse parametro.
  @member ReadOnly Identifica um parametro somente leitura.
  @member Decimal Identifica quantas casas decimais o parametro tem por padrão.
  }
  TParameter = record
    ParameterID:Byte;
    FunctionAllowed:Byte;
    ReadOnly:Boolean;
    Decimal:Byte;
  end;

  //: Tempos de scam de cada registrador West.
  TScanTime = record
    ScanTime, RefCount:integer;
  end;

  {:
  Identifica um registrador West n6100.
  @member Value Valor do registrador.
  @member Decimal Casas decimais do registrador.
  @member Timestamp Data/Hora da última atualização do registrador.
  @member LastReadResult Resultado da última tentativa de leitura do registrador.
  @member LastWriteResult Resultado da última tentativa de escrita desse registrador.
  @member ScanTimes Lista das taxas de atualização do registrador.
  @member MinScanTime Menor taxa de atualização do registrador.
  }
  TWestRegister = record
    Value:Double;
    Decimal:Byte;
    Timestamp:TDateTime;
    LastReadResult, LastWriteResult:TProtocolIOResult;
    ScanTimes:Array of TScanTime;
    MinScanTime:Integer;
  end;
  //: Lista de todos os registradores do West n6100.
  TWestRegisters = array[$00..$1b] of TWestRegister;

  //: Identifica o intervalo de endereços do West n6100.
  TWestAddressRange = 0..99;

  //: Identifica um controlador West n6100.
  TWestDevice = record
    Address:TWestAddressRange;
    Registers:TWestRegisters;
  end;

  //: Identifica vários controladores West n6100.
  TWestDevices = array of TWestDevice;

  //: Identifica cada item retornando pela Tabela de Scan (ScanTable) do West.
  TScanTableReg = record
    Value:Double;
    Decimal:Byte;
    IOResult:TProtocolIOResult;
    TimeStamp:TDateTime;
  end;

  //: Identifica os dados retornados por ScanTable do West n6100.
  TScanTable = record
    PV,
    SP,
    Status,
    Out1,
    Out2:TScanTableReg;
    HaveOut2:Boolean;
  end;

  {:
  @abstract(Classe driver para West n6100 ASCII.)
  @author(Fabio Luis Girardi <papelhigienico@gmail.com>)

  Para usar este driver, basta configurar as seguintes propriedades do seu tag:

  @unorderedList(
    @item(@bold(TTag.MemAddress): Endereço do parametro West. Ver tabela abaixo;)
    @item(@bold(TTag.PLCStation): Endereço do controlador West.)
  )

  Para a propriedade MemAddres, use os seguintes valores:

  @table(
    @rowHead( @cell(Valor MemAddres)       @cell(Parametro West) )
    @row(     @cell(0)                     @cell(SetPoint - SP) )
    @row(     @cell(1)                     @cell(Process Variable - PV) )
    @row(     @cell(2)                     @cell(Power Output value) )
    @row(     @cell(3)                     @cell(Controller status) )
    @row(     @cell(4)                     @cell(Scale Range Max) )
    @row(     @cell(5)                     @cell(Scale Range Min) )
    @row(     @cell(6)                     @cell(Scale Range Decimal Point) )
    @row(     @cell(7)                     @cell(Input filter time constant) )
    @row(     @cell(8)                     @cell(Output 1 Power Limit) )
    @row(     @cell(9)                     @cell(Output 1 cycle time) )
    @row(     @cell(10)                    @cell(Output 2 cycle time) )
    @row(     @cell(11)                    @cell(Recorder output scale max) )
    @row(     @cell(12)                    @cell(Recorder output scale min) )
    @row(     @cell(13)                    @cell(SetPoint ramp rate) )
    @row(     @cell(14)                    @cell(Setpoint high limit) )
    @row(     @cell(15)                    @cell(Setpoint low limit) )
    @row(     @cell(16)                    @cell(Alarm 1 value) )
    @row(     @cell(17)                    @cell(Alarm 2 value) )
    @row(     @cell(18)                    @cell(Rate - Derivative time constant) )
    @row(     @cell(19)                    @cell(Reset - Integral time constant) )
    @row(     @cell(20)                    @cell(Manual time reset - BIAS) )
    @row(     @cell(21)                    @cell(ON/OFF diferential) )
    @row(     @cell(22)                    @cell(Overlap/Deadband) )
    @row(     @cell(23)                    @cell(Proportional band 1 value) )
    @row(     @cell(24)                    @cell(Proportional band 2 value) )
    @row(     @cell(25)                    @cell(PV Offset) )
    @row(     @cell(26)                    @cell(Arithmetic deviation) )
    @row(     @cell(27)                    @cell(Arithmetic deviation) )
  )

  @bold(Caso um ou mais parametros possam ser lidos por scan table, o driver
  irá fazer isso para ganhar algum desempenho.)
  }
  TWestASCIIDriver = class(TProtocolDriver)
  private
    FWestDevices:TWestDevices;
{d} procedure AssignScanTableToReg(const stablereg:TScanTableReg; var WestReg:TWestRegister);
{d} function  IOResultToProtocolResult(IORes:TIOResult):TProtocolIOResult;
{d} procedure AddressToChar(Addr:TWestAddressRange; var ret:BYTES);
{d} function  WestToDouble(const buffer:Array of byte; var Value:Double):TProtocolIOResult; overload;
{d} function  WestToDouble(const buffer:Array of byte; var Value:Double; var dec:Byte):TProtocolIOResult; overload;
{d} function  DoubleToWestAuto(var buffer:Array of Byte; const Value:Double):TProtocolIOResult;
{d} function  DoubleToWestManual(var buffer:Array of Byte; const Value:Double; const dec:BYTE):TProtocolIOResult;

{d} function  ParameterValue (const DeviceID:TWestAddressRange; const Parameter:BYTE; var   Value:Double; var   dec:BYTE):TProtocolIOResult;
{d} function  ModifyParameter(const DeviceID:TWestAddressRange; const Parameter:BYTE; const Value:Double; const dec:BYTE):TProtocolIOResult;

{d} function  ScanTable(DeviceID:TWestAddressRange; var ScanTableValues:TScanTable):TProtocolIOResult;

{d} procedure MinScanTimeOfReg(var WestReg:TWestRegister);

  protected
    //: @seealso(TProtocolDriver.DoAddTag)
{d} procedure DoAddTag(TagObj:TTag; TagValid:Boolean); override;
    //: @seealso(TProtocolDriver.DoAddTag)
{d} procedure DoDelTag(TagObj:TTag); override;
    //: @seealso(TProtocolDriver.DoAddTag)
    procedure DoScanRead(Sender:TObject; var NeedSleep:Integer); override;
    //: @seealso(TProtocolDriver.DoAddTag)
{d} procedure DoGetValue(TagRec:TTagRec; var values:TScanReadRec); override;
    //: @seealso(TProtocolDriver.DoAddTag)
{d} function  DoWrite(const tagrec:TTagRec; const Values:TArrayOfDouble; Sync:Boolean):TProtocolIOResult; override;
    //: @seealso(TProtocolDriver.DoAddTag)
{d} function  DoRead (const tagrec:TTagRec; out   Values:TArrayOfDouble; Sync:Boolean):TProtocolIOResult; override;
  public
    //: @exclude
    constructor Create(AOwner:TComponent); override;
    //: @exclude
    destructor  Destroy; override;
    {:
    Verifique se um controlador West esta ativo na rede.
    @param(DeviceID TWestAddressRange Endereço que se deseja verificar se está disponível na rede.)
    @returns(ioOk caso o equipamento esteja operando na rede.)
    }
    function    DeviceActive(DeviceID:TWestAddressRange):TProtocolIOResult;

    // @seealso(TProtocolDriver.SizeOfTag);
    function SizeOfTag(Tag: TTag; isWrite: Boolean; var ProtocolTagType: TProtocolTagType): BYTE; override;

    //: @seealso(TProtocolDriver.OpenTagEditor)
    procedure OpenTagEditor(OwnerOfNewTags: TComponent; InsertHook: TAddTagInEditorHook; CreateProc: TCreateTagProc); override;
  published
    //: @seealso(TProtocolDriver.ReadSomethingAlways)
    property ReadSomethingAlways;
  end;

var
  ParameterList:array[$00..$1b] of TParameter;

implementation

uses PLCTagNumber, math, dateutils, hsstrings, uwesttagbuilder, Controls;

constructor TWestASCIIDriver.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  PReadSomethingAlways:=true;
end;

destructor  TWestASCIIDriver.Destroy;
begin
  inherited Destroy;
  SetLength(FWestDevices,0);
end;

procedure TWestASCIIDriver.DoAddTag(TagObj:TTag; TagValid:Boolean);
var
  plc, scanRate:Integer;
  foundplc, foundScanRate, valido:boolean;
  plctagobj:TPLCTagNumber;
begin
  if not (TagObj is TPLCTagNumber) then
    raise Exception.Create(SonlyPLCTagNumber);

  plctagobj:=TPLCTagNumber(TagObj);

  valido:=false;

  //se for um tag válido, registra ele no scan. senão só o coloca na lista de
  //tags dependentes...
  if (plctagobj.PLCStation in [1..99]) and (plctagobj.MemAddress in [$00..$1B]) then begin

    foundplc:=false;
    foundScanRate:=false;

    for plc:=0 to High(FWestDevices) do
      if FWestDevices[plc].Address=plctagobj.PLCStation then begin
        foundplc:=true;
        break;
      end;

    if not foundplc then begin
      plc := Length(FWestDevices);
      SetLength(FWestDevices,plc+1);
      FWestDevices[plc].Address := plctagobj.PLCStation;
    end;

    with FWestDevices[plc].Registers[plctagobj.MemAddress] do
      for scanRate := 0 to High(ScanTimes) do
        if ScanTimes[scanRate].ScanTime=plctagobj.RefreshTime then begin
          foundScanRate:=true;
          inc(ScanTimes[scanRate].RefCount);
          break;
        end;

    if not foundScanRate then
      with FWestDevices[plc].Registers[plctagobj.MemAddress] do begin
        scanRate:=Length(ScanTimes);
        SetLength(ScanTimes,scanRate+1);
        ScanTimes[scanRate].ScanTime:=plctagobj.RefreshTime;
        ScanTimes[scanRate].RefCount:=1;
        if scanRate=0 then
          MinScanTime:=plctagobj.RefreshTime;
      end;

    with FWestDevices[plc].Registers[plctagobj.MemAddress] do
      MinScanTime:=Min(MinScanTime, plctagobj.RefreshTime);

    valido:=true;
  end;

  inherited DoAddTag(TagObj, valido);

end;

procedure TWestASCIIDriver.DoDelTag(TagObj:TTag);
var
  plc, scanRate, reg, h:Integer;
  foundplc, foundScanRate, foundActiveReg:boolean;
  plctagobj:TPLCTagNumber;
begin
  try
    if not (TagObj is TPLCTagNumber) then
      raise Exception.Create(SonlyPLCTagNumber);

    plctagobj:=TPLCTagNumber(TagObj);

    if (plctagobj.PLCStation in [1..99]) and (plctagobj.MemAddress in [$00..$1B]) then begin

      foundplc:=false;
      foundScanRate:=false;

      for plc:=0 to High(FWestDevices) do
        if FWestDevices[plc].Address=plctagobj.PLCStation then begin
          foundplc:=true;
          break;
        end;

      //se nao encontrou o CLP, não há nada para fazer,
      //pq se o clp nao existe, a memoria tbm nao existe.
      if not foundplc then
        exit;

      with FWestDevices[plc].Registers[plctagobj.MemAddress] do begin
        h:=High(ScanTimes);
        for scanRate := 0 to High(ScanTimes) do
          if ScanTimes[scanRate].ScanTime=plctagobj.RefreshTime then begin
            foundScanRate:=true;

            dec(ScanTimes[scanRate].RefCount);

            //caso a taxa de atualização nao tenha mais dependentes, remove...
            if ScanTimes[scanRate].RefCount=0 then begin
              ScanTimes[scanRate] := ScanTimes[h];
              SetLength(ScanTimes,h);
              MinScanTime:=$7fffffff;
            end;
            break;
          end;
        end;

      if not foundScanRate then
        exit;

      //procura por registros ativos no scan.
      foundActiveReg:=false;
      for reg:=0 to High(FWestDevices[plc].Registers) do
        if Length(FWestDevices[plc].Registers[reg].ScanTimes)>0 then begin
          foundActiveReg:=true;
          break;
        end;

      if foundActiveReg then
        MinScanTimeOfReg(FWestDevices[plc].Registers[plctagobj.MemAddress])
      else
        if (Length(FWestDevices)>0) then begin
          //se nao encontrou mais nenhum outro registrador ativo
          //no clp, é necessario elimintar tbm o CLP do scan.
          h:=High(FWestDevices);
          FWestDevices[plc]:=FWestDevices[h];
          SetLength(FWestDevices,h);
        end;

    end;
  finally
    inherited DoDelTag(TagObj);
  end;
end;

procedure TWestASCIIDriver.DoScanRead(Sender:TObject; var NeedSleep:Integer);
var
  plc, plcneedy, reg, regneedy, regini, usados, msbetween,minStime:Integer;
  somethingdone,firstreg:boolean;
  res:TProtocolIOResult;
  stable:TScanTable;
  tagrec:TTagRec;
  values:TArrayOfDouble;
begin
  if ([csDestroying]*ComponentState<>[]) then begin
    {$IFDEF FPC}
    ThreadSwitch;
    {$ELSE}
    SwitchToThread;
    {$ENDIF}
    exit;
  end;
  plcneedy:=0;
  regneedy:=0;
  somethingdone:=false;
  SetLength(values,1);
  firstreg:=true;
  try
    for plc := 0 to High(FWestDevices) do begin
      regini := 0;
      usados := 0;
      with FWestDevices[plc] do begin
        usados := ifthen((Length(Registers[0].ScanTimes)>0) and (MilliSecondsBetween(Now,Registers[0].Timestamp)>=Registers[0].MinScanTime),usados+1,usados);
        usados := ifthen((Length(Registers[1].ScanTimes)>0) and (MilliSecondsBetween(Now,Registers[1].Timestamp)>=Registers[1].MinScanTime),usados+1,usados);
        usados := ifthen((Length(Registers[2].ScanTimes)>0) and (MilliSecondsBetween(Now,Registers[2].Timestamp)>=Registers[2].MinScanTime),usados+1,usados);
        usados := ifthen((Length(Registers[3].ScanTimes)>0) and (MilliSecondsBetween(Now,Registers[3].Timestamp)>=Registers[3].MinScanTime),usados+1,usados);
      end;

      tagrec.Station:=FWestDevices[plc].Address;

      //if exist more than one register used, Read it using ScanTable
      //command to reduce the use of bandwidth...
      if usados>1 then begin
        res := ScanTable(FWestDevices[plc].Address,stable);
        if res = ioOk then begin
          AssignScanTableToReg(stable.SP,FWestDevices[plc].Registers[0]);
          AssignScanTableToReg(stable.PV,FWestDevices[plc].Registers[1]);
          AssignScanTableToReg(stable.Out1,FWestDevices[plc].Registers[2]);
          AssignScanTableToReg(stable.Status,FWestDevices[plc].Registers[3]);
        end else begin
          for reg := 0 to 3 do
            FWestDevices[plc].Registers[reg].LastReadResult:=res;
        end;
        regini:=4;
        somethingdone:=true;
      end;

      //le os
      for reg := regini to High(FWestDevices[plc].Registers) do
        with FWestDevices[plc].Registers[reg] do
          if Length(ScanTimes)>0 then begin
            msbetween:=MilliSecondsBetween(Now,Timestamp);
            if msbetween>=MinScanTime then begin
              tagrec.Address:=reg;
              DoRead(tagrec, values, false);
              somethingdone:=true;
            end else begin
              if firstreg then begin
                minStime:=msbetween;
                plcneedy:=plc;
                regneedy:=reg;
                firstreg:=false;
              end else begin
                if msbetween>minStime then begin
                  minStime:=msbetween;
                  plcneedy:=plc;
                  regneedy:=reg;
                end;
              end;
            end;
          end;
    end;

    if (not somethingdone) and PReadSomethingAlways and (High(FWestDevices)>=plcneedy) then begin
      tagrec.Station:=FWestDevices[plcneedy].Address;
      tagrec.Address:=regneedy;
      DoRead(tagrec, values, false);
    end else
      NeedSleep := 1;
  finally
    SetLength(values,0);
  end
end;

procedure TWestASCIIDriver.DoGetValue(TagRec:TTagRec; var values:TScanReadRec);
var
  plc:Integer;
begin
  if (tagrec.Station<1) or (tagrec.Station>99) then
    exit;

  if (tagrec.Address<$00) or (tagrec.Address>$1b) then
    exit;

  for plc:=0 to High(FWestDevices) do
    if FWestDevices[plc].Address=TagRec.Station then begin
      SetLength(values.Values,1);
      values.Values[0]:=FWestDevices[plc].Registers[TagRec.Address].Value;
      values.LastQueryResult:=FWestDevices[plc].Registers[TagRec.Address].LastReadResult;
      values.ValuesTimestamp:=FWestDevices[plc].Registers[TagRec.Address].Timestamp;
      break;
    end;
end;

function  TWestASCIIDriver.DoWrite(const tagrec:TTagRec; const Values:TArrayOfDouble; Sync:Boolean):TProtocolIOResult;
var
  plc:integer;
  dec:BYTE;
  foundplc:Boolean;
begin
  if (tagrec.Station<1) or (tagrec.Station>99) then begin
    Result := ioIllegalStationAddress;
    exit;
  end;

  if (tagrec.Address<$00) or (tagrec.Address>$1b) then begin
    Result := ioIllegalRegAddress;
    exit;
  end;

  if ParameterList[tagrec.Address].Decimal=255 then begin
    foundplc := false;
    for plc:=0 to High(FWestDevices) do
      if FWestDevices[plc].Address=tagrec.Station then begin
        foundplc:=true;
        dec := FWestDevices[plc].Registers[tagrec.Address].Decimal;
        break;
      end;
    if not foundplc then
      dec := 255;
  end else
    dec := ParameterList[tagrec.Address].Decimal;

  if Length(Values)>0 then
    Result := ModifyParameter(tagrec.Station,ParameterList[tagrec.Address].ParameterID,Values[0],dec)
  else
    Result := ioIllegalValue;

  if foundplc then begin
    with FWestDevices[plc].Registers[tagrec.Address] do begin
      if (Length(Values)>0) and (Result=ioOk) then begin
        Value:=Values[0];
        Timestamp:=Now;
      end;
      LastWriteResult:=Result;
    end;
  end;
end;

function  TWestASCIIDriver.DoRead (const tagrec:TTagRec; out   Values:TArrayOfDouble; Sync:Boolean):TProtocolIOResult;
var
  plc:integer;
  dec:Byte;
  foundplc:Boolean;
begin
  if (tagrec.Station<1) or (tagrec.Station>99) then begin
    Result := ioIllegalStationAddress;
    exit;
  end;

  if (tagrec.Address<$00) or (tagrec.Address>$1b) then begin
    Result := ioIllegalRegAddress;
    exit;
  end;

  foundplc := false;
  for plc:=0 to High(FWestDevices) do
    if FWestDevices[plc].Address=tagrec.Station then begin
      foundplc:=true;
      break;
    end;

  if Length(Values)>0 then
    Result := ParameterValue(tagrec.Station,ParameterList[tagrec.Address].ParameterID,Values[0],dec)
  else begin
    Result := ioDriverError;
  end;

  if foundplc then
    with FWestDevices[plc].Registers[tagrec.Address] do begin
      if (Length(Values)>0) and (Result=ioOk) then begin
        Value:=Values[0];
        Decimal := dec;
        Timestamp:=Now;
      end;
      LastReadResult:=Result;
    end;
end;

function TWestASCIIDriver.DeviceActive(DeviceID:TWestAddressRange):TProtocolIOResult;
var
  buffer, No:BYTES;
  pkg:TIOPacket;
begin
  try

    SetLength(buffer,6);
    SetLength(No,2);

    AddressToChar(DeviceID,No);

    buffer[0]:=$4C;
    buffer[1]:=No[0];
    buffer[2]:=No[1];
    buffer[3]:=$3F;
    buffer[4]:=$3F;
    buffer[5]:=$2A;

    if PCommPort=nil then begin
      Result := ioNullDriver;
      exit;
    end;

    if PCommPort.IOCommandSync(iocWriteRead, buffer, 6, 6, DriverID, 5, CommPortCallBack, false, nil, @pkg)=0 then begin
      Result:=ioDriverError;
      exit;
    end;

    Result := IOResultToProtocolResult(pkg.WriteIOResult);
    if Result <> ioOk then exit;
    Result := IOResultToProtocolResult(pkg.ReadIOResult);
    if Result <> ioOk then exit;

    SetLength(buffer,0);
    buffer := pkg.BufferToRead;

    if (buffer[0]=$4C) and (buffer[1]=No[0]) and (buffer[2]=No[1]) and (buffer[3]=$3F) and (buffer[4]=$41) and (buffer[5]=$2A) then begin
      result := ioOk;
      exit;
    end;

    if (buffer[0]=$4C) and (buffer[1]=No[1]) and (buffer[2]=$3F) and (buffer[3]=$41) and (buffer[4]=$2A) then begin
      result := ioOk;
      exit;
    end;

    Result := ioCommError;
  finally
    SetLength(pkg.BufferToRead,0);
    SetLength(pkg.BufferToWrite,0);
    SetLength(buffer,0);
    SetLength(No,0);
  end;
end;

procedure TWestASCIIDriver.AddressToChar(Addr:TWestAddressRange; var ret:BYTES);
var
   Dezenas, Unidades:BYTE;
begin
  if not Assigned(ret) then exit;

  //testa as condições q fariam esse procedimento falhar
  if ((Addr<1) or (Addr>99)) then
    raise Exception.Create(SoutOfBounds);

  Unidades := Addr mod 10;
  Dezenas  := (Addr-Unidades) div 10;

  ret[0] := (48 + Dezenas);
  ret[1] := (48 + Unidades);
end;

function TWestASCIIDriver.WestToDouble(const buffer:Array of byte; var Value:Double; var dec:Byte):TProtocolIOResult;
var
  a,b,c,d,r:BYTE;
  i, aux:Integer;
begin
  if ((buffer[0]=$3C) and (buffer[1]=$3F) and (buffer[2]=$3F) and (buffer[3]=$3E)) then begin
    Result := ioIllegalValue;
    exit;
  end;

  for i:=0 to 4 do begin
    aux := (buffer[i]-48);
    if ((aux<0) or (aux>9)) then begin
      Result := ioCommError;
      exit;
    end;
  end;

  a := buffer[0]-48; //ascii para decimal
  b := buffer[1]-48;
  c := buffer[2]-48;
  d := buffer[3]-48;
  r := buffer[4];

  case r of
    $30: begin
      Value  := (a*1000)+(b*100)+(c*10)+d;
      dec    := 0;
      Result := ioOk;
    end;
    $31: begin
      Value  := (a*100)+(b*10)+c+(d/10);
      dec    := 1;
      Result := ioOk;
    end;
    $32: begin
      Value  := (a*10)+b+(c/10)+(d/100);
      dec    := 2;
      Result := ioOk;
    end;
    $33: begin
      Value  := a+(b/10)+(c/100)+(d/1000);
      dec    := 3;
      Result := ioOk;
    end;
    $35: begin
      Value  := ((a*1000)+(b*100)+(c*10)+d)*(-1);
      dec    := 0;
      Result := ioOk;
    end;
    $36: begin
      Value  := ((a*100)+(b*10)+c+(d/10))*(-1);
      dec    := 1;
      Result := ioOk;
    end;
    $37: begin
      Value := ((a*10)+(b)+(c/10)+(d/100))*(-1);
      dec    := 2;
      Result := ioOk;
    end;
    $38: begin
      Value := (a+(b/10)+(c/100)+(d/1000))*(-1);
      dec    := 3;
      Result := ioOk;
    end;
    else
      Result := ioCommError;
  end;
end;

function  TWestASCIIDriver.WestToDouble(const buffer:Array of byte; var Value:Double):TProtocolIOResult;
var
  cd:BYTE;
begin
  Result :=  WestToDouble(buffer,Value,cd);
end;

function  TWestASCIIDriver.DoubleToWestAuto(var buffer:Array of Byte; const Value:Double):TProtocolIOResult;
var
   caso:BYTE;
   numaux:Extended;
   c:Integer;
   aux:String;
begin
  caso:=255;

  if (Value>=10000) or (Value<=-10000) then begin
    Result := ioIllegalValue;
    exit;
  end;

  caso:=IfThen((Value>=1000) and (Value<10000),$30,caso);
  caso:=IfThen((Value>=100) and (Value<1000),$31,caso);
  caso:=IfThen((Value>=10) and (Value<100),$32,caso);
  caso:=IfThen((Value>=0) and (Value<10),$33,caso);

  caso:=IfThen((Value<=-1000) and (Value>-10000),$35,caso);
  caso:=IfThen((Value<=-100) and (Value>-1000),$36,caso);
  caso:=IfThen((Value<=-10) and (Value>-100),$37,caso);
  caso:=IfThen((Value < 0) and (Value>-10),$38,caso);

  case caso of
    $30:
      numaux := Value;
    $31:
      numaux := Value*10;
    $32:
      numaux := Value*100;
    $33:
      numaux := Value*1000;
    $35:
      numaux := Value*(-1);
    $36:
      numaux := Value*(-10);
    $37:
      numaux := Value*(-100);
    $38:
      numaux := Value*(-1000);
    else begin
      Result := ioIllegalValue;
      exit;
    end;
  end;

   aux := FormatFloat('0000',Abs(numaux));

   for c:=0 to 3 do
      buffer[c] := StrToInt(aux[1+c])+48;

   buffer[4] := caso;
   Result := ioOk;
end;

function  TWestASCIIDriver.DoubleToWestManual(var buffer:Array of Byte; const Value:Double; const dec:BYTE):TProtocolIOResult;
var
   caso:BYTE;
   c:Integer;
   numaux:Double;
   aux:String;
begin
   caso:=255;

   if (Value>=10000) or (Value<=-10000) then begin
       Result := ioIllegalValue;
       exit;
   end;

   caso:=IfThen(((caso=255) and (dec<=0) and (Value<10000) and (Value>=0)), $30, caso);
   caso:=IfThen(((caso=255) and (dec<=1) and (Value<1000) and (Value>=0)), $31, caso);
   caso:=IfThen(((caso=255) and (dec<=2) and (Value<100) and (Value>=0)), $32, caso);
   caso:=IfThen(((caso=255) and (dec<=3) and (Value<10) and (Value>=0)), $33, caso);

   caso:=IfThen(((caso=255) and (dec<=0) and (Value>-10000) and (Value<0)), $35, caso);
   caso:=IfThen(((caso=255) and (dec<=1) and (Value>-1000) and (Value<0)), $36, caso);
   caso:=IfThen(((caso=255) and (dec<=2) and (Value>-100) and (Value<0)), $37, caso);
   caso:=IfThen(((caso=255) and (dec<=3) and (Value>-10) and (Value<0)), $38, caso);

   if (caso = 255) then begin
      Result := ioIllegalValue;
      exit;
   end;

   case caso of
      $30:
         numaux := Value;
      $31:
         numaux := (Value*10);
      $32:
         numaux := Value*100;
      $33:
         numaux := Value*1000;
      $35:
         numaux := Value*(-1);
      $36:
         numaux := Value*(-10);
      $37:
         numaux := Value*(-100);
      $38:
         numaux := Value*(-1000);
      else begin
         Result := ioIllegalValue;
         exit;
      end;
   end;

   aux := FormatFloat('0000',Abs(numaux));

   for c:=0 to 3 do
      buffer[c] := StrToInt(aux[1+c])+48;

   buffer[4] := caso;
   Result := ioOk;
end;

function  TWestASCIIDriver.ParameterValue(const DeviceID:TWestAddressRange;
                                          const Parameter:BYTE;
                                          var   Value:Double;
                                          var   dec:BYTE):TProtocolIOResult;
var
  buffer, No:BYTES;
  b1, b2:Boolean;
  pkg:TIOPacket;
begin
  try

    SetLength(buffer,11);
    SetLength(No,2);

    AddressToChar(DeviceID,No);

    buffer[0]:=$4C;
    buffer[1]:=No[0];
    buffer[2]:=No[1];
    buffer[3]:=Parameter;
    buffer[4]:=$3F;
    buffer[5]:=$2A;

    if PCommPort=nil then begin
      Result := ioNullDriver;
      exit;
    end;


    if PCommPort.IOCommandSync(iocWriteRead, buffer, 11, 6, DriverID, 5, CommPortCallBack, false, nil, @pkg)=0 then begin
      Result:=ioDriverError;
      exit;
    end;

    Result := IOResultToProtocolResult(pkg.WriteIOResult);
    if Result <> ioOk then exit;
    Result := IOResultToProtocolResult(pkg.ReadIOResult);
    if Result <> ioOk then exit;

    SetLength(buffer,0);
    buffer := pkg.BufferToRead;

    b1 := (buffer[0]=$4C) and (buffer[1]=No[0]) and (buffer[2]=No[1]) and (buffer[3]=Parameter) and (buffer[9]=$4E) and (buffer[10]=$2A);
    b2 := (buffer[0]=$4C) and (buffer[1]=No[1]) and (buffer[2]=Parameter) and (buffer[8]=$4E) and (buffer[9]=$2A);
    if (b1 or b2) then
      Result := ioIllegalFunction
    else begin
      b1 := (buffer[0]=$4C) and (buffer[1]=No[0]) and (buffer[2]=No[1]) and (buffer[3]=Parameter) and (buffer[9]=$41) and (buffer[10]=$2A);
      b2 := (buffer[0]=$4C) and (buffer[1]=No[1]) and (buffer[2]=Parameter) and (buffer[8]=$41) and (buffer[9]=$2A);
      if (b1 or b2) then begin

        b1 := (buffer[4]=$3C) and (buffer[5]=$3F) and (buffer[6]=$3F) and (buffer[7]=$3E);

        if b1 then
          Result := ioIllegalValue
        else begin
          Result := WestToDouble(buffer[4],Value,dec);
        end;
      end else
        Result := ioCommError;
    end;
  finally
    SetLength(pkg.BufferToRead,0);
    SetLength(pkg.BufferToWrite,0);
    SetLength(buffer,0);
    SetLength(No,0);
  end;
end;

function  TWestASCIIDriver.ModifyParameter(const DeviceID:TWestAddressRange; const Parameter:BYTE; const Value:Double; const dec:BYTE):TProtocolIOResult;
var
  buffer, respprog, No:BYTES;
  flag:Boolean;
  pkg:TIOPacket;
  i:Integer;
begin
  try

    flag := true;

    SetLength(No,2);
    SetLength(buffer,20);
    SetLength(respprog,12);

    AddressToChar(DeviceID,No);
    buffer[0] := $4C;
    buffer[1] := No[0];
    buffer[2] := No[1];
    buffer[3] := Parameter;
    buffer[4] := $23;
    if dec=255 then
      Result := DoubleToWestAuto(buffer[5],Value)
    else
      Result := DoubleToWestManual(buffer[5],Value,dec);

    if Result<>ioOk then exit;

    buffer[10] := $2A;

    respprog[0] := $4C;
    respprog[1] := No[0];
    respprog[2] := No[1];
    respprog[3] := Parameter;
    if dec=255 then
      Result := DoubleToWestAuto(respprog[4],Value)
    else
      Result := DoubleToWestManual(respprog[4],Value,dec);

    if Result<>ioOk then exit;

    respprog[9] := $49;
    respprog[10] := $2A;

    if PCommPort=nil then begin
      Result := ioNullDriver;
      exit;
    end;

    PCommPort.IOCommandSync(iocWriteRead, buffer, 11, 11, DriverID, 10, CommPortCallBack, false, nil, @pkg);

    Result := IOResultToProtocolResult(pkg.WriteIOResult);
    if Result <> ioOk then exit;
    Result := IOResultToProtocolResult(pkg.ReadIOResult);
    if Result <> ioOk then exit;

    for i:=0 to 10 do
      flag := flag and (respprog[i]=pkg.BufferToRead[i]);

    if (not flag) then begin
      Result := ioCommError;
      exit;
    end;

    SetLength(buffer,0);
    SetLength(buffer,12);

    SetLength(pkg.BufferToRead, 0);
    SetLength(pkg.BufferToWrite,0);

    buffer[0] := $4C;
    buffer[1] := No[0];
    buffer[2] := No[1];
    buffer[3] := Parameter;
    buffer[4] := $49;
    buffer[5] := $2A;

    PCommPort.IOCommandSync(iocWriteRead, buffer, 11, 6, DriverID, 10, CommPortCallBack, false, nil, @pkg);

    Result := IOResultToProtocolResult(pkg.WriteIOResult);
    if Result <> ioOk then exit;
    Result := IOResultToProtocolResult(pkg.ReadIOResult);
    if Result <> ioOk then exit;

    if ((pkg.BufferToRead[8]=$4E) or (pkg.BufferToRead[9]=$4E)) then begin
      Result := ioIllegalFunction;
      exit;
    end;
    Result := ioOk;
  finally
    SetLength(pkg.BufferToRead, 0);
    SetLength(pkg.BufferToWrite,0);
    SetLength(No,0);
    SetLength(buffer,0);
    SetLength(respprog,0);
  end;
end;

function  TWestASCIIDriver.ScanTable(DeviceID:TWestAddressRange; var ScanTableValues:TScanTable):TProtocolIOResult;
var
   buffer, No:BYTES;
   b1, b2:Boolean;
   pkg:TIOPacket;
   OffsetSpace, OffsetNo, OffsetSize, res:Integer;
begin
  try
    SetLength(buffer,35);
    SetLength(No,2);

    AddressToChar(DeviceID,No);

    buffer[0]:=$4C;
    buffer[1]:=No[0];
    buffer[2]:=No[1];
    buffer[3]:=$5D;
    buffer[4]:=$3F;
    buffer[5]:=$2A;

    if PCommPort=nil then begin
      Result := ioNullDriver;
      exit;
    end;

    PCommPort.Lock(DriverID);

    if PCommPort.IOCommandSync(iocWriteRead, buffer, 6, 6, DriverID, 10, CommPortCallBack, false, nil, @pkg)=0 then begin
      Result:=ioDriverError;
      exit;
    end;

    if [csDestroying]*ComponentState<>[] then begin
      Result := ioDriverError;
      exit;
    end;

    Result := IOResultToProtocolResult(pkg.WriteIOResult);
    if Result <> ioOk then exit;
    Result := IOResultToProtocolResult(pkg.ReadIOResult);
    if Result <> ioOk then exit;

    buffer := pkg.BufferToRead;

    b2 := (buffer[0]=$4C) and (buffer[1]=No[0]) and (buffer[2]=No[1]) and (buffer[3]=$5D) and (buffer[4]=$32);
    b1 := (buffer[0]=$4C) and (buffer[1]=No[1]) and (buffer[2]=$5D) and (buffer[3]=$32);

    if (b1=false) and (b2=false) then begin
      Result := ioCommError;
      exit;
    end;

    //se respondeu o endereco com um byte, incrementa offset da array.
    OffsetNo:=0;
    if b2 then
      OffsetNo:=1;

    case Chr(buffer[4+OffsetNo]) of
      '0': begin
        res := PCommPort.IOCommandSync(iocRead, buffer, 21+OffsetNo, 0, DriverID, 10, CommPortCallBack, false, nil, @pkg);
        OffsetSize := 0;
      end;
      '5': begin
        res := PCommPort.IOCommandSync(iocRead, buffer, 26+OffsetNo, 0, DriverID, 10, CommPortCallBack, false, nil, @pkg);
        OffsetSize := 5;
      end;
      else begin
        Result := ioCommError;
        exit;
      end;
    end;

    if res=0 then begin
      Result := ioDriverError;
      exit;
    end;

    if [csDestroying]*ComponentState<>[] then begin
      Result := ioDriverError;
      exit;
    end;

    PCommPort.Unlock(DriverID);

    Result := IOResultToProtocolResult(pkg.ReadIOResult);
    if Result <> ioOk then exit;

    if b2 and (pkg.BufferToRead[0]=$20) then
      OffsetSpace := 1
    else
      OffsetSpace := 0;

    buffer := pkg.BufferToRead;

    if ((buffer[20+OffsetSize+OffsetSpace]<>$41) or (buffer[21+OffsetSize+OffsetSpace]<>$2A)) then begin
      Result := ioCommError;
      exit;
    end;

    Result := WestToDouble(buffer[0+OffsetSpace], ScanTableValues.SP.Value, ScanTableValues.SP.Decimal);
    if (Result=ioCommError) then
      exit;
    ScanTableValues.SP.TimeStamp:=Now;
    ScanTableValues.SP.IOResult:=Result;

    Result := WestToDouble(buffer[5+OffsetSpace], ScanTableValues.PV.Value, ScanTableValues.PV.Decimal);
    if (Result=ioCommError) then
      exit;
    ScanTableValues.PV.TimeStamp:=Now;
    ScanTableValues.PV.IOResult:=Result;

    Result := WestToDouble(buffer[10+OffsetSpace], ScanTableValues.Out1.Value, ScanTableValues.Out1.Decimal);
    if (Result=ioCommError) then
      exit;
    ScanTableValues.Out1.TimeStamp:=Now;
    ScanTableValues.Out1.IOResult:=Result;

    if OffsetSize=0 then begin
      Result := WestToDouble(buffer[15+OffsetSpace], ScanTableValues.Status.Value, ScanTableValues.Status.Decimal);
      if (Result=ioCommError) then
        exit;
      ScanTableValues.Status.TimeStamp:=Now;
      ScanTableValues.Status.IOResult:=Result;
    end else begin
      Result := WestToDouble(buffer[15+OffsetSpace], ScanTableValues.Out2.Value, ScanTableValues.Out2.Decimal);
      if (Result=ioCommError) then
        exit;
      ScanTableValues.Out2.TimeStamp:=Now;
      ScanTableValues.Out2.IOResult:=Result;

      Result := WestToDouble(buffer[20+OffsetNo+OffsetSpace], ScanTableValues.Status.Value, ScanTableValues.Status.Decimal);
      if (Result=ioCommError) then
        exit;
      ScanTableValues.Status.TimeStamp:=Now;
      ScanTableValues.Status.IOResult:=Result;
    end;
    Result := ioOk;
  finally
    if PCommPort<>nil then
      if PCommPort.LockedBy=DriverID then
         PCommPort.Unlock(DriverID);
  end;
end;

procedure TWestASCIIDriver.MinScanTimeOfReg(var WestReg:TWestRegister);
var
  srate:integer;
begin
  if Length(WestReg.ScanTimes)>0 then begin
    WestReg.MinScanTime:=WestReg.ScanTimes[0].ScanTime;
    for srate := 1 to High(WestReg.ScanTimes) do
      WestReg.MinScanTime := Min(WestReg.MinScanTime, WestReg.ScanTimes[srate].ScanTime);
  end;
end;

function  TWestASCIIDriver.IOResultToProtocolResult(IORes:TIOResult):TProtocolIOResult;
begin
  case IORes of
    iorTimeOut:
      Result := ioTimeOut;
    iorOK:
      Result := ioOk;
    else
      Result := ioDriverError;
  end;
end;

procedure TWestASCIIDriver.AssignScanTableToReg(const stablereg:TScanTableReg; var WestReg:TWestRegister);
begin
  if stablereg.IOResult=ioOk then begin
    WestReg.Value:=stablereg.Value;
    WestReg.Timestamp:=stablereg.TimeStamp;
    WestReg.Decimal:=stablereg.Decimal;
  end;
  WestReg.LastReadResult:=stablereg.IOResult;
end;

function  TWestASCIIDriver.SizeOfTag(Tag: TTag; isWrite: Boolean; var ProtocolTagType: TProtocolTagType): BYTE;
begin
  // todos os registradores do west são de 32 bits (ponto flutuante);
  Result:=32;
end;

procedure TWestASCIIDriver.OpenTagEditor(OwnerOfNewTags: TComponent; InsertHook: TAddTagInEditorHook; CreateProc: TCreateTagProc);
var
  tplc:TPLCTagNumber;
  ctrl, variable:Integer;
  frm:TWestTagBuilder;
  sctrl,
  formatmask:String;
begin
  frm:=TWestTagBuilder.Create(nil);
  try
    if frm.ShowModal=mrOK then begin
      if frm.ZeroFill.Checked and (frm.AdrEnd.Value>9) then
        formatmask:='#00'
      else
        formatmask:='#0';

      for ctrl:=frm.AdrStart.Value to frm.AdrEnd.Value do begin
        sctrl:=FormatFloat(formatmask,ctrl);
        for variable:=0 to $1b do begin
          if frm.Variaveis[variable].Enabled.Checked then begin
            if Pos('%a',frm.Variaveis[variable].TagName.Text)=0 then begin
              frm.Variaveis[variable].TagName.Text := frm.Variaveis[variable].TagName.Text + '%a';
            end;
            tplc := TPLCTagNumber(CreateProc(TPLCTagNumber));
            tplc.Name:=StringReplace(frm.Variaveis[variable].TagName.Text,'%a',sctrl,[rfReplaceAll]);
            tplc.MemAddress := variable;
            tplc.PLCStation:=ctrl;
            tplc.RefreshTime:=frm.Variaveis[variable].Scan.Value;
            tplc.ProtocolDriver := Self;
            InsertHook(tplc);
          end;
        end;
      end;
    end;
  finally
    frm.Destroy;
  end;
end;

initialization

   //Cria a lista de Parametros Validos...
   //SetPoint
   ParameterList[$00].ParameterID := $53;
   ParameterList[$00].FunctionAllowed :=  0;
   ParameterList[$00].ReadOnly :=  false;
   ParameterList[$00].Decimal := 255;

   //PV
   ParameterList[$01].ParameterID := $4D; //ID do Parametro
   ParameterList[$01].FunctionAllowed :=  2 ; //Funcao q pode usar, 0 := todas as funcoes
   ParameterList[$01].ReadOnly :=  true ; //ReadOnly 1 := yes?
   ParameterList[$01].Decimal := 255; // casas decimais variaveis...

   //Power Output value
   ParameterList[$02].ParameterID := $57;
   ParameterList[$02].FunctionAllowed :=  0;
   ParameterList[$02].ReadOnly :=  false;
   ParameterList[$02].Decimal := 255;

   //Controller status
   ParameterList[$03].ParameterID := $4C;
   ParameterList[$03].FunctionAllowed :=  2;
   ParameterList[$03].ReadOnly :=  true;
   ParameterList[$03].Decimal := 0;

   //Scale Range Max
   ParameterList[$04].ParameterID := $47;
   ParameterList[$04].FunctionAllowed :=  0;
   ParameterList[$04].ReadOnly :=  false;
   ParameterList[$04].Decimal := 255;

   //Scale Range Min
   ParameterList[$05].ParameterID := $48;
   ParameterList[$05].FunctionAllowed :=  0;
   ParameterList[$05].ReadOnly :=  false;
   ParameterList[$05].Decimal := 255;

   //Scale Range Dec. Point
   ParameterList[$06].ParameterID := $51;
   ParameterList[$06].FunctionAllowed :=  0;
   ParameterList[$06].ReadOnly :=  false;
   ParameterList[$06].Decimal := 0;

   //Input filter time constant
   ParameterList[$07].ParameterID := $6D;
   ParameterList[$07].FunctionAllowed :=  0;
   ParameterList[$07].ReadOnly :=  false;
   ParameterList[$07].Decimal := 255;

   //Output 1 Power Limit
   ParameterList[$08].ParameterID := $42;
   ParameterList[$08].FunctionAllowed :=  0;
   ParameterList[$08].ReadOnly :=  false;
   ParameterList[$08].Decimal := 255;

   //Output 1 cycle time
   ParameterList[$09].ParameterID := $4E;
   ParameterList[$09].FunctionAllowed :=  0;
   ParameterList[$09].ReadOnly :=  false;
   ParameterList[$09].Decimal := 1;

   //Output 2 cycle time
   ParameterList[$0a].ParameterID := $4F;
   ParameterList[$0a].FunctionAllowed :=  0;
   ParameterList[$0a].ReadOnly :=  false;
   ParameterList[$0a].Decimal := 1;

   //Recorder output scale max
   ParameterList[$0b].ParameterID := $5B;
   ParameterList[$0b].FunctionAllowed :=  0;
   ParameterList[$0b].ReadOnly :=  false;
   ParameterList[$0b].Decimal := 255;

   //Recorder output scale min
   ParameterList[$0c].ParameterID := $5C;
   ParameterList[$0c].FunctionAllowed :=  0;
   ParameterList[$0c].ReadOnly :=  false;
   ParameterList[$0c].Decimal := 255;

   //SetPoint ramp rate
   ParameterList[$0d].ParameterID := $5E;
   ParameterList[$0d].FunctionAllowed :=  0;
   ParameterList[$0d].ReadOnly :=  false;
   ParameterList[$0d].Decimal := 255;

   //Setpoint high limit
   ParameterList[$0e].ParameterID := $41;
   ParameterList[$0e].FunctionAllowed :=  0;
   ParameterList[$0e].ReadOnly :=  false;
   ParameterList[$0e].Decimal := 255;

   //Setpoint low limit
   ParameterList[$0f].ParameterID := $54;
   ParameterList[$0f].FunctionAllowed :=  0;
   ParameterList[$0f].ReadOnly :=  false;
   ParameterList[$0f].Decimal := 255;

   //alarm 1 value
   ParameterList[$10].ParameterID := $43;
   ParameterList[$10].FunctionAllowed :=  0;
   ParameterList[$10].ReadOnly :=  false;
   ParameterList[$10].Decimal := 255;

   //alarm 2 value
   ParameterList[$11].ParameterID := $45;
   ParameterList[$11].FunctionAllowed :=  0;
   ParameterList[$11].ReadOnly :=  false;
   ParameterList[$11].Decimal := 255;

   //Rate (Derivative time constant)
   ParameterList[$12].ParameterID := $44;
   ParameterList[$12].FunctionAllowed :=  0;
   ParameterList[$12].ReadOnly :=  false;
   ParameterList[$12].Decimal := 2;

   //Reset (Integral time constant)
   ParameterList[$13].ParameterID := $49;
   ParameterList[$13].FunctionAllowed :=  0;
   ParameterList[$13].ReadOnly :=  false;
   ParameterList[$13].Decimal := 2;

   //Manual time reset (BIAS)
   ParameterList[$14].ParameterID := $4A;
   ParameterList[$14].FunctionAllowed :=  0;
   ParameterList[$14].ReadOnly :=  false;
   ParameterList[$14].Decimal := 255;

   //ON/OFF diferential
   ParameterList[$15].ParameterID := $46;
   ParameterList[$15].FunctionAllowed :=  0;
   ParameterList[$15].ReadOnly :=  false;
   ParameterList[$15].Decimal := 1;

   //Overlap/Deadband
   ParameterList[$16].ParameterID := $4B;
   ParameterList[$16].FunctionAllowed :=  0;
   ParameterList[$16].ReadOnly :=  false;
   ParameterList[$16].Decimal := 0;

   //Proportional band 1 value
   ParameterList[$17].ParameterID := $50;
   ParameterList[$17].FunctionAllowed :=  0;
   ParameterList[$17].ReadOnly :=  false;
   ParameterList[$17].Decimal := 1;

   //Proportional band 2 value
   ParameterList[$18].ParameterID := $55;
   ParameterList[$18].FunctionAllowed :=  0;
   ParameterList[$18].ReadOnly :=  false;
   ParameterList[$18].Decimal := 1;

   //PV Offset
   ParameterList[$19].ParameterID := $76;
   ParameterList[$19].FunctionAllowed :=  0 ; //todas as funcoes podem realizar operacoes com esse parametro
   ParameterList[$19].ReadOnly :=  false ;
   ParameterList[$19].Decimal := 255;

   //Arithmetic deviation
   ParameterList[$1a].ParameterID := $56;
   ParameterList[$1a].FunctionAllowed :=  2;
   ParameterList[$1a].ReadOnly :=  true;
   ParameterList[$1a].Decimal := 255;

   //Arithmetic deviation
   ParameterList[$1b].ParameterID := $5A;
   ParameterList[$1b].FunctionAllowed :=  3;
   ParameterList[$1b].ReadOnly :=  false;
   ParameterList[$1b].Decimal := 0;
end.
