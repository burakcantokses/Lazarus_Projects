program Matrix2D;
uses crt;

var
  matrix : array[0..5, 0..5] of Integer;
  sum : array[0..5] of Integer;
  i, j : Integer;
begin
  ClrScr;
  WriteLn('SAYILARI GIRMEYE BASLAYIN');
  for i := 1 to 5 do
  begin
       for j := 1 to 5 do
       begin
            WriteLn(i,'. Sutunun ', j, '. SATIRINA SAYI GIRIN: ');
            ReadLn(matrix[i,j]);
            sum[i]:= sum[i] + matrix[i,j];
       end;
  end;

  WriteLn(matrix[1,2]);

  ReadLn;
end.

