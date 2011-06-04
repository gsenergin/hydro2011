unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Mask, ScktComp;

// Tipos de Datos definidos para el soft.
type Trama = Array [1..256] of byte;

type TramasSinRecibir=record
        frame: Trama;
        frame_length: word; // word=entero 2 bytes sin signo
        //estado: Boolean;
        NroTransaccion: Word;
    end;

type
  TForm1 = class(TForm)
    memoTX: TMemo;
    memoRX: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    formatoTX: TRadioGroup;
    formatoRX: TRadioGroup;
    btnLimpiarTX: TButton;
    btnLimpiarRX: TButton;
    lblCodFuncion: TLabel;
    LE_MBSlave: TLabeledEdit;
    LE_MBDirMem: TLabeledEdit;
    LE_MBCantidadRegistros: TLabeledEdit;
    combo_MBFuncion: TComboBox;
    btn_Solicitar: TButton;
    LE_MBValor: TLabeledEdit;
    memoPort: TMemo;
    Label4: TLabel;
    Panel1: TPanel;
    btn_Conectar: TButton;
    Label5: TLabel;
    LE_IPAdress: TLabeledEdit;
    LE_Puerto: TLabeledEdit;
    TCPSocket: TClientSocket;

    // CONECTIVIDAD RS-232
    procedure btn_ConectarClick(Sender: TObject);

    // MENSAJES Y DETALLES VISUALES IDE
    procedure FormCreate(Sender: TObject);
    procedure msInfo (mensaje, titulo : String);
    procedure msInfof (valor:integer; titulo : String);
    procedure combo_MBFuncionChange(Sender: TObject);


    // LOGS DE TANSMISION Y RECEPCION
    procedure btnLimpiarTXClick(Sender: TObject);
    procedure btnLimpiarRXClick(Sender: TObject);
    procedure CambiarFormato(var memo:TMemo; formatoNuevo,formatoViejo:word);
    procedure formatoTXClick(Sender: TObject);
    procedure formatoRXClick(Sender: TObject);

    // CONVERSION DE DATOS
    function IntToBin(valor,digitos:integer):string;
    function BinToInt(Value: string): byte;
    function HexToInt(s:string; cant:word):byte;
    function frameToString2(frame: trama; frame_length: word; formatoNuevo:word): string;

    // ENVIO DE TRAMAS
    procedure EnviarPuerto(var frame: Trama; var frame_length: word);
    procedure btn_SolicitarClick(Sender: TObject);

    // RECEPCION DE TRAMAS
    procedure Recibir(var frame:Trama; var frame_length:word; NroTransaccion:word);
    procedure TCPSocketRead(Sender: TObject; Socket: TCustomWinSocket);

  private
  public
  end;


var // GLOBALES
  Form1: TForm1;
  flagNOBORRAR: boolean;         // Indica si es un envio multiple
  formatoMemoTx: word=0;         // 0=decimal; 1=binario; 2=hexa
  formatoMemoRx: word=0;
  IDTransaccion: word=1;

  //Cola de Frames Enviados sin respuesta
  ColaFrames: Array[1..10] of TramasSinRecibir;
  // Cantida Elementos en ColaFrames
  ColaFramesIndex: word=0;

implementation

{$R *.dfm}

// Procedimineto que se ejecuta al iniciar la aplicacion
procedure TForm1.FormCreate(Sender: TObject);
begin
    // Inicialización de las Columnas del Stringgrid para mostrar datos
    StringGrid1.Cells[0,0]:='@@';
    StringGrid1.Cells[1,0]:='Decimal';
    StringGrid1.Cells[2,0]:='Hex';
    StringGrid1.Cells[3,0]:='Bin (Hi)';
    StringGrid1.Cells[4,0]:='Bin (Lo)';
    StringGrid1.RowCount:=2;
end;

// Mensaje de información, con el botón "Aceptar"
procedure TForm1.msInfo (mensaje, titulo : String);
begin
  application.MessageBox(pchar(mensaje),
      pchar(titulo), (MB_OK + MB_ICONINFORMATION));
end;

