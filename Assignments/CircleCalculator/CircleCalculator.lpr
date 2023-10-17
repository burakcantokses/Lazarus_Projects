program CircleCalculator;
uses crt;

var
  choice : char;
  pi : real = 3.14;
  result : real;
  radius : real;

begin
  Repeat
    ClrScr;
    TextColor(7);
    WriteLn('Secim yapiniz.');
    WriteLn('Alan hesaplamak icin "A" tusuna basin.');
    WriteLn('Cevre hesaplamak icin "C" tusuna basin.');
    choice := ReadKey();

    if (choice = 'A') or (choice = 'a') then
      begin
        ClrScr;
        WriteLn('Yaricapi girin.');
        ReadLn(radius);
        result := pi * (radius * radius);
        ClrScr;
        TextColor(2);
        WriteLn('Dairenin alani: ', result:3:3);
      end
    else if (choice = 'C') or (choice = 'c') then
      begin
        ClrScr;
        WriteLn('Yaricapi girin.');
        ReadLn(radius);
        result := 2 * pi * radius;
        ClrScr;
        TextColor(2);
        WriteLn('Dairenin cevresi: ', result:3:3);
      end
    else
      begin
        ClrScr;
        TextColor(4);
        writeln('Gecerli bir secim yapmadiniz!');
        Delay(1000);
      end;

    TextColor(7);
    writeln;
    writeln;
    writeln('Ana menuye donmek icin "M", uygulamayi kapatmak icin "E" tusuna basin.');
    choice := ReadKey();

    if (choice = 'E') or (choice = 'e') then
      break;

  until false;
end.

