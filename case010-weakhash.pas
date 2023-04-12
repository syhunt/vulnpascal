unit case010-weakhash;

interface

uses
{$IFDEF DXE2_OR_UP}
  {$IFDEF USECROSSVCL}
  WinAPI.Windows,
  {$ENDIF}
  {$IFDEF D10SEATTLE_OR_UP}
  System.Hash,
  {$ENDIF}
  System.Classes, System.SysUtils;
{$ELSE}
  Classes, SysUtils;
{$ENDIF}
implementation

function MD5File(const filename:string): string;
var
  f: TFileStream;
begin
  f := TFileStream.Create(filename, fmOpenRead or fmShareDenyWrite);
  with f do
  begin
    try
      Result := StreamToMD5(f);
    except
      Result := emptystr;
    end;
    Free;
  end;
end;

function StreamToMD5(m: TStream): String;
begin
  {$IFDEF D10SEATTLE_OR_UP}
  result := THashMD5.GetHashString(m);
  {$ELSE}
  // TODO...
  result := emptystr;
  {$ENDIF}
end;

function StreamToSHA1(m: TStream): String;
begin
  {$IFDEF D10SEATTLE_OR_UP}
  result := THashSHA1.GetHashString(m);
  {$ELSE}
  // TODO...
  result := emptystr;
  {$ENDIF}
end;

function MD5Hash(const s: string): string;
begin
  {$IFDEF D10SEATTLE_OR_UP}
  result := THashMD5.GetHashString(s);
  {$ELSE}
  result := string(UTF8string(MD5Hash_Sanders(s)));
  {$ENDIF}
end;

// ------------------------------------------------------------------------//
end.