// Mensaje de información, con el botón "Aceptar"
procedure TForm1.msInfof (valor:integer; titulo : String);
begin
  application.MessageBox(pchar(inttostr(valor)),
      pchar(titulo), (MB_OK + MB_ICONINFORMATION));
end;


// Procedimiento que cambia los valores de los Caption de Labels
// cuando cambia la función modbus elegida
procedure TForm1.combo_MBFuncionChange(Sender: TObject);
begin
    LE_MBValor.Visible:=True;
    LE_MBCantidadRegistros.Enabled:= True;
    case combo_MBFuncion.ItemIndex of
      0: begin
        LE_MBValor.Visible:=False;
      end;
      1: begin
        LE_MBValor.EditLabel.Caption:= 'Valor';
        LE_MBCantidadRegistros.text:='1';
        LE_MBCantidadRegistros.Enabled:= False;
      end;
      2: LE_MBValor.EditLabel.Caption:= 'Valores (separados por ",") ';
    end;
end;






//////////////////////// CONVERSION DE DATOS /////////////////////////////

// Fn. que pasa de Binario a Entero
function TForm1.BinToInt(Value: string): byte;
var i, iValueSize: Integer;
begin
    Result := 0;
    iValueSize := Length(Value);
    for i := iValueSize downto 1 do
       if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
end;

// Fn. que pasa de Entero a Binario
function TForm1.IntToBin(valor,digitos:integer):string;
 var
  resultado:string;
  i:integer;
 begin
  if digitos>32 then
   digitos:=32;
  Resultado:='';
  i:=0;
  while i< digitos do
  begin
   if ((1 shl i) AND valor)>0 then
    Resultado:='1'+resultado
   else
    Resultado:='0'+resultado;
   inc(i);
  end;
  Result:=resultado;
 end;

// Fn. que pasa de Hexadecimal a Entero
function TForm1.HexToInt(s: string; cant: word): byte;
var b:Array[1..2]of byte;
i:byte;
begin
     for i:=1 to 2 do
       case ord(s[i]) of
        48..57: b[i]:=ord(s[i])-48;
        65..70: b[i]:=ord(s[i])-55;
       end;
     result:= b[1]*16 + b[2];
end;

// Fn. que pasa una trama a String Decimal (para poder visualizarla "humanamente"
function TForm1.frameToString2(frame: trama; frame_length,formatoNuevo: word): string;
var i:word;
    s,temp:string;
begin
     s:='';
     for i:=1 to frame_length do
     begin
          case formatoNuevo of

            0: begin //Decimal
               temp:= inttostr(frame[i]);
                if length(temp)= 1 then
                  temp:= '00'+temp
                else if Length(temp)=2 then
                  temp:='0'+temp;
                s:=s+'['+temp+']';
            end;

            1: begin //Binario
                s:=s+'['+IntToBin(frame[i],8)+']';
            end;

            2: begin //Hexa
                s:=s+'['+IntToHex(frame[i],2)+']';
            end;
          end;
     end;
     result:= s;
end;




////////////////////// FIN CONVERSION DE DATOS /////////////////////////////


///////////////////////////// LOGS TX y RX //////////////////////////////////

procedure TForm1.btnLimpiarRXClick(Sender: TObject);
begin
    memoRX.Clear;
end;

procedure TForm1.btnLimpiarTXClick(Sender: TObject);
begin
    memoTX.Clear;
end;

// Cambio de un formato a otro, de un memo
procedure TForm1.CambiarFormato(var memo:TMemo; formatoNuevo,formatoViejo:word);
  procedure rellenar (var cadena:String; c:char; cant:byte);
  begin
    while length(cadena)<>cant do
        cadena:= c+cadena;
  end;

var i:integer;
    s,t:string;
    lineas:string;
    c:char;
    x:TextFile;
