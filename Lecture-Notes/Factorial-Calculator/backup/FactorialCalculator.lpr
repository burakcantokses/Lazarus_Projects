//klavyeden girilen bir sayının faktoriyelini hseaplayınız. Girilen sayı 1 ile 10 arasında değilse uyararak tekrardan sayı girişini isteyin.
//
program FactorialCalculator;
uses crt;
label MainMenu;
var
  number : Integer;
  i : Integer;
  result : LongInt;
begin
  MainMenu:
    WriteLn('Sayi giriniz.');
    ReadLn(number);
    if (number < 0) or (number>10)  then
    begin
      WriteLn('Lutfen 1-10 arasinda bir sayi girin.');
      goto MainMenu;
    end;
    ClrScr;
    result:=1;
    for i := 1 to number do
    begin
      result:=result*i;
    end;
    WriteLn(number,'! : ',result);

    ReadLn;
end.

