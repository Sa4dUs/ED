UNIT uUtilidades;

INTERFACE
USES uGrafo, uElemento, uListaAdy, uListaVisitados, uLineas, uNodoG, sysUtils;

CONST
    INI = 1;
    FIN = 12;

PROCEDURE InsertarLinea(VAR g: TGrafo; numLinea: INTEGER);
PROCEDURE InsertarTodas(VAR g: TGrafo);
PROCEDURE ObtenerEstacion (g: TGrafo; VAR objetivo: TNodoG; nombre: STRING);
PROCEDURE ActualizarEstacion (VAR g: TGrafo; nombre: STRING; numLinea: TElementoLineas);
PROCEDURE ConsultarPorNombre(g: TGrafo; nombre: STRING);
PROCEDURE RecorrerEnAnchura(g: TGrafo; nombreOrigen: STRING; printados, totalVisitados: TListaVisitados);

IMPLEMENTATION
PROCEDURE InsertarLinea(VAR g: TGrafo; numLinea: INTEGER);
VAR
    archivo: TextFile;
    nombreArchivo, linea: STRING;
    antiguo, nuevo: TElemento;
    lineas: TLineas;
BEGIN
    IF numLinea < 10 THEN
    BEGIN
        nombreArchivo := 'L0' + IntToStr(numLinea) + '.txt'
    END
    ELSE
    BEGIN
        nombreArchivo := 'L' + IntToStr(numLinea) + '.txt'
    END;

    Assign(archivo, 'Estacion metro Madrid/' + nombreArchivo);
    Reset(archivo);

    AsignarTexto(antiguo, '');

    WHILE NOT EOF(archivo) DO
    BEGIN
        ReadLn(archivo, linea);
        AsignarTexto(nuevo, linea);


        IF NOT PerteneceAOrigenes(g, nuevo) THEN
        BEGIN
            CrearConjuntoVacio(lineas);
            Poner(lineas, numLinea);
            PonerLineas(nuevo, lineas);

            InsertarOrigen(g, nuevo);
        END
        ELSE
        BEGIN
            ActualizarEstacion(g, nuevo.info, numLinea);
        END;

        IF NOT EsIgualTexto(antiguo, '') THEN
        BEGIN
            InsertarDestino(g, antiguo, nuevo);
        END;

        antiguo := nuevo;
    END;
    
    Close(archivo);
END;

PROCEDURE InsertarTodas(VAR g: TGrafo);
VAR
    i: INTEGER;
BEGIN
    FOR i := INI TO FIN DO
    BEGIN
        InsertarLinea(g, i);
    END;
END;

PROCEDURE ObtenerEstacion (g: TGrafo; VAR objetivo: TNodoG; nombre: STRING);
VAR
    aux: TElemento;
BEGIN
    AsignarTexto(aux, nombre);
    IF PerteneceAOrigenes(g, aux) THEN
   ; BEGIN
        WHILE NOT EsGrafoVacio(g) DO
        BEGIN
            IF EsIgualNodoG(g^.info, aux) THEN
            BEGIN
                ClonarNodoG(objetivo, g^.info);
            END;
            g := g^.sig;
        END;
    END;
END;

PROCEDURE ActualizarEstacion (VAR g: TGrafo; nombre: STRING; numLinea: TElementoLineas);
VAR
    gaux: TGrafo;
    aux: TElemento;
    lineas: TLineas;
BEGIN
    gaux := g;
    AsignarTexto(aux, nombre);
    IF PerteneceAOrigenes(gaux, aux) THEN
    BEGIN
        WHILE NOT EsGrafoVacio(gaux) DO
        BEGIN
            IF EsIgualNodoG(gaux^.info, aux) THEN
            BEGIN
                CogerLineasNodoG(gaux^.info, lineas);
                Poner(lineas, numLinea);
                PonerLineasNodoG(gaux^.info, lineas);
            END;
            gaux := gaux^.sig;
        END;
    END;
END;

PROCEDURE ConsultarPorNombre(g: TGrafo; nombre: STRING);
VAR
    estacion: TElemento;
    objetivo: TNodoG;
BEGIN
    AsignarTexto(estacion, nombre);
    IF PerteneceAOrigenes(g, estacion) THEN
    BEGIN
        Writeln('[+] La estacion ', nombre, ' esta incluida en el grafo.');
        ObtenerEstacion(g, objetivo, nombre);
        MostrarLineasElemento(objetivo.info);
    END
    ELSE
    BEGIN
        Writeln('[!] La estacion ', nombre, ' NO esta incluida en el grafo.');
    END;
END;

PROCEDURE RecorrerEnAnchura(g: TGrafo; nombreOrigen: STRING; printados, totalVisitados: TListaVisitados);
VAR
    nodoOrigen: TNodoG;
    ady: TListaAdy;
BEGIN
    ObtenerEstacion(g, nodoOrigen, nombreOrigen);
    Adyacencia(nodoOrigen, ady);

    ConstruirListaVisitados(totalVisitados, nombreOrigen);

    WHILE NOT EsAdyacenciaVacia(ady) DO
    BEGIN
        IF NOT PerteneceListaVisitados(printados, ady^.info.info) THEN
        BEGIN
            MostrarElemento(ady^.info);
            ConstruirListaVisitados(printados, ady^.info.info);
        END;
        ady := ady^.sig;
    END;


    WHILE NOT EsListaVisitadosVacia(printados) DO
    BEGIN
        IF NOT PerteneceListaVisitados(totalVisitados, printados^.info) THEN
        BEGIN
            RecorrerEnAnchura(g, printados^.info, printados, totalVisitados);
        END;
        printados := printados^.sig;
    END;
END;
END.