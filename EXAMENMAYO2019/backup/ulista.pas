unit uLista;
interface
TYPE
TLista = ^TNodo;
TNodo = RECORD
 e: integer;
 sgte: TLista;
END;
l=TLista;
PROCEDURE  Sumatorio (e:integer; l:TLista);
implementation
PROCEDURE Sumatorio (e:integer; l:TLista);
var
  tope,i,n:integer;
  resultado:integer;
begin
  readln(n);
  IF n=0 THEN
   writeln ('[]')
  ELSE
   begin
    tope:=e;
    FOR i:=1 TO tope-1 DO
     begin
       resultado:=resultado+(l^.e);
       l^.sgte:=l^.sgte+1;
     end;
   end;
  writeln(resultado);
end;
end.

