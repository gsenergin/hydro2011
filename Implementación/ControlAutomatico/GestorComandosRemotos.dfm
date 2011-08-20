object DM_GestorComandosRemotos: TDM_GestorComandosRemotos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 168
  Width = 290
  object ServerSocket_GUIDesktop: TServerSocket
    Active = False
    Port = 9000
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket_GUIDesktopClientConnect
    OnClientDisconnect = ServerSocket_GUIDesktopClientDisconnect
    OnClientRead = ServerSocket_GUIDesktopClientRead
    OnClientWrite = ServerSocket_GUIDesktopClientWrite
    Left = 64
    Top = 24
  end
end
