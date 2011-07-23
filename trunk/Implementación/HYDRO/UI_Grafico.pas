unit UI_Grafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Buttons;

type
  Tfrm_Grafico = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    lblNomenclatura: TLabel;
    lblDescripcion: TLabel;
    bitbtn_Imprimir: TBitBtn;
    Chart_HistoricoSensado: TChart;
    Series1: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure bitbtn_ImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Grafico: Tfrm_Grafico;

implementation

{$R *.dfm}

procedure Tfrm_Grafico.bitbtn_ImprimirClick(Sender: TObject);
begin
    Chart_HistoricoSensado.PrintLandscape;
end;

procedure Tfrm_Grafico.FormCreate(Sender: TObject);
begin
    Chart_HistoricoSensado.Visible:= true;
end;

end.
