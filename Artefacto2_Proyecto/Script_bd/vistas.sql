USE Renta_Movil;

-- Vista de usuarios con su tipo de autenticación
CREATE OR REPLACE VIEW vw_usuarios AS
SELECT u.idUsuario, u.Correo, u.EstadoUsuario, t.nombre AS TipoAutenticacion
FROM Usuarios u
INNER JOIN TipoAutenticacion t ON u.idTipoAutenticacion = t.idTipoAutenticacion;

-- Vista de reservas con datos del usuario y vehículo
CREATE OR REPLACE VIEW vw_reservas AS
SELECT r.idReserva, u.Correo AS Usuario, v.placa AS Vehiculo,
       r.fechaInicio, r.fechaFin, e.nombreEstado AS EstadoReserva
FROM Reserva r
INNER JOIN Usuarios u ON r.UsuarioID = u.idUsuario
INNER JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo
INNER JOIN EstadoReserva e ON r.idEstadoReserva = e.idEstadoReserva;

-- Vista de pagos con información de la reserva y usuario
CREATE OR REPLACE VIEW vw_pagos AS
SELECT p.idPago, r.idReserva, u.Correo AS Usuario,
       p.monto, m.nombre AS MetodoPago, ep.nombreEstado AS EstadoPago, p.referenciaTransaccion
FROM Pago p
INNER JOIN Reserva r ON p.idReserva = r.idReserva
INNER JOIN Usuarios u ON r.UsuarioID = u.idUsuario
INNER JOIN MetodoPago m ON p.idMetodoPago = m.idMetodoPago
INNER JOIN EstadoPago ep ON p.idEstadoPago = ep.idEstadoPago;

-- Vista de vehículos con su empresa, categoría y estado
CREATE OR REPLACE VIEW vw_vehiculos AS
SELECT v.idVehiculo, v.placa, e.nombre AS Empresa, c.nombre AS Categoria, ev.nombreEstado AS EstadoVehiculo
FROM Vehiculo v
INNER JOIN Empresa e ON v.idEmpresa = e.idEmpresa
INNER JOIN Categoria c ON v.idCategoria = c.idCategoria
INNER JOIN EstadoVehiculo ev ON v.idEstadoVehiculo = ev.idEstadoVehiculo;

-- Vista de quejas con usuario, reserva y estado
CREATE OR REPLACE VIEW vw_quejas AS
SELECT q.idQueja, u.Correo AS Usuario, r.idReserva, q.descripcion, q.fecha, eq.idEvidencia
FROM BuzonQuejas q
INNER JOIN Usuarios u ON q.UsuarioID = u.idUsuario
INNER JOIN Reserva r ON q.idReserva = r.idReserva
LEFT JOIN EvidenciaQueja eq ON q.idQueja = eq.idQueja;

-- Vista de calificaciones con usuario y reserva
CREATE OR REPLACE VIEW vw_calificaciones AS
SELECT c.idCalificacion, u.Correo AS Usuario, r.idReserva, c.puntuacion, c.comentario
FROM CalificacionServicio c
INNER JOIN Usuarios u ON c.UsuarioID = u.idUsuario
INNER JOIN Reserva r ON c.idReserva = r.idReserva;
