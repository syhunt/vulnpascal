uses
  Web.HTTPApp;

var
  Response: TWebResponse;
  Cookie: TCookie;
begin
  // Get the HTTP response object
  Response := WebContext.Response;

  // Create a new cookie object
  Cookie := Response.Cookies.Add;
  Cookie.Name := 'my_cookie';
  Cookie.Value := 'my_value';
end;
