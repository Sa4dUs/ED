PROGRAM Twitter;

USES uArbolBB, uArbolBin, uElemento, sysutils, strutils;

PROCEDURE ExtraerHashtags(VAR a: TArbolBin; t: TTweet);
VAR
    save: TTweet;
    contador: INI..FIN;
    posicion, longitud: INTEGER;
    i: LONGINT;
    s: STRING;
BEGIN
    save := t;
    contador := 1;
    i := posEx('#', t.texto);
    WHILE i <> 0 DO
    BEGIN 
        s := ExtractSubstr(t.texto, i, [' ']);
        AnadirTweet(a, s, save);
        posicion := Pos(s, t.texto);
        longitud := Length(s);
        Delete(t.texto, posicion, longitud);
        contador := Succ(contador);
        i := posEx('#', t.texto);
    END;
END;

PROCEDURE InsertarHashtags (VAR a: TArbolBin; nombreArchivo: STRING); 
VAR 
    f: TEXT;
    linea: STRING;
    e: TElemento;
BEGIN
    Assign(f, nombreArchivo);
    Reset(f);

    WHILE NOT Eof(f) DO
    BEGIN
        Readln(f, linea);
        ConstruirElemento(e, linea);
        Insertar(a, e);
    END;

    Close(f);
END;

PROCEDURE InsertarTweets (VAR a: TArbolBin; nombreArchivo: STRING); 
VAR 
    f: TEXT;
    linea: STRING;
    t: TTweet;
BEGIN
    Assign(f, nombreArchivo);
    Reset(f);

    WHILE NOT Eof(f) DO
    BEGIN
        Readln(f, linea);
        ConstruirTweet(t, linea);
        ExtraerHashtags(a, t);
    END;

    Close(f);
END;

VAR
    a: TArbolBin;
    res: TListaTweets;
BEGIN
	CrearArbolBinVacio(a);
    InsertarHashtags(a, 'hashtags.txt');
    InsertarTweets(a, 'tweets.txt');

    EncontrarTweetsConHashtag(a, '#MiMejorMomento', res);
END.