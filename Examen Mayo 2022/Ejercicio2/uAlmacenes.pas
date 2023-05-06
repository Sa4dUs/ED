UNIT uAlmacenes;

INTERFACE
USES uNodoAlmacen, uArticulosPosibles, uPedidos;
TYPE
    TAlmacenes = ^TNodoAlmacenes;
    TNodoAlmacenes = RECORD
        info: TNodoAlmacen;
        sig: ^TNodoAlmacenes;
    END;

PROCEDURE InsertarVecino(VAR g: TAlmacenes; a1, a2: TNodoAlmacen; distancia: INTEGER);
PROCEDURE AlmacenesAptos(a: TAlmacenes; t: TTiposAlm; l: TLista);
PROCEDURE LiberarAlmacenes(a: TAlmacenes; alm_principal: String);

IMPLEMENTATION
PROCEDURE InsertarVecino(VAR g: TAlmacenes; a1, a2: TNodoAlmacen; distancia: INTEGER);
BEGIN
    IF NOT EsGrafoVacio(g) THEN
    BEGIN
        InsertarAristaDirigida(g, a1, a2, distancia);
        InsertarAristaDirigida(g, a2, a1, distancia);
    END;
END;

PROCEDURE InsertarAristaDirigida(VAR g: TAlmacenes; origen, destino: TNodoAlmacen; distancia: INTEGER);
VAR
    aux: TAlmacenes;
    ady: TListaAdy;
BEGIN
    aux := g;
    WHILE NOT EsGrafoVacio(aux) DO
    BEGIN
        IF EsIgualAlmacen(aux^.info, origen) THEN
        BEGIN
            CogerAdyacencia(aux^.info, ady);
            ConstruirAdyacencia(ady, destino, distancia);
            PonerAdyacencia(aux^.info, ady);
        END;

        aux := aux^.sig;
    END;
END;

PROCEDURE AlmacenesAptos(a: TAlmacenes; t: TArticulosPosibles; VAR l: TLista);
VAR
    c, aux: TArticulosPosibles;
    nombre: STRING;
BEGIN
    CrearListaVacia(l);
    WHILE NOT EsGrafoVacio(a) DO
    BEGIN   
        ObtenerArticulosPosibles(a^.info, aux);
        Interseccion(aux, t, c)
        IF NOT EsConjuntoVacio(c) THEN
        BEGIN
            ObtenerNombre(a^.info, nombre);
            Construir(l, nombre);
        END;
    END;
END;

PROCEDURE LiberarAlmacenes(VAR a: TAlmacenes; alm_principal: STRING, profundidad: INTEGER);
VAR
    p: TPedidos;
    nombre: STRING;
BEGIN
    WHILE NOT EsGrafoVacio(a) DO
    BEGIN
        ObtenerNombre(a^.info, nombre)
        IF nombre = alm_principal THEN
        BEGIN
            LiberarAlmacen(a, a^.info, 1, 0);
        END;
        a := a^.sig;
    END;
END;

PROCEDURE LiberarAlmacen(vAR alms: TAlmacenes; VAR a: TNodoAlmacen; profundidad: INTEGER); 
VAR
    capacidadMax, capacidadAct: INTEGER;
    ady: TListaAdy;
    aux: TAlmacen;
    c, c1, c2: TArticulosPosibles;
    e: TArticulosPosibles;
BEGIN
    ObtenerCapacidadMax(a^.info, capacidadMax);
    ObtenerCapacidadAct(a^.info, capacidadAct);
    Adyacencia(a, ady);
    WHILE capacidadMax*0.75 <= capacidadAct AND NOT EsAdyacenciaVacia(ady) THEN
    BEGIN
        ObtenerAlmacenPorID(ady^.info, aux);
        ObtenerArticulosPosiblesPorID(ady^.info, c2);
        ObtenerArticulosPosibles(a^.info, c1);
        Interseccion(c1, c2, c);

        IF NOT EsConjuntoVacio(c) THEN
        BEGIN
            Elegir(c, e);
            ActualizarCapacidadActual(a^.info, -1);
            ActualizarCapacidadActualPorID(ady^.info, -1);
            QuitarArticuloPedido(a^.info, e);
            AñadirArticuloPedidoPorID(ady^.info, e);
        END;

        IF profundidad > 0 THEN
        BEGIN
            LiberarAlmacenes(alms, ady^.info, profundidad - 1)
        END;

        ObtenerCapacidadMax(a^.info, capacidadMax);
        ObtenerCapacidadAct(a^.info, capacidadAct);
        ady := ady^.sig;
    END;
END;



END.