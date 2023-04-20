UNIT uElemento;

INTERFACE
CONST
    INI = 1;
    FIN = 100;
TYPE
    THashtag = STRING;

    TListaHashtags = ARRAY [INI..FIN] OF THashtag;

    TTweet = RECORD
        texto: STRING[140];
    END;

    TListaTweets = ^TNodo;
    TNodo = RECORD
        info: TTweet;
        sig: ^TNodo;
    END; 

    // TODO Implementar listaTweets
    TElemento = RECORD
        hashtag: THashtag;
        listaTweets: TListaTweets;
    END;

PROCEDURE Asignar(VAR e1, e2: TElemento);
PROCEDURE AsignarTweet(VAR e1, e2: TTweet);
PROCEDURE AsignarListaTweets(VAR e1, e2: TListaTweets);
FUNCTION EsIgual(e1, e2: TElemento): BOOLEAN;
PROCEDURE ConstruirElemento(VAR e: TElemento; hashtag: THashtag);
PROCEDURE ConstruirTweet(VAR t: TTweet; texto: STRING);
PROCEDURE ConstruirListaTweets(VAR l: TListaTweets; t: TTweet);

IMPLEMENTATION
PROCEDURE Asignar(VAR e1, e2: TElemento);
BEGIN
    e1 := e2;
END;

PROCEDURE AsignarTweet(VAR e1, e2: TTweet);
BEGIN
    e1 := e2;
END;

PROCEDURE AsignarListaTweets(VAR e1, e2: TListaTweets);
BEGIN
    e1 := e2;
END;

FUNCTION EsIgual(e1, e2: TElemento): BOOLEAN;
BEGIN
    EsIgual := (e1.hashtag = e2.hashtag);
END;

PROCEDURE ConstruirElemento(VAR e: TElemento; hashtag: THashtag);
BEGIN
    e.hashtag := hashtag;
END;

PROCEDURE ConstruirTweet(VAR t: TTweet; texto: STRING);
BEGIN
    t.texto := texto;
END;

PROCEDURE ConstruirListaTweets(VAR l: TListaTweets; t: TTweet);
VAR
    aux: TListaTweets;
BEGIN
    New(aux);
    AsignarTweet(aux^.info, t);
    aux^.sig := l;
    l := aux;
END;
END.