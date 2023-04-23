unit ulistatuits2;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils,utuit2;
type
TListaTuit=^TNodo;
TNodo= record
info:TTuit;
sig:^TNodo;
end;

Function EsVacia(l:TListaTuit):boolean;
Procedure ImprimirLista (l:TListaTuit);
Function LongitudLista(l:TListaTuit):integer;

implementation
Function EsVacia(l:TListaTuit):boolean;
begin
  EsVacia:= l=nil;
end;
Procedure ImprimirLista (l:TListaTuit);
begin
  if not EsVacia(l) then
     begin
       while l<> nil do
       begin
       ImprimirTuit(l^.info);
       writeln();      // Para que haya cierta separación entre los tuits
       l:=l^.sig;
       end;
     end
  else
      writeln('ERROR, no existen tuits con este hashtag');
end;
Function LongitudLista(l:TListaTuit):integer;
var
contador:integer;
begin
if not EsVacia(l) then
   begin
     contador:=1;
     while l<> nil do
           begin
                l:=l^.sig;
                contador:=contador+1;
           end;
     LongitudLista:=contador;
   end
else
LongitudLista:=0;
end;


end.

