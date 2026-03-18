
USE uapa_proevent;
CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    id_rol INT NOT NULL,
    estado ENUM('activo','inactivo') DEFAULT 'activo',
    token_acceso_rapido VARCHAR(255),
    ultimo_login DATETIME,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);
CREATE TABLE dependencia (
    id_dependencia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    responsable VARCHAR(100)
);
CREATE TABLE recinto (
    id_recinto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE evento (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    
    modalidad ENUM('Virtual','Presencial','Hibrido') NOT NULL,
    
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    
    cantidad_asistentes INT NOT NULL,
    
    tipo_evento VARCHAR(100) NOT NULL,
    
    monto_poa DECIMAL(15,2),
    moneda ENUM('USD','EUR','DOP'),
    
    estado ENUM('Pendiente','Aprobado','Rechazado','Finalizado') DEFAULT 'Pendiente',
    
    id_usuario INT NOT NULL,
    id_dependencia INT NOT NULL,
    id_recinto INT NOT NULL,
    
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_dependencia) REFERENCES dependencia(id_dependencia),
    FOREIGN KEY (id_recinto) REFERENCES recinto(id_recinto)
);
CREATE TABLE detalle_montaje (
    id_detalle_montaje INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    descripcion TEXT NOT NULL,
    
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE
);
CREATE TABLE detalle_corporativo (
    id_detalle_corporativo INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    
    tipo ENUM(
        'Bultos',
        'T-shirt',
        'Editoriales UAPA',
        'Lapiceros',
        'Llaveros',
        'Vasos',
        'Libreta',
        'Otros',
        'No aplica'
    ) NOT NULL,
    
    descripcion_otro VARCHAR(255),
    
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE
);
CREATE TABLE alimento (
    id_alimento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
CREATE TABLE evento_alimento (
    id_evento INT,
    id_alimento INT,
    
    PRIMARY KEY (id_evento, id_alimento),
    
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE,
    FOREIGN KEY (id_alimento) REFERENCES alimento(id_alimento) ON DELETE CASCADE
);
CREATE TABLE servicio_audiovisual (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    tipo_servicio VARCHAR(150) NOT NULL,
    estado ENUM('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
    
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE
);
CREATE TABLE presupuesto (
    id_presupuesto INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    total DECIMAL(15,2) NOT NULL,
    estado ENUM('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE
);
CREATE TABLE detalle_presupuesto (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_presupuesto INT NOT NULL,
    concepto VARCHAR(150),
    proveedor VARCHAR(150),
    cantidad INT,
    precio_unitario DECIMAL(12,2),
    subtotal DECIMAL(15,2),
    
    FOREIGN KEY (id_presupuesto) REFERENCES presupuesto(id_presupuesto) ON DELETE CASCADE
);
CREATE TABLE evaluacion (
    id_evaluacion INT AUTO_INCREMENT PRIMARY KEY,
    id_evento INT NOT NULL,
    
    respuesta_solicitud ENUM('Si','No'),
    
    recinto ENUM(
        'Cibao Oriental',
        'Nagua',
        'Santo Domingo Oriental',
        'Santiago'
    ),
    
    valoracion_respuesta ENUM('Muy eficiente','Excelente','Eficiente','Deficiente'),
    
    satisfaccion INT CHECK (satisfaccion BETWEEN 1 AND 5),
    
    comentario TEXT,
    
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (id_evento) REFERENCES evento(id_evento) ON DELETE CASCADE
);
INSERT INTO rol (nombre) VALUES 
('Administrador'),
('Desarrollador'),
('Solicitante');

INSERT INTO alimento (nombre) VALUES
('Desayuno'),
('Coffee Break'),
('Buffet-Almuerzo'),
('Refrigerio');