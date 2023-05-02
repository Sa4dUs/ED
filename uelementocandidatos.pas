unit UElementoCandidatos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, UHabilidades;
type
TElemento= Record
nombre:string;
apellidos:string;
id:integer;
habilidades:TConjunto;
end;
Procedure UnionCandidatos (var e1:TElemento; e2:TElemento;e3:TElemento);
Function HabilidadesLlenas (e:TElemento):boolean;
Procedure Asignar (var e1:TElemento;e2:TElemento);

implementation
Procedure UnionCandidatos (var e1:TElemento; e2:TElemento;e3:TElemento);
begin
  Union(e1.habilidades,e2.habilidades,e3.habilidades);
end;
Function HabilidadesLlenas (e:TElemento):boolean;
begin
   HabilidadesLlenas:= ConjuntoLleno(e.habilidades);
end;
Procedure Asignar (var e1:TElemento;e2:TElemento);
var
c:TConjunto;
begin
   Poneracero(c);
   e1.nombre:=e2.nombre;
   e1.apellidos:=e2.apellidos;
   Union(e1.habilidades,c,e2.habilidades);
end;

end.

