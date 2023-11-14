program SingleOrDouble;
uses crt;

var
  singleCount, doubleCount, maxNumber,i : Integer;
  numbers : array[0..999] of Integer;
begin
  ClrScr;
  WriteLn('KAC TANE SAYI GIRILSIN?');
  ReadLn(maxNumber);

  doubleCount:=0; singleCount:=0;
  for i := 1 to maxNumber do
  begin
       WriteLn(i,'. SAYIYI GIRIN: ');
       ReadLn(numbers[i]);
       if (numbers[i] mod 2 = 0) then
       begin
         doubleCount:=doubleCount+1;
         Continue;
       end;
       singleCount:=singleCount+1;
  end;

  WriteLn('CIFTLERIN ADET SAYISI: ', doubleCount);
  WriteLn('TEKLERIN ADET SAYISI: ', singleCount);

  ReadLn;
end.

