uses
  Xml.XMLDoc, Xml.Win.msxmldom;

var
  XmlDoc: TXmlDocument;
begin
  XmlDoc := TXmlDocument.Create(nil);
  try
    XmlDoc.DOMVendor := GetDOM('MSXML');
    // Load or manipulate the XML document here

  finally
    XmlDoc.Free;
  end;
end;
