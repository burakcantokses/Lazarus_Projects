program randomNumberGen;
uses crt;

function createRandomNumber(max : integer) : integer;
begin
  Randomize;
  Result:=Random(max);
end;

var
  max, randomNumber : integer;
begin
  ClrScr;
  Write('Random Number Limit: '); ReadLn(max);
  randomNumber:=createRandomNumber(max);
  WriteLn('Random Number: ', randomNumber);
  ReadLn;
end.

