program CarParkApplication;
uses crt, sysutils;

var
  parkKapasitesi : integer;
  parkKodlari : array of Integer;
  plakalar : array of String;
  aracTurleri : array of byte;
  aracGirisTarihleri : array of TDateTime;
  aracCikisTarihleri : array of TDateTime;

  girisKayitDosyaAdi : string;
  cikisKayitDosyaAdi : string;
  girisDosya : Text;
  cikisDosya : Text;

  programAkisi : boolean;

procedure aracGirisKayit(parkKodu : integer; plaka : string; aracTuru : byte; girisTarihi : TDateTime);
begin
   Assign(girisDosya, girisKayitDosyaAdi);
   Append(girisDosya);
   WriteLn(girisDosya, '======================================================');
   WriteLn(girisDosya, 'Park Kodu: ',parkKodu);
   WriteLn(girisDosya, 'Plaka: ',plaka);
   WriteLn(girisDosya, 'Arac Turu: ',aracTuru);
   WriteLn(girisDosya, 'Giris Tarihi: ',FormatDateTime('dd.mm.yyyy hh:nn:ss', girisTarihi));
   Close(girisDosya);
   WriteLn();
   WriteLn('Aracin otoparka girisi veri tabanina kaydedildi.');
end;

function musaitParkKodu: Integer;
begin
   Randomize;
   Result:=Random(Length(parkKodlari));
end;

procedure aracGiris;
var
  parkKodu : integer;
  plaka : string;
  aracTuru : byte;
  girisTarihi : TDateTime;
  onay : char;
begin
  ClrScr;
  Write('Aracin Plakasini Girin: '); ReadLn(plaka);
  WriteLn('[1]: Motor');
  WriteLn('[2]: Araba');
  WriteLn('[3]: Kamyon');
  Write('Arac Turunun Kodunu Girin: '); ReadLn(aracTuru);
  WriteLn('Musait bir park yeri bulunuyor.');
  Delay(250);
  WriteLn('Musait bir park yeri bulunuyor..');
  Delay(250);
  WriteLn('Musait bir park yeri bulunuyor...');
  parkKodu:=musaitParkKodu;
  WriteLn('Park Kodunuz: ', parkKodu);
  girisTarihi:=Date + Time;
  WriteLn('Giris Tarihi: ', FormatDateTime('dd.mm.yyyy hh:nn:ss', girisTarihi));
  WriteLn();
  Repeat
    Writeln('Kayit Icin Onayliyor Musunuz? [E] - [H]');
    onay:=UpCase(ReadKey);
    if (onay = 'E') then
       begin
         parkKodlari[parkKodu]:=-1;
         aracGirisKayit(parkKodu, plaka, aracTuru, girisTarihi);
         Break;
       end;
    if (onay <> 'E') then
       begin
         WriteLn('LUTFEN GECERLI KARAKTERLERE BASIN. [E] - [H]');
         Delay(500);
       end;
  until onay = 'H';
end;

procedure menuSecim;
var
  secim : Char;
begin
  WriteLn();
  WriteLn('Gitmek istediginiz menu tusuna basin.');
  secim:=ReadKey;
  if (secim <> '1') and (secim <> '2') and (secim <> '3') and (secim <> '4') and (secim <> '5') then
  begin
    WriteLn('LUTFEN GECERLI BIR MENU TUSUNA BASIN!!!!!!!!!');
    Delay(1000);
  end;
  case secim of
    '1':
      begin
         aracGiris;
      end;
    '2':
      begin

      end;
    '3':
      begin


      end;
    '4':
      begin


      end;
    '5':
      begin


      end
  else
    begin
      WriteLn('Bilinmeyen bir hata olustu. Tekrar deneyin.');
      Delay(500);
    end;
  end;
end;

procedure menuYoneticisi;
begin
  ClrScr;
  WriteLn('Arac Otopark Yonetim Sistemine Hosgeldiniz.');
  WriteLn();
  WriteLn('[1] - Arac Girisi Yap.');
  WriteLn('[2] - Arac Cikisi Yap.');
  WriteLn('[3] - Parkta Bulunan Araclari Listele.');
  WriteLn('[4] - Kayitli Tum Araclari Temizle.');
  WriteLn('[5] - Guvenli Bir Sekilde Uygulamadan Cikis Yap.');
end;

procedure parkKodlariOlustur;
var
  i : integer;
begin
  for i := 1 to Length(parkKodlari) do
  begin
    parkKodlari[i]:=i;
  end;
end;

function veriDosyalariniKontrolEt(var dosya: TEXT; dosyaAdi: string): Boolean;
begin
  Assign(dosya, dosyaAdi);
  {$I-}
  Reset(dosya);
  {$I+}
  if IOResult <> 0 then
    Result := false
  else
  begin
    Close(dosya);
    Result := true;
  end;
end;

procedure uygulamaAyarlari;
var
  kontrol: boolean;
begin
  parkKapasitesi := 10;
  girisKayitDosyaAdi := 'Giris.txt';
  kontrol := veriDosyalariniKontrolEt(girisDosya, girisKayitDosyaAdi);
  if not kontrol then
  begin
    FileCreate(girisKayitDosyaAdi);
    Close(girisDosya);
  end;

  cikisKayitDosyaAdi := 'Cikis.txt';
  kontrol := veriDosyalariniKontrolEt(cikisDosya, cikisKayitDosyaAdi);
  if not kontrol then
  begin
    FileCreate(cikisKayitDosyaAdi);
    Close(cikisDosya);
  end;

  SetLength(parkKodlari, parkKapasitesi);
  SetLength(plakalar, parkKapasitesi);
  SetLength(aracTurleri, parkKapasitesi);
  SetLength(aracGirisTarihleri, parkKapasitesi);
  SetLength(aracCikisTarihleri, parkKapasitesi);

  parkKodlariOlustur;
end;


begin
  uygulamaAyarlari;
  Repeat;
    menuYoneticisi;
    menuSecim;
  until false;
end.

