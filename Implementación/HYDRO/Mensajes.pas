unit Mensajes;

interface
uses forms, windows;

procedure msError (mensaje, titulo : String);
procedure msInfo (mensaje, titulo : String);
function msSiNo (mensaje, titulo : String) : boolean;
function msSiNon (mensaje, titulo : String) : boolean;
function msOKCancel (mensaje, titulo : String) : boolean;
function msOKCancelc (mensaje, titulo : String) : boolean;
procedure msAtencion (mensaje, titulo : String);

implementation

//mensaje de error, con el botón "Aceptar"
procedure msError (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),
      pchar(titulo), (MB_OK + MB_ICONSTOP));
end;

//mensaje de información, con el botón "Aceptar"
procedure msInfo (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),
      pchar(titulo), (MB_OK + MB_ICONINFORMATION));
end;

//mensaje de confirmación, con los botones Sí/No, devuelve True si se pulsa "Sí"
//el botón por defecto será "Sí"
function msSiNo (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),
      pchar(titulo), (MB_YESNO + MB_ICONQUESTION)) = IDYES then
    result := true
  else
    result := false;
end;

//mensaje de confirmación, con los botones Sí/No, devuelve True si se pulsa "Sí"
//el botón por defecto será "No"
function msSiNon (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),
      pchar(titulo), (MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION)) = IDYES then
    result := true
  else
    result := false;
end;


//mensaje de exclamación, con los botones Aceptar/Cancelar, devuelve True si se pulsa "Aceptar"
//el botón por defecto será "Aceptar"
function msOKCancel (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),
      pchar(titulo), (MB_OKCANCEL + MB_ICONWARNING)) = IDOK then
    result := true
  else
    result := false;
end;

//mensaje de exclamación, con los botones Aceptar/Cancelar, devuelve True si se pulsa "Aceptar"
//el botón por defecto será "Cancelar"
function msOKCancelc (mensaje, titulo : String) : boolean;
begin
  if application.MessageBox (pchar(mensaje),
      pchar(titulo), (MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONWARNING)) = IDOK then
    result := true
  else
    result := false;
end;

//mensaje de exclamación, con el botón Aceptar
procedure msAtencion (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),
      pchar(titulo), (MB_OK + MB_ICONWARNING));
end;


end.
