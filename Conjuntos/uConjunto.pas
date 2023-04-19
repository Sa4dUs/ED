UNIT uConjunto;

INTERFACE
USES uElemento;

TYPE TConjunto = ARRAY [TElemento] OF BOOLEAN;

{* -------------------------------------------------------------------------- *}
{*                          CONSTRUCTORAS GENERADORAS                         *}
{* -------------------------------------------------------------------------- *}
PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);
PROCEDURE Poner(VAR c: TConjunto; e: TElemento);

{* -------------------------------------------------------------------------- *}
{*                           OBSERVADORAS SELECTORAS                          *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Elegir(c: TConjunto; VAR e: TElemento);

{* -------------------------------------------------------------------------- *}
{*                         OBSERVADORAS NO SELECTORAS                         *}
{* -------------------------------------------------------------------------- *}
FUNCTION EsConjuntoVacio(c: TConjunto): BOOLEAN;
FUNCTION Pertenece(c: TConjunto; e: TElemento): BOOLEAN;
FUNCTION EsSubconjunto(s, c: TConjunto): BOOLEAN;
FUNCTION Cardinal(c: TConjunto): INTEGER;

{* -------------------------------------------------------------------------- *}
{*                        CONSTRUCTORAS NO GENERADORAS                        *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Quitar(VAR c: TConjunto; e: TElemento);
PROCEDURE Union(VAR c, c1, c2: TConjunto);
PROCEDURE Interseccion(VAR c, c1, c2: TConjunto);
PROCEDURE Diferencia(VAR c, c1, c2: TConjunto);

IMPLEMENTATION
{* -------------------------------------------------------------------------- *}
{*                          CONSTRUCTORAS GENERADORAS                         *}
{* -------------------------------------------------------------------------- *}
PROCEDURE CrearConjuntoVacio(VAR c: TConjunto);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        c[e] := FALSE; 
    END;
END;

PROCEDURE Poner(VAR c: TConjunto; e: TElemento);
BEGIN
    c[e] := TRUE
END;

{* -------------------------------------------------------------------------- *}
{*                           OBSERVADORAS SELECTORAS                          *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Elegir(c: TConjunto; VAR e: TElemento);
BEGIN
    Randomize;

    REPEAT
        e := Random(FIN - INI + 1) + INI;
    UNTIL c[e]
END;

{* -------------------------------------------------------------------------- *}
{*                         OBSERVADORAS NO SELECTORAS                         *}
{* -------------------------------------------------------------------------- *}
FUNCTION EsConjuntoVacio(c: TConjunto): BOOLEAN;
VAR
    i: BOOLEAN;
BEGIN
    FOR i IN c DO
    BEGIN
        IF NOT i THEN
        BEGIN
            Exit(FALSE);
        END;
    END;
    Exit(TRUE);
END;

FUNCTION Pertenece(c: TConjunto; e: TElemento): BOOLEAN;
BEGIN
    Exit(c[e]);
END;

FUNCTION EsSubconjunto(s, c: TConjunto): BOOLEAN;
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        IF s[e] AND NOT c[e] THEN
        BEGIN
            Exit(FALSE);
        END;
    END;
    Exit(TRUE)
END;

FUNCTION Cardinal(c: TConjunto): INTEGER;
VAR
    counter: INTEGER;
    i: BOOLEAN;
BEGIN
    counter := 0;

    FOR i IN c DO
    BEGIN
        IF i THEN
        BEGIN
            counter := Succ(counter);
        END;
    END;
    Exit(counter);
END;

{* -------------------------------------------------------------------------- *}
{*                        CONSTRUCTORAS NO GENERADORAS                        *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Quitar(VAR c: TConjunto; e: TElemento);
BEGIN
    c[e] := FALSE;
END;

PROCEDURE Union(VAR c, c1, c2: TConjunto);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        c[e] := c1[e] OR c2[e];
    END;
END;

PROCEDURE Interseccion(VAR c, c1, c2: TConjunto);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        c[e] := c1[e] AND c2[e];
    END;
END;

PROCEDURE Diferencia(VAR c, c1, c2: TConjunto);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        c[e] := c1[e] AND NOT c2[e];
    END;
END;

END.