unit uhashtag2;

{$mode ObjFPC}{$H+}

interface


uses
  Classes, SysUtils, ulistatuits2,utuit2;
type
Thashtag=^TNodo2;
TNodo2= record
nombre: array [1..140] of char;
Tuits:TListaTuit;
end;
Procedure MostrarHashtag (h:THashtag);

implementation
Procedure MostrarHashtag (h:THashtag);
          begin
            write(h^.nombre);
            write (' ');
            writeln(LongitudLista(h^.Tuits));
          end;
end.

