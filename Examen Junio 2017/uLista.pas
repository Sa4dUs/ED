UNIT uLista;

INTERFACE
USES uVivienda;
TYPE
    TLista = ^TNodoLista;
    TNodoLista = RECORD
        info: TVivienda;
        sig: ^TNodoLista;
    END;

PROCEDURE CrearListaVacia(VAR l: TLista);
PROCEDURE ConstruirLista(VAR l: TLista; v: TVivienda);
FUNCTION EsListaVacia(l: TLista): BOOLEAN;

IMPLEMENTATION
END.