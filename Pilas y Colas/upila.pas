unit UPila;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils,uElemento;
type
TPila=^TNodo;
TNodo= Record
  info:TElemento;
  sig:^TNodo;
  end;
Function EsVacia(var p:TPila):boolean;
Procedure CrearVacia(var p:TPila);
Procedure Cima(var p:TPila; var e:TElemento);
Procedure Apilar(var p:TPila; e:TElemento);
Procedure Desapilar(var p:TPila);
Procedure Mostrarporpantalla(var p:TPila);


implementation
Function EsVacia(var p:TPila):boolean;
begin
EsVacia:= p=nil;
end;

Procedure CrearVacia(var p:TPila);
begin
p:=nil;
end;
Procedure Cima(var p:TPila; var e:TElemento);
begin
if not EsVacia(p) then
   Asignar(e,p^.info);
end;
Procedure Apilar(var p:TPila;  e:TElemento);
var
aux:TPila;
begin
     new(aux);
     aux^.info:=e;
     aux^.sig:=p;
     p:=aux;
end;
Procedure Desapilar( var p:TPila);
var
aux:^TNodo;
begin
     if not EsVacia(p) then
        begin
     aux:=p;
     p:= aux^.sig;
     dispose(aux);
     aux:=nil;
     end;
        end;
Procedure Mostrarporpantalla(var p:TPila);
var
aux:^Tnodo;

begin
  aux:=p;
  while not EsVacia(aux) do
        begin
       Mostrar(aux^.info);
        aux:=aux^.sig;
        end;
end;



end.