begin
     if formatoNuevo=FormatoViejo then exit; // No tiene sentido convertir

     s:=''; lineas:='';
     memo.Lines.SaveToFile('temp.txt');
     memo.Lines.Clear;
     AssignFile(x,'temp.txt');
     reset(x);
     while not eof(x) do
     begin
       read(x,c);
       case c of
          '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F':begin
             s:= s+c;
          end else //es caracter
          begin
              if s<>'' then
              begin
                  case formatoViejo*10+formatoNuevo of
                    01: begin //Decimal -> Binario
                          t:= inttobin(strtoint(s),8);
                    end;
                    02:begin  //Decimal -> Hexa
                          t:= inttohex(strtoint(s),2);
                    end;
                    10:begin  //Binario -> Decimal
                          t:= inttostr( bintoint(s) );
                          rellenar(t,'0',3);
                    end;
                    12:begin  //Binario -> Hexa
                          s:= inttostr( bintoint(s) ); //Bina a Dec
                          t:= inttohex(strtoint(s),2); //Dec a Hex
                    end;
                    20:begin  //Hexa -> Decimal
                          t:=inttostr(HexToInt(s,2));
                          rellenar(t,'0',3);
                    end;
                    21:begin  //Hexa -> Binario
                          s:=inttostr(HexToInt(s,2));
                          t:=inttobin(strtoint(s),8);
                    end;
                  end;
                  lineas:=lineas+t+c;
                  s:='';
              end else lineas:=lineas+c;
          end;
       end;
     end;
     CloseFile(x);

     while length(lineas)>1 do
     begin
        s:=lineas[1];
        i:=2;
        while (lineas[i]<>'<')or(lineas[i]<>'<') do
        begin
            s:=s+lineas[i];
            i:=i+1;
        end;
        Memo.Lines.Add(s);
        Delete(lineas,1,i-1);
     end;

     // Borra lineas en blando...(bug)
     for i:=1 to Memo.Lines.Count do
       if Memo.Lines.Strings[i]='' then
          Memo.Lines.Delete(i);

end;

// Cambio de Formato del log de Recepcion
procedure TForm1.formatoRXClick(Sender: TObject);
begin
     CambiarFormato(memoRX,formatoRX.ItemIndex,formatoMemoRx);
     formatoMemoRx:=formatoRX.itemIndex;
end;

// Cambio de Formato del log de Transmisión
procedure TForm1.formatoTXClick(Sender: TObject);
begin
     CambiarFormato(memoTX,formatoTX.ItemIndex,formatoMemoTx);
     formatoMemoTx:=formatoTX.itemIndex;
end;

/////////////////////////// FIN LOGS TX y RX ////////////////////////////////




///////////////////// CONECTIVIDAD TCP ///////////////////////////

procedure TForm1.btn_ConectarClick(Sender: TObject);
begin
    if TCPSocket.Active then
    begin
      TCPSocket.Active:= False;
      LE_MBSlave.Enabled:= False;
      LE_MBDirMem.Enabled:= False;
      LE_MBCantidadRegistros.Enabled:= False;
      LE_MBValor.Enabled:= False;
      combo_MBFuncion.Enabled:= False;
      btn_Solicitar.Enabled:= False;
      lblCodFuncion.Enabled:= False;
      memoPort.Lines.Add('>> Desconectado <<');
      LE_IPAdress.Enabled:= True;
      LE_Puerto.Enabled:= True;
    end
    else
    begin
      TCPSocket.Host:= LE_IPAdress.text;
      TCPSocket.Port:= strtoint(LE_Puerto.text);
      TCPSocket.Active:= True;
      LE_MBSlave.Enabled:= True;
      LE_MBDirMem.Enabled:= True;
      LE_MBCantidadRegistros.Enabled:= True;
      LE_MBValor.Enabled:= True;
      combo_MBFuncion.Enabled:= True;
      btn_Solicitar.Enabled:= True;
      lblCodFuncion.Enabled:= True;
      memoPort.Lines.Add('>> Conectado <<');
      LE_IPAdress.Enabled:= False;
      LE_Puerto.Enabled:= False;
    end;

end;


///////////////////// FIN CONECTIVIDAD TCP ///////////////////////





//////////////////////// ENVIO DE TRAMAS /////////////////////////////

// Escribe en el Puerto ----> REVISAR!!!!!!!!!!!!!!!!!!!!!!!!!
procedure TForm1.EnviarPuerto(var frame: Trama; var frame_length: word);
var i:integer;
    ASCII_Frame, encabezado: string;
