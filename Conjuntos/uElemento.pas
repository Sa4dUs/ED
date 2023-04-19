UNIT uElemento;

INTERFACE
CONST
    INI = 1;
    FIN = 10;
TYPE TElemento = INI..FIN;

PROCEDURE Asignar(VAR e1, e2: TElemento);
FUNCTION EsIgual(e1, e2: TElemento): BOOLEAN;

IMPLEMENTATION
PROCEDURE Asignar(VAR e1, e2: TElemento);
BEGIN
    e1 := e2;
END;

FUNCTION EsIgual(e1, e2: TElemento): BOOLEAN;
BEGIN
    Exit(e1 = e2);
END;
END.