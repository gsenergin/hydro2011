unit UI_AgregarUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinMcSkin, StdCtrls, cxMaskEdit,
  cxDropDownEdit, Buttons, cxLabel, cxTextEdit;

type
  Tfrm_ABMUsuarios = class(TForm)
    txt_NombreUsuario: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxLabel1: TcxLabel;
    btnAgregar: TBitBtn;
    btnCancelar: TBitBtn;
    txt_ClaveInicial: TcxTextEdit;
    cxLabel3: TcxLabel;
    cmb_TipoUsuario: TcxComboBox;
    cmb_IDTipoUsuario: TComboBox;
    procedure btnAgregarClick(Sender: TObject);
    procedure txt_NombreUsuarioPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ABMUsuarios: Tfrm_ABMUsuarios;

implementation

{$R *.dfm}

procedure Tfrm_ABMUsuarios.btnAgregarClick(Sender: TObject);
begin
    cmb_IDTipoUsuario.ItemIndex:= cmb_TipoUsuario.ItemIndex;
end;

procedure Tfrm_ABMUsuarios.txt_NombreUsuarioPropertiesChange(Sender: TObject);
begin
        txt_ClaveInicial.Text:= txt_NombreUsuario.Text;
end;

end.


(*
    try
//      msinfo(inttostr(DM_AccesoDatos.ADOTable_TipoUsuario.FieldByName('ID_TipoUsuario').AsInteger),'TipoUsuarioSelecc');
      if not DM_AccesoDatos.SF_Usuario_Existente(nombre_usuario) then
        DM_AccesoDatos.SP_Usuario_Insert(nombre_usuario, DM_AccesoDatos.ADOTable_TipoUsuario.FieldByName('ID_TipoUsuario').AsInteger)
      else
        msinfo('Error: El nombre de usuario que ingresó ya existe','Hydro Desktop');
    except
      msinfo('Error al agregar el usuario','Hydro Desktop');
    end;
*)