unit UHabilidades;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;
type
TConjunto= array [1..15] of boolean;
Procedure Union (var c1:TConjunto; var c2:TConjunto; var c3: TConjunto);
Function ConjuntoLLeno (var c:TConjunto):boolean;
Procedure Poneracero (c:TConjunto);
implementation
Procedure Union (var c1:TConjunto; var c2:TConjunto; var c3: TConjunto);
var
i:integer;
begin
for i:=1 to 15 do
    c1[i]:= c2[i] or c3[i];
end;
Function ConjuntoLLeno (var c:TConjunto):boolean;
var
i:integer;
comp:boolean;
begin
comp:=true;
i:=1;
while ((comp= true) or (i<=15)) do
      begin
           comp:=c[i];
           i:=i+1;
      end;
ConjuntoLLeno:=comp;

end;
Procedure Poneracero (c:TConjunto);
var
i:integer;
begin
     for i:=1 to 15 do
         c[i]:=false;
end;

end.

