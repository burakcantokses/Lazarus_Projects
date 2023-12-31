program StudentExamCalculator;
uses crt;

var
  studentName, studentSurname, lesson, point: String;
  vize, final: Integer;
  result: real;
  vizeRate: Integer = 40;
  finalRate: Integer = 60;
  choice: char;
  pointColor: byte;

begin
  Repeat
    begin
      ClrScr;
      WriteLn('Ogrencinin adini girin.');
      ReadLn(studentName);
      WriteLn('Ogrencinin soyadini girin.');
      ReadLn(studentSurname);
      Write('Ders nedir: ');
      ReadLn(lesson);
    end;

    begin
      ClrScr;
      TextColor(9);
      WriteLn('Merhaba ', studentName, ' ', studentSurname);
      WriteLn();
      TextColor(LightBlue);
      WriteLn('Varsayilan vize orani: ', vizeRate, ' - Varsayilan final orani: ', finalRate);
      WriteLn('Bu degerleri degistirmek isterseniz "Y" tusuna basin. Degistirmek istemiyorsaniz herhangi bir tusa basin.');
      choice := ReadKey();
      if (choice = 'Y') or (choice = 'y') then
        begin
          Repeat
            ClrScr;
            TextColor(Yellow);
            WriteLn('Yeni vize oraninizi girin: ');
            Read(vizeRate);
            WriteLn('Yeni final oraninizi girin: ');
            Read(finalRate);
            if (vizeRate >= 10) and (vizeRate <= 90) and (finalRate >= 10) and (finalRate <= 90) then
              break;
            TextColor(4);
            WriteLn('Final ve Vize orani 10-90 arasinda olmalidir.');
            Delay(1000);
          until false;
        end;

      Repeat
        ClrScr;
        TextColor(LightBlue);
        WriteLn('Vize notunuzu girin: ');
        Read(vize);
        WriteLn('Final notunuzu girin: ');
        Read(final);
        if (vize >= 0) and (vize <= 100) and (final >= 0) and (final <= 100) then
          break;
        TextColor(4);
        WriteLn('Notlar 0-100 arasinda olmalidir.');
        Delay(1000);
      until false;
    end;

    ClrScr;
    TextColor(2);
    result := (vize * vizeRate / 100) + (final * finalRate / 100);

    if (result >= 0) and (result <= 29) then
    begin
      point := 'FF';
      pointColor := RED;
    end
    else if (result >= 30) and (result <= 40) then
    begin
      point := 'FD';
      pointColor := RED;
    end
    else if (result >= 41) and (result <= 49) then
    begin
      point := 'DD';
      pointColor := RED;
    end
    else if (result >= 50) and (result <= 59) then
    begin
      point := 'DC';
      pointColor := LightRed;
    end
    else if (result >= 60) and (result <= 70) then
    begin
      point := 'CC';
      pointColor := LightRed;
    end
    else if (result >= 71) and (result <= 79) then
    begin
      point := 'BC';
      pointColor := YELLOW;
    end
    else if (result >= 80) and (result <= 89) then
    begin
      point := 'BB';
      pointColor := YELLOW;
    end
    else if (result >= 90) and (result <= 94) then
    begin
      point := 'BA';
      pointColor := GREEN;
    end
    else if (result >= 95) and (result <= 100) then
    begin
      point := 'AA';
      pointColor := GREEN;
    end;


    WriteLn(lesson, ' dersi icin notlariniz asagidaki gibidir.');
    WriteLn('Vize notunuz: ', vize);
    WriteLn('Final notunuz: ', final);
    WriteLn();
    WriteLn('Ortalamaniz: ', result:1:1);
    TextColor(pointColor);
    WriteLn('Notunuz: ', point);
    Delay(2000);

    TextColor(7);
    writeln;
    writeln;
    WriteLn('Ana menuye donmek icin "M", uygulamayi kapatmak icin "E" tusuna basin.');
    choice := ReadKey();

    if (choice = 'E') or (choice = 'e') then
      break;
  until false;
end.

