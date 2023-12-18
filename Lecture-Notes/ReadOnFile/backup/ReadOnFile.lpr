program ReadOnFile;
uses crt;

var
  dosya : TextFile;
  okunan : char;
begin
  clrscr;
  Assign(dosya, 'duvar\bilgiler.txt');
  Reset(dosya);
  while not eof(dosya) do begin
    Read(dosya, okunan);
    Write(okunan);
  end;
  ReadKey;
end.

