uses
  IdHTTP, IdGlobal;

var
  HTTP: TIdHTTP;
  Response: string;
begin
  HTTP := TIdHTTP.Create(nil);
  try
    // Set the basic authentication credentials
    HTTP.Request.Username := 'username';
    HTTP.Request.Password := 'password';

    // Encode the credentials in Base64 format and set the Authorization header
    HTTP.Request.CustomHeaders.Values['Authorization'] :=
      'Basic ' + TIdEncoderMIME.EncodeString(HTTP.Request.Username + ':' + HTTP.Request.Password);

    // Send the HTTP request
    Response := HTTP.Get('http://example.com/secure_resource');
  finally
    HTTP.Free;
  end;
end;
