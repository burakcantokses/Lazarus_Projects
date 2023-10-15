program TemperatureConverter;
uses crt;

var
  celcius, fahrenheit: real;
  choice: byte;

begin
  repeat
    ClrScr;
    TextColor(7);
    writeln('Secim yapiniz.');
    writeln('Celcius -> Fahrenheit icin "1"');
    writeln('Fahrenheit -> Celcius icin "2"');
    readln(choice);

    if (choice = 1) then
    begin
      ClrScr;
      writeln('Celcius degerini girin.');
      readln(celcius);
      fahrenheit := 9 * celcius / 5 + 32;
      ClrScr;
      TextColor(2);
      writeln('Celcius -> Fahrenheit: ', fahrenheit:2:2);
      TextColor(0);
      writeln('Celcius -> Fahrenheit: ', fahrenheit:2:2);
    end
    else if (choice = 2) then
    begin
      ClrScr;
      writeln('Fahrenheit degerini girin.');
      readln(fahrenheit);
      celcius := (fahrenheit - 32) / 1.8000;
      ClrScr;
      TextColor(2);
      writeln('Fahrenheit -> Celcius: ', celcius:2:2);
    end
    else
    begin
      ClrScr;
      TextColor(4);
      writeln('Gecerli bir secim yapmadiniz!');
      Delay(1000);
      Continue;
    end;

    TextColor(7);
    writeln;
    writeln;
    writeln('Ana menuye donmek icin "0", uygulamayi kapatmak icin "1" girin.');
    readln(choice);

    if (choice = 1) then
      break;

  until false;
end.

