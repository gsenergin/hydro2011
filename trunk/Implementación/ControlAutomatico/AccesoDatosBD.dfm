object DM_AccesoDatosBD: TDM_AccesoDatosBD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 373
  Width = 681
  object StoredProc_HistorialSensado_Insertar: TADOStoredProc
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB;Mode=ReadWrite;Initial Catalog=hy' +
      'drodb'
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
  object StoredProc_RegistroEventos_Insertar: TADOStoredProc
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB;Mode=ReadWrite;Initial Catalog=hy' +
      'drodb'
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
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB;Mode=ReadWrite;Initial Catalog=hy' +
      'drodb'
    ConnectionTimeout = 0
    DefaultDatabase = 'hydroDB'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'MSDASQL.1'
    Left = 80
    Top = 33
  end
  object ADOQuery_Insertar: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 328
    Top = 161
  end
  object TimerGuardaDatos: TTimer
    Enabled = False
    OnTimer = TimerGuardaDatosTimer
    Left = 432
    Top = 80
  end
end
