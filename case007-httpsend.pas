uses
  httpsend;

var
  HTTP: THTTPSend;
begin
  HTTP := THTTPSend.Create;
  try
    if HTTP.HTTPMethod('GET', 'http://example.com') then
    begin
      //...
    end;
  finally
    HTTP.Free;
  end;
end;
