program switchCase;
uses crt;
var
  secim : char;
  i : integer;
begin
  WriteLn('Secim tuslayin.');
  ReadLn(secim);
  secim:=UpCase(secim);
  case secim of
    'A': WriteLn('1');
    'D','K':
      begin
           for i := 10 downto 4 do
           begin
                WriteLn(i, ' . sayi');
           end;
           WriteLn('test');
      end;
  else
    exit;
  end;
  ReadLn;
end.

