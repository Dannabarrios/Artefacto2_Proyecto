USE Renta_Movil;

-- Validar inicio de sesión
DELIMITER //
CREATE PROCEDURE sp_loginUsuario (
    IN p_NombreUsuario VARCHAR(255),
    IN p_Contrasena VARCHAR(255)
)
BEGIN
    SELECT UsuarioID, NombreUsuario, EstadoUsuario, idTipoAutenticacion
    FROM Usuarios
    WHERE NombreUsuario = p_NombreUsuario
      AND Contrasena = p_Contrasena
      AND EstadoUsuario = TRUE;
END //
DELIMITER ;

-- Cambiar contraseña de usuario
DELIMITER //
CREATE PROCEDURE sp_cambiarContrasena (
    IN p_UsuarioID INT,
    IN p_NuevaContrasena VARCHAR(255)
)
BEGIN
    UPDATE Usuarios
    SET Contrasena = p_NuevaContrasena
    WHERE UsuarioID = p_UsuarioID;
END //
DELIMITER ;

-- Consultar vehículos disponibles por rango de fechas
DELIMITER //
CREATE PROCEDURE sp_vehiculosDisponibles (
    IN p_FechaInicio DATE,
    IN p_FechaFin DATE
)
BEGIN
    SELECT v.idVehiculo, v.marca, v.modelo, v.precioDia, v.urlFoto
    FROM Vehiculo v
    WHERE v.idEstadoVehiculo = 1
      AND v.idVehiculo NOT IN (
        SELECT r.idVehiculo
        FROM Reserva r
        WHERE (p_FechaInicio BETWEEN r.fechaInicio AND r.fechaFin)
           OR (p_FechaFin BETWEEN r.fechaInicio AND r.fechaFin)
           OR (r.fechaInicio BETWEEN p_FechaInicio AND p_FechaFin)
      );
END //
DELIMITER ;

-- Crear nueva reserva
DELIMITER //
CREATE PROCEDURE sp_crearReserva (
    IN p_UsuarioID INT,
    IN p_idVehiculo INT,
    IN p_FechaInicio DATE,
    IN p_FechaFin DATE
)
BEGIN
    INSERT INTO Reserva (UsuarioID, idVehiculo, fechaInicio, fechaFin, idEstadoReserva)
    VALUES (p_UsuarioID, p_idVehiculo, p_FechaInicio, p_FechaFin, 1); -- 1 = Pendiente
END //
DELIMITER ;

-- Cancelar reserva
DELIMITER //
CREATE PROCEDURE sp_cancelarReserva (
    IN p_idReserva INT
)
BEGIN
    UPDATE Reserva
    SET idEstadoReserva = 3 
    WHERE idReserva = p_idReserva;
END //
DELIMITER ;

-- Obtener historial de reservas por usuario
DELIMITER //
CREATE PROCEDURE sp_historialReservasUsuario (
    IN p_UsuarioID INT
)
BEGIN
    SELECT r.idReserva, v.marca, v.modelo, r.fechaInicio, r.fechaFin, er.nombreEstado
    FROM Reserva r
    INNER JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo
    INNER JOIN EstadoReserva er ON r.idEstadoReserva = er.idEstadoReserva
    WHERE r.UsuarioID = p_UsuarioID
    ORDER BY r.fechaReserva DESC;
END //
DELIMITER ;

-- Registrar un pago
DELIMITER //
CREATE PROCEDURE sp_registrarPago (
    IN p_idReserva INT,
    IN p_idMetodoPago INT,
    IN p_monto DECIMAL(10,2),
    IN p_referencia VARCHAR(100)
)
BEGIN
    INSERT INTO Pago (idReserva, idMetodoPago, monto, idEstadoPago, referenciaTransaccion)
    VALUES (p_idReserva, p_idMetodoPago, p_monto, 1, p_referencia); -- 1 = Pendiente
END //
DELIMITER ;

-- Actualizar estado de pago
DELIMITER //
CREATE PROCEDURE sp_actualizarEstadoPago (
    IN p_idPago INT,
    IN p_idEstadoPago INT
)
BEGIN
    UPDATE Pago
    SET idEstadoPago = p_idEstadoPago
    WHERE idPago = p_idPago;
END //
DELIMITER ;
