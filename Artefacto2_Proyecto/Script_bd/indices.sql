USE Renta_Movil;

-- Vehiculos: consultas frecuentes por precio, marca y modelo
CREATE INDEX vehiculo_precioDia_idx ON Vehiculo(precioDia);
CREATE INDEX vehiculo_marca_idx ON Vehiculo(marca);
CREATE INDEX vehiculo_modelo_idx ON Vehiculo(modelo);

-- Reservas: filtrar por estado y fechas
CREATE INDEX reserva_estado_idx ON Reserva(idEstadoReserva);
CREATE INDEX reserva_fechas_idx ON Reserva(fechaInicio, fechaFin);

-- Pagos: consultas rapidas por estado y referencia
CREATE INDEX pago_estado_idx ON Pago(idEstadoPago);
CREATE UNIQUE INDEX pago_referencia_idx ON Pago(referenciaTransaccion);

-- Usuarios: busqueda rapida por nombre
CREATE INDEX usuario_nombre_idx ON Usuarios(NombreUsuario);

-- PerfilUsuario: busqueda rapida por documento y correo
CREATE UNIQUE INDEX perfil_numeroDocumento_idx ON PerfilUsuario(numeroDocumento);
CREATE UNIQUE INDEX perfil_correo_idx ON PerfilUsuario(correo);

-- Vehiculo: busqueda rapida por placa
CREATE UNIQUE INDEX vehiculo_placa_idx ON Vehiculo(placa);

-- Empresa: busqueda rapida por NIT
CREATE UNIQUE INDEX empresa_nit_idx ON Empresa(nit);

-- DocumentoVehiculo: busqueda rapida por numero de documento
CREATE INDEX docvehiculo_numeroDocumento_idx ON DocumentoVehiculo(numeroDocumento);

-- DocumentoUsuario: busqueda rapida por numero de documento
CREATE INDEX docusuario_numeroDocumento_idx ON DocumentoUsuario(numeroDocumento);

-- TokenAcceso: busquedas rapidas por token
CREATE UNIQUE INDEX tokenacceso_token_idx ON TokenAcceso(token);

-- ReportesGenerados: busquedas por tipo y formato
CREATE INDEX reportes_tipoFormato_idx ON ReportesGenerados(tipoReporte, formato);
