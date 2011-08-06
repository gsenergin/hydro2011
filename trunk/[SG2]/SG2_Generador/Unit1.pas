unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Gauges;

type
  TForm1 = class(TForm)
    ADOQuery_Empleados: TADOQuery;
    ADOConnection1: TADOConnection;
    btn_InsertarVentas: TButton;
    ADOQuery_Delete: TADOQuery;
    Button2: TButton;
    ADOQuery_Encuesta: TADOQuery;
    ADOQuery_Marcas: TADOQuery;
    ADOQuery_Ventas: TADOQuery;
    ADOQuery_DetallesVentas: TADOQuery;
    ADOTable_ItemsMenu: TADOTable;
    ADOQuery_UpdateVentas: TADOQuery;
    Button3: TButton;
    BarraProgresoVentas: TGauge;
    BarraProgresoFechas: TGauge;
    ADOQuery_UpdateCompras: TADOQuery;
    ADOQuery_Compras: TADOQuery;
    ADOQuery_DetallesCompras: TADOQuery;
    btn_InsertarCompras: TButton;
    ADOTable_Productos: TADOTable;
    Button1: TButton;
    ADOTable_Ventas: TADOTable;
    procedure btn_InsertarVentasClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btn_InsertarComprasClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


const
      Apellidos: array[1..70] of string = (
         'Rodríguez','Gómez','Fernández','López','Díaz','Martínez','Pérez','García','Sánchez','Romero',
         'Sosa','Álvarez','Torres','Ruiz','Ramírez','Flores','Acosta','Benítez','Medina','Suárez',
         'Herrera','Aguirre','Pereyra','Gutiérrez','Giménez','Molina','Silva','Castro','Rojas','Ortíz',
         'Núñez','Luna','Juárez','Cabrera','Ríos','Ferreyra','Godoy','Morales','Domínguez','Moreno',
         'Peralta','Vega','Carrizo','Quiroga','Castillo','Ledesma','Muñoz','Ojeda','Ponce','Vera',
         'Vázquez','Villalba','Cardozo','Navarro','Ramos','Arias','Coronel','Córdoba','Figueroa','Correa',
         'Cáceres','Vargas','Maldonado','Mansilla','Farías','Rivero','Paz','Miranda','Roldán','Lucero');

      Nombres: array[1..70] of string = (
         'Santiago','Sebastián','Diego','Nicolás','Samuel','Alejandro','Daniel','Mateo','Ángel','Matías',
         'Gabriel','Tomás','David','Emiliano','Andrés','Joaquín','Carlos','Alexander','Adrián','Lucas',
         'Benjamín','Leonardo','Rodrigo','Felipe','Francisco','Pablo','Martín','Fernando','Isaac','Manuel',
         'Juan Pablo','Emmanuel','Emilio','Vicente','Eduardo','Juan','Javier','Jorge','Aaron','José',
         'Erick','Luis','Cristian','Ignacio','Christopher','Jesús','Kevin','Juan José','Agustín','Juan David',
         'Simón','Joshua','Maximiliano','Miguel Ángel','Juan Sebastián','Bruno','Iván','Gael','Miguel','Thiago',
         'Jerónimo','Hugo','Ricardo','Antonio','Ian','Anthony','Pedro','Rafael','Jonathan','Esteban');
      Categoria: array[1..7] of integer = (1,2,3,2,3,2,3) ;

      Marca: array [1..50] of string=(
          'AppleCrings','Arnott','ArnottTimTam','Ben&Jerry','Bisc&Mars','BlueRiband',
          'Bob','Brannigans','Bugles','BurtonMaryland','Specials','Burtons','Cadbury',
          'Calypso','Cheeselets','CheesyToolBag','Cremosa','Discos','Disney','Domino',
          'DoubleTake','EskimoPie','FarmerBrown','Fish','Fishfingers','FlaminHotWotsits',
          'FootballCrazy','FoxBiscuits','Frazzles','Gold','GoldenWonder','GoodCrunchy',
          'Griddles','HobNob','HorrorBags','HulaHoops','Humdinger','JaffaCake','JuicyDropPop',
          'Kinder','Kins','KitKat','Kits','KPNuts','Kracks','LayStax','LemonCheesecakeKitKat',
          'Loacker','LyonsMaid','Magnum');

procedure TForm1.btn_InsertarComprasClick(Sender: TObject);
var forIdTienda,forFechaCompraAño,forFechaCompraMes: integer;
    fechaCompra: TDate;
    i, forIdCompra: integer;
    cantidadD, forIDproducto : integer;
    costo, totalCompra, subtotal: double;
