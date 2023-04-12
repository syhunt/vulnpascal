unit case009-sqlcommand;

interface

uses
  ADODB;
  
implementation

procedure ExecuteQuery(const IDStr:string);
var
  Conn: TADOConnection;
  Cmd: TADOCommand;
  ResultSet: TADODataSet;
begin
  Conn := TADOConnection.Create(nil);
  Conn.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\mydb.mdb';
  Conn.Connected := True;

  Cmd := TADOCommand.Create(nil);
  Cmd.Connection := Conn;
  Cmd.CommandText := 'SELECT * FROM mytable WHERE id = '+IDStr;

  ResultSet := TADODataSet.Create(nil);
  ResultSet.Recordset := Cmd.Execute;
  
  // Do something with the result set
  
  ResultSet.Free;
  Cmd.Free;
  Conn.Free;
end;
