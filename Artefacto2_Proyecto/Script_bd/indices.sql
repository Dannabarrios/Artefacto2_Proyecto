USE Renta_Movil;

-- este indice sirve para buscar usuarios rapidamente por su correo (login principal)
CREATE INDEX idx_usuario_correo ON Usuarios(Correo);

-- este indice sirve para obtener reservas por usuario (historial de reservas)
CREATE INDEX idx_reserva_usuario ON Reserva(UsuarioID);

-- este indice sirve para filtrar vehiculos por empresa (cuando se consulta flota de cada empresa)
CREATE INDEX idx_vehiculo_empresa ON Vehiculo(idEmpresa);

-- este indice sirve para consultar pagos por reserva 
CREATE INDEX idx_pago_reserva ON Pago(idReserva);

-- este indice sirve para buscar reservas en un rango de fechas (disponibilidad de vehiculos)
CREATE INDEX idx_reserva_fechas ON Reserva(fechaInicio, fechaFin);

-- este indice sirve para identificar el estado de los vehiculos (disponible, reservado, mantenimiento)
CREATE INDEX idx_vehiculo_estado ON Vehiculo(idEstadoVehiculo);
