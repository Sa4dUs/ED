program Bolsas;

uses uBolsasj;

VAR
  b,b2,b3:TBolsas;
  e:Intervalo;

begin
  CrearVacia(b);
  readln(e);
  Poner(b,e);
  readln(e);
  Poner(b,e);
  readln(e);
  Poner(b,e);
  readln(e);
  Poner(b,e);
  readln(e);
  Poner(b,e);
  readln(e);
  Poner(b,e);
  readln(e);
  Poner(b,e);
  writeln('Bolsa:');
  MostrarBolsa(b);
  readln;

  writeln('Elegir:');
  Elegir(b,e);
  writeln(e);
  readln;

  writeln('Pertenece:');
  readln(e);
  writeln(Pertenece(b,e));
  readln;


  CrearVacia(b2);
  readln(e);
  Poner(b2,e);
  readln(e);
  Poner(b2,e);
  readln(e);
  Poner(b2,e);
  readln(e);
  Poner(b2,e);
  writeln('Bolsa 2:');
  MostrarBolsa(b2);
  readln;

  writeln('EsSubconjunto:');
  writeln(EsSubconjunto(b2,b));
  readln;

  writeln('Cardinal 1:');
  writeln(Cardinal(b));
  readln;

  writeln('Cardinal 2:');
  writeln(Cardinal(b2));
  readln;

  writeln('Quitar');
  readln(e);
  Quitar(b,e);
  writeln('Bolsa 1:');
  MostrarBolsa(b);
  readln;

  writeln('Union');
  writeln('Bolsa 3:');
  Union(b3,b,b2);
  MostrarBolsa(b3);
  readln;

  writeln('Interseccion');
  writeln('Bolsa 3:');
  Interseccion(b3,b,b2);
  MostrarBolsa(b3);
  readln;

  writeln('Diferencia');
  writeln('Bolsa 3:');
  Diferencia(b3,b,b2);
  MostrarBolsa(b3);
  readln;

end.


