UNIT uListaAdy;

INTERFACE
USES uAdy;
TYPE
    TListaAdy = ^TNodoAdy;
    TNodoAdy = RECORD
        info: TAdy;
        sig: ^TNodoAdy;
    END;

PROCEDURE CrearListaAdyVacia(VAR l: TListaAdy);

IMPLEMENTATION
PROCEDURE CrearListaAdyVacia(VAR l: TListaAdy);
BEGIN
    l := NIL;
END;
END.