begin
    // Compras (fecha, total, idTienda)
    // DetallesVentas (subtotal, idProducto, idCompra, cantidad)
    // update

    randomize;
    ADOConnection1.Connected:= true;
    ADOTable_Productos.Active:= true;

    forIdCompra:=1;

    for forIdTienda:=1 to 26  do   // 26 tiendas
    begin
      for forFechaCompraAño:=2010 to 2011  do   // del 2010 a 2011
      for forFechaCompraMes:=1 to 12 do   // Enero a Diciembre
      begin
           totalCompra:= 0;
           // Siempre se compra el día 1
           fechaCompra := StrToDate(''+inttostr(forFechaCompraMes)+'/01/'+inttostr(forFechaCompraAño));

           with ADOQuery_Compras do
           begin
               Close;
               Parameters.ParamByName('idCompra').Value:= forIdCompra;
               Parameters.ParamByName('fecha').Value:= fechaCompra;
               Parameters.ParamByName('total').Value:= 0; // Despues hacemos Update...
               Parameters.ParamByName('idTienda').Value:= forIdTienda;
               ExecSQL;
           end;

            // Detalles de la Compra, 1 PARA CADA PRODUCTO
            for forIDproducto:=1 to 17 do
            begin

              with ADOQuery_DetallesCompras do
              begin
                 Close;
                 Parameters.ParamByName('idCompra').Value:= forIdCompra;
                 Parameters.ParamByName('idProducto').Value:= forIDproducto;

                 if forIDproducto<=8 then  // 540 al mes
                    cantidadD:= random(400)+300
                 else
                    cantidadD:= random(200)+100;
                    


                    ////////////////////////////////////////////////////////ACA CUANTOS====???
                 Parameters.ParamByName('cantidad').Value:= cantidadD;

                 //Busco el costo en la tabla Productos
                 ADOTable_Productos.Locate('idProducto',forIDproducto,[]);
                 costo:= ADOTable_Productos.FieldByName('costo').AsFloat;

                 subtotal:= costo*cantidadD;

                 Parameters.ParamByName('subtotal').Value:= FormatFloat('0.00', subtotal);

                 ExecSQL;
              end;
              
              totalCompra:= totalCompra + costo * CantidadD;
            end;

            with ADOQuery_UpdateCompras do
            begin
              Close;
              Parameters.ParamByName('total').Value:= totalCompra;
              Parameters.ParamByName('idCompra').Value:= forIdCompra;
              ExecSQL;
            end;

            inc (forIdCompra);

         BarraProgresoFechas.Progress:= BarraProgresoFechas.Progress+1;

      end; // end For Fechas
    end; // end for IDtienda



    ADOTable_Productos.Active:= false;
    ADOConnection1.Connected:= false;
    Showmessage('FIN CARGA!');

end;

procedure TForm1.btn_InsertarVentasClick(Sender: TObject);
var forIdVenta, forFechaVentaDia, forFechaVentaMes, forFechaVentaAño,
    RNDIdTipoVenta, forIdTienda, RNDCantVentasDia, RNDCantElementos: integer;
    totalVenta, precio: integer;
    i, cantidadD, IDitemMenu: integer;
    fechaVenta:TDate;
    horaVenta:TDateTime;
    inicialForIDVentas: integer;
begin

// Ventas: (:idVenta, :fechaVenta, :total, :idTipoVenta, :idTienda)

// Detalle (:subtotal, :idItemMenu, :idVenta, :cantidad)
    inicialForIDVentas:= 1;
    randomize;
    ADOConnection1.Connected:= true;
    ADOTable_ItemsMenu.Active:= true;


    for forIdTienda:=1 to 26  do   // 26 tiendas
    begin
      for forFechaVentaAño:=2010 to 2011  do   // del 2010 a 2011
      for forFechaVentaMes:=1 to 12 do   // Enero a Diciembre
      for forFechaVentaDia:=1 to 28 do     // Días 1 a 28
      begin
        if (forFechaVentaDia mod 6=0) or (forFechaVentaDia mod 7=0) then //fin de semana + ventas
          RNDCantVentasDia:= random(30)+1
        else
          RNDCantVentasDia:= random(15)+1;

        for forIdVenta := inicialForIDVentas to (inicialForIDVentas+RNDCantVentasDia-1) do // Uno por cada venta diaria
        begin

           totalVenta:= 0;
           fechaVenta := StrToDate(inttostr(forFechaVentaMes)+'/'+inttostr(forFechaVentaDia)+'/'+inttostr(forFechaVentaAño));

           //Calculo de la hora
           if random(100)>30 then
           begin
             // 70% de probabilidades de que sea al mediodia o noche
             if random(100)>50 then
                // Venta al mediodia
                horaVenta:= StrToTime(inttostr(random(2)+12)+':'+inttostr(random(50)+10))
             else
                // Venta a la noche
                horaVenta:= StrToTime(inttostr(random(2)+21)+':'+inttostr(random(50)+10));
           end
           else
           begin
             // 30 % de probabilidades que sea a la tarde
             horaVenta:= StrToTime(inttostr(random(15)+9)+':'+inttostr(random(50)+10));
           end;


           with ADOQuery_Ventas do
           begin
               Close;
               Parameters.ParamByName('idVenta').Value:= forIdVenta;
               Parameters.ParamByName('fechaVenta').Value:= fechaVenta;
              // Parameters.ParamByName('horaVenta').Value:= StrToTime(inttostr(random(15)+9)+':'+inttostr(random(50)+10));
                Parameters.ParamByName('horaVenta').Value:= horaVenta;

               Parameters.ParamByName('total').Value:= 0; // Despues hacemos Update...
               Parameters.ParamByName('idTipoVenta').Value:= random(2)+1; //gravadas o no gravadas
               Parameters.ParamByName('idTienda').Value:= forIdTienda;
               ExecSQL;
           end;


           RNDCantElementos:= random(3)+1; // Cantidad de elementos que compra

            // Detalles de la venta
            for i:=1 to RNDCantElementos do
            begin
              with ADOQuery_DetallesVentas do
              begin
                 Close;
                 Parameters.ParamByName('idVenta').Value:= forIdVenta;

                 IDitemMenu:= random(40)+1;
                 Parameters.ParamByName('idItemMenu').Value:= IDitemMenu;

                 cantidadD:= random(3)+1;
                 Parameters.ParamByName('cantidad').Value:= cantidadD;

                 //Busco el precio en la tabla ItemsMenu
                 ADOTable_ItemsMenu.Locate('idItemMenu',IDitemMenu,[]);
                 precio:= ADOTable_ItemsMenu.FieldByName('precio').AsInteger;

                 Parameters.ParamByName('subtotal').Value:= precio*cantidadD;

                 ExecSQL;
              end;
              totalventa:= totalventa + precio * CantidadD;
            end;

            with ADOQuery_UpdateVentas do
            begin
              Close;
              Parameters.ParamByName('total').Value:= totalventa;
              Parameters.ParamByName('idVenta').Value:= forIdVenta;
              ExecSQL;
            end;



         end;  // FIN  for forIdVenta := 1 to RNDCantVentasDia do

         inicialForIDVentas:= inicialForIDVentas+RNDCantVentasDia;

         BarraProgresoFechas.Progress:= BarraProgresoFechas.Progress+1;
       //  Showmessage('Venta Cargada'); exit;
      end;
      BarraProgresoFechas.Progress:= 0;
      BarraProgresoVentas.Progress:= BarraProgresoVentas.Progress+1;
    end;


    ADOTable_ItemsMenu.Active:= false;
    ADOConnection1.Connected:= false;
    Showmessage('FIN CARGA!');
