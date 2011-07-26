object DM_AccesoDatosObservador: TDM_AccesoDatosObservador
  OldCreateOrder = False
  Height = 150
  Width = 215
  object UdpSocket1: TUdpSocket
    BlockMode = bmNonBlocking
    LocalHost = '127.0.0.1'
    LocalPort = '9001'
    Left = 120
    Top = 24
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 9000
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    Left = 40
    Top = 24
  end
end
