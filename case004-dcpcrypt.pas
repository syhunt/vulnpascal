uses
  DCPrijndael;

var
  Cipher: TCipher_Rijndael;
begin
  // Create an instance of the cipher object
  Cipher := TCipher_Rijndael.Create(nil);

  try
    // Set the encryption key and mode
    Cipher.InitStr('encryption key', TDCP_sha256); // replace 'encryption key' with your own key
    Cipher.Mode := cmECB

    // Do something with the cipher object...
  finally
    // Free the cipher object
    Cipher.Free;
  end;
end;
