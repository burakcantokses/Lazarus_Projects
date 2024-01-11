program factorialFunc;
uses crt;

function factorial(number : integer) : integer;
var
  i, sum : integer;
begin
  sum:=1;
  for i := number  downto 1 do
  begin
    sum:=sum*i;
  end;
  factorial:=sum;
end;

var
  number : integer;
  result : integer;

begin
  ClrScr;
  Write('Input a number :'); ReadLn(number);
  result:=factorial(number);
  WriteLn('Result: ', result);
  ReadLn;
end.

