UNIT uAlmacen;

INTERFACE
USES uElementoID, uArticulosPosibles, uPedidos;
TYPE
    TAlmacen = RECORD
        id: uElementoID;
        nombre: STRING;
        capacidadMax: INTEGER;
        capacidadAct: INTEGER;
        articulosPosibles: TArticulosPosibles;
        pedidos: TPedidos;
    END;

IMPLEMENTATION
END.