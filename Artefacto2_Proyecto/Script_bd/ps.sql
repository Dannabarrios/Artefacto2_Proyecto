USE Renta_Movil;

DELIMITER //
CREATE PROCEDURE RegistrarUsuario(
    IN pNombreUsuario VARCHAR(255),
    IN pContrasena    VARCHAR(255),
    IN pTipoAuth      VARCHAR(50)
)
BEGIN
    INSERT INTO Usuarios (NombreUsuario, Contraseña, TipoAutenticacion)
    VALUES (pNombreUsuario, pContrasena, pTipoAuth);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CambiarContrasena(
    IN pUsuarioID INT,
    IN pNuevaContrasena VARCHAR(255)
)
BEGIN
    UPDATE Usuarios
       SET Contraseña = pNuevaContrasena
     WHERE UsuarioID = pUsuarioID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AsignarRolUsuario(
    IN pUsuarioID INT,
    IN pRolID INT
)
BEGIN
    INSERT INTO Usuario_Rol (UsuarioID, RolID)
    VALUES (pUsuarioID, pRolID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CrearReserva(
    IN pUsuarioID INT,
    IN pVehiculoID INT,
    IN pFechaInicio DATE,
    IN pFechaFin DATE
)
BEGIN
    INSERT INTO Reserva (UsuarioID, idVehiculo, fechaInicio, fechaFin, estado)
    VALUES (pUsuarioID, pVehiculoID, pFechaInicio, pFechaFin, 'Pendiente');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarEstadoReserva(
    IN pReservaID INT,
    IN pNuevoEstado VARCHAR(50)
)
BEGIN
    UPDATE Reserva
       SET estado = pNuevoEstado
     WHERE idReserva = pReservaID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GenerarContrato(
    IN pReservaID INT,
    IN pRutaPDF VARCHAR(255),
    IN pCondiciones TEXT
)
BEGIN
    INSERT INTO Contrato (idReserva, rutaPDF, condiciones)
    VALUES (pReservaID, pRutaPDF, pCondiciones);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RegistrarPago(
    IN pReservaID INT,
    IN pMetodoPago INT,
    IN pMonto DECIMAL(10,2)
)
BEGIN
    INSERT INTO Pago (idReserva, idMetodoPago, monto, estado)
    VALUES (pReservaID, pMetodoPago, pMonto, 'Pendiente');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ReportarMantenimiento(
    IN pVehiculoID INT,
    IN pDescripcion TEXT,
    IN pBloqueo BOOLEAN
)
BEGIN
    INSERT INTO ReporteMantenimiento (idVehiculo, descripcion, bloqueo, estado)
    VALUES (pVehiculoID, pDescripcion, pBloqueo, 'Pendiente');
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE VehiculosDisponiblesPorCategoria(
    IN pCategoriaID INT
)
BEGIN
    SELECT v.idVehiculo, v.placa, v.marca, v.modelo, v.color, v.precioDia
      FROM Vehiculo v
     WHERE v.idCategoria = pCategoriaID
       AND v.estado = 'Disponible';
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ReservasActivasUsuario(
    IN pUsuarioID INT
)
BEGIN
    SELECT r.idReserva, v.placa, v.marca, r.fechaInicio, r.fechaFin, r.estado
      FROM Reserva r
      JOIN Vehiculo v ON r.idVehiculo = v.idVehiculo
     WHERE r.UsuarioID = pUsuarioID
       AND r.estado IN ('Pendiente','Confirmada');
END //
DELIMITER ;
