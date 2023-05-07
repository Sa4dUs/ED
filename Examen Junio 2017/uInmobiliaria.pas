UNIT uInmobiliaria;

INTERFACE
USES uCola, uVivienda, uLista;
TYPE
    TArbolBin = ^TNodo;
    TNodo = RECORD 
        raiz: TCola;
        izq: TArbolBin;
        der: TArbolBin;
    END;

    TCatalogo = TArbolBin;


PROCEDURE ConstruirArbolBin (VAR a: TArbolBin; r: TCola; izq, der: TArbolBin);
FUNCTION EsArbolBinVacio(a: TArbolBin): BOOLEAN;

PROCEDURE InsertarVivienda (VAR a: TArbolBin; v: TVivienda);
PROCEDURE ConsultarArbolBin(a: TArbolBin; numHabs: INTEGER; minPrecio, maxPrecio: REAL; minSuperficie, maxSuperficie: REAL; maxAntiguedad: INTEGER);

IMPLEMENTATION
PROCEDURE ConstruirArbolBin (VAR a: TArbolBin; r: TCola; izq, der: TArbolBin);
BEGIN
    Asignar(a^.raiz, r);
    a^.izq := izq;
    a^.der := der;
END;

FUNCTION EsArbolBinVacio(a: TArbolBin): BOOLEAN;
BEGIN
    EsArbolBinVacio := (a = NIL);
END;

PROCEDURE InsertarVivienda (VAR a: TArbolBin; v: TVivienda);
VAR
    aux: TCola;
    id: INTEGER;
    numHabs: INTEGER;
BEGIN
    IF NOT EsArbolBinVacio(a) THEN
    BEGIN
        ObtenerIDCola(a^.raiz, id);
        GetNumDormitorios(v, numHabs);
        
        IF numHabs = id THEN
        BEGIN
            EncolarOrdenado(a^.raiz, v);
        END
        ELSE iF numHabs < id THEN
        BEGIN
            InsertarVivienda(a^.izq, v);
        END
        ELSE
        BEGIN
            InsertarVivienda(a^.der, v);
        END;
    END
    ELSE
    BEGIN
        CrearColaVacia(aux);
        EncolarOrdenado(aux, v);
        ConstruirArbolBin(a, aux, NIL, NIL);
    END;
END;

PROCEDURE ConsultarArbolBin(a: TArbolBin; numHabs: INTEGER; minPrecio, maxPrecio: REAL; minSuperficie, maxSuperficie: REAL; maxAntiguedad: INTEGER; VAR l: TLista);
VAR
    id: INTEGER;
BEGIN
    WHILE NOT EsArbolBinVacio(a) DO
    BEGIN
        ObtenerIDCola(a^.raiz, id);

        IF numHabs = id THEN
        BEGIN
            ConsultarCola(a^.raiz, minPrecio, maxPrecio, minSuperficie, maxSuperficie, maxAntiguedad, l);
        END
        ELSE IF numHabs < id THEN
        BEGIN
            ConsultarArbolBin(a^.izq, minPrecio, maxPre, minSuperficie, maxSuperficie, maxAntiguedad, l);
        END
        ELSE
        BEGIN
            ConsultarArbolBin(a^.izq, minPrecio, maxPre, minSuperficie, maxSuperficie, maxAntiguedad, l);
        END;
    END;
END;

END.