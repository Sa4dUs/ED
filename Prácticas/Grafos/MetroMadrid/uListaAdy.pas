UNIT uListaAdy;

INTERFACE
USES uElemento;
TYPE
    TListaAdy = ^TNodoAdy;
    TNodoAdy = RECORD
        info: TElemento;
        sig: ^TNodoAdy;
    END;

PROCEDURE CrearAdyacenciaVacia(VAR l: TListaAdy);
PROCEDURE ConstruirAdyacencia(VAR l: TListaAdy; e: TElemento);
FUNCTION EsAdyacenciaVacia(l: TListaAdy): BOOLEAN;
PROCEDURE AsignarAdyacencia(VAR l1, l2: TListaAdy);
FUNCTION PerteneceAdyacencia(ady: TListaAdy; e: TElemento): BOOLEAN;


IMPLEMENTATION
PROCEDURE CrearAdyacenciaVacia(VAR l: TListaAdy);
BEGIN
    l := NIL;
END;

PROCEDURE ConstruirAdyacencia(VAR l: TListaAdy; e: TElemento);
VAR
    aux: TListaAdy;
BEGIN
    New(aux);
    Asignar(aux^.info, e);
    aux^.sig := l;
    l := aux;
END;

FUNCTION EsAdyacenciaVacia(l: TListaAdy): BOOLEAN;
BEGIN
    EsAdyacenciaVacia := (l = NIL)
END;

PROCEDURE AsignarAdyacencia(VAR l1, l2: TListaAdy);
BEGIN
    l1 := l2;
END;

FUNCTION PerteneceAdyacencia(ady: TListaAdy; e: TElemento): BOOLEAN;
VAR
    encontrado: BOOLEAN;
BEGIN
    encontrado := FALSE;

    WHILE NOT EsAdyacenciaVacia(ady) DO
    BEGIN
        IF EsIgual(ady^.info, e) THEN
        BEGIN
            encontrado := TRUE;
        END;

        ady := ady^.sig;
    END;

    PerteneceAdyacencia := encontrado;
END;

END.