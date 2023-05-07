UNIT uCola;

INTERFACE
USES uVivienda, uLista;
TYPE
    TCola = ^TNodoCola;
    TNodoLista = RECORD
        id: INTEGER;
        info: TVivienda;
        sig: ^TNodoCola;
    END;

PROCEDURE ObtenerIDCola(c: TCola; id: INTEGER);
PROCEDURE CrearColaVacia(VAR c: TCola);
PROCEDURE EncolarOrdenado(VAR c: TCola; v: TVivienda);
FUNCTION EsColaVacia(c: TCola): BOOLEAN;

PROCEDURE ConsultarCola(c: TCola; minPrecio, maxPrecio: REAL; minSuperficie, maxSuperficie: REAL; maxAntiguedad: INTEGER; VAR l: TLista);

IMPLEMENTATION
PROCEDURE ObtenerIDCola(c: TCola; id: INTEGER);
BEGIN
    id := c^.id;
END;

PROCEDURE CrearColaVacia(VAR c: TCola);
BEGIN
    c := NIL;
END;

PROCEDURE EncolarOrdenado(VAR c: TCola; v: TVivienda);
VAR
    fecha1, fecha2: TFecha;
    precio1, precio2: INTEGER;
    aux, aux2: TCola;
    insertado: BOOLEAN;
BEGIN
    // suponemos fecha1 := FechaActual
    insertado := FALSE;

    IF NOT EsColaVacia(c) THEN
    BEGIN
        aux := c;
        GetFechaPublicacion(v, fecha1);
        GetPrecio(v, precio1);

        WHILE NOT EsColaVacia(aux) THEN
        BEGIN
            GetFechaPublicacion(aux^.info, fecha2);
            GetPrecio(aux^.info, precio2);
            IF EsMasReciente(fecha1, fecha2) OR (DiferenciaFechas(fecha1,fecha2) = 0 AND precio1 < precio2) THEN
            BEGIN
                aux2^.sig := aux;
                Asignar(aux2^.info, v);
                insertado := TRUE;
            END
            aux := aux^.sig
        END;

        IF NOT insertado THEN
        BEGIN
            Asignar(aux^.info, v);
        END;
    END
    ELSE
    BEGIN
        AsignarVivienda(c^.info, v);
        c^.sig := NIL;
    END;
END;

FUNCTION EsColaVacia(c: TCola): BOOLEAN;
BEGIN
    EsColaVacia := (c = NIL);
END;

PROCEDURE ConsultarCola(c: TCola; minPrecio, maxPrecio: REAL; minSuperficie, maxSuperficie: REAL; maxAntiguedad: INTEGER; VAR l: TLista);
VAR
    fecha1, fecha2: TFecha;
    antiguedad: INTEGER;
    superficie, precio: INTEGER;
BEGIN
    // suponemos fecha1 := FechaActual
    WHILE NOT EsColaVacia(c) DO
    BEGIN
        GetSuperficie(c^.info, superficie);
        GetPrecio(c^.info, precio);
        GetFechaConstruccion(c^.info, fecha2)
        antiguedad := DiferenciaFechas(fecha1, fecha2);

        IF (((precio >= minPrecio) AND (precio <= maxPrecio)) AND ((superficie >= minSuperficie) AND (superficie <= maxSuperficie))) AND (antiguedad <= maxAntiguedad) THEN
        BEGIN
            ConstruirLista(l, c^.info);
        END;

        c := c^.sig;
    END;
END;

END.