USE Renta_Movil;

-- Procedimiento para registrar un nuevo usuario
DELIMITER //
CREATE PROCEDURE sp_registrar_usuario (
    IN pCorreo VARCHAR(100),
    IN pClave VARCHAR(100),
    IN pEstadoUsuario VARCHAR(20),
    IN pIdTipoAutenticacion INT
)
BEGIN
    INSERT INTO Usuarios (Correo, Clave, EstadoUsuario, idTipoAutenticacion)
    VALUES (pCorreo, pClave, pEstadoUsuario, pIdTipoAutenticacion);
END //
DELIMITER ;

-- Procedimiento para registrar una reserva
DELIMITER //
CREATE PROCEDURE sp_registrar_reserva (
    IN pUsuarioID INT,
    IN pVehiculoID INT,
    IN pFechaInicio DATE,
    IN pFechaFin DATE,
    IN pIdEstadoReserva INT
)
BEGIN
    INSERT INTO Reserva (UsuarioID, idVehiculo, fechaInicio, fechaFin, idEstadoReserva)
    VALUES (pUsuarioID, pVehiculoID, pFechaInicio, pFechaFin, pIdEstadoReserva);
END //
DELIMITER ;

-- Procedimiento para consultar reservas de un usuario
DELIMITER //
CREATE PROCEDURE sp_reservas_por_usuario (
    IN pUsuarioID INT
)
BEGIN
    SELECT r.idReserva, r.fechaInicio, r.fechaFin, e.nombreEstado AS Estado, v.placa
    FROM Reserva r
    INNER JOIN EstadoReserva e ON r.idEstadoReserva = e.idEstadoReserva
    INNER JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo
    WHERE r.UsuarioID = pUsuarioID;
END //
DELIMITER ;

-- Procedimiento para registrar un pago
DELIMITER //
CREATE PROCEDURE sp_registrar_pago (
    IN pIdReserva INT,
    IN pIdMetodoPago INT,
    IN pMonto DECIMAL(10,2),
    IN pIdEstadoPago INT,
    IN pReferencia VARCHAR(100)
)
BEGIN
    INSERT INTO Pago (idReserva, idMetodoPago, monto, idEstadoPago, referenciaTransaccion)
    VALUES (pIdReserva, pIdMetodoPago, pMonto, pIdEstadoPago, pReferencia);
END //
DELIMITER ;

-- Procedimiento para cambiar estado de un vehículo
DELIMITER //
CREATE PROCEDURE sp_actualizar_estado_vehiculo (
    IN pIdVehiculo INT,
    IN pIdEstadoVehiculo INT
)
BEGIN
    UPDATE Vehiculo
    SET idEstadoVehiculo = pIdEstadoVehiculo
    WHERE idVehiculo = pIdVehiculo;
END //
DELIMITER ;

-- Procedimiento para generar reporte de ingresos por fechas
DELIMITER //
CREATE PROCEDURE sp_reporte_ingresos (
    IN pFechaInicio DATE,
    IN pFechaFin DATE
)
BEGIN
    SELECT SUM(p.monto) AS TotalIngresos
    FROM Pago p
    INNER JOIN Reserva r ON p.idReserva = r.idReserva
    WHERE r.fechaInicio >= pFechaInicio AND r.fechaFin <= pFechaFin
      AND p.idEstadoPago = 1; 
END //
DELIMITER ;
