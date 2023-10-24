program NumberPowerCalculator;
VAR
  number, power, result, i: LongInt;

begin
  repeat
    begin
      WriteLn('Ussunu almak istediginiz sayiyi girin (cikmak icin 0 girin):');
      ReadLn(number);

      if number = 0 then
        break;

      WriteLn('Kacinci ussunu almak istersiniz?');
      ReadLn(power);

      if (power < 0) then
      begin
        power:=power*-1;
      end;

      result := 1;
      for i := 1 to power do
      begin
        result := result * number;
      end;

      WriteLn(number, ' uzeri ', power, ' = ', result);
    end;
  until false;
end.

