UNIT uBolsa;

INTERFACE
USES math,  uElemento;

TYPE TBolsa = ARRAY [TElemento] OF INTEGER;

{* -------------------------------------------------------------------------- *}
{*                          CONSTRUCTORAS GENERADORAS                         *}
{* -------------------------------------------------------------------------- *}
PROCEDURE CrearBolsaVacio(VAR b: TBolsa);
PROCEDURE Poner(VAR b: TBolsa; e: TElemento);

{* -------------------------------------------------------------------------- *}
{*                           OBSERVADORAS SELECTORAS                          *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Elegir(b: TBolsa; VAR e: TElemento);

{* -------------------------------------------------------------------------- *}
{*                         OBSERVADORAS NO SELECTORAS                         *}
{* -------------------------------------------------------------------------- *}
FUNCTION EsBolsaVacio(b: TBolsa): BOOLEAN;
FUNCTION Pertenece(b: TBolsa; e: TElemento): BOOLEAN;
FUNCTION EsSubbolsa(s, b: TBolsa): BOOLEAN;
FUNCTION Cardinal(b: TBolsa): INTEGER;

{* -------------------------------------------------------------------------- *}
{*                        CONSTRUCTORAS NO GENERADORAS                        *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Quitar(VAR b: TBolsa; e: TElemento);
PROCEDURE Union(VAR b, b1, b2: TBolsa);
PROCEDURE Interseccion(VAR b, b1, b2: TBolsa);
PROCEDURE Diferencia(VAR b, b1, b2: TBolsa);

IMPLEMENTATION
{* -------------------------------------------------------------------------- *}
{*                          CONSTRUCTORAS GENERADORAS                         *}
{* -------------------------------------------------------------------------- *}
PROCEDURE CrearBolsaVacio(VAR b: TBolsa);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        b[e] := 0; 
    END;
END;

PROCEDURE Poner(VAR b: TBolsa; e: TElemento);
BEGIN
    b[e] := Succ(b[e]);
END;

{* -------------------------------------------------------------------------- *}
{*                           OBSERVADORAS SELECTORAS                          *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Elegir(b: TBolsa; VAR e: TElemento);
BEGIN
    Randomize;

    REPEAT
        e := Random(FIN - INI + 1) + INI;
    UNTIL b[e] <> 0
END;

{* -------------------------------------------------------------------------- *}
{*                         OBSERVADORAS NO SELECTORAS                         *}
{* -------------------------------------------------------------------------- *}
FUNCTION EsBolsaVacio(b: TBolsa): BOOLEAN;
VAR
    i: INTEGER;
BEGIN
    FOR i IN b DO
    BEGIN
        IF i <> 0 THEN
        BEGIN
            Exit(FALSE);
        END;
    END;
    Exit(TRUE);
END;

FUNCTION Pertenece(b: TBolsa; e: TElemento): BOOLEAN;
BEGIN
    Exit(b[e] <> 0);
END;

FUNCTION EsSubbolsa(s, b: TBolsa): BOOLEAN;
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        IF s[e] > b[e] THEN
        BEGIN
            Exit(FALSE);
        END;
    END;
    Exit(TRUE)
END;

FUNCTION Cardinal(b: TBolsa): INTEGER;
VAR
    counter: INTEGER;
    i: INTEGER;
BEGIN
    counter := 0;

    FOR i IN b DO
    BEGIN
        counter := counter + i;
    END;
    Exit(counter);
END;

{* -------------------------------------------------------------------------- *}
{*                        CONSTRUCTORAS NO GENERADORAS                        *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Quitar(VAR b: TBolsa; e: TElemento);
BEGIN
    b[e] := 0;
END;

PROCEDURE Union(VAR b, b1, b2: TBolsa);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        b[e] := Max(b1[e],b2[e]);
    END;
END;

PROCEDURE Interseccion(VAR b, b1, b2: TBolsa);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        b[e] := Min(b1[e],b2[e]);
    END;
END;

PROCEDURE Diferencia(VAR b, b1, b2: TBolsa);
VAR
    e: TElemento;
BEGIN
    FOR e := INI TO FIN DO
    BEGIN
        IF b1[e] > b2[e] THEN
        BEGIN
            b[e] := b1[e] - b2[e];
        END
        ELSE
        BEGIN
            b[e] := 0;
        END;
    END;
END;

END.