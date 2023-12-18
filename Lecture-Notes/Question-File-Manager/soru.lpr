program soru;
uses crt, SysUtils;

var
   ogrenciAd, ogrenciSoyad, ders : string;
   ogrenciNumara, vizeNot, finalNot : integer;
   secim : string;
   ortalama : real;
   gecti : boolean;

   veriDosyasiAdi : string;

function secimYap(mesaj : String; cevap1, cevap2 : char): Boolean;
begin
   Write(mesaj); WriteLn(' - [', cevap1,'] / [', cevap2, ']');
   secim:=UpperCase(ReadKey);
   if secim=cevap1 then Result:=true;
   if secim<>cevap1 then Result:=false;;
end;

procedure veriKaydet(ogrenciAd, ogrenciSoyad, ders: string; ogrenciNumara: Integer; ortalama: Real; gecti: Boolean);
var
  veriDosyasi: Text;
begin
  ClrScr;
  Assign(veriDosyasi, veriDosyasiAdi);
  try
    Append(veriDosyasi);
    Writeln(veriDosyasi, '==========================================================');
    Writeln(veriDosyasi, 'Ogrenci_Numara:"', ogrenciNumara, '"');
    Writeln(veriDosyasi, 'Ogrenci_Adi:"', ogrenciAd, '"');
    Writeln(veriDosyasi, 'Ogrenci_Soyadi:"', ogrenciSoyad, '"');
    Writeln(veriDosyasi, 'Ders_Adi:"', ders, '"');
    Writeln(veriDosyasi, 'Ogrenci_Ortalama:"', ortalama:0:0, '"');
    if gecti then
      Writeln(veriDosyasi, 'GECTI')
    else
      Writeln(veriDosyasi, 'KALDI');
    WriteLn('Veri tabanina basariyla kaydedildi.');
  finally
    Close(veriDosyasi);
  end;
end;

procedure veriListele(okunanVeriDosyasiAdi: String);
var
  veriDosyasi: Text;
  okunanVeri: string;
begin
  ClrScr;
  Assign(veriDosyasi, okunanVeriDosyasiAdi);
  Reset(veriDosyasi);
  while not eof(veriDosyasi) do
  begin
    ReadLn(veriDosyasi, okunanVeri);
    WriteLn(okunanVeri);
  end;
  Close(veriDosyasi);
end;

procedure hesaplaGectiKaldi(vize, final : Integer);
begin
 ortalama:=((vize*0.30) + (final*0.70)) / 2;
 if ortalama >= 60 then gecti:=true;
 if ortalama < 60 then gecti:=false;
end;

procedure veriGiris;
begin
  ClrScr;
  Write('OGRENCI NUMARA GIRIN: '); ReadLn(ogrenciNumara);
  Write('OGRENCI ADINI GIRIN: '); ReadLn(ogrenciAd);
  Write('OGRENCI SOYAD GIRIN: '); ReadLn(ogrenciSoyad);
  Write('OGRENCI DERS GIRIN: '); ReadLn(ders);
  Write('OGRENCI VIZE NOTUNU GIRIN: '); ReadLn(vizeNot);
  Write('OGRENCI FINAL NOTUNU GIRIN: '); ReadLn(finalNot);
  hesaplaGectiKaldi(vizeNot, finalNot);
  veriKaydet(ogrenciAd, ogrenciSoyad, ders, ogrenciNumara, ortalama, gecti);
end;

procedure menuyuListele;
begin
  ClrScr;
  WriteLn('1- OGRENCI NOT HESAPLAMA (KAYIT)');
  WriteLn('2 - OGRENCI NOT GORUNTULE');
  WriteLn('3 - CIKIS');
end;

procedure menuSec;
begin
  WriteLn('Menu seciminizi yapin.');
  secim:=UpperCase(ReadKey);
  case secim of
     '1':
       begin
         repeat
           veriGiris;
           Delay(500);
         until not secimYap('Yeni kayit yapilsin mi?', 'E', 'H');
       end;
     '2':
       begin
          veriListele(veriDosyasiAdi);
          WriteLn();
          if (secimYap('Anamenuye donmek icin "B" tusuna bas. Uygulamayi kapatmak icin "E" tusuna bas.', 'B', 'E') = false) then Exit;
       end;
     '3':
       begin
           WriteLn('LUTFEN BEKLEYINIZ BIRAZDAN KAPATILACAKTIR.');
           Delay(2500);
           Exit;
       end;
   else ;
  end;
  menuyuListele;
  menuSec;
end;

procedure projeBaslat;
var
  baslat : Boolean;
begin
  baslat:= secimYap('MENULERI LISTELEMEK ICIN "E" TUSUNA BASIN. CIKMAK ICIN "H" TUSUNA BASIN.', 'E', 'H');
  if baslat = true then
  begin
    menuyuListele;
    menuSec;
  end
  else if baslat = false then
    Exit;
end;


begin
  veriDosyasiAdi:='veriTabani.txt';
  projeBaslat;
end.

