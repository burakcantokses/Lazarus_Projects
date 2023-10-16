program CircleCalculator;
uses crt;

var
  choice : char;
  pi : real = 3.14;
  radius : Integer;
begin
  Repeat
    ClrScr;
    TextColor(7);
    WriteLn('Secim yapiniz.');
    WriteLn('Alan hesaplamak icin "A" tusuna basin.');
    WriteLn('Cevre hesaplamak icin "C" tusuna basin.');
    choice := ReadKey();

    if (choice = 'A') then
       WriteLn('blabla');
    else if (choice = 'C') then
       WriteLn('blabla');
    else
       begin
         ClrScr;
         TextColor(4);
         writeln('Gecerli bir secim yapmadiniz!');
         Delay(1000);
         Continue;
       end

    TextColor(7);
    writeln;
    writeln;
    writeln('Ana menuye donmek icin "0", uygulamayi kapatmak icin "1" girin.');
    readln(choice);

    if (choice = 1) then
      break;

  until false;
end.

