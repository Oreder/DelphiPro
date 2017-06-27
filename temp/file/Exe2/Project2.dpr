program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var f:text;
n,i:integer;
a:array[1..100] of integer;
Begin
assign(f,'data.txt'); reset(f);
i:=1;
Repeat
Readln(f,a[i]);
inc(i);
Until seekEof(f);
n:=i-1;
For i:=1 to n do Writeln(a[i]);
Readln;
End.
