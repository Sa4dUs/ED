UNIT uGrafoEstatico;

INTERFACE
USES uElemento;

TYPE TGrafo = RECORD
    datos: ARRAY [INI..FIN, INI..FIN] OF INTEGER;
    numnodos: INTEGER;
END;

PROCEDURE CrearGrafoVacio(VAR g: TGrafo);
PROCEDURE InsertarNodo(VAR g: TGrafo; e: TElemento);
PROCEDURE InsertarArista(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
PROCEDURE InsertarAristaDirigida(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);

IMPLEMENTATION
PROCEDURE CrearGrafoVacio(VAR g: TGrafo);
VAR
    i, j: TElemento;
BEGIN
    g.numnodos := 0;

    FOR i := INI TO FIN DO
    BEGIN
        FOR j := INI TO FIN DO
        BEGIN
            g.data[i][j] := 0
        END;
    END;
END;

PROCEDURE InsertarNodo(VAR g: TGrafo; e: TElemento);
VAR
    i: INTEGER;
BEGIN
    g.numnodos := g.numnodos + 1;

    FOR i := INI TO FIN DO
    BEGIN
        g.datos[i][e] := 0;
        g.datos[e][i] := 0;
    END;
END;

PROCEDURE InsertarArista(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
BEGIN
    InsertarAristaDirigida(g, e1, e2, peso);
    InsertarAristaDirigida(g, e2, e1, peso);
END;

PROCEDURE InsertarAristaDirigida(VAR g: TGrafo; e1, e2: TElemento; peso: INTEGER);
BEGIN
    g.datos[e1][e2] := g.datos[e1][e2] + peso
END;

END.


{ 
    ¿INEFICIENTE?
    TGrafo = RECORD
        V = CONJUNTO(VERTICES);
        A = CONJUNTO((VERTICES, VERTICES))
    END;
}