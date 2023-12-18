program soru;
uses crt, SysUtils;

var
   ogrenciAd, ogrenciSoyad, ders : string;
   ogrenciNumara, vizeNot, finalNot : integer;
   secim, okunanVeri : char;
   ortalama : real;
   gecti : boolean;

   veriDosyasiAdi : string;

procedure menuyuListele;
begin
  ClrScr;
  WriteLn('1- OGRENCI NOT HESAPLAMA (KAYIT)');
  WriteLn('2 - OGRENCI NOT GORUNTULE');
  WriteLn('3 - CIKIS');
end;

procedure menuSec;
begin
  WriteLn('Menu seciminizi yapin: '); ReadLn(secim);
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
end;

procedure veriKaydet(ogrenciAd, ogrenciSoyad, ders : string; ogrenciNumara : Integer; ortalama : Real; gecti : Boolean);
var
   veriDosyasi : text;
begin
   ClrScr;
   Assign(veriDosyasi, veriDosyasiAdi);
   Append(veriDosyasi);
   Writeln(veriDosyasi,'==========================================================');
   Writeln(veriDosyasi,'Ogrenci_Numara:"',ogrenciNumara,'"');
   Writeln(veriDosyasi,'Ogrenci_Adi:"',ogrenciAd,'"');
   Writeln(veriDosyasi,'Ogrenci_Soyadi:"',ogrenciSoyad,'"');
   Writeln(veriDosyasi,'Ders_Adi:"',ders,'"');
   Writeln(veriDosyasi,'Ogrenci_Ortalama:"',ortalama:0:0,'"');
   if gecti=true then Writeln(veriDosyasi,'GECTI');
   if gecti=false then Writeln(veriDosyasi,'KALDI');
   Writeln(veriDosyasi,'==========================================================');
   Close(veriDosyasi);
end;

procedure veriListele(okunanVeriDosyasiAdi : String);
var
   veriDosyasi : Text;
begin
   ClrScr;
   Assign(veriDosyasi, okunanVeriDosyasiAdi);
   WriteLn(okunanVeriDosyasiAdi);
   ReadLn;
   while not eof(veriDosyasi) do
   begin
      Read(veriDosyasi, okunanVeri); Write(okunanVeri);
   end;
end;

procedure hesaplaGectiKaldi(vize, final : Integer);
begin
 ortalama:=((vize*0.30) + (final*0.70)) / 2;
 if ortalama >= 60 then gecti:=true;
 if ortalama < 60 then gecti:=false;
end;

begin
  menuyuListele;
  menuSec;
  veriDosyasiAdi:='veriTabani.txt';
     case secim of
     '1':
       begin
          veriGiris;
          hesaplaGectiKaldi(vizeNot, finalNot);
          veriKaydet(ogrenciAd, ogrenciSoyad, ders, ogrenciNumara, ortalama, gecti);
       end;
     '2':
       begin
          veriListele(veriDosyasiAdi);
       end;
   else ;
   end;
     ReadLn;
end.

