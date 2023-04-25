unit uBolsasj;


interface


CONST
  INI = 1;
  FIN = 100;

TYPE
  TBolsas=ARRAY [INI..FIN] OF Integer;
  Intervalo = INI..FIN;

  {Constructoras generadoras}
  PROCEDURE CrearVacia(VAR b:TBolsas);
  PROCEDURE Poner(VAR b:TBolsas;e:Intervalo);

  {Observadoras selectoras}
  PROCEDURE Elegir (VAR b:TBolsas;VAR e:Intervalo);

  {Observadoras no selectoras}
  FUNCTION EsBolsaVacia(VAR b:TBolsas):Boolean;
  FUNCTION Pertenece (VAR b:TBolsas;e:Intervalo):Boolean;
  FUNCTION EsSubconjunto(VAR b1:TBolsas;VAR b2:TBolsas):Boolean;
  FUNCTION Cardinal (VAR b:TBolsas):Integer;

  {Constructoras no generadoras}
  PROCEDURE MostrarBolsa(VAR b:TBolsas);
  PROCEDURE Quitar(VAR b:TBolsas;e:Intervalo);
  PROCEDURE Union(VAR b:TBolsas;VAR b1,b2:TBolsas);
  FUNCTION min(a,b:Integer):Integer;
  PROCEDURE Interseccion(VAR b:TBolsas;VAR b1,b2:TBolsas);
  FUNCTION absoluto(a:Integer):Integer;
  PROCEDURE Diferencia (VAR b:TBolsas;VAR b1,b2:TBolsas);

implementation
PROCEDURE CrearVacia(VAR b:TBolsas);
VAR
  i:Intervalo;
BEGIN
  FOR i:=INI TO FIN DO
    Quitar(b,i);
END;

PROCEDURE Poner(VAR b:TBolsas;e:Intervalo);
BEGIN
  b[e]:=b[e]+1;
END;

PROCEDURE Elegir (VAR b:TBolsas;VAR e:Intervalo);
VAR
  i:Integer;
BEGIN
  randomize;
  i:=random(FIN)+INI;
  WHILE NOT Pertenece(b,i) DO
    i:=random(FIN)+INI;
    e:=i;
END;

FUNCTION EsBolsaVacia(VAR b:TBolsas):Boolean;
VAR
  vacio:Boolean;
  i:Intervalo;
BEGIN
  vacio:=True;
  i:=INI;
  WHILE (NOT Pertenece(b,i)) AND (i<=FIN) DO
    i:=INI+1;
  IF i<FIN THEN
    vacio:=False;
  EsBolsaVacia:=vacio;
END;

FUNCTION Pertenece (VAR b:TBolsas;e:Intervalo):Boolean;
BEGIN
  Pertenece:=b[e]>0;
END;

FUNCTION EsSubconjunto(VAR b1:TBolsas;VAR b2:TBolsas):Boolean;
VAR
  aux:Boolean;
  i:Integer;
BEGIN
  aux:=True;
  WHILE (aux) AND (i<=FIN) DO
    BEGIN
      i:=i+1;
      IF (Pertenece(b2,i)) AND (NOT Pertenece(b1,i)) THEN
        aux:=False;
    END;
  EsSubconjunto:=aux;
END;

FUNCTION Cardinal (VAR b:TBolsas):Integer;
VAR
  i:Intervalo;
  contador:Integer;
BEGIN
  contador:=0;
  FOR i:=INI TO FIN DO
    contador:=contador+b[i];
  Cardinal:=contador;
END;

PROCEDURE MostrarBolsa(VAR b:TBolsas);
VAR
  i:Intervalo;
  j:Integer;
BEGIN
  FOR i:=INI TO FIN DO
    IF Pertenece(b,i) THEN
      FOR j:=1 TO b[i] DO
        writeln(i);
END;

PROCEDURE Quitar(VAR b:TBolsas;e:Intervalo);
BEGIN
  b[e]:=0;
END;

PROCEDURE Union(VAR b:TBolsas;VAR b1,b2:TBolsas);
VAR
  i:Intervalo;
BEGIN
  CrearVacia(b);
  FOR i:=INI TO FIN DO
    b[i]:=b1[i]+b2[i];
END;


FUNCTION min(a,b:Integer):Integer;
BEGIN
  IF a<b THEN
    min:=a
  ELSE
    min:=b;
END;

PROCEDURE Interseccion(VAR b:TBolsas;VAR b1,b2:TBolsas);
VAR
  i:Intervalo;
BEGIN
  CrearVacia(b);
  FOR i:=INI TO FIN DO
    b[i]:=min(b1[i],b2[i]);
END;

FUNCTION absoluto(a:Integer):Integer;
BEGIN
  IF a>= 0 THEN
    absoluto:=a
  ELSE
    absoluto:=-a;
END;

PROCEDURE Diferencia (VAR b:TBolsas;VAR b1,b2:TBolsas);
VAR
  i:Intervalo;
BEGIN
  CrearVacia(b);
  FOR i:=INI TO FIN DO
    b[i]:=absoluto(b1[i]-b2[i]);
END;

end.

