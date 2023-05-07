UNIT uVivienda, uFecha;

INTERFACE
TYPE
    TVivienda = RECORD
        score: REAL;
        direccion: TUbicacion;
        numDomrs, numAseos, superficie, precio: INTEGER;
        fConstruccion, fPublicacion: TFecha;
        observaciones: STRING;
    END;

FUNCTION GetNumDormitorios(vivienda: TVivienda): INTEGER;
FUNCTION GetNumAseos(vivienda: TVivienda): INTEGER;
FUNCTION GetSuperficie(vivienda: TVivienda): INTEGER;
FUNCTION GetPrecio(vivienda: TVivienda): INTEGER;
PROCEDURE GetFechaPublicacion(vivienda: TVivienda; VAR fecha: TFecha);
PROCEDURE GetFechaConstruccion(vivienda: TVivienda; VAR fecha: TFecha);
PROCEDURE GetDireccion(vivienda: TVivienda; VAR direccion: TUbicacion);
PROCEDURE GetObservaciones(vivienda: TVivienda; VAR observaciones:STRING);
PROCEDURE AsignarVivienda(v1: TVivienda; VAR v2: TVivienda);
PROCEDURE AsignarScore(VAR v: TVivienda);
PROCEDURE AsignarInteres(s: REAL; VAR v: TVivienda);

IMPLEMENTATION
PROCEDURE AsignarScore(VAR v: TVivienda);
VAR
    fechaHoy: TFecha;
BEGIN
    AsignarInteres(0.25*(7300-DiferenciaFechas(fechaHoy, v.fConstruccion)) + 1000*(v.numDomrs/(v.precio/1000)) + 1000*(v.superficie/v.precio/1000), v);
END;
END.