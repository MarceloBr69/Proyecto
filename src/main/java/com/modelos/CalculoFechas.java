package com.modelos;

import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class CalculoFechas {

    public static String tiempoTranscurrido(LocalDateTime fechaCreacion) {
        LocalDateTime ahora = LocalDateTime.now();
        Duration duracion = Duration.between(fechaCreacion, ahora);

        long dias = duracion.toDays();
        long horas = duracion.minusDays(dias).toHours();

        return dias + " días y " + horas + " horas";
    }

    public static LocalDateTime convertirDateALocalDateTime(Date fecha) {
        return Instant.ofEpochMilli(fecha.getTime())
                      .atZone(ZoneId.systemDefault())
                      .toLocalDateTime();
    }
    
    public static String formatearFecha(Date fecha) {
        SimpleDateFormat formato = new SimpleDateFormat("d 'de' MMMM, yyyy");
        return formato.format(fecha);
    }
}
