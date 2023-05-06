UNIT uElemento;

INTERFACE
USES uLineas;
TYPE TElemento = RECORD
    info: STRING;
    lineas: TLineas;
END;

PROCEDURE Asignar(VAR e1, e2: TElemento);
PROCEDURE AsignarTexto(VAR e: TElemento; s: STRING);
PROCEDURE PonerLineas(VAR e: TElemento; l: TLineas);
FUNCTION EsIgual(e1, e2: TElemento): BOOLEAN;
FUNCTION EsIgualTexto(e: TElemento; s: STRING): BOOLEAN;
PROCEDURE CogerLineas(e: TElemento; VAR lineas: TLineas);
PROCEDURE MostrarElemento(e: TElemento);
PROCEDURE MostrarLineasElemento(e: TElemento);

IMPLEMENTATION
PROCEDURE Asignar(VAR e1, e2: TElemento);
BEGIN
    e1 := e2;
END;

PROCEDURE AsignarTexto(VAR e: TElemento; s: STRING);
BEGIN
    e.info := s;
END;

PROCEDURE PonerLineas(VAR e: TElemento; l: TLineas);
BEGIN
    AsignarLineas(e.lineas, l);
END;

FUNCTION EsIgual(e1, e2: TElemento): BOOLEAN;
BEGIN
    EsIgual := (e1.info = e2.info);
END;

FUNCTION EsIgualTexto(e: TElemento; s: STRING): BOOLEAN;
BEGIN
    EsIgualTexto := (e.info = s);
END;

PROCEDURE CogerLineas(e: TElemento; VAR lineas: TLineas);
BEGIN
    AsignarLineas(lineas,  e.lineas);
END;

PROCEDURE MostrarElemento(e: TElemento);
BEGIN
    Write(e.info, ' -> ');
    MostrarLineasElemento(e);
END;

PROCEDURE MostrarLineasElemento(e: TElemento);
VAR
    lineas: TLineas;
BEGIN
    CogerLineas(e, lineas);
    MostrarLineas(lineas);
END;


END.