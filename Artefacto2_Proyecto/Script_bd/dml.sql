USE Renta_Movil;

INSERT INTO TipoAutenticacion (nombre) VALUES
('Local'), ('Google'), ('Facebook'), ('Microsoft');

INSERT INTO EstadoReserva (nombreEstado) VALUES
('Pendiente'), ('Confirmada'), ('Cancelada'), ('Finalizada');

INSERT INTO EstadoVehiculo (nombreEstado) VALUES
('Disponible'), ('Reservado'), ('En mantenimiento'), ('Fuera de servicio');

INSERT INTO EstadoPago (nombreEstado) VALUES
('Pendiente'), ('Pagado'), ('Fallido'), ('Reembolsado');

INSERT INTO Usuarios (Correo, Contrasena, EstadoUsuario, idTipoAutenticacion) VALUES
('laura@gmail.com', 'hash1234', TRUE, 1),
('juan@gmail.com', 'hash5678', TRUE, 1),
('maria@gmail.com', 'hashabcd', TRUE, 2),
('carlos@gmail.com', 'hashsecure', FALSE, 3);

INSERT INTO Roles (NombreRol, Descripcion) VALUES
('Administrador', 'Gestión total del sistema'),
('Cliente', 'Puede realizar reservas y pagos'),
('Operador', 'Gestiona vehículos y reportes'),
('Soporte', 'Atiende quejas y notificaciones');

INSERT INTO Usuario_Rol (UsuarioID, RolID) VALUES
(1,1),(2,2),(3,2),(4,3);

INSERT INTO Permisos (NombrePermiso, Descripcion) VALUES
('CrearUsuario','Permite registrar usuarios'),
('GestionarVehiculos','Alta, baja y edición de vehículos'),
('GestionarPagos','Procesar y revisar pagos'),
('GenerarReportes','Acceso a reportes PDF/Excel');

INSERT INTO Rol_Permiso (RolID, PermisoID) VALUES
(1,1),(1,2),(1,3),(1,4);

INSERT INTO Auditoria (UsuarioID, Accion, Descripcion, IP_Origen, Aplicacion) VALUES
(1,'Login','Inicio de sesión','192.168.1.10','Web'),
(2,'Reserva','Reserva confirmada','192.168.1.11','Web'),
(3,'Pago','Pago realizado','192.168.1.12','App'),
(4,'Logout','Cierre de sesión','192.168.1.13','Web');

INSERT INTO Configuracion_Seguridad (NombreConfiguracion, ValorConfiguracion, Descripcion) VALUES
('MaxIntentos','5','Intentos de login'),
('TiempoSesion','30','Duración sesión'),
('CaptchaLogin','Activo','Uso de captcha'),
('2FA','Opcional','Segundo factor');

INSERT INTO Sesion_Usuario (UsuarioID, FechaFin, IP_Origen, EstadoSesion) VALUES
(1,NULL,'192.168.1.10','Activo'),
(2,NULL,'192.168.1.11','Activo'),
(3,NOW(),'192.168.1.12','Finalizado'),
(4,NOW(),'192.168.1.13','Finalizado');

INSERT INTO Log_Errores (UsuarioID, TipoError, Descripcion, IP_Origen) VALUES
(1,'DBError','Error de conexión','192.168.1.10'),
(2,'AuthError','Contraseña inválida','192.168.1.11'),
(3,'Timeout','Sesión expirada','192.168.1.12'),
(4,'Crash','Falla inesperada','192.168.1.13');

INSERT INTO Politicas_Contrasenas (MinLongitud, MaxLongitud, RequiereMayusculas, RequiereNumeros, RequiereSimbolos, CaducidadDias) VALUES
(8,20,TRUE,TRUE,TRUE,90),
(10,25,TRUE,TRUE,FALSE,60),
(6,15,FALSE,TRUE,FALSE,30),
(12,30,TRUE,TRUE,TRUE,120);

