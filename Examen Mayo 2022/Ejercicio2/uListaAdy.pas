UNIT uListaAdy;

INTERFACE
USES uElementoAdy;
TYPE
    TListaAdy = ^TNodoAdy;
    TNodoAdy = RECORD
        info: TElementoAdy;
        sig: ^TNodoAdy;
    END;

IMPLEMENTATION

END.