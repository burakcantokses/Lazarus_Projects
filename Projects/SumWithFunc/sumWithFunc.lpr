program sumWithFunc;
uses crt;
function sum(number1, number2 : integer) : integer;
begin
  Result:=number1+number2;
end;

var
  number1, number2, result : Integer;

begin
  ClrScr;
  Write('Please input first number: '); ReadLn(number1);
  Write('Please input first number: '); ReadLn(number2);
  result:=sum(number1, number2);
  WriteLn('Result: ', result);
  ReadLn;
end.

