unit uDepartamento;

{$mode ObjFPC}{$H+}

interface

uses
  uPersona;
type
TDepartamento = RECORD
  Nombre:string;
  Trabajador: ARRAY [1..300] of TPersona;
END;
PROCEDURE  Orden (a,b:string; var precedencia:integer);
PROCEDURE CompararString(var cadena1,cadena2:  string);
Implementation
PROCEDURE  Orden (a,b:string; var precedencia:integer);
begin
 IF a<=b THEN
   precedencia:=-1
 ELSE
   precedencia:=1; //Debería ser Asignar(precedencia,1)...pero me da una de pereza...
end;

PROCEDURE CompararString(var cadena1,cadena2:  string);
var
  aux:string;
  precedencia:integer;
begin
  Orden (cadena1,cadena2,precedencia);
  IF ((precedencia= -1) OR (precedencia=0)) THEN
   begin
     aux:=cadena1;
     cadena1:=cadena2;
     cadena2:=aux;
   end
  ELSE IF precedencia =1 THEN
   begin
     aux:=cadena2;
     cadena2:=cadena1;
     cadena1:=aux;
   end;
end;

end.

