unit UCola; //Implementado con Cabecera y final 

{$mode ObjFPC}{$H+}






interface
uses
  UString;
type
TCola= record
ini:^TNodo;
fin:^TNodo;
end;

TNodo=record
info:TElemento;
sig:^TNodo;
ant:^TNodo;
end;


Function EsVacia (c:Tcola):boolean;
Procedure CrearVaciac(var c:Tcola);
Procedure Encolar (var c:Tcola;e:TElemento);/// Insertar FInal
Procedure Desencolar (var c:Tcola;e:TElemento); /// Borrar por el principio
Function Pertenece (var c:TCola;e:TElemento):boolean;
Procedure Mostrarc(c:TCola);



implementation
Function EsVacia (c:Tcola):boolean;
begin
     EsVacia:= c.ini=nil;
end;
Procedure CrearVaciac(var c:Tcola);
begin
     c.ini:=nil;
     c.fin:=nil;
end;
Procedure Encolar (var c:Tcola;e:TElemento);
var
aux:^TNodo;
        begin
           new(aux);
           Asignar(aux^.info,e);
           aux^.ant:=c.fin;
           c.fin^.sig:=aux;
           c.fin:=aux;
           aux^.sig:=nil;
        end;
end;
Procedure Desencolar (var c:Tcola;e:TElemento);
var
aux:^TNodo;
begin
     if Not EsVacia(c) then
        begin
           aux:=c.ini;
           c.ini:=c.ini^.sig;
           c.ini^.ant:=nil;
           dispose(aux);
           aux:=nil;
        end;
end;
Function Pertenece (var c:TCola;e:TElemento):boolean;
var
aux:^TNodo;
comp:boolean;
begin
aux:=c.ini;
comp:=false;
while ((aux<>nil) and (comp=false)) do
      begin
        comp:=EsIgual(aux^.info,e);
        aux:=aux^.sig;
      end;
end;
Procedure Mostrarc(c:Tcola);
var
aux:^TNodo;
begin
   aux:=c.ini;
   while aux<>nil do
         begin
           write(aux^.info);
           aux:=aux^.sig;
         end;
end;



end.

