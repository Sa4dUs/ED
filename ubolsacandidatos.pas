unit UBolsaCandidatos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, UElementoCandidatos, UHabilidades;
type
TBolsa= array[1..15] of integer;
Function ObjetivoCumplido (var b:Tbolsa):boolean;
Procedure Poneracerob (c:TBolsa);
Procedure UnirBolsas (var b:TBolsa;b1:TBolsa;b2:Tbolsa);
Procedure Candidatoabolsa ( var b:TBolsa; e:TElemento);
implementation
Function ObjetivoCumplido (var b:TBolsa):boolean;
var
i:integer;
comp:boolean;
begin
i:=1;
comp:=true;
while ((i<= 15) and (comp=true)) do
      begin
        comp:=b[i]>1;
        i:=i+1;
      end;
end;
Procedure Poneracerob (c:TBolsa);
var
i:integer;
begin
     for i:=1 to 15 do
         c[i]:=0;
end;
Procedure UnirBolsas (var b:TBolsa;b1:TBolsa;b2:Tbolsa);
var
i:integer;
begin
    for i:=1 to 15 do
        b[i]:= b1[i] + b2[i];
end;
Procedure Candidatoabolsa ( var b:TBolsa; e:TElemento);
var
i:integer;
begin
for i:=1 to 15 do
    if e.habilidades[i]=false then
       b[i]:=0
    else
       b[i]:=1;
end;
end.

