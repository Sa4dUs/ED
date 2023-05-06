UNIT uGrafo;

INTERFACE
USES uNodoG, uElemento, uListaAdy;
TYPE
    TGrafo = ^TNodoGrafo;
    TNodoGrafo = RECORD
        info: TNodoG;
        sig: ^TNodoGrafo;
    END;

    PROCEDURE CrearGrafoVacio(VAR g: TGrafo);
    PROCEDURE InsertarOrigen(VAR g: TGrafo; origen: TElemento);
    PROCEDURE InsertarDestino(g: TGrafo; origen: TElemento; destino: TElemento);
    PROCEDURE InsertarAristaDirigida(VAR g: TGrafo; origen, destino: TElemento);
    FUNCTION EsGrafoVacio(g: TGrafo):BOOLEAN;
    FUNCTION PerteneceAOrigenes(g: TGrafo; origen: TElemento):BOOLEAN;
    FUNCTION PerteneceADestinos(g:TGrafo; origen: TElemento; destino: TElemento):BOOLEAN;
    PROCEDURE ListaAdyacencia(g:TGrafo; e: TElemento; VAR adyacentes: TListaAdy);

IMPLEMENTATION
PROCEDURE CrearGrafoVacio(VAR g: TGrafo);
BEGIN
    g := NIL;
END;

PROCEDURE InsertarOrigen(VAR g: TGrafo; origen: TElemento);
VAR
    aux: TGrafo;
BEGIN
    New(aux);
    AsignarNodoG(aux^.info, origen);
    aux^.sig := g;
    g := aux;
END;

PROCEDURE InsertarDestino(g: TGrafo; origen: TElemento; destino: TElemento);
BEGIN
    InsertarAristaDirigida(g, origen, destino);
END;

PROCEDURE InsertarAristaDirigida(VAR g: TGrafo; origen, destino: TElemento);
VAR
    aux: ^TNodoGrafo;
    ady: TListaAdy;
BEGIN
    aux := g;

    WHILE NOT EsGrafoVacio(aux) AND NOT EsIgualNodoG(aux^.info, origen) DO
    BEGIN
        aux := aux^.sig;
    END;

    IF NOT EsGrafoVacio(aux) THEN
    BEGIN
        Adyacencia(aux^.info, ady);
        ConstruirAdyacencia(ady, destino);
        PonerAdyacencia(aux^.info, ady);
    END;
END;

FUNCTION EsGrafoVacio(g: TGrafo):BOOLEAN;
BEGIN
    EsGrafoVacio := (g = NIL);
END;

FUNCTION PerteneceAOrigenes(g: TGrafo; origen: TElemento):BOOLEAN;
VAR
    encontrado: BOOLEAN;
BEGIN
    encontrado := FALSE;
    
    WHILE NOT EsGrafoVacio(g) DO
    BEGIN
        IF EsIgualNodoG(g^.info, origen) THEN
        BEGIN
            encontrado := TRUE;
        END;
        
        g := g^.sig;
    END;

    PerteneceAOrigenes := encontrado;
END;

FUNCTION PerteneceADestinos(g:TGrafo; origen: TElemento; destino: TElemento):BOOLEAN;
VAR
    encontrado: BOOLEAN;
    ady: TListaAdy;
BEGIN
    encontrado := FALSE;
    
    WHILE NOT EsGrafoVacio(g) DO
    BEGIN
        IF EsIgualNodoG(g^.info, origen) THEN
        BEGIN
            Adyacencia(g^.info, ady);

            encontrado := PerteneceAdyacencia(ady, destino);
        END;
        
        g := g^.sig;
    END;

    PerteneceADestinos := encontrado;
END;

PROCEDURE ListaAdyacencia(g:TGrafo; e: TElemento; VAR adyacentes: TListaAdy);
BEGIN
    WHILE NOT EsGrafoVacio(g) DO
    BEGIN
        IF EsIgualNodoG(g^.info, e) THEN
        BEGIN
            Adyacencia(g^.info, adyacentes);
        END;

        g := g^.sig;
    END;
END;

END.