program PasswordGenerator;
uses crt, sysutils;

var
  passwordLevel : Char;
  passwordLength : Integer;

  i : Integer;

function generatePassword(passwordLevel: Char; passwordLength: Integer): String;
var
  i: Integer;
  generatedPassword: String;
  specialChars : Array of Char;
  specialString : String;
  letterChars : Array of Char;
  letters : String;
  randomNumber : Integer;
begin
  generatedPassword := '';
  specialString:='" !"#$%&()*+,-./:;<=>?@[\]^_`{|}~"';
  letters:='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

  SetLength(specialChars, Length(specialString));
  SetLength(letterChars, Length(letters));

  for i := 1 to Length(specialString) do
    specialChars[i - 1] := specialString[i];

  for i := 1 to Length(letters) do
    letterChars[i - 1] := letters[i];

  case passwordLevel of
    'A':
      begin
        for i := 1 to passwordLength do
        begin
          generatedPassword := generatedPassword + IntToStr(Random(10));
        end;
        Result := generatedPassword;
      end;
    'B':
      begin
        for i := 1 to passwordLength do
        begin
          generatedPassword := generatedPassword + Chr(Random(26) + Ord('A'));
        end;
        Result := generatedPassword;
      end;
    'C':
      begin
        for i := 1 to passwordLength do
        begin
          randomNumber:=Random(30);
          if ((randomNumber MOD 2) = 0) then begin
            randomNumber:=Random(30);
            if ((randomNumber MOD 2) = 0) then begin generatedPassword := generatedPassword + IntToStr(Random(10)); Continue; end;
            if ((randomNumber MOD 2) <> 0) then begin generatedPassword := generatedPassword + specialChars[Random(Length(specialChars))]; Continue; end;
          end;
          if ((randomNumber MOD 2) <> 0) then begin generatedPassword := generatedPassword + letterChars[Random(Length(letterChars))]; Continue; end;
        end;
        Result := generatedPassword;
      end;
  else
    Result := 'BILINMEYEN BIR HATA OLUSTU.';
  end;
end;

procedure writeDefaultText;
begin
  ClrScr;
  WriteLn('Sifre olusturucuya hosgeldin.');
  WriteLn();
  WriteLn('Olusturmak istedigin sifrenin menu tusuna tikla.');
  TextColor(2);
  WriteLn('[A] - DUSUK SEVIYE SIFRE (VARSAYILAN UZUNLUK: 6) - SADECE SAYILARDAN OLUSUR.');
  TextColor(6);
  WriteLn('[B] - ORTA SEVIYE SIFRE (VARSAYILAN UZUNLUK: 10) - SADECE KARAKTERLERDEN OLUSUR.');
  TextColor(4);
  WriteLn('[C] - YUKSEK SEVIYE SIFRE (VARSAYILAN UZUNLUK: 14) - SAYI VE KARAKTERLER KARISIK OLUSUR.');
end;

procedure selectLevel;
begin
  TextColor(7);
  WriteLn;
  Write('Seciminiz: ');
  passwordLevel := UpCase(ReadKey);

  if (passwordLevel <> 'A') and (passwordLevel <> 'B') and (passwordLevel <> 'C') then
  begin
    TextColor(4);
    WriteLn('Lutfen gecerli bir secim yapiniz.');
    Delay(400);
    writeDefaultText;
    selectLevel;
  end;

  case passwordLevel of
    'A': passwordLength := 6;
    'B': passwordLength := 10;
    'C': passwordLength := 14;
  end;
end;

function areYouChangePasswordLength: Char;
var
  userChoice: Char;
begin
  repeat
    TextColor(7);
    WriteLn;
    WriteLn('SIFRE UZUNLUGUNU DEGISTIRMEK ISTER MISIN?');
    WriteLn('SUANKI SEVIYENE GORE VARSAYILAN UZUNLUK DEGERI: ', passwordLength);
    WriteLn('Evet ise "E", Hayir ise "H" tusuna bas.');

    userChoice := UpCase(ReadKey);

    if (userChoice <> 'E') and (userChoice <> 'H') then
    begin
      TextColor(4);
      WriteLn('Lutfen gecerli bir secim yapiniz.');
      Delay(400);
    end
    else
      break;

  until true;

  if (userChoice = 'E') or (userChoice = 'H') then
    Result := userChoice
end;


procedure changePasswordLength;
begin
  Write('UZUNLUK KAC OLSUN?: ');
  ReadLn(passwordLength);
end;


begin
  Repeat
    writeDefaultText;
    selectLevel;
    if (areYouChangePasswordLength = 'E') then changePasswordLength;

    WriteLn('                      OLUSTURULAN SIFREN               ');
    TextColor(2);
    WriteLn(generatePassword(passwordLevel, passwordLength));

    Delay(1000);
    WriteLn('YENI SIFRE OLUSTURMAK ICIN BIR TUSA BAS. CIKMAK ICIN "0" TUSUNA BAS.');
    if (ReadKey='0') then break;
  until false;
end.

