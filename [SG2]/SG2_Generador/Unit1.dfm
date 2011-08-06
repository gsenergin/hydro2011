object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 355
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object BarraProgresoVentas: TGauge
    Left = 32
    Top = 158
    Width = 353
    Height = 43
    MaxValue = 26
    Progress = 0
  end
  object BarraProgresoFechas: TGauge
    Left = 32
    Top = 216
    Width = 353
    Height = 33
    MaxValue = 672
    Progress = 0
  end
  object btn_InsertarVentas: TButton
    Left = 152
    Top = 104
    Width = 105
    Height = 25
    Caption = 'Insertar Ventas'
    TabOrder = 0
    OnClick = btn_InsertarVentasClick
  end
  object Button2: TButton
    Left = 296
    Top = 8
    Width = 105
    Height = 25
    Caption = 'Eliminar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 496
    Top = 192
    Width = 75
    Height = 25
    Caption = 'test'
    TabOrder = 2
    OnClick = Button3Click
  end
  object btn_InsertarCompras: TButton
    Left = 544
    Top = 120
    Width = 121
    Height = 25
    Caption = 'Insertar Compras'
    TabOrder = 3
    OnClick = btn_InsertarComprasClick
  end
  object Button1: TButton
    Left = 160
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object ADOQuery_Empleados: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'nombre'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'legajo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idCategoriaEmpleado'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTurno'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTienda'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO EMPLEADOS'
      '(nombre,legajo,idCategoriaEmpleado,idTurno,idTienda) '
      'VALUES'
      '(:nombre,:legajo,:idCategoriaEmpleado,:idTurno,:idTienda)')
    Left = 64
    Top = 16
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\[Proyecto]\[SG2]' +
      '\FastFood2003.mdb;Mode=ReadWrite;Persist Security Info=False;'
    KeepConnection = False
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 16
  end
  object ADOQuery_Delete: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'nombre'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'legajo'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idCategoriaEmpleado'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTurno'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTienda'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO EMPLEADOS'
      '(nombre,legajo,idCategoriaEmpleado,idTurno,idTienda) '
      'VALUES'
      '(:nombre,:legajo,:idCategoriaEmpleado,:idTurno,:idTienda)')
    Left = 96
    Top = 16
  end
  object ADOQuery_Encuesta: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'motivacion'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'satisfaccion'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'fecha'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idEmpleado'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO ENCUESTA'
      '(motivacion,satisfaccion,fecha,idEmpleado) '
      'VALUES'
      '(:motivacion,:satisfaccion,:fecha,:idEmpleado) ')
    Left = 64
    Top = 48
  end
  object ADOQuery_Marcas: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'marca'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO MARCAS'
      '(marca) '
      'VALUES'
      '(:marca) ')
    Left = 96
    Top = 48
  end
  object ADOQuery_Ventas: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'idVenta'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'fechaVenta'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'horaVenta'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'total'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTipoVenta'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTienda'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO Ventas'
      '(idVenta, fechaVenta, horaVenta, total, idTipoVenta, idTienda) '
      'VALUES'
      
        '(:idVenta, :fechaVenta, :horaVenta, :total, :idTipoVenta, :idTie' +
        'nda) ')
    Left = 288
    Top = 64
  end
  object ADOQuery_DetallesVentas: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'subtotal'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idItemMenu'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVenta'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'cantidad'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO DetallesVentas'
      '(subtotal, idItemMenu, idVenta, cantidad)'
      'VALUES'
      '(:subtotal, :idItemMenu, :idVenta, :cantidad)')
    Left = 328
    Top = 64
  end
  object ADOTable_ItemsMenu: TADOTable
    Connection = ADOConnection1
    LockType = ltReadOnly
    TableName = 'ItemsMenu'
    Left = 376
    Top = 64
  end
  object ADOQuery_UpdateVentas: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'total'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idVenta'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Ventas'
      'SET total=:total'
      'WHERE idVenta=:idVenta')
    Left = 304
    Top = 104
  end
  object ADOQuery_UpdateCompras: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'total'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idCompra'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE Compras'
      'SET total=:total'
      'WHERE idCompra=:idCompra')
    Left = 600
    Top = 88
  end
  object ADOQuery_Compras: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'idCompra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'fecha'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'total'
        Attributes = [paNullable]
        DataType = ftFloat
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idTienda'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO Compras'
      '(idCompra, fecha, total, idTienda) '
      'VALUES'
      '(:idCompra, :fecha, :total, :idTienda) ')
    Left = 584
    Top = 48
  end
  object ADOQuery_DetallesCompras: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'subtotal'
        Attributes = [paNullable]
        DataType = ftVariant
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idProducto'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'idCompra'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'cantidad'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO DetallesCompras'
      '(subtotal, idProducto, idCompra, cantidad)'
      'VALUES'
      '(:subtotal, :idProducto, :idCompra, :cantidad)')
    Left = 624
    Top = 48
  end
  object ADOTable_Productos: TADOTable
    Connection = ADOConnection1
    LockType = ltReadOnly
    TableName = 'Productos'
    Left = 536
    Top = 56
  end
  object ADOTable_Ventas: TADOTable
    Connection = ADOConnection1
    TableName = 'Ventas'
    Left = 176
    Top = 40
  end
end
