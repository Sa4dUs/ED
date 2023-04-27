UNIT uGrafo;

INTERFACE
USES uElemento, uNodoG, uListaAdy;
TYPE
    TGrafo = ^TNodoGrafo;
    TNodoGrafo = RECORD
        info: TNodoG;
        sig: ^TNodoGrafo;
    END;


    PROCEDURE CrearGrafoVacio(VAR g: TGrafo);
    PROCEDURE InsertarNodo(VAR g: TGrafo; e: TElemento);
    PROCEDURE InsertarArista(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
    PROCEDURE InsertarAristaDirigida(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
    FUNCTION EsGrafoVacio(g: TGrafo): BOOLEAN;

IMPLEMENTATION
PROCEDURE CrearGrafoVacio(VAR g: TGrafo);
BEGIN
    g := NIL;
END;

PROCEDURE InsertarNodo(VAR g: TGrafo; e: TElemento);
VAR
    aux: ^TNodoGrafo;
BEGIN
    new(aux);
    AsignarNodoG(aux^.info, e);
    aux^.sig := g;
    g := aux;
END;

PROCEDURE InsertarArista(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
BEGIN
    InsertarAristaDirigida(g, e1, e2, peso);
    InsertarAristaDirigida(g, e2, e1, peso);
END;

PROCEDURE InsertarAristaDirigida(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
VAR
    aux: ^TNodoGrafo;
BEGIN
    aux := g;

    WHILE NOT EsGrafoVacio(aux) AND NOT EsIgualNodoG(aux^.info, e1) DO
    BEGIN
        aux := aux^.sig;
    END;

    IF NOT EsGrafoVacio(aux) THEN
    BEGIN
        Adyacencia(aux^.info, aux^.info.ady); // Después de un rato he interpretado que se supone que debe hacer esto (?) 
    END;
END;

FUNCTION EsGrafoVacio(g: TGrafo): BOOLEAN;
BEGIN
    EsGrafoVacio := (g = NIL);
END;

END.