object PasswordDlg: TPasswordDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = 'HYDRO - Login'
  ClientHeight = 134
  ClientWidth = 231
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 57
    Width = 54
    Height = 13
    Caption = 'Password'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 13
    Width = 43
    Height = 13
    Caption = 'Usuario'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltipoUsuario: TLabel
    Left = 57
    Top = 13
    Width = 64
    Height = 13
    Caption = 'lbltipoUsuario'
    Visible = False
  end
  object Password: TEdit
    Left = 8
    Top = 76
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object btn_OK: TButton
    Left = 154
    Top = 107
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = btn_OKClick
  end
  object btn_Cancel: TButton
    Left = 8
    Top = 106
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object User: TEdit
    Left = 8
    Top = 32
    Width = 217
    Height = 21
    TabOrder = 3
  end
  object ADOConnectionHYDROLogin: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=HydroDB'
    ConnectionTimeout = 0
    DefaultDatabase = 'hydrodb'
    LoginPrompt = False
    Mode = cmRead
    Left = 88
    Top = 44
  end
  object ADOQueryUsuario: TADOQuery
    Connection = ADOConnectionHYDROLogin
    Parameters = <>
    Left = 128
    Top = 40
  end
end
