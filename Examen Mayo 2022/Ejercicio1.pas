UNIT Ejercicio1

INTERFACE
USES uArbolBin, uLista;

{
FUNCTION CompareText(const S1: string; const S2: string) : Integer;
}

PROCEDURE InsertarOrdenado(VAR l: TLista; e: TElemento);
PROCEDURE Resolver(a: TArbolBin; VAR l: TLista);

IMPLEMENTATION
PROCEDURE InsertarOrdenado(VAR l: TLista; e: TElemento);
VAR
    aux: TLista;
BEGIN
    aux := l;

    IF EsListaVacia(aux) THEN
    BEGIN
        Construir(aux, e);
    END
    ELSE 
    BEGIN
        WHILE NOT EsListaVacia(aux^.sig) AND CompareText(aux^.info, e) > 0 THEN
        BEGIN
            Construir(aux, e);
        END;
    END;
END;

PROCEDURE Resolver(a: TArbolBin; VAR l: TLista);
VAR
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    IF NOT EsArbolBinVacio(a) THEN
    BEGIN
        // Asignamos [raiz, hijoIzquierdo, hijoDerecho] a [r, izq, der]
        Raiz(a, r);
        HijoIzq(a, izq);
        HijoDer(a, der);

        // Paso recursivo
        Resolver(izq, l);
        Resolver(der, l);

        // Insertamos elemento
        InsertarOrdenado(l, r);
    END;
END;

END.