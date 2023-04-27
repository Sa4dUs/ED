UNIT uNodoG;

INTERFACE
USES uElemento, uListaAdy;
TYPE
    TNodoG = RECORD
        info: TElemento;
        ady: TListaAdy;
    END;

PROCEDURE AsignarNodoG(VAR n: TNodoG; e: TElemento);
FUNCTION EsIgualNodoG(n: TNodoG; e: TElemento): BOOLEAN;
PROCEDURE Adyacencia(n: TNodoG; VAR ady: TListaAdy);

IMPLEMENTATION

PROCEDURE AsignarNodoG(VAR n: TNodoG; e: TElemento);
BEGIN
    Asignar(n.info, e);
    CrearListaAdyVacia(n.ady);
END;

FUNCTION EsIgualNodoG(n: TNodoG; e: TElemento): BOOLEAN;
BEGIN
    EsIgualNodoG := EsIgual(n.info, e);
END;

PROCEDURE Adyacencia(n: TNodoG; VAR ady: TListaAdy);
BEGIN
    ady := n.ady
END;

END.

