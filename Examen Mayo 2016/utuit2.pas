unit utuit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
TTuit= array [1..140] of char;

Procedure ImprimirTuit (var t:TTuit);

implementation
Procedure ImprimirTuit (var t:TTuit);
var
i:integer;
begin
  for i:=1 to length(t) do
      write(t[i]);
end;

end.

