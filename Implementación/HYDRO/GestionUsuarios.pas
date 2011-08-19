unit GestionUsuarios;

interface
uses Controls, Sysutils,
     Mensajes,
     AccesoDatos,
     UI_AgregarUsuario;

procedure GestionUsuarios_CambiarClave(nombre_usuario, claveLogin, claveAnterior,ClaveNueva,ClaveNueva2:string);
procedure GestionUsuarios_ResetearPassword(nombre_usuario:string);
procedure GestionUsuarios_EliminarUsuario(nombre_usuario:string);
procedure GestionUsuarios_RestaurarUsuario(nombre_usuario:string);
procedure GestionUsuarios_AgregarUsuario();

implementation


procedure GestionUsuarios_CambiarClave(nombre_usuario, claveLogin, claveAnterior,ClaveNueva,ClaveNueva2:string);
begin
    if claveAnterior=claveLogin then
    begin
        if claveNueva=claveNueva2 then
        begin
             if Length(claveNueva)<8 then
             begin
                 msError('Error: La clave debe tener al menos 8 caracteres');
             end
             else
             begin
                  DM_AccesoDatos.SP_Usuario_RestorePassword(nombre_usuario, claveNueva);
                  msInfo('¡Clave cambiada con éxito!');
             end;
        end
        else
            msError('Error: Las Nuevas Claves no coinciden');
    end
    else msError('Error: La clave anterior no es correcta');
end;


procedure GestionUsuarios_ResetearPassword(nombre_usuario:string);
begin
    try
      if nombre_usuario='' then
        nombre_usuario:= DM_AccesoDatos.ADOTable_Usuario.FieldByName('user').AsString;
      DM_AccesoDatos.SP_Usuario_RestorePassword(nombre_usuario, nombre_usuario);
    except
      msError('Error al Resetear la Clave');
      exit;
    end;
    msInfo('Clave de <'+nombre_usuario+'> Reseteada con éxito a <'+nombre_usuario+'>');
end;


procedure GestionUsuarios_EliminarUsuario(nombre_usuario:string);
begin
    try
      if nombre_usuario='' then
        nombre_usuario:= DM_AccesoDatos.ADOTable_Usuario.FieldByName('user').AsString;
      DM_AccesoDatos.SP_Usuario_Delete(nombre_usuario);
    except
      msError('Error al Eliminar al usuario');
      exit;
    end;
    msInfo('Usuario <'+nombre_usuario+'> eliminado exitosamente');
end;


procedure GestionUsuarios_RestaurarUsuario(nombre_usuario:string);
begin
    if nombre_usuario<>'' then    
    try
      DM_AccesoDatos.SP_Usuario_Restaurar(nombre_usuario);
      msinfo('Usuario <'+nombre_usuario+'> restaurado con éxito');
    except
      mserror('Error al restaurar al usuario <'+nombre_usuario+'>');
    end;
end;

procedure GestionUsuarios_AgregarUsuario();
var nombre_usuario:string;
    IDTipoUsuario: integer;
    frm_AgregarUsuario: Tfrm_ABMUsuarios;
begin
    frm_AgregarUsuario:= Tfrm_ABMUsuarios.Create(nil);
    frm_AgregarUsuario.cmb_TipoUsuario.Clear;
    frm_AgregarUsuario.cmb_IDTipoUsuario.Clear;

    DM_AccesoDatos.ADOTable_TipoUsuario.First;

    while not DM_AccesoDatos.ADOTable_TipoUsuario.Eof do
      with DM_AccesoDatos.ADOTable_TipoUsuario do
      begin

        frm_AgregarUsuario.cmb_TipoUsuario.Properties.Items.Add(FieldByName('Descripcion').AsString);
        frm_AgregarUsuario.cmb_IDTipoUsuario.Items.Add(FieldByName('ID_TipoUsuario').AsString);
        Next;
      end;

    frm_AgregarUsuario.ShowModal;

    if frm_AgregarUsuario.ModalResult = mrYes then
    begin
         nombre_usuario:= frm_AgregarUsuario.txt_NombreUsuario.Text;
         IDTipoUsuario:= strtoint(frm_AgregarUsuario.cmb_IDTipoUsuario.Text);
          try
            if not DM_AccesoDatos.AQ_Usuario_Existente(nombre_usuario) then
              DM_AccesoDatos.SP_Usuario_Insert(nombre_usuario, IDTipoUsuario)
            else
              msinfo('Error: El nombre de usuario que ingresó ya existe');
          except
            mserror('Error al agregar el usuario');
          end;
    end;
end;



end.
