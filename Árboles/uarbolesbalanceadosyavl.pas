unit uArbolesBalanceadosyAVL;
//pa guardar jerarquías por ahora
//Árboles equilibrados/balanceados
//Existen los árboles binarios de búsqueda, que siguen un criterio para estar balanceados
//Por ejemplo que dado un número los mayores vayan a la derecha y los menores a la izquierda
//Su búsqueda es logarítmica (log 2) SIEMPRE Y CUANDO esté balanceado
//El TAD usado es un conjunto o un árbol si aparece la palabra eficiencia en el examen.
//Se descarta el conjunto si no se puede implementar el dato dado con esa estructura
//La complejidad de la búsqueda es O(n) en el peor caso y log 2 en el mejor
//

interface
PROCEDURE Insertar (var a:TArbol; e:TElemento);
implementation
PROCEDURE Insertar (var a:TArbol; e:TElemento);
var
  aux:TArbol;
  i,d:TArbol;
  r:TElemento;
begin
  IF EsArbolVacio(a) THEN
    ConstruirArbolBin (a,NIL,e,NIL)//Mejor en vez de NIL pasarle un árbol previamente creado
  ELSE
    begin
    Raiz (a,r);
    HijoDer (a,i);
    HijoIzq (a,d);
     IF EsMenor (e,r) THEN
       Insertar (i,e)
     ELSE
       Insertar (d,e);
    end;

end;
PROCEDURE BorrarNodo (var a:TArbol; e:TElemento);
//1º Caso : BorrarHoja-> simplemente te la cargas
//2º Caso : Solo un Hijo-> sustituyo al padre (que elimino) por el hijo
//3º Caso : Dos hijos-> cambio la raíz (que elimino) por el "menor de los mayores" de sus descendientes
//Después borro el mejor de los mayores
var
begin
  IF Not EsArbolVacio(a) THEN
    begin
      IF uElemento.Igual(a^.raiz,e) THEN
         a.aux:=a;
         a:=a^.Hijoizq;
         Dispose (a.aux);
    end
  ELSE
     IF EsArbolVacio (a^.Hijoizq) THEN
       BEGIN
         a.aux:=a;
         a:=a^.Hijodch;
         //FALTA PARTE

end;
end;
PROCEDURE minimo (a:TArbol; var e:TElemento);

begin
IF EsHoja (a) THEN
  Raiz(a,e)
ELSE
  HijoIzq (a,i);
minimo (a,e);
end;
///////////////////////Un Árbol es AVL si la suma del equilibrio de sus ramas nunca supera el 2
//LOS AVL NO ENTRAN COMO IMPLEMENTACIÓN!!!
//Para balancear los árboles hay que ascender y bajar diferentes nodos
end.

