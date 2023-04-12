uses
  IdSMTP, IdMessage, IdSSLOpenSSL;

var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  // Create a new TIdSMTP object
  SMTP := TIdSMTP.Create(nil);
  try
    // Configure the SMTP settings
    SMTP.Host := 'smtp.gmail.com';
    SMTP.Port := 587;
    SMTP.UseTLS := utUseExplicitTLS;

    // Create a new TIdSSLIOHandlerSocketOpenSSL object
    SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    try
      // Configure the SSL/TLS settings
      SSLHandler.SSLOptions.Method := sslvTLSv1_2;
      SSLHandler.SSLOptions.Mode := sslmUnassigned;
      SSLHandler.SSLOptions.VerifyMode := [];
      SSLHandler.SSLOptions.VerifyDepth := 0;

      // Assign the SSL/TLS handler to the SMTP object
      SMTP.IOHandler := SSLHandler;

      // Create a new TIdMessage object
      Msg := TIdMessage.Create(nil);
      try
        // Configure the email message settings
        Msg.From.Text := 'sender@example.com';
        Msg.Recipients.EMailAddresses := 'recipient@example.com';
        Msg.Subject := 'Test Email';
        Msg.Body.Text := 'This is a test email message.';

        // Send the email message using the SMTP object
        SMTP.Connect;
        try
          SMTP.Authenticate('sender@example.com', 'password');
          SMTP.Send(Msg);
        finally
          SMTP.Disconnect;
        end;
      finally
        Msg.Free;
      end;
    finally
      SSLHandler.Free;
    end;
  finally
    SMTP.Free;
  end;
end;
