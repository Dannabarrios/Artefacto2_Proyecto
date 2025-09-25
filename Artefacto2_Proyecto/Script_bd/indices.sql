USE Renta_Movil;

-- Este indice sirve para buscar usuarios rapidamente por su nombre
CREATE INDEX ind_usuarios_nombreusuario
    ON Usuarios (NombreUsuario);

-- Este indice sirve para acelerar las consultas por Rol dentro de la tabla de relacion Usuario_Rol
CREATE INDEX ind_usuario_rol_rolid
    ON Usuario_Rol (RolID);

-- Este indice sirve para filtrar vehiculos segun su estado (por ejemplo Disponible)
CREATE INDEX ind_vehiculo_estado
    ON Vehiculo (estado);

-- Este indice sirve para mejorar joins y busquedas por placa de vehiculo
CREATE INDEX ind_vehiculo_placa
    ON Vehiculo (placa);

-- Este indice sirve para filtrar reservas por usuario y por rango de fechas
CREATE INDEX ind_reserva_usuario_fecha
    ON Reserva (UsuarioID, fechaInicio, fechaFin);

-- Este indice sirve para buscar pagos por reserva y por estado
CREATE INDEX ind_pago_reserva_estado
    ON Pago (idReserva, estado);

-- Este indice sirve para consultar reportes de mantenimiento por vehiculo y por estado
CREATE INDEX ind_reporte_mantenimiento_vehiculo_estado
    ON ReporteMantenimiento (idVehiculo, estado);

-- Este indice sirve para encontrar rapidamente las sesiones activas de un usuario
CREATE INDEX ind_sesion_usuario_estado
    ON Sesion_Usuario (UsuarioID, EstadoSesion);

-- Este indice sirve para revisar la auditoria de acciones por usuario y por fecha
CREATE INDEX ind_auditoria_usuario_fecha
    ON Auditoria (UsuarioID, Fecha);

-- Este indice sirve para ubicar el contrato correspondiente a una reserva especifica
CREATE INDEX ind_contrato_reserva
    ON Contrato (idReserva);
