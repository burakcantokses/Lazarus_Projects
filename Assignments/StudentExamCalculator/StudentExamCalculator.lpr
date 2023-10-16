program StudentExamCalculator;
uses crt;

var
  studentName, studentSurname: String;
  vize, final: Integer;
  result: real;
  vizeRate: Integer = 40;
  finalRate: Integer = 60;
  choice: char;

begin
  Repeat
    begin
      ClrScr;
      WriteLn('Ogrencinin adini girin.');
      ReadLn(studentName);
      WriteLn('Ogrencinin soyadini girin.');
      ReadLn(studentSurname);
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
    WriteLn('Vize notunuz: ', vize);
    WriteLn('Final notunuz: ', final);
    WriteLn();
    WriteLn('Ortalamaniz: ', result:1:1);
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

