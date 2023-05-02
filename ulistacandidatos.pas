unit UListaCandidatos;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, UElementoCandidatos, uBolsaCandidatos, UHabilidades;
type
TLista=^TNodo;
TNodo= Record
info:TElemento;
sig:^TNodo;
end;
Function TodoCubierto (l:TLista):boolean;
Procedure MontarEquipo (l:TLista; var l2:TLista);
Procedure Construir (var l:TLista;e:TElemento);
Function EsVacia (l:TLista):boolean;
Procedure CrearListaVacia( var l:TLista);
implementation
Function EsVacia (l:TLista):boolean;
begin
 EsVacia:= l=nil;
end;

Function TodoCubierto (l:TLista):boolean;
var
e:TElemento;
aux:^TNodo;
begin
Poneracero(e.habilidades);
aux:=l;
if not EsVacia(l) then
begin
   while ((aux<>nil) and (not HabilidadesLlenas(e))) do       //Para parar antes en caso de que se llene con menos candidatos que los totales
       begin
           begin
             UnionCandidatos(e,aux^.info,aux^.info);
           end;
       aux:=aux^.sig;
       end;
TodoCubierto:= HabilidadesLlenas(e);
end
else
    TodoCubierto:=false;
end;
Procedure MontarEquipo (l:TLista;var l2:TLista);
var
b,b1,b2:Tbolsa;
aux:^TNodo;
begin
CrearListaVacia(l2);
if not EsVacia(l) then
begin
   Poneracerob(b2);
   Poneracerob(b);
   aux:=l;
   while ((aux<>nil) and (not ObjetivoCumplido(b))) do       //Para parar antes en caso de que se llene con menos candidatos que los totales
       begin
           begin
             Candidatoabolsa(b1,aux^.info);
             UnirBolsas(b,b1,b2);
             Construir(l2,aux^.info);
           end;
       end;
end;
end;
Procedure Construir (var l:TLista;e:TElemento);
var
aux:^TNodo;
begin
     new(aux);
     Asignar(aux^.info,e);
     aux^.sig:=l;
     l:=aux;
end;
Procedure CrearListaVacia( var l:TLista);
begin
     l:=nil
end;
end.