begin
    inc(ColaFramesIndex);   // incrementa en 1
    ColaFrames[ColaFramesIndex].frame:= frame;
    ColaFrames[ColaFramesIndex].frame_length:= frame_length;
    ColaFrames[ColaFramesIndex].NroTransaccion:= IDTransaccion;

     ASCII_Frame:='';
     for i:=1 to frame_length do
         ASCII_Frame:= ASCII_Frame + chr(frame[i]);

     encabezado:= chr(Hi(IDTransaccion)) + chr(Lo(IDTransaccion))+ chr(0) + chr(0);
     encabezado:= encabezado + chr(hi(length(ASCII_Frame)))+ chr(lo(length(ASCII_Frame)));

     ASCII_Frame:= encabezado + ASCII_Frame;
     
     // Envío al Puerto
     TCPSocket.Socket.SendText(ASCII_Frame);
     inc(IDTransaccion);
end;

// Comportamiento de Click en el boton Solicitar
procedure TForm1.btn_SolicitarClick(Sender: TObject);
var
  s, datos: String;
  i:integer;
  codigo_funcion: byte;
  direccionHI, direccionLO: byte;
  cantRegistrosHI, cantRegistrosLO: byte;
  valorHI,ValorLO: byte;
  cantRegistrosRestantes: word;
  dirSlave: byte;
  c: char;
  valor:word;
  Sindex, cant_valores: word;
  frame: Trama;
  frame_length: word;
