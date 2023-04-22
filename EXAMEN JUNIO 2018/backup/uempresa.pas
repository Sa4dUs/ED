unit uEmpresa;

{$mode ObjFPC}{$H+}

interface

uses
 uDepartamento,uPersona;
CONST
  INI = 1;
  MAX = 100000;
TYPE
  TEmpresa = RECORD
    CIF: ARRAY [INI..MAX] of TDepartamento;
    Dueno:ARRAY [1..3] OF  TPersona;//raiz
    ti:^TEmpresa;//hi
    td:^TEmpresa;//hd
end;
TLista= RECORD
    Apuntao:string;
     sig:integer;
 end;
    a = TEmpresa;
PROCEDURE Abuelos (a:TEmpresa; var l:TLista);
PROCEDURE CrearVacia (var tope:integer);
PROCEDURE Construir (a:TEmpresa; d:TDepartamento; precedencia:integer;tope:integer);
implementation
PROCEDURE Abuelos (a:TEmpresa; var l:TLista);
var
  i,e:integer;
  aux:integer;
begin
  FOR i:=1 TO 3 DO
    BEGIN
      aux:=a.Dueno[i].Edad;
       IF (aux >= 65) THEN
          begin
            l.Apuntao:=a.Dueno[i].Nombre;
            l.sig:=l.sig+1;
          end;
    end;
  FOR i:=1 TO MAX DO
    FOR e:=1 TO 300 DO
      begin
       IF a.CIF[i].Trabajador[e].Edad >= 65 THEN
          l.Apuntao:= a.CIF[i].Trabajador[e].Nombre;
          l.sig:=l.sig+1;
      end;
end;
PROCEDURE CrearVacia (tope:integer);
begin
  IF tope<MAX THEN
     tope:=tope+1;
end;


PROCEDURE Construir (a:TEmpresa; d:TDepartamento; precedencia:integer;tope:integer);
var
  b,c,i:integer;
begin
  b:=tope;
  c:=b-1;
  CrearVacia (tope);
  FOR i:=1 TO tope DO
    begin
      CompararString(a.CIF[b].Nombre, a.CIF[c].Nombre);
      b:=b-1;
      c:=c-1;
    end;
end;

end.

