unit Log;

interface
uses StdCtrls, // Unidad para los TMemo
  SysUtils;

type TLog = Class(TObject)
  private
      flog: TMemo;
      fenableLog: boolean;
  public
      constructor Create;
      destructor Destroy; override;

      function getLog(): TLog;
      procedure LogEnable(var MemoLog:Tmemo);  overload;
      procedure LogEnable();  overload;
      procedure LogDisable();
      procedure LogWrite(mensaje: string);
End;

var   Log_Singleton: TLog;


implementation

constructor TLog.Create;
begin
    if Log_Singleton <> nil then
      exit
    else
       Log_Singleton := Self;
end;

destructor TLog.Destroy;
begin
    if Log_Singleton = Self then
        Log_Singleton := nil;
    inherited Destroy;
end;

function TLog.getLog: TLog;
begin
     if Log_Singleton <> nil then
        result := Log_Singleton
     else
        result:= TLog.Create();
end;

procedure FreeGlobalObjects; far;
begin
    if Log_Singleton <> nil then
       Log_Singleton.Free;
end;



procedure TLog.LogDisable;
begin
     fenableLog:= false;
end;

procedure TLog.LogEnable;
begin
    if fLog<>nil  then
       fenableLog:= true;
end;

procedure TLog.LogEnable(var MemoLog: Tmemo);
begin
     flog:= MemoLog;
     fenableLog:= true;
end;

procedure TLog.LogWrite(mensaje: string);
begin
    // Escribe en el log si esta habilitado el logueo
    if fenableLog then
      flog.lines.Add(mensaje);
end;





begin

  AddExitProc(FreeGlobalObjects);

end.

