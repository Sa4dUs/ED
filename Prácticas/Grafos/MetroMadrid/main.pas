PROGRAM MetroMadrid;

USES uGrafo, uUtilidades;

PROCEDURE ConstruirGrafoMetroMadrid(VAR g: TGrafo);
BEGIN
    InsertarTodas(g);
END;

PROCEDURE ConsultarEstaciones(g: TGrafo; estacion: STRING);
BEGIN
    ConsultarPorNombre(g, estacion);
END;

PROCEDURE Recorrido(g: TGrafo; origen: STRING);
BEGIN
    RecorrerEnAnchura(g, origen, NIL, NIL);
END;

PROCEDURE Camino(g: TGrafo; origen, destino: STRING);
BEGIN
END;

VAR
    g: TGrafo;

BEGIN
    CrearGrafoVacio(g);

    // Construir el grafo del Metro de Madrid
    ConstruirGrafoMetroMadrid(g);

    // Consultar Estacion
    ConsultarEstaciones(g, 'Pradillo');

    // Recorrido en Anchura
    Recorrido(g, 'Callao');

END.