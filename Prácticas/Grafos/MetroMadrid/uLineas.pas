UNIT uLineas;

INTERFACE
CONST
    INI = 1;
    FIN = 12;
TYPE
    TElementoLineas = INI..FIN;
    TConjunto = ARRAY [TElementoLineas] OF BOOLEAN;
    TLineas = TConjunto;

PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);
PROCEDURE Poner(VAR c: TConjunto; e: TElementoLineas);
FUNCTION Pertenece(c: TConjunto; e: TElementoLineas): BOOLEAN;
PROCEDURE MostrarLineas(c: TConjunto);
PROCEDURE AsignarLineas(VAR l1, l2: TLineas);

IMPLEMENTATION
PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);
VAR
    i: TElementoLineas;
BEGIN
    FOR i := INI TO FIN DO
    BEGIN
        c[i] := FALSE;
    END;
END;

PROCEDURE Poner(VAR c: TConjunto; e: TElementoLineas);
BEGIN
    c[e] := TRUE;
END;

FUNCTION Pertenece(c: TConjunto; e: TElementoLineas): BOOLEAN;
BEGIN
    Pertenece := c[e];
END;

PROCEDURE MostrarLineas(c: TConjunto);
VAR
    e: TElementoLineas;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        IF c[e] THEN
        BEGIN
            Write(e, ' ');
        END;
    END;
    Writeln;
END;

PROCEDURE AsignarLineas(VAR l1, l2: TLineas);
BEGIN
    l1 := l2;
END;
END.