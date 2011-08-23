object DM_AccesoDatos: TDM_AccesoDatos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 569
  Width = 1023
  object ADOConnectionHYDRODB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB;Mode=Read'
    ConnectionTimeout = 0
    DefaultDatabase = 'hydrodb'
    LoginPrompt = False
    Mode = cmRead
    Left = 104
    Top = 20
  end
  object ADOTable_Sensor: TADOTable
    Connection = ADOConnectionHYDRODB
    CursorType = ctStatic
    LockType = ltReadOnly
    IndexName = 'PRIMARY'
    TableName = 'sensor'
    Left = 96
    Top = 120
  end
  object DS_Sensor: TDataSource
    DataSet = ADOTable_Sensor
    Left = 96
    Top = 184
  end
  object ADOQuery_Grafico: TADOQuery
    Connection = ADOConnectionHYDRODB
    CursorType = ctOpenForwardOnly
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 136
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT * FROM historialsensado WHERE FK_HistorialSensado_Sensor='
      ':ID ORDER BY TIMESTAMP')
    Left = 200
    Top = 120
  end
  object DS_Grafico: TDataSource
    DataSet = ADOQuery_Grafico
    Left = 208
    Top = 184
  end
  object ADOQuery_SensorUpdate: TADOQuery
    Connection = ADOConnectionHYDRODB
    CursorType = ctOpenForwardOnly
    Parameters = <
      item
        Name = 'MIN'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'VALORLL'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'VALORL'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'VALORH'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'VALORHH'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'MAX'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftSmallint
        NumericScale = 248
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE sensor'
      'SET min = :MIN, '
      '       valorLL = :VALORLL, '
      '       valorL = :VALORL, '
      '       valorH = :VALORH,'
      '       valorHH = :VALORHH,'
      '       max = :MAX'
      'WHERE ID_sensor = :ID')
    Left = 312
    Top = 120
  end
  object DS_SensorUpdate: TDataSource
    DataSet = ADOQuery_SensorUpdate
    Left = 312
    Top = 184
  end
  object ADOTable_TipoUsuario: TADOTable
    Active = True
    Connection = ADOConnectionHYDRODB
    CursorType = ctStatic
    LockType = ltReadOnly
    IndexName = 'ID_TipoUsuario'
    TableName = 'tipousuario'
    Left = 480
    Top = 128
  end
  object DS_TipoUsuario: TDataSource
    AutoEdit = False
    DataSet = ADOTable_TipoUsuario
    Left = 480
    Top = 184
  end
  object DS_Usuario: TDataSource
    DataSet = ADOTable_Usuario
    Left = 592
    Top = 184
  end
  object ADOTable_Usuario: TADOTable
    Active = True
    Connection = ADOConnectionHYDRODB
    CursorType = ctStatic
    Filter = 'Baja=0'
    Filtered = True
    TableName = 'usuario'
    Left = 592
    Top = 128
  end
  object StoredProc_Usuario_Delete: TADOStoredProc
    Connection = ADOConnectionHYDRODB
    ProcedureName = 'Usuario_Delete'
    Parameters = <
      item
        Name = 'nombre_usuario'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 496
    Top = 276
  end
  object StoredProc_Usuario_Insertar: TADOStoredProc
    Connection = ADOConnectionHYDRODB
    ProcedureName = 'Usuario_Insertar'
    Parameters = <
      item
        Name = 'nombre_usuario'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'IDTipoUsuario'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 496
    Top = 324
  end
  object StoredProc_Usuario_RestorePassword: TADOStoredProc
    Connection = ADOConnectionHYDRODB
    ProcedureName = 'Usuario_RestorePassword'
    Parameters = <
      item
        Name = 'nombre_usuario'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end
      item
        Name = 'nueva_clave'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 496
    Top = 372
  end
  object ADOQuery_UsuarioExistente: TADOQuery
    Connection = ADOConnectionHYDRODB
    CursorType = ctOpenForwardOnly
    Parameters = <
      item
        Name = 'nombre_usuario'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 176
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      'SELECT COUNT(*) AS cantidad '
      'FROM usuario'
      'WHERE usuario.user=:nombre_usuario')
    Left = 648
    Top = 280
  end
  object ADOQuery_ExUsuarios: TADOQuery
    Connection = ADOConnectionHYDRODB
    CursorType = ctOpenForwardOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM usuario'
      'WHERE Baja=1')
    Left = 800
    Top = 272
  end
  object DS_ExUsuarios: TDataSource
    DataSet = ADOQuery_ExUsuarios
    Left = 800
    Top = 328
  end
  object StoredProc_UsuarioRestaurar: TADOStoredProc
    Connection = ADOConnectionHYDRODB
    ProcedureName = 'Usuario_Restaurar'
    Parameters = <
      item
        Name = 'nombre_usuario'
        Attributes = [paNullable]
        DataType = ftString
        Size = 50
        Value = Null
      end>
    Left = 496
    Top = 420
  end
  object ADOQuery_AlertasUltimaHora: TADOQuery
    Connection = ADOConnectionHYDRODB
    CursorType = ctOpenForwardOnly
    Parameters = <>
    SQL.Strings = (
      
        'select Sensor.descripcion as SensorNombre, Alertas.descripcion, ' +
        'Alertas.TimeStamp '
      
        'FROM ALERTAS JOIN Sensor ON Alertas.FK_Alertas_Sensor=Sensor.Id_' +
        'Sensor '
      
        'Where TIMESTAMPDIFF(HOUR,alertas.TimeStamp,CURRENT_TIMESTAMP())=' +
        '0;')
    Left = 88
    Top = 272
  end
  object DS_AlertasUltimaHora: TDataSource
    AutoEdit = False
    DataSet = ADOQuery_AlertasUltimaHora
    Left = 88
    Top = 336
  end
end
