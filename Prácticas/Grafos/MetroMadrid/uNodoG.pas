UNIT uNodoG;

INTERFACE
USES uElemento, uListaAdy, uLineas;
TYPE
    TNodoG = RECORD
        info: TElemento;
        ady: TListaAdy;
    END;

PROCEDURE AsignarNodoG(VAR n: TNodoG; e: TElemento);
FUNCTION EsIgualNodoG(n: TNodoG; e: TElemento): BOOLEAN;
PROCEDURE Adyacencia(n: TNodoG; VAR ady: TListaAdy);
PROCEDURE PonerAdyacencia(VAR n: TNodoG; ady: TListaAdy);
PROCEDURE ClonarNodoG(VAR n1, n2: TNodoG);
PROCEDURE ActualizarNodoG(VAR n: TNodoG; ady: TListaAdy);
PROCEDURE CogerLineasNodoG(n: TNodoG; VAR lineas: TLineas);
PROCEDURE PonerLineasNodoG(VAR n: TNodoG; lineas: TLineas);
PROCEDURE AsignarIgualesNodoG(VAR n1, n2: TNodoG);
FUNCTION SonIgualesNodoG(n1, n2: TNodoG): BOOLEAN;

IMPLEMENTATION
PROCEDURE ClonarNodoG(VAR n1, n2: TNodoG);
BEGIN
    n1 := n2;
END;

PROCEDURE AsignarNodoG(VAR n: TNodoG; e: TElemento);
BEGIN
    Asignar(n.info, e);
END;

FUNCTION EsIgualNodoG(n: TNodoG; e: TElemento): BOOLEAN;
BEGIN
    EsIgualNodoG := EsIgual(n.info, e);
END;

PROCEDURE Adyacencia(n: TNodoG; VAR ady: TListaAdy);
BEGIN
    AsignarAdyacencia(ady, n.ady);
END;

PROCEDURE PonerAdyacencia(VAR n: TNodoG; ady: TListaAdy);
BEGIN
    AsignarAdyacencia(n.ady, ady);
END;

PROCEDURE ActualizarNodoG(VAR n: TNodoG; ady: TListaAdy);
BEGIN
    AsignarAdyacencia(n.ady, ady);
END;

PROCEDURE CogerLineasNodoG(n: TNodoG; VAR lineas: TLineas);
BEGIN
    CogerLineas(n.info, lineas);
END;

PROCEDURE PonerLineasNodoG(VAR n: TNodoG; lineas: TLineas);
BEGIN
    PonerLineas(n.info, lineas);
END;

PROCEDURE AsignarIgualesNodoG(VAR n1, n2: TNodoG);
BEGIN
    n1 := n2;
END;

FUNCTION SonIgualesNodoG(n1, n2: TNodoG): BOOLEAN;
BEGIN
    SonIgualesNodoG := (EsIgualNodoG(n1, n2.info))
END;
END.