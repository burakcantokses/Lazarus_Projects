program FibonacciProject;
uses crt;

var
  i : integer;
  fibonacci : array[0..15] of Integer;

begin
  ClrScr;
  fibonacci[0]:=1;
  fibonacci[1]:=2;
  for i := 1 to 50 do
  begin
       fibonacci[i]:=fibonacci[i-1]+fibonacci[i-2];
  end;
  for i := 1 to 50 do
  begin
       WriteLn(fibonacci[i]);
  end;
  ReadLn;
end.