begin
     StringGrid1.RowCount:=2;

     // Verificación de Rangos de Datos de entrada
     if (strtoint(LE_MBSlave.Text)<1) or (strtoint(LE_MBSlave.Text)>255) or
        (strtoint(LE_MBDirMem.Text)<0) or (strtoint(LE_MBDirMem.Text)>65535) or
        (strtoint(LE_MBCantidadRegistros.Text)<1) then
        begin
          msinfo('Error en los datos de entrada. Por Favor Revise los Rangos','Error');
          exit;
        end;


     frame_length:= 0;
     direccionHI:= Hi(strtoint(LE_MBDirMem.text));
     direccionLO:= Lo(strtoint(LE_MBDirMem.text));
     dirSlave:= strtoint(LE_MBSlave.Text);

     case combo_MBFuncion.ItemIndex of

        -1,0: (*Read Holding Regsiter 0x03*)
        begin
          // codigo_funcion:= 3;
          memoPort.Lines.Add('0x03: Read Holding Register');
          cantRegistrosRestantes:= strtoint(LE_MBCantidadRegistros.Text);
          //cantRegistrosHI:= 0;
          flagNOBORRAR:= false;
          while cantRegistrosRestantes>0 do
          begin
            frame[1]:= dirSlave;
            frame[2]:= 3;       // Codigo de Funcion

            // i especifica en que direccion de memoria comienza a escribir
            i:= strtoint(LE_MBDirMem.text)+strtoint(LE_MBCantidadRegistros.Text)-cantRegistrosRestantes;
            frame[3]:= Hi( i );
            frame[4]:= Lo( i );

            if cantRegistrosRestantes>125 then
            begin
              cantRegistrosLO:= 125;
              flagNOBORRAR:= true;
              cantRegistrosRestantes:= cantRegistrosRestantes - 125;
            end else
            begin
              cantRegistrosLO:= cantRegistrosRestantes;
              cantRegistrosRestantes:= 0;
            end;

            frame[5]:= 0; // Nunca se puede pasar entre Hi-LO mas de 125 por lo que HI siempre es =0
            frame[6]:= cantRegistrosLO;
            frame_length:= 6;

            EnviarPuerto(frame,frame_length);

            memoTX.Lines.Add('> ' + frameToString2(frame,frame_length,formatoMemoTx));
          end;

        end;

        1: (*Write Single Regsiter 0x06*)
        begin
          //codigo_funcion:= 6;
          memoPort.Lines.Add('0x06: Write Single Register');
          ValorHI:= Hi(strtoint(LE_MBValor.text));
          ValorLo:= Lo(strtoint(LE_MBValor.text));
          frame[1]:= dirSlave;
          frame[2]:= 6;
          frame[3]:= direccionHI;
          frame[4]:= direccionLO;
          frame[5]:= ValorHi;
          frame[6]:= ValorLO;
          frame_length:= 6;

          EnviarPuerto(frame,frame_length);
          memoTX.Lines.Add('> ' + frameToString2(frame,frame_length,formatoMemoTx));
        end;

        2: (*Write Multiple Regsiter 0x10*)
        begin
          codigo_funcion:= $10;
          memoPort.Lines.Add('0x10: Write Multiple Register');
          cantRegistrosRestantes:= strtoint(LE_MBCantidadRegistros.Text);
          cantRegistrosHI:= 0; // Nunca se puede pasar entre Hi-LO mas de 123 por lo que HI siempre es =0
          datos:= LE_MBValor.text;

          while cantRegistrosRestantes>0 do
          begin
            frame[1]:= dirSlave;
            frame[2]:= codigo_funcion;
            frame[3]:= Hi( strtoint(LE_MBDirMem.text)+strtoint(LE_MBCantidadRegistros.Text)-cantRegistrosRestantes );
            frame[4]:= Lo( strtoint(LE_MBDirMem.text)+strtoint(LE_MBCantidadRegistros.Text)-cantRegistrosRestantes );

            if cantRegistrosRestantes>123 then
            begin
              cantRegistrosLO:= 123;
              dec(cantRegistrosRestantes, 123);
            end else
            begin
              cantRegistrosLO:= cantRegistrosRestantes;
              cantRegistrosRestantes:= 0;
            end;

            frame[5]:= cantRegistrosHI;
            frame[6]:= cantRegistrosLO;
            frame[7]:= frame[6] * 2; //Byte Count
            frame_length:= 7;

            // Obtenemos los valores del LE_MBValores (los separados por "comas" )

            Sindex:= 1; //Sindex apunta a donde leo del string
            cant_valores:= 0; //cantidad de valores leidos

            while (Sindex <= length(datos)) and (cant_valores<cantRegistrosLO) do
            begin
              c:= datos[Sindex];
              if (c=',') or (c=';') or (Sindex=length(datos)) then
              begin
                frame_length:= frame_length+2;
                if Sindex=length(datos) then s:=s+c;
                valor:= strtoint(s);
                valorHi:=Hi(valor);
                valorLo:=Lo(valor);
                frame[frame_length-1]:= valorHi;
                frame[frame_length]:= valorLo;
                s:='';
                inc(cant_valores);
              end else
              begin
                s:= s+c;
              end;
              Sindex := Sindex+1;
            end;
            Delete(datos,1,Sindex-1);
            
            memoTX.Lines.Add('> ' + frameToString2(frame,frame_length,formatoMemoTx));
          //  if strtoint(LE_MBCantidadRegistros.Text)>123 then msinfo('Enviando Fragmento','Debug Mode');
            EnviarPuerto(frame,frame_length);
          end;

        end;
     end; //END CASE
end;

//////////////////////// FIN ENVIO DE TRAMAS //////////////////////////



//////////////////////// RECEPCION DE TRAMAS //////////////////////////

// Procesa una trama recibida
procedure TForm1.Recibir(var frame:Trama; var frame_length:word; NroTransaccion:word);
var memIni,t:word;
    i,j:integer;
