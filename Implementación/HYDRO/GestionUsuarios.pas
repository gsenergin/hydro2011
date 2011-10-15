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
procedure GestionUsuarios_AgregarUsuario(current_user:string);

implementation

(* GestionUsuarios_CambiarClave= Cambia la clave de logueo para un usuario *)
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

                  // Escribo en la bitácora lo que hace el usuario
                  DM_AccesoDatos.SP_Bitacora_Insertar(nombre_usuario,'Cambio de clave');
             end;
        end
        else
            msError('Error: Las Nuevas Claves no coinciden');
    end
    else msError('Error: La clave anterior no es correcta');
end;

(* GestionUsuarios_ResetearPassword= Restaura la clave de un usuario al mismo
nombre que el de su login, en caso que la haya perdido. Solo habilitada para el
administrador del sistema *)
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

(* GestionUsuarios_EliminarUsuario= Elimina un usuario. Solo habilitado para el
administrador del sistema *)
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

(* GestionUsuarios_RestaurarUsuario= Restaura un usuario previamente eliminado.
Solo habilitado para el administrador del sistema *)
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

(* GestionUsuarios_AgregarUsuario= Agrega un usuario, con clave por defecto
igual a su nombre. Solo habilitado para el administrador del sistema *)
procedure GestionUsuarios_AgregarUsuario(current_user:string);
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
    frm_AgregarUsuario.cmb_IDTipoUsuario.ItemIndex:= 0;
    frm_AgregarUsuario.cmb_TipoUsuario.ItemIndex:= 0;
    
    frm_AgregarUsuario.ShowModal;

    if frm_AgregarUsuario.ModalResult = mrYes then
    begin
         nombre_usuario:= frm_AgregarUsuario.txt_NombreUsuario.Text;
         IDTipoUsuario:= strtoint(frm_AgregarUsuario.cmb_IDTipoUsuario.Text);
          try
            if not DM_AccesoDatos.AQ_Usuario_Existente(nombre_usuario) then
            begin
              DM_AccesoDatos.SP_Usuario_Insert(nombre_usuario, IDTipoUsuario);

              // Escribo en la bitácora lo que hace el usuario
              DM_AccesoDatos.SP_Bitacora_Insertar(current_user,'Creado usuario <'+nombre_usuario+'>, Tipo <'
                  +frm_AgregarUsuario.cmb_TipoUsuario.text+'>');

            end
            else
              msinfo('Error: El nombre de usuario que ingresó ya existe');
          except
            mserror('Error al agregar el usuario');
          end;
    end;
end;



end.
