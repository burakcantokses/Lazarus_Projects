program ExternalProject;
uses crt;

label
  aMenu,bMenu,cMenu,dMenu;

var
  //SECIM
  choice : string;

  //SONUC
  result : LongInt;
  i : Integer;

  //A
  shortLine, longLine : LongInt;

  //B
  celcius, fahrenheit: real;

  //C
  customArray: array [1..999] of integer;
  total : LongInt;
  sum : real;
  maxInput : integer;


  //D
  urunAdi : string; bFiyat, adet, odenen : real;
begin
  repeat
    begin
        ClrScr;
        WriteLn('[A] - DIKDORTGEN ALAN VE CEVRESINI HESAPLA');
        WriteLn('[B] - SICAKLIK DEGERINI FAHRENHEITE DONUSTUR');
        WriteLn('[C] - DIZININ ELEMANLARININ ORTALAMASINI HESAPLA');
        WriteLn('[D] - MUSTERIYE MAL SATIS ISLEMI YAP');
        WriteLn('[E] - SISTEMI KAPAT');
        ReadLn(choice);
        choice:=UpCase(choice);
    end;

    begin
      case choice of
        'E':
          begin
              WriteLn('UYGULAMA KAPATILIYOR.');
              Delay(1000);
              break
          end;
        'A':
          begin
            aMenu:
            begin
              ClrScr;
              WriteLn('DIKDORTGEN ALAN HESABI YAPMAK ICIN [A] VEYA DIKDORTGEN CEVRE HESABI YAPMAK ICIN [C] TUSUNU GIRIN.');
              ReadLn(choice);
              choice:=UpCase(choice);
              WriteLn('KISA KENARI GIRIN');
              ReadLn(shortLine);
              WriteLn('UZUN KENARI GIRIN');
              ReadLn(longLine);
            end;
              case choice of
                'A':
                  begin
                      WriteLn('KISA KENAR: ', shortLine, 'UZUN KENAR: ', longLine);
                      WriteLn('DIKDORTGEN ALAN HESABINIZ YAPILIYOR.');
                       result:=shortLine*longLine;
                  end;
                'C':
                  begin
                       WriteLn('KISA KENAR: ', shortLine, 'UZUN KENAR: ', longLine);
                       WriteLn('DIKDORTGEN CEVRE HESABINIZ YAPILIYOR.');
                       result:=2*(longLine) + 2*(shortLine);
                  end;
                else GOTO aMenu;
              end;
              Delay(500);
              WriteLn('Sonucunuz: ', result);
              WriteLn('YENIDEN DIKDORTGEN HESABI YAPMAK ICIN [R] TUSUNA BASIN VEYA ANAMENUYE AKTARILMAK ICIN [M] TUSUNA BASIN.');
              case UpCase(ReadKey) of
                'R': goto aMenu;
                'M': Continue;
              end;
              WriteLn('GECERLI BIR GIRIS YAPILMADIGI ICIN ANAMENUYE YONLENDIRILIYORSUNUZ.');
              Continue;
            end;
        'B':
          begin
              bMenu:
               begin
                    WriteLn('SECIM YAPINIZ.');
                    WriteLn('CELCIUS -> FAHRENHEIT ICIN "1" TUSUNA BASIN.');
                    WriteLn('FAHRENHEIT -> CELCIUS ICIN "2" TUSUNA BASIN.');
               end;

               case ReadKey of
                 '1':
                   begin
                      WriteLn('CELCIUS DEGERINI GIRIN.');
                      ReadLn(celcius);
                      fahrenheit := 9 * celcius / 5 + 32;
                      ClrScr;
                      TextColor(2);
                      WriteLn('CELCIUS -> FAHRENHEIT: ', fahrenheit:2:2);
                   end;
                 '2':
                   begin
                      WriteLn('FAHRENHEIT DEGERINI GIRIN.');
                      ReadLn(fahrenheit);
                      celcius := (fahrenheit - 32) / 1.8000;
                      ClrScr;
                      TextColor(2);
                      WriteLn('FAHRENHEIT -> CELCIUS: ', celcius:2:2);
                   end;
                 else GOTO bMenu;
              end;
              Delay(500);
              WriteLn('YENIDEN DERECE HESABI YAPMAK ICIN [R] TUSUNA BASIN VEYA ANAMENUYE AKTARILMAK ICIN [M] TUSUNA BASIN.');
              case UpCase(ReadKey) of
                'R': goto bMenu;
                'M': Continue;
              end;
              WriteLn('GECERLI BIR GIRIS YAPILMADIGI ICIN ANAMENUYE YONLENDIRILIYORSUNUZ.');
              Continue;
          end;
        'C':
          begin
              cMenu:
              begin
               ClrScr;
               WriteLn('KAC ADET SAYI GIRILECEK?');
               ReadLn(maxInput);
               total:=0;
               for i := 1 to maxInput do
                   begin
                        WriteLn(i,'. SAYIYI GIRIN.');
                        ReadLn(customArray[ i-1 ]);
                        total:=total+customArray[ i-1 ];
                   end;
               sum:=total/maxInput;
               Writeln('TOPLAM GIRILEN SAYI ADETI: ', maxInput);
               WriteLn('GIRILEN SAYILARIN TOPLAMI: ', total);
               WriteLn('GIRILEN SAYILARIN ORTALAMASI: ', sum:2:2);
              end;
              Delay(500);
              WriteLn('YENIDEN DIZIYE GIRILEN SAYILARI HESAPLAMAK ICIN [R] TUSUNA BASIN VEYA ANAMENUYE AKTARILMAK ICIN [M] TUSUNA BASIN.');
              case UpCase(ReadKey) of
                'R': goto cMenu;
                'M': Continue;
              end;
              WriteLn('GECERLI BIR GIRIS YAPILMADIGI ICIN ANAMENUYE YONLENDIRILIYORSUNUZ.');
              Continue;
          end;
        'D':
          begin
              dMenu:
              begin
                ClrScr;
                WriteLn('URUN ADINI GIRIN.');
                ReadLn(urunAdi);
                WriteLn('URUNUN BIRIM FIYATINI GIRIN.');
                ReadLn(bFiyat);
                WriteLn('KAC ADET SATIYORSUNUZ?');
                ReadLn(adet);

                odenen:=(bFiyat*adet);
                if (odenen<=3000) then odenen:=odenen - (odenen*0.03);
                if (odenen>3000) and (odenen<=8000) then odenen:=odenen - (odenen*0.10);
                if (odenen>8000) then odenen:=odenen - (odenen*0.15);
                WriteLn('ODENECEK TUTAR: ', odenen:0:2);
              end;

              Delay(500);
              WriteLn('YENIDEN MUSTERIYE MAL SATIS ISLEMI ICIN [R] TUSUNA BASIN VEYA ANAMENUYE AKTARILMAK ICIN [M] TUSUNA BASIN.');
              case UpCase(ReadKey) of
                'R': goto dMenu;
                'M': Continue;
              end;
              WriteLn('GECERLI BIR GIRIS YAPILMADIGI ICIN ANAMENUYE YONLENDIRILIYORSUNUZ.');
              Continue;
          end;
      else ;
      end;
    end

  until false;
end.

