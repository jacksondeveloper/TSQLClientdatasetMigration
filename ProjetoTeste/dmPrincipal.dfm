object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 598
  Top = 328
  Height = 150
  Width = 215
  object SQLConnection: TSQLConnection
    Connected = True
    ConnectionName = 'IBLocal'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'CommitRetain=False'
      
        'Database=127.0.0.1:C:\Users\jack\Desktop\TSQLClientdatasetMigrat' +
        'ion\ProjetoTeste\Dados\DADOS.FDB'
      'DriverName=Interbase'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=1'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'FBCLIENT.DLL'
    Left = 88
    Top = 40
  end
end
