USE uapa_proevent;

CREATE TABLE IF NOT EXISTS bitacora_movimiento (
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_rol INT NOT NULL,
    accion VARCHAR(150) NOT NULL,
    detalles TEXT,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol)
);
