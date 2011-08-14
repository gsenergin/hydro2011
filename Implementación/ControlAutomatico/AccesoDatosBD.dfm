object DM_AccesoDatosBD: TDM_AccesoDatosBD
  OldCreateOrder = False
  Height = 373
  Width = 681
  object StoredProc_HistorialSensado_Insertar: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'HistorialSensado_Insertar'
    Parameters = <
      item
        Name = 'dirMem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'rtu_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'valor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 88
    Top = 100
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB'
    ConnectionTimeout = 0
    DefaultDatabase = 'hydrodb'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 88
    Top = 12
  end
  object StoredProc_RegistroEventos_Insertar: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'RegistroEventos_Insertar'
    Parameters = <
      item
        Name = 'dirMem'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'rtu_num'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'valor'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 248
    Top = 28
  end
end