begin
     memIni:= strtoint(LE_MBDirMem.text);

     case frame[2] of  // Frame[2] = cod funcion
        3:begin // Read Holding Register
                if flagNOBORRAR=FALSE then begin // No es pedido multiple
                   t:=0;
                   StringGrid1.RowCount:= (frame[3] div 2)+1;
            end
            else  //Es pedido multiple
            begin
                   if (StringGrid1.RowCount)>2 then
                      t:= StringGrid1.RowCount-1 // T indica a partir de donde se puede escribir en el Stringgrid
                   else
                      t:=0;
                   StringGrid1.RowCount:= t +(frame[3] div 2)+1;
                   if t>1 then memini:= strtoint(StringGrid1.Cells[0,t+1]);
                end;

                for i:= 0  to frame[3] div 2  do  // Frame[3] = byte count; Desde Frame[4] hay datos
                begin
                  (*Adr*)StringGrid1.Cells[0,t+i+1]:= inttostr(memIni+i);
                  (*Dec*)StringGrid1.Cells[1,t+i+1]:= inttostr(frame[4+2*i] * 256 + frame[4+2*i +1]);
                  (*Hex*)StringGrid1.Cells[2,t+i+1]:= inttohex(frame[4+2*i] * 256 + frame[4+2*i+1],4);
                  (*Bin*)StringGrid1.Cells[3,t+i+1]:= inttobin(frame[4+2*i],8);
                  (*Bin*)StringGrid1.Cells[4,t+i+1]:= inttobin(frame[4+2*i +1],8);
            end;
        end;

        6:begin // Write Single Register
                StringGrid1.RowCount:=2;
                (*Adr*)StringGrid1.Cells[0,1]:= inttostr(memIni);
                (*Dec*)StringGrid1.Cells[1,1]:= inttostr(frame[5] * 256 + frame[6]);
                (*Hex*)StringGrid1.Cells[2,1]:= inttohex(frame[5] * 256 + frame[6],4);
                (*Bin*)StringGrid1.Cells[3,1]:= inttobin(frame[5],8);
                (*Bin*)StringGrid1.Cells[4,1]:= inttobin(frame[6],8);
        end;

        16:begin  // Write Multiple Register
                StringGrid1.RowCount:=1;
                memoPort.Lines.Add('Escritos Correctamente '+inttostr(frame[6])+' registros');
        end;

        else begin // ECXEPCIONES!
                if flagNOBORRAR=false then StringGrid1.Rowcount:=1;
                case frame[3] of //Frame[3] = Exceptoin Code
                    1: begin
                        msinfo('ILLEGAL FUNCTION','Error: Exception #1');
                        memoPort.Lines.Add('ERROR #1: Ilegal Function');
                    end;
                    2: begin
                        msinfo('ILLEGAL DATA ADDRESS','Error: Exception #2');
                        memoPort.Lines.Add('ERROR #2: Ilegal Data Adress');
                    end;
                    3: begin
                        msinfo('ILLEGAL DATA VALUE','Error: Exception #3');
                        memoPort.Lines.Add('ERROR #3: Ilegal Data Value');
                    end;
                    4: begin
                        msinfo('SLAVE DEVICE FAILURE','Error: Exception #4');
                        memoPort.Lines.Add('ERROR #4: Slave Device Failure ');
                    end;
                end;
        end;

      end;// Case

      // Saco el paquete de la cola de enviados sin recibir
      for i:=1 to ColaFramesIndex do
           if ColaFrames[i].NroTransaccion=NroTransaccion then
           begin
                for j:=i to ColaFramesIndex - 1 do
                begin
                   ColaFrames[j].frame:= ColaFrames[j+1].frame;
                   ColaFrames[j].frame_length:= ColaFrames[j+1].frame_length;
                   ColaFrames[j].NroTransaccion:= ColaFrames[j+1].NroTransaccion;
                end;
           end;
      ColaFramesIndex:= ColaFramesIndex - 1;
end;

procedure TForm1.TCPSocketRead(Sender: TObject; Socket: TCustomWinSocket);
var frame:trama;
    frame_length, NT:word;
    estado_frame: boolean;
    str,str2:string;
    i:integer;
begin
     // Si no hay un paquete pendiente, sale
     if ColaFramesIndex=0 then exit;

     str:= Socket.ReceiveText;
     str2:= str;
     NT:= ord(str[1])*256 + ord(str[2]); // Guardo el nº de Transaccion
     Delete(str2,1,6);                   //Elimino el encabezado
     frame_length:= length(str2);

     for i := 1 to frame_length do
         frame[i]:= ord(str2[i]);  // ord convierte de caracter a byte

     memoRX.Lines.Add('< '+frameToString2(frame,frame_length,formatoMemoRx));
     Recibir(frame,frame_length,NT);
end;

//////////////////////// FIN RECEPCION DE TRAMAS ///////////////////////

end.
