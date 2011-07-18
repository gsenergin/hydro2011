unit UI_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  dxSkinMcSkin, dxSkinscxPCPainter, cxPC, cxControls, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Menus, cxTextEdit, dxSkinsForm,
  cxButtons, cxLabel, dxGDIPlusClasses, dxSkinsCore, ScktComp,
  HMIControlDislocatorAnimation, CommPort, tcp_udpport, ProtocolDriver,
  ModBusDriver, ModBusTCP, PLCNumber, PLCBlockElement, Tag, PLCTag, TagBlock,
  PLCBlock, HMILabel, HMIText;

type
  Tfrm_Principal = class(TForm)
    panel_Alertas: TPanel;
    PageControl: TcxPageControl;
    tab_Control: TcxTabSheet;
    tab_Historicos: TcxTabSheet;
    tab_Reportes: TcxTabSheet;
    tab_Simulacion: TcxTabSheet;
    tab_Configuracion: TcxTabSheet;
    panel_Usuario: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxButton5: TcxButton;
    dxSkinController1: TdxSkinController;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    lblUsuario: TcxLabel;
    lblTipoUsuario: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    SG_Alertas: TStringGrid;
    cxLabel8: TcxLabel;
    SG_Historicos: TStringGrid;
    btnHistorico: TcxButton;
    cxLabel19: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    cxLabel9: TcxLabel;
    img_GolpeAriete: TImage;
    btnSimular: TcxButton;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxTextEdit5: TcxTextEdit;
    cxTextEdit6: TcxTextEdit;
    cxTextEdit7: TcxTextEdit;
    cxTextEdit8: TcxTextEdit;
    cxTextEdit9: TcxTextEdit;
    Image1: TImage;
    cxLabel11: TcxLabel;
    cxLabel13: TcxLabel;
    btnCompuertaDesvioAbierta: TcxButton;
    cxLabel14: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel29: TcxLabel;
    cxLabel32: TcxLabel;
    cxLabel34: TcxLabel;
    UpDown1: TUpDown;
    cxLabel37: TcxLabel;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    cxLabel41: TcxLabel;
    cxLabel44: TcxLabel;
    cxLabel45: TcxLabel;
    cxLabel46: TcxLabel;
    cxLabel48: TcxLabel;
    cxLabel50: TcxLabel;
    cxLabel52: TcxLabel;
    btnCompuertaDesvioCerrada: TcxButton;
    btnCompuertaIngresoCerrada: TcxButton;
    btnCompuertaIngresoAbierta: TcxButton;
    cxLabel53: TcxLabel;
    cxLabel54: TcxLabel;
    cxLabel55: TcxLabel;
    cxLabel56: TcxLabel;
    cxLabel57: TcxLabel;
    cxButton14: TcxButton;
    cxButton15: TcxButton;
    cxButton16: TcxButton;
    cxButton17: TcxButton;
    cxButton18: TcxButton;
    cxButton19: TcxButton;
    cxButton20: TcxButton;
    cxButton21: TcxButton;
    cxLabel58: TcxLabel;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cxButton9: TcxButton;
    cxButton10: TcxButton;
    cxLabel59: TcxLabel;
    cxButton6: TcxButton;
    cxButton11: TcxButton;
    cxLabel43: TcxLabel;
    cxLabel60: TcxLabel;
    cxButton22: TcxButton;
    cxButton23: TcxButton;
    SG_Configuracion: TStringGrid;
    cxButton1: TcxButton;
    SocketSuscripcion: TClientSocket;
    cxTabSheet1: TcxTabSheet;
    PLCBlock_RTU2: TPLCBlock;
    RTU2_ST10001: TPLCBlockElement;
    RTU2_ST10002: TPLCBlockElement;
    RTU2_AT10003: TPLCBlockElement;
    RTU2_AT10004: TPLCBlockElement;
    RTU2_ST10005: TPLCBlockElement;
    RTU2_AT10006: TPLCBlockElement;
    RTU2_AT10007: TPLCBlockElement;
    RTU2_ST10008: TPLCBlockElement;
    RTU2_ST10009: TPLCBlockElement;
    RTU2_ST10010: TPLCBlockElement;
    RTU2_AT10011: TPLCBlockElement;
    RTU2_ST10012: TPLCBlockElement;
    RTU2_ST10013: TPLCBlockElement;
    RTU2_ST10014: TPLCBlockElement;
    RTU2_AT10015: TPLCBlockElement;
    RTU2_AT10016: TPLCBlockElement;
    RTU2_AT10017: TPLCBlockElement;
    RTU2_AT10018: TPLCBlockElement;
    RTU2_AT10019: TPLCBlockElement;
    RTU2_ST10020: TPLCBlockElement;
    RTU2_ST10021: TPLCBlockElement;
    PLCBlock_RTU3: TPLCBlock;
    RTU3_ASA0002: TPLCBlockElement;
    RTU3_SSA0001: TPLCBlockElement;
    PLCBlock_RTU1: TPLCBlock;
    RTU1_SCC0001: TPLCBlockElement;
    RTU1_SCC0002: TPLCBlockElement;
    RTU1_ACC0003: TPLCBlockElement;
    RTU1_ACC0004: TPLCBlockElement;
    RTU1_SCC0005: TPLCBlockElement;
    ModBusTCPDriver1: TModBusTCPDriver;
    TCP_UDPPort1: TTCP_UDPPort;
    HMILabel2: THMILabel;
    HMILabel3: THMILabel;
    HMILabel4: THMILabel;
    HMILabel5: THMILabel;
    HMILabel6: THMILabel;
    HMILabel27: THMILabel;
    HMILabel28: THMILabel;
    HMILabel1: THMILabel;
    HMILabel7: THMILabel;
    HMILabel10: THMILabel;
    HMILabel13: THMILabel;
    HMILabel14: THMILabel;
    HMILabel15: THMILabel;
    HMILabel8: THMILabel;
    HMILabel9: THMILabel;
    HMILabel11: THMILabel;
    HMILabel12: THMILabel;
    cxLabel10: TcxLabel;
    cxLabel12: TcxLabel;
    HMILabel16: THMILabel;
    HMILabel17: THMILabel;
    HMILabel18: THMILabel;
    HMILabel19: THMILabel;
    HMILabel20: THMILabel;
    HMILabel21: THMILabel;
    HMILabel22: THMILabel;
    HMILabel23: THMILabel;
    HMILabel24: THMILabel;
    HMILabel25: THMILabel;
    HMILabel26: THMILabel;
    cxLabel15: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RTU1_ACC0003ValueChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

