program Conjuntos;

uses uConjuntoej;

VAR
  c,c2,c3:TConjunto;
  e:Intervalo;

begin
  CrearVacio(c);
  readln(e);
  Poner(c,e);
  readln(e);
  Poner(c,e);
  readln(e);
  Poner(c,e);
  readln(e);
  Poner(c,e);
  readln(e);
  Poner(c,e);
  readln(e);
  Poner(c,e);
  readln(e);
  Poner(c,e);
  writeln('Conjunto:');
  MostrarConjunto(c);
  readln;

  {writeln('Elegir:');
  Elegir(c,e);
  writeln(e);
  readln;

  writeln('Pertenece:');
  readln(e);
  writeln(Pertenece(c,e));
  readln;}


  CrearVacio(c2);
  readln(e);
  Poner(c2,e);
  readln(e);
  Poner(c2,e);
  readln(e);
  Poner(c2,e);
  readln(e);
  Poner(c2,e);
  writeln('Conjunto 2:');
  MostrarConjunto(c2);
  readln;

  writeln('EsSubconjunto:');
  writeln(EsSubconjunto(c2,c));
  readln;

  writeln('Cardinal 1:');
  writeln(Cardinal(c));
  readln;

  writeln('Cardinal 2:');
  writeln(Cardinal(c2));
  readln;

  writeln('Quitar');
  readln(e);
  Quitar(c,e);
  writeln('Conjunto 1:');
  MostrarConjunto(c);
  readln;

  writeln('Union');
  writeln('Conjunto 3:');
  Union(c3,c,c2);
  MostrarConjunto(c3);
  readln;

  writeln('Interseccion');
  writeln('Conjunto 3:');
  Interseccion(c3,c,c2);
  MostrarConjunto(c3);
  readln;

  writeln('Diferencia');
  writeln('Conjunto 3:');
  Diferencia(c3,c,c2);
  MostrarConjunto(c3);
  readln;

end.