INSERT INTO Empresa (nombre, nit, direccion, telefono, correo, estado) VALUES
('RentaCar SAS','900123456','Cra 10 #20-30 Bogotá','3101234567','contacto@rentacar.com','Activa'),
('MovilRent LTDA','901987654','Av 15 #45-12 Medellín','3119876543','info@movilrent.com','Activa'),
('AutoExpress','902555333','Calle 50 #70-15 Cali','3125553332','ventas@autoexpress.com','Activa'),
('CityCars','903444222','Carrera 8 #12-45 Barranquilla','3134442221','citycars@outlook.com','Inactiva');

INSERT INTO PerfilUsuario (UsuarioID, nombres, apellidos, tipoDocumento, numeroDocumento, correo, telefono) VALUES
(1,'Laura','Pérez','CC','1075228301','laura.perfil@gmail.com','3101112233'),
(2,'Juan','Martínez','CC','1075228302','juan.perfil@gmail.com','3101112244'),
(3,'María','Gómez','CC','1075228303','maria.perfil@gmail.com','3101112255'),
(4,'Carlos','Ramírez','TI','1075228304','carlos.perfil@gmail.com','3101112266');

INSERT INTO CategoriaVehiculo (nombre, descripcion) VALUES
('Económico','Vehículos pequeños y económicos'),
('SUV','Vehículos familiares y robustos'),
('Lujo','Vehículos de alta gama'),
('Pickup','Camionetas de carga ligera');

INSERT INTO Vehiculo (idEmpresa, idCategoria, placa, marca, modelo, color, precioDia, tipoTransmision, tipoCombustible, capacidad, kilometraje, idEstadoVehiculo, urlFoto) VALUES
(1,1,'ABC123','Chevrolet','Spark GT','Rojo',120000,'Manual','Gasolina',5,45000,1,'spark.jpg'),
(2,2,'XYZ987','Toyota','Prado','Blanco',350000,'Automática','Diesel',7,60000,1,'prado.jpg'),
(3,3,'JKL456','BMW','Serie 5','Negro',500000,'Automática','Gasolina',5,30000,1,'bmw.jpg'),
(4,4,'MNO789','Ford','Ranger','Azul',280000,'Manual','Diesel',5,75000,2,'ranger.jpg');

INSERT INTO DocumentoVehiculo (idVehiculo, tipoDocumento, numeroDocumento, fechaEmision, fechaVencimiento, rutaArchivo, estado) VALUES
(1,'SOAT','SOAT123','2025-01-01','2026-01-01','soat_spark.pdf','Vigente'),
(2,'Tecnomecánica','TEC987','2025-02-01','2026-02-01','tec_prado.pdf','Vigente'),
(3,'SOAT','SOAT456','2025-03-01','2026-03-01','soat_bmw.pdf','Vigente'),
(4,'Tecnomecánica','TEC789','2025-04-01','2026-04-01','tec_ranger.pdf','Vigente');

INSERT INTO DocumentoUsuario (idPerfil, tipoDocumento, numeroDocumento, fechaVencimiento, rutaArchivo) VALUES
(1,'Licencia Conducción','LIC123','2027-01-01','licencia_laura.pdf'),
(2,'Licencia Conducción','LIC456','2027-02-01','licencia_juan.pdf'),
(3,'Licencia Conducción','LIC789','2027-03-01','licencia_maria.pdf'),
(4,'Licencia Conducción','LIC321','2027-04-01','licencia_carlos.pdf');

INSERT INTO Reserva (UsuarioID, idVehiculo, fechaInicio, fechaFin, idEstadoReserva) VALUES
(1,1,'2025-10-05','2025-10-10',2),
(2,2,'2025-10-06','2025-10-12',1),
(3,3,'2025-10-07','2025-10-09',4),
(4,4,'2025-10-08','2025-10-15',3);