{$R *.dfm}



procedure Tfrm_Principal.Button1Click(Sender: TObject);
begin
    TCP_UDPPort1.Active:= true;
end;



procedure Tfrm_Principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    SocketSuscripcion.Socket.SendText('BAJA');
end;

procedure Tfrm_Principal.FormCreate(Sender: TObject);
begin
    // Activo el Socket
    TCP_UDPPort1.Active:= true;
//    SocketSuscripcion.Active:= false;
//    SocketSuscripcion.Host:= '127.0.0.1';
//    SocketSuscripcion.Port:= 9000;
 //   SocketSuscripcion.Active:= true;


    // StringGrid Alertas
    SG_Alertas.Cells[1,0]:= 'Fecha';
    SG_Alertas.Cells[2,0]:= 'Hora';
    SG_Alertas.Cells[3,0]:= 'Evento';
    SG_Alertas.Cells[4,0]:= 'RTU';
    SG_Alertas.Cells[5,0]:= 'Elemento';
    SG_Alertas.Cells[6,0]:= 'Valor';

    // StringGrid Historticos
    SG_Historicos.Cells[1,0]:= 'RTU';
    SG_Historicos.Cells[2,0]:= 'Nombre';
    SG_Historicos.Cells[3,0]:= 'Tipo';
    SG_Historicos.Cells[4,0]:= 'Detalle';

      SG_Historicos.Cells[1,1]:= '1';
      SG_Historicos.Cells[2,1]:= 'SCC0001';
      SG_Historicos.Cells[3,1]:= 'Sensor';
      SG_Historicos.Cells[4,1]:= 'Caudal de Entrada';

      SG_Historicos.Cells[1,2]:= '1';
      SG_Historicos.Cells[2,2]:= 'SCC0002';
      SG_Historicos.Cells[3,2]:= 'Sensor';
      SG_Historicos.Cells[4,2]:= 'Nivel Desborde en Cámara de carga ';

      SG_Historicos.Cells[1,3]:= '1';
      SG_Historicos.Cells[2,3]:= 'ACC0003';
      SG_Historicos.Cells[3,3]:= 'Actuador';
      SG_Historicos.Cells[4,3]:= 'Compuerta de Desvio de Agua';

      SG_Historicos.Cells[1,4]:= '...';
      SG_Historicos.Cells[2,4]:= '...';
      SG_Historicos.Cells[3,4]:= '...';
      SG_Historicos.Cells[4,4]:= '...';

    // StringGrid Configuracion
    SG_Configuracion.Cells[1,0]:='RTU';
    SG_Configuracion.Cells[2,0]:='Nombre';
    SG_Configuracion.Cells[3,0]:='Detalle';
    SG_Configuracion.Cells[4,0]:='U. Medida';
    SG_Configuracion.Cells[5,0]:='LL';
    SG_Configuracion.Cells[6,0]:='L';
    SG_Configuracion.Cells[7,0]:='H';
    SG_Configuracion.Cells[8,0]:='HH';

      SG_Configuracion.Cells[1,1]:='1';
      SG_Configuracion.Cells[2,1]:='SCC0001';
      SG_Configuracion.Cells[3,1]:='Caudal de Entrada';
      SG_Configuracion.Cells[4,1]:='m^3 / s';
      SG_Configuracion.Cells[5,1]:='10';
      SG_Configuracion.Cells[6,1]:='25';
      SG_Configuracion.Cells[7,1]:='55';
      SG_Configuracion.Cells[8,1]:='70';

      SG_Configuracion.Cells[1,2]:='1';
      SG_Configuracion.Cells[2,2]:='SCC0002';
      SG_Configuracion.Cells[3,2]:='Nivel Desborde en Cámara de carga';
      SG_Configuracion.Cells[4,2]:='cm';
      SG_Configuracion.Cells[5,2]:='-4';
      SG_Configuracion.Cells[6,2]:='-2';
      SG_Configuracion.Cells[7,2]:='-0.05';
      SG_Configuracion.Cells[8,2]:='0';

      SG_Configuracion.Cells[1,3]:='1';
      SG_Configuracion.Cells[2,3]:='SCC0005';
      SG_Configuracion.Cells[3,3]:='Presión Tubería Forzada';
      SG_Configuracion.Cells[4,3]:='bar';
      SG_Configuracion.Cells[5,3]:='3';
      SG_Configuracion.Cells[6,3]:='5';
      SG_Configuracion.Cells[7,3]:='12';
      SG_Configuracion.Cells[8,3]:='15';

      SG_Configuracion.Cells[1,4]:='...';
      SG_Configuracion.Cells[2,4]:='...';
      SG_Configuracion.Cells[3,4]:='...';
      SG_Configuracion.Cells[4,4]:='...';
      SG_Configuracion.Cells[5,4]:='...';
      SG_Configuracion.Cells[6,4]:='...';
      SG_Configuracion.Cells[7,4]:='...';
      SG_Configuracion.Cells[8,4]:='...';


    // Me suscribo a la distribución de información del control automatico



end;


// Cambio en La compuerta de Desvio
procedure Tfrm_Principal.RTU1_ACC0003ValueChange(Sender: TObject);
begin
    if trunc(RTU1_ACC0003.Value)=1 then
        btnCompuertaDesvioAbierta.SetFocus
    else
        btnCompuertaDesvioCerrada.SetFocus;

end;


end.
