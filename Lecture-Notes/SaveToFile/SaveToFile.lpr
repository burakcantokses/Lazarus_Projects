program SaveToFile;
uses crt;

var
  dosya:Text;
  ad, soyad : string;
begin
  Assign(dosya, 'veri.txt');
  Append(dosya);
  Write('Ad: '); ReadLn(ad);
  Write('Soyad: '); ReadLn(soyad);
  WriteLn(dosya, ad, ' ', soyad);
  Close(dosya);
  WriteLn('Bilgileriniiz kaydedildi.');
end.

