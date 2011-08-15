unit Log;

interface
uses StdCtrls, // Unidad para los TMemo
      SysUtils;

type TLog = Class(TObject) // SINGLETON
  private
      flog: TMemo;
      fenableLog: boolean;            
  public

      class function NewInstance: TObject; override;
      procedure FreeInstance; override;
      class function RefCount: Integer;

      procedure LogEnable(var MemoLog:Tmemo);  overload;
      procedure LogEnable();  overload;
      procedure LogDisable();
      procedure LogWrite(mensaje: string);
End;

var
    Instance  : TLog  = nil;
    Ref_Count : Integer     = 0;


implementation

procedure TLog.FreeInstance;
begin
  Dec( Ref_Count );
  if ( Ref_Count = 0 ) then
  begin
    Instance := nil;
    // Destroy private variables here
    inherited FreeInstance;
  end;
end;
 
class function TLog.NewInstance: TObject;
begin
  if ( not Assigned( Instance ) ) then
  begin
    Instance := (inherited NewInstance) as TLog;
    // Initialize private variables here, like this:
    // TSingleton(Result).Variable := Value;
    TLog(Result).fenableLog:= false;
    
  end;
  Result := Instance;
  Inc( Ref_Count );
end;
 
class function TLog.RefCount: Integer;
begin
  Result := Ref_Count;
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


end.

