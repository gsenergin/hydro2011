unit UI_Grafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Buttons;

type
  Tfrm_Grafico = class(TForm)
    Panel1: TPanel;
    Chart_HistoricoSensado: TChart;
    Series2: TLineSeries;
    Label2: TLabel;
    Label1: TLabel;
    lblNomenclatura: TLabel;
    lblDescripcion: TLabel;
    bitbtn_Imprimir: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Grafico: Tfrm_Grafico;

implementation

{$R *.dfm}

end.
