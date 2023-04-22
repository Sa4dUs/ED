unit uTwitter;
interface
//Constructoras generadoras
CrearVacio (var TArbol);
ConstruirArbolBin (var TArbol; e:TElemento);
 //Se construye de abajo a arriba
 //Observadora selectora
 Raiz ( TArbol):TElemento; //es parcial porque no se pueden definir para todos los árboles
 HI (TArbol):TArbol;       //Lo mismo que arriba
 HD (TArbol):TArbol;       //lo mismo que arriba
//OBservadora no selectora
FUNCTION EsVacio (a:TArbol):boolean;
FUNCTION NumNodo (a:TArbol):integer;
FUNCTION Altura (a:TArbol):integer;
PROCEDURE Frontera (a:TArbol;var l:Lista);     //lo que está en el límite del árbol.
//Constructora no generadora
PROCEDURE Espejo (a:TArbol):TArbol;
implementation
FUNCTION NumNodos (a:TArbol):integer;
begin
IF a:=EsArbolVacio THEN
NumNodos (a):=0
ELSE
NumNodos (ConstruirArbolBin (i,r,d):=1+NumNodos(i)+numNodos(d);
end;
FUNCTION NumHojas (a:TArbol):integer;
begin
IF NOT  EsArbolVacio(a) THEN
BEGIN
IF EsHoja (a) THEN
  NumHojas:=1
ELSE
 begin
   HijoIzq(a,i);
   HijoDcho(a,d);
   NumHojas:=NumHojas(d)+NumHojas(i)+1;
 end;
end;
FUNCTION Altura (a:TArbol):integer;
var
i,d:TArbol;
begin
IF EsArbolVacio(a) THEN
Altura (a):=0
ELSE
HijoIzq (a,i);
HijoDcho(a,d);
Altura(ConstruirArbolBin(i,r,d):=1+Altura(i)+Altura(d);
end;
FUNCTION Compensado (a:TArbol):boolean;
begin
Compensado:= a.hi:=a.hd;
end;

PROCEDURE Frontera (a:TArbol; var l:TLista);
var
r:TElemento;
i,d:TArbol;
begin
 IF Not EsArbolVacio(a) THEN
  begin
     Raiz(a,r);
     HI (a,i);
     HD(a,d);
       IF EsHoja (a) THEN
        begin
           Construir (l,r);
           Frontera (i,l);
           Frontera(d,l);
        end;
end;
//ORDENES DE ORDENACION
//PREORDEN/INORDEN/POSTORDEN
Procedure Recorrido (a:TArbol);  //PREORDEN
var
r:TElemento;
begin
IF Not EsArbolVacio (a) THEN
 BEGIN
    Raiz(a,r);
    HI(a,r);
    HD(a,r);
    Mostrar(r);
    Recorrido(i);
    Recorrido(d);
 END;
END;

PROCEDURE EsTio (a:TArbol; e:TElemento);
var
r:TElemento;
i,d:TArbol;
begin
 IF Not EsVacio(a) THEN
  begin
     Raiz(a,r);
     HI (a,i);
     HD(a,d);
      IF NOT EsVacio (i) AND NOT EsVacio (d) THEN
       IF EsHoja (i) AND Not EsHoja(d) THEN
        begin
        Raiz (i,r);
        Construir (l,r);
        end;
       ELSE IF NOT EsHoja(i) AND EsHoja (d) THEN
        begin
        Raiz(d,r);
        Construir(l,r);
        end;
       end;
 end;
PROCEDURE ConstruirArbolBin (var a:TArbol; i:TArbol; e:TElemento);
begin
 new(a);
 Asignar (a^.raiz,r);
 a^.i:=i;
 a^.d:=d;
end;
PROCEDURE CrearArbolVacio (var a:TArbol);
begin
  a.raiz=NIL;
end;
FUNCTION EsArbolVacio (a:TArbol);
begin
  EsArbolVacio:=a.raiz:=NIL;
end;
PROCEDURE HijoIzq (var a:TArbol);
begin
  IF Not EsArbolVacio (a) THEN
   Asignar (i, a^.i);
end;
PROCEDURE HijoDch (a:TArbol; var d:TElemento);
begin
 IF Not EsArbolVacio (a) THEN
   Asignar (d, a^.d);
end;
PROCEDURE Raiz (a:TArbol; VAR r:TElemento);
begin
  IF Not EsArbolVacio (a) THEN
    Asignar (r, a^.raiz);
end;
FUNCTION EsHoja (a:TArbol):boolean;
var
i,d:TArbol;
BEGIN
IF Not EsArbolVacio (a) THEN
 begin
 HijoIzq (a,i);
 HijoDch (a,d);
 EsHoja:= EsArbolVacio(i)+EsArbolVacio(d);
 end
ELSE
EsHoja:=FALSE;
END;
FUNCTION Max (a,b:integer):integer;
begin
IF a<b THEN
 maz:=b
 ELSE
 max:=a;
end;
FUNCTION NivelElemento (a:TArbol; e:TElemento):integer;
var
r:TElemento;
i,d:TArbol;
begin
IF EsVacio (a) THEN
 NivelElemento :=0
ELSE
  Begin
    Raiz (a,r);
    IF EsIgual (r,e) THEN
     NivelElemento:=1
    ELSE
    ni:=NivelElemento(i,e);
    nd:=NivelElemento(d,e);
      IF ((ni>0) AND (nd>0) THEN
     NivelElemento:=1+ min(ni,nd)
     ELSE IF ni>0 THEN
      NivelElemento:=1+ni
    ELSE IF nd>0 THEN
     NivelElemento:=1+nd
     ELSE
     NivelElemento:=0;
     END;
end;
PROCEDURE Espejo (a:TArbol):TArbol;
var
i,d,ed,ei:TArbol;
r:TElemento;
begin
 IF Not EsArbolVacio (a) THEN
  BEGIN
  Raiz (a,r);
  HijoIzq (a,i);
  HijoDcho (a,d);
  Espejo (ed,d);
  Espejo (id,i);
  ConstruirArbolBin(e,ed,r,ei);
  end;
end;
END.


