USE Renta_Movil;

-- Vehiculos disponibles (solo los que no estan reservados y en estado 'Disponible')
CREATE OR REPLACE VIEW vw_VehiculosDisponibles AS
SELECT v.idVehiculo, v.marca, v.modelo, v.color, v.precioDia, v.capacidad, v.urlFoto, ev.nombreEstado AS estado
FROM Vehiculo v
INNER JOIN EstadoVehiculo ev ON v.idEstadoVehiculo = ev.idEstadoVehiculo
WHERE ev.nombreEstado = 'Disponible';

-- Reservas con detalle de usuario y vehiculo
CREATE OR REPLACE VIEW vw_ReservasDetalle AS
SELECT r.idReserva, u.NombreUsuario, p.nombres, p.apellidos,
       v.marca, v.modelo, r.fechaInicio, r.fechaFin, er.nombreEstado AS estadoReserva
FROM Reserva r
INNER JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
INNER JOIN PerfilUsuario p ON u.UsuarioID = p.UsuarioID
INNER JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo
INNER JOIN EstadoReserva er ON r.idEstadoReserva = er.idEstadoReserva;

-- Pagos con detalle de reserva, metodo y estado
CREATE OR REPLACE VIEW vw_PagosDetalle AS
SELECT p.idPago, r.idReserva, u.NombreUsuario, v.marca, v.modelo,
       p.monto, p.fechaPago, mp.nombre AS metodoPago, ep.nombreEstado AS estadoPago
FROM Pago p
INNER JOIN Reserva r ON p.idReserva = r.idReserva
INNER JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
INNER JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo
INNER JOIN MetodoPago mp ON p.idMetodoPago = mp.idMetodoPago
INNER JOIN EstadoPago ep ON p.idEstadoPago = ep.idEstadoPago;

-- Perfil completo de usuario
CREATE OR REPLACE VIEW vw_PerfilUsuarioCompleto AS
SELECT u.UsuarioID, u.NombreUsuario, u.EstadoUsuario, ta.nombre AS tipoAutenticacion,
       p.nombres, p.apellidos, p.tipoDocumento, p.numeroDocumento, p.correo, p.telefono, p.estado
FROM Usuarios u
INNER JOIN PerfilUsuario p ON u.UsuarioID = p.UsuarioID
INNER JOIN TipoAutenticacion ta ON u.idTipoAutenticacion = ta.idTipoAutenticacion;

-- Quejas con evidencias
CREATE OR REPLACE VIEW vw_QuejasConEvidencias AS
SELECT q.idQueja, u.NombreUsuario, q.tipoQueja, q.descripcion, q.estado, q.fechaRegistro,
       e.rutaArchivo, e.tipoArchivo, e.fechaSubida
FROM BuzonQuejas q
INNER JOIN Usuarios u ON q.UsuarioID = u.UsuarioID
LEFT JOIN EvidenciaQueja e ON q.idQueja = e.idQueja;

-- Calificaciones de servicio con detalle de reserva
CREATE OR REPLACE VIEW vw_CalificacionesDetalle AS
SELECT c.idCalificacion, u.NombreUsuario, v.marca, v.modelo,
       c.puntuacion, c.comentario, c.fecha
FROM CalificacionServicio c
INNER JOIN Usuarios u ON c.UsuarioID = u.UsuarioID
INNER JOIN Reserva r ON c.idReserva = r.idReserva
INNER JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo;
