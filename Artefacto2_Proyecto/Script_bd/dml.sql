USE Renta_Movil;

INSERT INTO Usuarios (NombreUsuario, Contraseña, EstadoUsuario, TipoAutenticacion) VALUES
('laura', 'pass123', TRUE, 'Local'),
('vanessa', 'pass234', TRUE, 'Local'),
('danna', 'pass345', TRUE, 'Google'),
('camilo', 'pass456', TRUE, 'Local');

INSERT INTO Roles (NombreRol, Descripcion) VALUES
('Administrador', 'Acceso total'),
('Cliente', 'Usuario cliente'),
('Operador', 'Gestion de reservas'),
('Soporte', 'Atencion de soporte');

INSERT INTO Usuario_Rol (UsuarioID, RolID) VALUES
(1,1),(2,2),(3,2),(4,3);

INSERT INTO Permisos (NombrePermiso, Descripcion) VALUES
('CrearUsuario','Puede crear usuarios'),
('EditarUsuario','Puede editar usuarios'),
('EliminarUsuario','Puede eliminar usuarios'),
('VerReportes','Puede ver reportes');

INSERT INTO Rol_Permiso (RolID, PermisoID) VALUES
(1,1),(1,2),(1,3),(1,4);

INSERT INTO Auditoria (UsuarioID, Accion, Descripcion, IP_Origen, Aplicacion) VALUES
(1,'Login','Inicio de sesion','192.168.1.1','Web'),
(2,'Reserva','Creo una reserva','192.168.1.2','Movil'),
(3,'Pago','Realizo un pago','192.168.1.3','Web'),
(4,'Logout','Cerro sesion','192.168.1.4','Web');

INSERT INTO Configuracion_Seguridad (NombreConfiguracion, ValorConfiguracion, Descripcion) VALUES
('IntentosMaximos','5','Maximo intentos de login'),
('TiempoSesion','30','Duracion de sesion en minutos'),
('BloqueoIP','1','Bloqueo por intentos fallidos'),
('AlertaEmail','1','Envia alerta de seguridad');

INSERT INTO Sesion_Usuario (UsuarioID, FechaFin, IP_Origen, EstadoSesion) VALUES
(1,NULL,'192.168.1.1','Activo'),
(2,NULL,'192.168.1.2','Activo'),
(3,NULL,'192.168.1.3','Activo'),
(4,NULL,'192.168.1.4','Activo');

INSERT INTO Log_Errores (UsuarioID, TipoError, Descripcion, IP_Origen) VALUES
(1,'SQL','Error de consulta','192.168.1.1'),
(2,'Conexion','Fallo de conexion','192.168.1.2'),
(3,'Aplicacion','Error de aplicacion','192.168.1.3'),
(4,'Autenticacion','Error de login','192.168.1.4');

INSERT INTO Politicas_Contraseñas (MinLongitud, MaxLongitud, RequiereMayusculas, RequiereNumeros, RequiereSimbolos, CaducidadDias) VALUES
(8,20,TRUE,TRUE,TRUE,90),
(10,25,TRUE,TRUE,FALSE,120),
(12,30,TRUE,FALSE,TRUE,180),
(8,16,FALSE,TRUE,FALSE,60);

INSERT INTO Empresa (nombre, nit, direccion, telefono, correo, estado) VALUES
('AutoRent','900123001','Calle 10 20-30','3001111111','info@autorent.com','Activa'),
('CarGo','900123002','Carrera 5 15-25','3002222222','info@cargo.com','Activa'),
('MovilRent','900123003','Avenida 7 12-45','3003333333','info@movilrent.com','Activa'),
('CityCar','900123004','Calle 8 14-10','3004444444','info@citycar.com','Activa');

INSERT INTO PerfilUsuario (UsuarioID, nombres, apellidos, tipoDocumento, numeroDocumento, correo, telefono, estado) VALUES
(1,'Laura','Martinez','CC','100100100','laura@mail.com','3101111111','Activo'),
(2,'Vanessa','Gomez','CC','100200200','vanessa@mail.com','3102222222','Activo'),
(3,'Danna','Perez','CC','100300300','danna@mail.com','3103333333','Activo'),
(4,'Camilo','Lopez','CC','100400400','camilo@mail.com','3104444444','Activo');

