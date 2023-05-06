UNIT uPedido;

INTERFACE
USES uArticulosPosibles;
TYPE
    TPedido = RECORD
        tipos: TArticulosPosibles;
        cantidad: INTEGER;
        volumen: INTEGER;
        prioridad: INTEGER;
    END;

IMPLEMENTATION
END.