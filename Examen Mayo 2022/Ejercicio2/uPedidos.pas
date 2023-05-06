UNIT uPedidos;

INTERFACE
USES uPedido;
TYPE
    TPedidos = ^TNodoPedidos;
    TNodoPedidos = RECORD
        info: TPedido;
        sig: ^TNodoPedidos;
    END;

IMPLEMENTATION
END.