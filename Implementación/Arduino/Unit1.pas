unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, CPortCtl, ExtCtrls, Buttons, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels,
  dxSkinsForm, jpeg, cxGraphics, cxControls, cxLookAndFeelPainters, cxContainer,
  cxEdit, cxLabel;

type
  TForm1 = class(TForm)
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    Timer1: TTimer;
    dxSkinController1: TdxSkinController;
    Image1: TImage;
    BitBtn1: TBitBtn;
    label1: TcxLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mensaje: string;



implementation

{$R *.dfm}


procedure Split
   (const Delimiter: Char;
    Input: string;
    const Strings: TStrings) ;
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;



procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    Comport1.ShowSetupDialog();
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: string);
var ipos,i:integer;
msg:string;
valor: integer;
begin
  try
     ipos:=0;
     msg:='';

     for i :=3 to length(str) do
     begin
       if str[i]='.' then
       begin
          ipos:= i-2;
          if ipos+5<=length(str) then
          begin
            msg := Copy(str,ipos,5);
            valor:= StrToInt(msg[1]+msg[2]);
            if (valor>0) and (valor<100) then
              mensaje:= msg;
              exit;
          end;
       end;
     end;


  finally

  end;

end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    ComPort1.Connected := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
var x: textfile;
    com: string;
begin
    assignfile(x,ExtractFilePath(Application.exename)+'\Arduino.ini');
    reset(x);
    readln(x,com);
    closefile(x);

    ComPort1.Port:= com;
    ComPort1.Connected := true;
    Timer1.Enabled:= true;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i, ini, fin: integer;
  A: TStringList;

begin
      Label1.Caption := mensaje + ' ºC';
end;

end.