INSERT INTO Contrato (idReserva, rutaPDF, condiciones, firmaDigital) VALUES
(1,'contrato1.pdf','Condiciones estándar','firma1.png'),
(2,'contrato2.pdf','Condiciones estándar','firma2.png'),
(3,'contrato3.pdf','Condiciones estándar','firma3.png'),
(4,'contrato4.pdf','Condiciones estándar','firma4.png');

INSERT INTO MetodoPago (nombre, descripcion) VALUES
('Tarjeta Crédito','Pago con tarjeta VISA/MC'),
('Tarjeta Débito','Pago con tarjeta débito'),
('Efectivo','Pago en efectivo en oficina'),
('Transferencia','Pago vía transferencia bancaria');

INSERT INTO Pago (idReserva, idMetodoPago, monto, idEstadoPago, referenciaTransaccion) VALUES
(1,1,600000,2,'TXN123'),
(2,2,2100000,1,'TXN456'),
(3,3,1000000,2,'TXN789'),
(4,4,1960000,3,'TXN321');

INSERT INTO ReporteMantenimiento (idVehiculo, descripcion, estado) VALUES
(1,'Cambio de aceite','Pendiente'),
(2,'Revisión frenos','Pendiente'),
(3,'Cambio llantas','Pendiente'),
(4,'Mantenimiento general','Pendiente');

INSERT INTO Notificacion (UsuarioID, mensaje, estado) VALUES
(1,'Su reserva ha sido confirmada','No leido'),
(2,'Su pago está en proceso','No leido'),
(3,'Su vehículo ya está disponible','Leido'),
(4,'Se ha generado un nuevo contrato','No leido');

INSERT INTO BuzonQuejas (UsuarioID, idReserva, tipoQueja, descripcion, estado) VALUES
(1,1,'Vehículo','El carro no estaba limpio','Pendiente'),
(2,2,'Pago','Error en la transacción','Pendiente'),
(3,3,'Atención','Demora en entrega del vehículo','Pendiente'),
(4,4,'Contrato','Condiciones poco claras','Pendiente');

INSERT INTO EvidenciaQueja (idQueja, rutaArchivo, tipoArchivo) VALUES
(1,'foto1.jpg','imagen'),
(2,'captura_pago.png','imagen'),
(3,'video_entrega.mp4','video'),
(4,'documento.pdf','pdf');

INSERT INTO CalificacionServicio (UsuarioID, idReserva, puntuacion, comentario) VALUES
(1,1,5,'Excelente servicio'),
(2,2,4,'Buen carro, algo costoso'),
(3,3,3,'Regular experiencia'),
(4,4,2,'No cumplió expectativas');

INSERT INTO RecuperacionCuenta (UsuarioID, codigo, estado, intentos) VALUES
(1,'ABC123','Activo',0),
(2,'DEF456','Activo',1),
(3,'GHI789','Expirado',2),
(4,'JKL012','Activo',0);

INSERT INTO Configuracion_Idioma (idiomaDetectado, comentario) VALUES
('Español','Detectado en navegador Chrome'),
('Inglés','Detectado en navegador Edge'),
('Francés','Detectado en navegador Firefox'),
('Portugués','Detectado en app móvil');

INSERT INTO TokenAcceso (UsuarioID, token, fechaExpiracion, estado) VALUES
(1,'token123','2025-12-31 23:59:59','Activo'),
(2,'token456','2025-11-30 23:59:59','Activo'),
(3,'token789','2025-10-31 23:59:59','Inactivo'),
(4,'token012','2025-09-30 23:59:59','Expirado');

INSERT INTO ReportesGenerados (UsuarioID, tipoReporte, formato, parametros, rutaArchivo) VALUES
(1,'Vehículos','PDF','Filtro=Disponibles','reporte_vehiculos.pdf'),
(2,'Reservas','Excel','Fecha=2025-10','reporte_reservas.xlsx'),
(3,'Pagos','PDF','Estado=Pagados','reporte_pagos.pdf'),
(4,'Mantenimientos','Excel','Vehículo=Todos','reporte_mantenimientos.xlsx');