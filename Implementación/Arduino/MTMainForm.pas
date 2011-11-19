unit MTMainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CPort, StdCtrls, CPortCtl, ExtCtrls, Menus,IniFiles, dxSkinsCore,
  dxSkinMcSkin, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxLabel, Buttons, dxSkinsForm, jpeg;

type
  TMainForm = class(TForm)
    ComTerminal: TComTerminal;
    ComPort: TComPort;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Image1: TImage;
    dxSkinController1: TdxSkinController;
    ComDataPacket1: TComDataPacket;
    BitBtn1: TBitBtn;
    Timer1: TTimer;
    cxLabel1: TcxLabel;
    Label1: TLabel;
    TerminalReady: TComLed;
    ComLed1: TComLed;
    ConnButton: TButton;
    PortButton: TButton;
    TermButton: TButton;
    FontButton: TButton;
    ComLed2: TComLed;
    ComLed3: TComLed;
    procedure ConnButtonClick(Sender: TObject);
    procedure ComPortAfterOpen(Sender: TObject);
    procedure ComPortAfterClose(Sender: TObject);
    procedure PortButtonClick(Sender: TObject);
    procedure TermButtonClick(Sender: TObject);
    procedure FontButtonClick(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    FInitFlag:Boolean;
    FIni:TMemIniFile;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  mensaje: string;

implementation

{$R *.DFM}

uses Clipbrd;
procedure TMainForm.ConnButtonClick(Sender: TObject);
begin
  ComTerminal.Connected := not ComTerminal.Connected;
end;

procedure TMainForm.ComPortAfterOpen(Sender: TObject);
begin
  ConnButton.Caption := 'Disconnect';
end;

procedure TMainForm.ComDataPacket1Packet(Sender: TObject; const Str: string);
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

procedure TMainForm.ComPortAfterClose(Sender: TObject);
begin
  ConnButton.Caption := 'Connect';
end;

procedure TMainForm.Paste1Click(Sender: TObject);
var
 clipboardStr:String;
begin
  clipboardStr := Clipboard.AsText;
//  ComTerminal.WriteStr(clipboardStr);
  ComPort.WriteStr( AnsiString(clipboardStr) );
end;

procedure TMainForm.PortButtonClick(Sender: TObject);
begin
  ComPort.ShowSetupDialog;
end;

procedure TMainForm.TermButtonClick(Sender: TObject);
begin
  ComTerminal.ShowSetupDialog;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
    cxLabel1.Caption := mensaje + ' ºC';
end;

procedure TMainForm.FontButtonClick(Sender: TObject);
begin
  ComTerminal.SelectFont;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(FIni) then begin
     FIni.WriteString('ComPort', 'ComPort', ComPort.Port );
     FIni.WriteString('ComPort','BaudRate', BaudRateToStr( ComPort.BaudRate ) );
     FIni.WriteString('ComPort','FlowControl', FlowControlToStr(ComPort.FlowControl.FlowControl ));
     FIni.UpdateFile;
     FIni.Free;
   end;
end;



procedure TMainForm.FormShow(Sender: TObject);
var x: textfile;
    com: string;
begin
    assignfile(x,ExtractFilePath(Application.exename)+'\Arduino.ini');
    reset(x);
    readln(x,com);
    closefile(x);

    ComPort.Port:= com;
    Timer1.Enabled:= true;

 if not FInitFlag then begin
   FInitFlag := true;

   FIni := TMemIniFile.Create( ExtractFilePath(Application.ExeName)+'terminal.ini');
   ComPort.Port := FIni.ReadString('ComPort', 'ComPort',ComPort.Port);
   ComPort.BaudRate := StrToBaudRate( FIni.ReadString('ComPort','BaudRate', '19200'));
   ComPort.FlowControl.FlowControl := StrToFlowControl( FIni.ReadString('ComPort','FlowControl', 'Hardware'));
   ConnButtonClick(Sender);

 end;
end;

procedure TMainForm.BitBtn1Click(Sender: TObject);
begin
Comport.ShowSetupDialog();
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  s:AnsiString;
begin
  { This test shows how to work with a TComPort without any visual controls
   attached, and without any background event thread or Win32 overlapped I/O.
   This mode might be useful for some people who want a simpler Com Port wrapper
   component that does not use asynchronous/overlapped Win32 apis.  Many things
   stop working in this approach, and it is not recommended for new or
   inexperienced users. }
   ComPort.Connected := false;
   ComTerminal.Connected := false;
   Application.ProcessMessages;
   ComPort.Overlapped := false;
   ComPort.Connected := true;
   ComPort.WriteStr('AT'+CHR(13));  {Send modem Command}
   Sleep(5);
   ComPort.ReadStr(S,80); {Get modem response.}
   if Pos('OK',s)>0 then
        Application.MessageBox( PChar('Modem is responding normally on '+ComPort.Port),
                                'Non-Overlapped Test', MB_OK)
        else
        Application.MessageBox( PChar('No modem responding on '+ComPort.Port),
                                'Non-Overlapped Test', MB_OK);

   ComPort.Connected := false;
   ComPort.Overlapped := true;


end;

end.
