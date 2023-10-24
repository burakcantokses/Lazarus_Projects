program MultiplicationTable;
uses crt;
var
  i : Integer;
  number : Integer;
  result : Integer;
begin
  WriteLn('Carpim tablosunu istediginiz sayiyi giriniz');
  Readln(number);

  ClrScr;

  result:=0;
  for i := 1 to 10 do
  begin
       result:=i*number;
       WriteLn(number,'x',i,': ',result);
  end;
  ReadLn;
end.