INSERT INTO CategoriaVehiculo (nombre, descripcion) VALUES
('Sedan','Vehiculo tipo sedan'),
('SUV','Vehiculo deportivo utilitario'),
('Hatchback','Vehiculo compacto'),
('Pickup','Camioneta de carga');

INSERT INTO Vehiculo (idEmpresa, idCategoria, placa, marca, modelo, color, precioDia, tipoTransmision, tipoCombustible, capacidad, kilometraje, estado) VALUES
(1,1,'ABC123','Toyota','Corolla','Rojo',150.00,'Automatica','Gasolina',5,30000,'Disponible'),
(2,2,'DEF456','Mazda','CX5','Negro',200.00,'Automatica','Diesel',5,25000,'Disponible'),
(3,3,'GHI789','Kia','Rio','Blanco',120.00,'Manual','Gasolina',5,40000,'Disponible'),
(4,4,'JKL012','Ford','Ranger','Gris',220.00,'Automatica','Diesel',4,35000,'Disponible');

INSERT INTO DocumentoVehiculo (idVehiculo, tipoDocumento, numeroDocumento, fechaEmision, fechaVencimiento, rutaArchivo, estado) VALUES
(1,'SOAT','SOAT001','2025-01-01','2026-01-01','/docs/soat1.pdf','Vigente'),
(2,'SOAT','SOAT002','2025-01-01','2026-01-01','/docs/soat2.pdf','Vigente'),
(3,'SOAT','SOAT003','2025-01-01','2026-01-01','/docs/soat3.pdf','Vigente'),
(4,'SOAT','SOAT004','2025-01-01','2026-01-01','/docs/soat4.pdf','Vigente');

INSERT INTO DocumentoUsuario (idPerfil, tipoDocumento, numeroDocumento, fechaVencimiento, rutaArchivo) VALUES
(1,'Licencia','LIC001','2026-01-01','/docs/lic1.pdf'),
(2,'Licencia','LIC002','2026-01-01','/docs/lic2.pdf'),
(3,'Licencia','LIC003','2026-01-01','/docs/lic3.pdf'),
(4,'Licencia','LIC004','2026-01-01','/docs/lic4.pdf');

INSERT INTO Reserva (UsuarioID, idVehiculo, fechaInicio, fechaFin, estado) VALUES
(1,1,'2025-09-25','2025-09-28','Pendiente'),
(2,2,'2025-09-26','2025-09-29','Pendiente'),
(3,3,'2025-09-27','2025-09-30','Pendiente'),
(4,4,'2025-09-28','2025-10-01','Pendiente');

INSERT INTO Contrato (idReserva, rutaPDF, condiciones) VALUES
(1,'/contratos/contrato1.pdf','Condiciones generales 1'),
(2,'/contratos/contrato2.pdf','Condiciones generales 2'),
(3,'/contratos/contrato3.pdf','Condiciones generales 3'),
(4,'/contratos/contrato4.pdf','Condiciones generales 4');

INSERT INTO MetodoPago (nombre, descripcion) VALUES
('PSE','Pago en linea'),
('TarjetaCredito','Pago con tarjeta de credito'),
('Efectivo','Pago en efectivo'),
('Transferencia','Pago por transferencia');

INSERT INTO Pago (idReserva, idMetodoPago, monto, estado) VALUES
(1,1,450.00,'Pendiente'),
(2,2,600.00,'Pendiente'),
(3,3,360.00,'Pendiente'),
(4,4,660.00,'Pendiente');

INSERT INTO ReporteMantenimiento (idVehiculo, idReserva, descripcion, bloqueo, estado) VALUES
(1,1,'Revision de frenos',FALSE,'Pendiente'),
(2,2,'Cambio de aceite',FALSE,'Pendiente'),
(3,3,'Revision de llantas',FALSE,'Pendiente'),
(4,4,'Cambio de bateria',FALSE,'Pendiente');

INSERT INTO Notificacion (UsuarioID, mensaje, estado) VALUES
(1,'Su reserva ha sido creada','No leido'),
(2,'Su reserva ha sido creada','No leido'),
(3,'Su reserva ha sido creada','No leido'),
(4,'Su reserva ha sido creada','No leido');

INSERT INTO RecuperacionCuenta (UsuarioID, codigo, estado, intentos) VALUES
(1,'ABC111','Activo',0),
(2,'ABC222','Activo',0),
(3,'ABC333','Activo',0),
(4,'ABC444','Activo',0);
