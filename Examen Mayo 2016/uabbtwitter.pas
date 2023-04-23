unit UABBtwitter;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils,uhashtag2,ulistatuits2,utuit2;
type
TABB= ^TNodo3;
TNodo3=Record
info:THashtag;
hi:^TNodo3;
hd:^TNodo3;
end;
Procedure MostrarArbol (a:TABB);
Function EsVacioArbol (a:TABB):boolean;
Procedure Raiz (a:TAAB,var r:THashtag);
Procedure HijoDcho (a:TAAB,var d:TAAB);
Procedure HijoIzqdo (a:TAAB,var i:TAAB);
Procedure AsignarA (var a:TAAB, b:TAAB);

implementation
Procedure MostrarArbol (a:TABB);
var
r:THashtag;
d,i:^TNodo3;
begin
  if not EsVacioArbol(a) then
     begin
       Raiz(a,r);
       HijoIzqdo(a,i);
       HijoDcho(a,d);
       MostrarHashtag (r); //Lo leemos en Preorden
       MostrarArbol(i);
       MostrarArbol(d);
     end;

end;
Function EsVacioArbol (a:TABB):boolean;
begin
  EsVacioArbol:= a=nil;
end;
Procedure Raiz (a:TAAB,var r:THashtag);
begin
if not EsVAcioArbol(a) then
   begin
     Asignar(r,a^.info);
   end;
end;
Procedure HijoDcho (a:TAAB,var d:TAAB);
begin
if not EsVAcioArbol(a) then
   begin
     Asignar(d,a^.hd);
   end;
end;
Procedure HijoIzqdo (a:TAAB,var i:TAAB);
begin
if not EsVAcioArbol(a) then
   begin
     Asignar(i,a^.hi);
   end;
end;
Procedure AsignarA (var a:TAAB, b:TAAB);
begin
if not EsVAcioArbol(b) then
   begin
   Asignar(b^.info,a^.info);
   AsignarA (b^.hi,a^.hi);
   AsignarA (b^.hd,a^.hd);
    end;
end.

