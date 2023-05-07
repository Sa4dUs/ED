UNIT uFecha;

INTERFACE
TYPE 
    TFecha = STRING;

FUNCTION EsMasReciente(fecha1, fecha2: TFecha): BOOLEAN;
FUNCTION EsIgualFecha(fecha1, fecha2: TFecha): BOOLEAN;
PROCEDURE CrearFecha(dia, mes, anno: INTEGER; VAR fecha:TFecha);
FUNCTION DiferenciaFechas(fecha1, fecha2: TFecha):INTEGER;

IMPLEMENTATION
END.