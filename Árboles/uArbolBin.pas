UNIT uArbolBB;

INTERFACE
USES uElemento;

TYPE
    TArbolBin = ^TNodo;

    TNodo = RECORD
        r: TElemento;
        izq, der: TArbolBin;
    END;

    {* -------------------------------------------------------------------------- *}
    {*                          CONSTRUCTORAS GENERADORAS                         *}
    {* -------------------------------------------------------------------------- *}
    PROCEDURE CrearArbolBinVacio (VAR a: TArbolBin);
    PROCEDURE ConstruirArbolBin  (VAR a, izq, r, der: TArbolBin);

    {* -------------------------------------------------------------------------- *}
    {*                         OBSERVADORAS NO SELECTORAS                         *}
    {* -------------------------------------------------------------------------- *}
    FUNCTION EsArbolBinVacio(a: TArbolBin): BOOLEAN; 

    {* -------------------------------------------------------------------------- *}
    {*                           OBSERVADORAS SELECTORAS                          *}
    {* -------------------------------------------------------------------------- *}
    PROCEDURE Raiz(a: TArbolBin; VAR e: TElemento);
    PROCEDURE HijoIzq(a: TArbolBin; VAR hIzq: TArbolBin);
    PROCEDURE HijoDer(a: TArbolBin; VAR hDer: TArbolBin);

IMPLEMENTATION
    {* -------------------------------------------------------------------------- *}
    {*                          CONSTRUCTORAS GENERADORAS                         *}
    {* -------------------------------------------------------------------------- *}
    PROCEDURE CrearArbolBinVacio (VAR a: TArbolBin);
    BEGIN
        a := NIL;
    END;

    PROCEDURE ConstruirArbolBin  (VAR a, izq, der: TArbolBin; r: TElemento);
    BEGIN
        New(a);
        Asignar(a^.r, r);
        a^.izq := izq;
        a^.der := der;
    END;

    {* -------------------------------------------------------------------------- *}
    {*                         OBSERVADORAS NO SELECTORAS                         *}
    {* -------------------------------------------------------------------------- *}
    FUNCTION EsArbolBinVacio(a: TArbolBin): BOOLEAN; 
    BEGIN
        EsArbolBinVacio := (a = NIL);
    END;

    {* -------------------------------------------------------------------------- *}
    {*                           OBSERVADORAS SELECTORAS                          *}
    {* -------------------------------------------------------------------------- *}
    PROCEDURE Raiz(a: TArbolBin; VAR e: TElemento);
    BEGIN
        Asignar(e, a^.r);
    END;

    PROCEDURE HijoIzq(a: TArbolBin; VAR hIzq: TArbolBin);
    BEGIN
        hIzq := a^.izq;
    END;

    PROCEDURE HijoDer(a: TArbolBin; VAR hDer: TArbolBin);
    BEGIN
        hDer := a^.der;
    END;


END.