end;

procedure TForm1.Button1Click(Sender: TObject);
var fecha, temp: string;
begin
// CAMBIO FECHAS
   ADOConnection1.Connected:= true;
   ADOTable_Ventas.Active:= true;
   ADOTable_Ventas.Locate('idVenta',152567,[]);
   ADOTable_Ventas.Edit;
   while not ADOTable_Ventas.Eof do
   begin
      with ADOTable_Ventas do
      begin
        fecha:= FieldByName('fechaVenta').AsString;
        temp:= fecha[4]+fecha[5]+'/'+fecha[1]+fecha[2]+'/'+fecha[7]+fecha[8]+fecha[9]+fecha[10];
        Edit;
          FieldByName('fechaVenta').Value:= temp;
        Post;
        Next;
      end;
   end;

   ADOTable_Ventas.Active:= true;
   ADOConnection1.Connected:= false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     ADOConnection1.Connected:= true;
     with ADOQuery_Delete do
     begin
       Close;
       sql.Clear;
       SQL.Add('DELETE * FROM DetallesVentas');
       ExecSQL;
       sql.Clear;
       SQL.Add('DELETE * FROM Ventas');
       ExecSQL;

     end;
     ADOConnection1.Connected:= false;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
    ADOConnection1.Connected:= true;
    ADOTable_ItemsMenu.Active:= true;
    ADOTable_ItemsMenu.Locate('idItemMenu',40,[]);
    ShowMessage(FloatToStr( ADOTable_ItemsMenu.FieldByName('precio').AsFloat));
    ADOTable_ItemsMenu.Active:= false;
    ADOConnection1.Connected:= false;
end;

end.


(*
----------EMPLEADOS------------------

    t:= 3+random(5);
    for forTienda:=1 to 75 do
    for forTurno:=1 to 3 do
    for forCategoria:=1 to t do
    begin

      with ADOQuery_Empleados do
      begin
        Close;
        Parameters.ParamByName('nombre').Value:= Nombres[random(70)+1]+' '+Apellidos[random(70)+1];
        Parameters.ParamByName('legajo').Value:= random(20000)+1;
        Parameters.ParamByName('idCategoriaEmpleado').Value:= Categoria[forCategoria];
        Parameters.ParamByName('idTurno').Value:= forTurno;
        Parameters.ParamByName('idTienda').Value:= forTienda;
        ExecSQL;
      end;

    end;


--------ENCUESTA----------------------
    for forEmpleados:=901 to 1800 do
    BEGIN

    cant:= random(3)+1;
    for t := 1 to cant do
    begin
      with ADOQuery_Encuesta do
      begin
        Close;
        Parameters.ParamByName('motivacion').Value:= random(5)+1;
        Parameters.ParamByName('satisfaccion').Value:= random(5)+1;
        Parameters.ParamByName('fecha').Value:= StrToDate(inttostr(random(28)+1)+'/'+inttostr(random(12)+1)+'/'+inttostr(random(11)+2000));
        Parameters.ParamByName('idEmpleado').Value:= forEmpleados;
        ExecSQL;
      end;

    end;
    END;    



*)