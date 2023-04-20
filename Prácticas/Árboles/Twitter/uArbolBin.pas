UNIT uArbolBin;

INTERFACE
USES uElemento, Math;

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
    PROCEDURE ConstruirArbolBin  (VAR a: TArbolBin; izq: TArbolBin; r: TElemento; der: TArbolBin);

    {* -------------------------------------------------------------------------- *}
    {*                         OBSERVADORAS NO SELECTORAS                         *}
    {* -------------------------------------------------------------------------- *}
    FUNCTION EsArbolBinVacio(a: TArbolBin): BOOLEAN; 
    FUNCTION Altura(a: TArbolBin): INTEGER;

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

    PROCEDURE ConstruirArbolBin  (VAR a: TArbolBin; izq: TArbolBin; r: TElemento; der: TArbolBin);
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

    FUNCTION Altura(a: TArbolBin): INTEGER;
    VAR contador: INTEGER;
    BEGIN
        contador := 0;

        IF NOT EsArbolBinVacio(a) THEN
        BEGIN
            contador := 1 + max(Altura(a^.izq), Altura(a^.der));
        END;

        Altura := contador;
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