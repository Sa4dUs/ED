UNIT uListaVisitados;

INTERFACE
TYPE
    TListaVisitados = ^TNodoVisitados;
    TNodoVisitados = RECORD
        info: STRING;
        sig: ^TNodoVisitados;
    END;

PROCEDURE CrearListaVisitadosVacia(VAR l: TListaVisitados);
FUNCTION EsListaVisitadosVacia(l: TListaVisitados): BOOLEAN;
PROCEDURE ConstruirListaVisitados(VAR l: TListaVisitados; e: STRING);
FUNCTION PerteneceListaVisitados(l: TListaVisitados; e: STRING): BOOLEAN;

IMPLEMENTATION
PROCEDURE CrearListaVisitadosVacia(VAR l: TListaVisitados);
BEGIN
    l := NIL;
END;

FUNCTION EsListaVisitadosVacia(l: TListaVisitados): BOOLEAN;
BEGIN
    EsListaVisitadosVacia := (l = NIL);
END;

PROCEDURE ConstruirListaVisitados(VAR l: TListaVisitados; e: STRING);
VAR
    aux: TListaVisitados;
BEGIN
    New(aux);
    aux^.info := e;
    aux^.sig := l;
    l := aux;
END;

FUNCTION PerteneceListaVisitados(l: TListaVisitados; e: STRING): BOOLEAN;
VAR
    encontrado: BOOLEAN;
BEGIN
    encontrado := FALSE;

    WHILE NOT EsListaVisitadosVacia(l) DO
    BEGIN
        IF l^.info = e THEN
        BEGIN
            encontrado := TRUE;
        END;

        l := l^.sig;
    END;

    PerteneceListaVisitados := encontrado;
END;

END.