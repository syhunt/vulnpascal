uses
  OverbyteIcsHttpProt;

var
  HttpCli: THttpCli;
begin
  HttpCli := THttpCli.Create(nil);
  try
    HttpCli.URL := 'http://example.com';
    HttpCli.RcvdStream := TMemoryStream.Create;
    HttpCli.Get;
    // ...
  finally
    HttpCli.RcvdStream.Free;
    HttpCli.Free;
  end;
end;
