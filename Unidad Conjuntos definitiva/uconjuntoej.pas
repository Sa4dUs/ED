unit uConjuntoej;


interface


CONST
  INI = 1;
  FIN = 100;

TYPE
  TConjunto=ARRAY [INI..FIN] OF Boolean;
  Intervalo = INI..FIN;

  {Constructoras generadoras}
  PROCEDURE CrearVacio(VAR c:TConjunto);
  PROCEDURE Poner(VAR c:TConjunto;e:Intervalo);

  {Observadoras selectoras}
  PROCEDURE Elegir (VAR c:TConjunto;VAR e:Intervalo);

  {Observadoras no selectoras}
  FUNCTION EsConjuntoVacio(VAR c:TConjunto):Boolean;
  FUNCTION Pertenece (VAR c:TConjunto;e:Intervalo):Boolean;
  FUNCTION EsSubconjunto(VAR c1:TConjunto;VAR c2:TConjunto):Boolean;
  FUNCTION Cardinal (VAR c:TConjunto):Integer;

  {Constructoras no generadoras}
  PROCEDURE MostrarConjunto(VAR c:TConjunto);
  PROCEDURE Quitar(VAR c:TConjunto;e:Intervalo);
  PROCEDURE Union(VAR c:TConjunto;VAR c1,c2:TConjunto);
  PROCEDURE Interseccion(VAR c:TConjunto;VAR c1,c2:TConjunto);
  PROCEDURE Diferencia (VAR c:TConjunto;VAR c1,c2:TConjunto);

implementation
PROCEDURE CrearVacio(VAR c:TConjunto);
VAR
  i:Intervalo;
BEGIN
  FOR i:=INI TO FIN DO
    Quitar(c,i);
END;

PROCEDURE Poner(VAR c:TConjunto;e:Intervalo);
BEGIN
  c[e]:=True;
END;

PROCEDURE Elegir (VAR c:TConjunto;VAR e:Intervalo);
VAR
  i:Intervalo;
BEGIN
  IF NOT EsConjuntoVacio(c) THEN
    BEGIN
      randomize;
      i:=random(FIN)+INI;
      WHILE NOT Pertenece(c,i) DO
        i:=random(FIN)+INI;
      e:=i;
    END;
END;

FUNCTION EsConjuntoVacio(VAR c:TConjunto):Boolean;
VAR
  vacio:Boolean;
  i:Intervalo;
BEGIN
  vacio:=True;
  i:=INI;
  WHILE (NOT Pertenece(c,i)) AND (i<=FIN) DO
    i:=INI+1;
  IF i<FIN THEN
    vacio:=False;
  EsConjuntoVacio:=vacio;
END;

FUNCTION Pertenece (VAR c:TConjunto;e:Intervalo):Boolean;
BEGIN
  Pertenece:=c[e];
END;

FUNCTION EsSubconjunto(VAR c1:TConjunto;VAR c2:TConjunto):Boolean;
VAR
  aux:Boolean;
  i:Integer;
BEGIN
  aux:=True;
  WHILE (aux) AND (i<=FIN) DO
    BEGIN
      i:=i+1;
      IF (Pertenece(c2,i)) AND (NOT Pertenece(c1,i)) THEN
        aux:=False;
    END;
  EsSubconjunto:=aux;
END;

FUNCTION Cardinal (VAR c:TConjunto):Integer;
VAR
  i:Intervalo;
  contador:Integer;
BEGIN
  contador:=0;
  IF NOT EsConjuntoVacio(c) THEN
      FOR i:=INI TO FIN DO
        IF Pertenece(c,i) THEN
          contador:=contador+1;
  Cardinal:=contador;
END;

PROCEDURE MostrarConjunto(VAR c:TConjunto);
VAR
  i:Intervalo;
BEGIN
  FOR i:=INI TO FIN DO
    IF Pertenece(c,i) THEN
      writeln(i);
END;

PROCEDURE Quitar(VAR c:TConjunto;e:Intervalo);
BEGIN
  c[e]:=False;
END;

PROCEDURE Union(VAR c:TConjunto;VAR c1,c2:TConjunto);
VAR
  i:Intervalo;
BEGIN
  CrearVacio(c);
  FOR i:=INI TO FIN DO
    IF (Pertenece(c1,i)) OR (Pertenece(c2,i)) THEN
      Poner(c,i);
END;


PROCEDURE Interseccion(VAR c:TConjunto;VAR c1,c2:TConjunto);
VAR
  i:Intervalo;
BEGIN
  CrearVacio(c);
  FOR i:=INI TO FIN DO
    IF (Pertenece(c1,i)) AND (Pertenece(c2,i)) THEN
      Poner(c,i);
END;

PROCEDURE Diferencia (VAR c:TConjunto;VAR c1,c2:TConjunto);
VAR
  i:Intervalo;
BEGIN
  CrearVacio(c);
  FOR i:=INI TO FIN DO
    IF (Pertenece(c1,i)) AND (NOT Pertenece(c2,i)) THEN
      Poner(c,i);
END;

end.

