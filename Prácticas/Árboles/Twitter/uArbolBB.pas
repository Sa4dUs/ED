UNIT uArbolBB;

INTERFACE
USES uElemento, uArbolBin;

{* -------------------------------------------------------------------------- *}
{*                                 OPERACIONES                                *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Maximo(a: TArbolBin; VAR e: TElemento);
PROCEDURE Minimo(a: TArbolBin; VAR e: TElemento);
FUNCTION EsMenor(a: TArbolBin; e1, e2: TElemento): BOOLEAN;
FUNCTION Pertenece(VAR a: TArbolBin; e: TElemento): BOOLEAN;
PROCEDURE AnadirTweet(VAR a: TArbolBin; hashtag: THashtag; t: TTweet);
PROCEDURE EncontrarTweetsConHashtag(VAR a: TArbolBin; hashtag: THashtag; VAR res: TListaTweets);

{* -------------------------------------------------------------------------- *}
{*                              TRANSFORMACIONES                              *}
{* -------------------------------------------------------------------------- *}
PROCEDURE RotarSIzq(VAR a: TArbolBin);
PROCEDURE RotarSDer(VAR a: TArbolBin);
PROCEDURE RotarDIzqDer(VAR a:TArbolBin);

{* -------------------------------------------------------------------------- *}
{*                        CONSTRUCTORAS NO GENERADORAS                        *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Insertar(VAR a: TArbolBin; e: TElemento);
PROCEDURE Eliminar(VAR a: TArbolBin; e: TElemento);

IMPLEMENTATION
{* -------------------------------------------------------------------------- *}
{*                                 OPERACIONES                                *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Maximo(a: TArbolBin; VAR e: TElemento);
VAR
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    Raiz(a, r);
    HijoIzq(a, izq);
    HijoDer(a, der);

    IF EsArbolBinVacio(der) THEN
    BEGIN
        Asignar(e, r);
    END
    ELSE
    BEGIN
        Maximo(der, e);
    END;
END;

PROCEDURE Minimo(a: TArbolBin; VAR e: TElemento);
VAR
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    Raiz(a, r);
    HijoIzq(a, izq);
    HijoDer(a, der);

    IF EsArbolBinVacio(izq) THEN
    BEGIN
        Asignar(e, r);
    END
    ELSE
    BEGIN
        Minimo(izq, e);
    END;
END;

FUNCTION EsMenor(a: TArbolBin; e1, e2: TElemento): BOOLEAN;
VAR
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    IF NOT EsArbolBinVacio(a) THEN
    BEGIN
        Raiz(a, r);
        HijoIzq(a, izq);
        HijoDer(a, der);

        // TODO EsIgual -> StackOverflow
        IF EsIgual(e1, r) THEN
        BEGIN
            EsMenor := Pertenece(izq, e2);
        END
        ELSE
        BEGIN
            IF Pertenece(izq, e1) AND NOT Pertenece(izq, e2) THEN
            BEGIN
                EsMenor := TRUE;
            END
            ELSE
            BEGIN
                EsMenor := EsMenor(izq, e1, e2);
            END;
        END;
    END;
END;

FUNCTION Pertenece(VAR a: TArbolBin; e: TElemento): BOOLEAN;
VAR
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    IF EsArbolBinVacio(a) THEN
    BEGIN
        Pertenece := FALSE;
    END
    ELSE
    BEGIN
        Raiz(a, r);
        HijoIzq(a, izq);
        HijoDer(a, der);
        Pertenece := EsIgual(r, e) OR Pertenece(izq, e) OR Pertenece(izq, e);
    END;
END;

PROCEDURE AnadirTweet(VAR a: TArbolBin; hashtag: THashtag; t: TTweet);
VAR
    r: TElemento;
    izq, der: TArbolBin;
    aux: TElemento;
BEGIN
    ConstruirElemento(aux, hashtag);
    
    IF Pertenece(a, aux) THEN
    BEGIN
        Raiz(a, r);
        HijoIzq(a, izq);
        HijoDer(a, der);

        IF r.hashtag = hashtag THEN
        BEGIN
            ConstruirListaTweets(r.listaTweets, t);
        END
        ELSE
        BEGIN
            AnadirTweet(izq, hashtag, t);
            AnadirTweet(der, hashtag, t);
        END;
    END;
END;

PROCEDURE EncontrarTweetsConHashtag(VAR a: TArbolBin; hashtag: THashtag; VAR res: TListaTweets);
VAR
    r: TElemento;
    izq, der: TArbolBin;
    encontrado: BOOLEAN;
    e: TElemento;
BEGIN
    ConstruirElemento(e, hashtag);

    IF NOT EsArbolBinVacio(a) THEN
    BEGIN
        Raiz(a, r);
        HijoIzq(a, izq);
        HijoDer(a, der);

        IF EsIgual(r, e) THEN
        BEGIN
            encontrado := TRUE;
            AsignarListaTweets(res, e.listaTweets);
        END
        ELSE
        BEGIN
            Pertenece(izq, e);
            Pertenece(izq, e);
        END;

    END;

    IF NOT encontrado THEN
    BEGIN
        Writeln('[!] No se han encontrado tweets con el hashtag ', hashtag)
    END
    ELSE
    BEGIN
        Writeln('[+] Tweets encontrado!');
    END;

END;

{* -------------------------------------------------------------------------- *}
{*                              TRANSFORMACIONES                              *}
{* -------------------------------------------------------------------------- *}
PROCEDURE RotarSIzq(VAR a: TArbolBin);
VAR
    aux: TArbolBin;
BEGIN
    IF EsArbolBinVacio(a^.der) THEN
    BEGIN

    END
    ELSE
    BEGIN
        aux := a^.der;
        a^.der := aux^.izq;
        aux^.izq := a;
        a := aux;
    END;
END;

PROCEDURE RotarSDer(VAR a: TArbolBin);
VAR
    aux: TArbolBin;
BEGIN
    IF EsArbolBinVacio(a^.izq) THEN
    BEGIN

    END
    ELSE
    BEGIN
        aux := a^.izq;
        a^.izq := aux^.der;
        aux^.der := a;
        a := aux;
    END;
END;

PROCEDURE RotarDIzqDer(VAR a:TArbolBin);
BEGIN
    IF EsArbolBinVacio(a^.izq) THEN
    BEGIN

    END
    ELSE
    BEGIN
        RotarSIzq(a^.izq);
        RotarSDer(a);
    END;
END;


{* -------------------------------------------------------------------------- *}
{*                        CONSTRUCTORAS NO GENERADORAS                        *}
{* -------------------------------------------------------------------------- *}
PROCEDURE Insertar(VAR a: TArbolBin; e: TElemento);
VAR
    aux: TArbolBin;
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    
    IF EsArbolBinVacio(a) THEN
    BEGIN
        CrearArbolBinVacio(aux);
        ConstruirArbolBin(a, aux, e, aux);
    END
    ELSE
    BEGIN
        Raiz(a, r);
        HijoIzq(a, izq);
        HijoDer(a, der);
        IF EsMenor(a, e, r) THEN
        BEGIN
            Insertar(izq, e);
        END
        ELSE
        BEGIN
            Insertar(der, e);
        END;
    END;
END;

PROCEDURE Eliminar(VAR a: TArbolBin; e: TElemento);
VAR
    m: TElemento;
    aux: TArbolBin;
    r: TElemento;
    izq, der: TArbolBin;
BEGIN
    Raiz(a, r);
    HijoIzq(a, izq);
    HijoDer(a, der);

    IF NOT EsArbolBinVacio(a) THEN
    BEGIN
        IF EsIgual(r, e) THEN
        BEGIN
            aux := a;
            a := izq;
            Dispose(aux);
        END
        ELSE
        BEGIN
            IF EsArbolBinVacio(izq) THEN
            BEGIN
                aux := a;
                a := der;
                Dispose(aux);
            END
            ELSE
            BEGIN
                Minimo(der, m);
                Asignar(m, r);
                Eliminar(izq, e);
            END;
        END;
    END
    ELSE
    BEGIN
        IF EsMenor(a, e, r) THEN
        BEGIN
            Eliminar(izq, e);
        END
        ELSE
        BEGIN
            Eliminar(der, e);
        END;
    END
END;
END.