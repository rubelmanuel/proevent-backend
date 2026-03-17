USE uapa_proevent;

-- 1. Insertar roles
INSERT IGNORE INTO rol (nombre) VALUES ('Administrador de Audiovisual'), ('Administrador de Evento');

-- 2. Crear tabla equipo_audiovisual
CREATE TABLE IF NOT EXISTS equipo_audiovisual (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE,
    icono VARCHAR(50) DEFAULT 'FiMonitor'
);

INSERT IGNORE INTO equipo_audiovisual (nombre, icono) VALUES 
('Proyector', 'FiMonitor'),
('Sistema de sonido', 'FiSpeaker'),
('Micrófonos', 'FiMic'),
('Cámaras (Grabación)', 'FiVideo'),
('Transmisión en vivo', 'FiRadio'),
('Iluminación', 'FiSun'),
('Pantallas o monitores extras', 'FiCast');

-- 3. Crear tabla tipo_evento_master
CREATE TABLE IF NOT EXISTS tipo_evento_master (
    id_tipo_evento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE
);

INSERT IGNORE INTO tipo_evento_master (nombre) VALUES 
('Reunión'),
('Curso taller práctico'),
('Ceremonia de graduación'),
('Firma de convenio'),
('Seminario académico'),
('Congreso internacional'),
('Conferencia magistral'),
('Evento curso cultural'),
('Jornada de investigación'),
('Feria universitaria'),
('Charlas'),
('Acto internado enfermería'),
('Reunión de cuentas'),
('Visitas guiada de colegio');

-- 4. Crear tabla tipo_detalle_corporativo
CREATE TABLE IF NOT EXISTS tipo_detalle_corporativo (
    id_detalle_corp INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE
);

INSERT IGNORE INTO tipo_detalle_corporativo (nombre) VALUES 
('Bultos, T-shert'),
('Editoriales UAPA (libros)'),
('Lapiceros'),
('Llaveros'),
('Vasos'),
('Libreta'),
('Otros'),
('No aplica');
