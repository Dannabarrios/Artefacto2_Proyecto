USE Renta_Movil;

-- 1. Usuarios con su rol principal
CREATE VIEW v_Usuarios_Roles AS
SELECT u.UsuarioID, u.NombreUsuario, r.NombreRol
FROM Usuarios u
LEFT JOIN Usuario_Rol ur ON u.UsuarioID = ur.UsuarioID
LEFT JOIN Roles r ON ur.RolID = r.RolID;

-- 2. Perfil de usuario completo
CREATE VIEW v_PerfilCompleto AS
SELECT u.UsuarioID, u.NombreUsuario, p.nombres, p.apellidos,
       p.tipoDocumento, p.numeroDocumento, p.correo, p.telefono, p.estado
FROM Usuarios u
JOIN PerfilUsuario p ON u.UsuarioID = p.UsuarioID;

-- 3. Vehiculos con empresa y categoria
CREATE VIEW v_VehiculosDetalle AS
SELECT v.idVehiculo, v.placa, v.marca, v.modelo, v.color, v.precioDia,
       e.nombre AS Empresa, c.nombre AS Categoria, v.estado
FROM Vehiculo v
JOIN Empresa e ON v.idEmpresa = e.idEmpresa
JOIN CategoriaVehiculo c ON v.idCategoria = c.idCategoria;

-- 4. Reservas con datos de usuario y vehiculo
CREATE VIEW v_ReservasDetalle AS
SELECT r.idReserva, u.NombreUsuario, v.placa, v.marca, r.fechaInicio, r.fechaFin, r.estado
FROM Reserva r
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo;

-- 5. Pagos realizados por reserva
CREATE VIEW v_PagosDetalle AS
SELECT p.idPago, r.idReserva, u.NombreUsuario, m.nombre AS MetodoPago,
       p.monto, p.fechaPago, p.estado
FROM Pago p
JOIN Reserva r ON p.idReserva = r.idReserva
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
JOIN MetodoPago m ON p.idMetodoPago = m.idMetodoPago;

-- 6. Contratos generados con usuario y vehiculo
CREATE VIEW v_ContratosDetalle AS
SELECT c.idContrato, r.idReserva, u.NombreUsuario, v.placa, c.rutaPDF, c.fechaGeneracion
FROM Contrato c
JOIN Reserva r ON c.idReserva = r.idReserva
JOIN Usuarios u ON r.UsuarioID = u.UsuarioID
JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo;

-- 7. Reportes de mantenimiento con estado de vehiculo
CREATE VIEW v_ReportesMantenimiento AS
SELECT rm.idReporte, v.placa, v.marca, rm.descripcion, rm.bloqueo, rm.estado, rm.fechaReporte
FROM ReporteMantenimiento rm
JOIN Vehiculo v ON rm.idVehiculo = v.idVehiculo;

-- 8. Sesiones activas de usuarios
CREATE VIEW v_SesionesActivas AS
SELECT s.SesionID, u.NombreUsuario, s.FechaInicio, s.IP_Origen
FROM Sesion_Usuario s
JOIN Usuarios u ON s.UsuarioID = u.UsuarioID
WHERE s.EstadoSesion = 'Activo';

-- 9. Auditoria de acciones de usuarios
CREATE VIEW v_AuditoriaAcciones AS
SELECT a.AuditoriaID, u.NombreUsuario, a.Accion, a.Fecha, a.Descripcion, a.IP_Origen, a.Aplicacion
FROM Auditoria a
LEFT JOIN Usuarios u ON a.UsuarioID = u.UsuarioID;

-- 10. Vehiculos disponibles por categoria y empresa
CREATE VIEW v_VehiculosDisponibles AS
SELECT v.idVehiculo, v.placa, v.marca, v.modelo, c.nombre AS Categoria, e.nombre AS Empresa, v.precioDia
FROM Vehiculo v
JOIN CategoriaVehiculo c ON v.idCategoria = c.idCategoria
JOIN Empresa e ON v.idEmpresa = e.idEmpresa
WHERE v.estado = 'Disponible';

SELECT * FROM v_Usuarios_Roles;
SELECT * FROM v_PerfilCompleto;
SELECT * FROM v_VehiculosDetalle;
SELECT * FROM v_ReservasDetalle;
SELECT * FROM v_PagosDetalle;
SELECT * FROM v_ContratosDetalle;
SELECT * FROM v_ReportesMantenimiento;
SELECT * FROM v_SesionesActivas;
SELECT * FROM v_AuditoriaAcciones;
SELECT * FROM v_VehiculosDisponibles;