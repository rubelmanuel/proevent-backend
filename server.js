const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

db.connect((err) => {
  if (err) {
    console.log('Error conectando a MySQL:', err);
    return;
  }
  console.log('✅ Conectado a MySQL correctamente');
});

// LOGIN
app.post('/login', (req, res) => {
  const { correo, contrasena } = req.body;
  db.query(
    `SELECT u.id_usuario, u.nombre, u.correo, r.nombre AS rol
     FROM usuario u
     JOIN rol r ON u.id_rol = r.id_rol
     WHERE u.correo = ? AND u.contrasena = ?`,
    [correo, contrasena],
    (err, results) => {
      if (err) return res.status(500).json({ mensaje: 'Error del servidor' });
      if (results.length === 0) {
        return res.status(401).json({ mensaje: 'Correo o contraseña incorrectos' });
      }
      res.json({ mensaje: 'Login exitoso', usuario: results[0] });
    }
  );
});

// OBTENER todos los usuarios con su rol
app.get('/usuarios', (req, res) => {
  db.query(
    `SELECT u.id_usuario, u.nombre, u.correo, r.nombre AS rol
     FROM usuario u
     JOIN rol r ON u.id_rol = r.id_rol`,
    (err, results) => {
      if (err) return res.status(500).json({ error: err });
      res.json(results);
    }
  );
});

// OBTENER todos los roles disponibles
app.get('/roles', (req, res) => {
  db.query('SELECT * FROM rol', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// CREAR un nuevo usuario
app.post('/usuarios', (req, res) => {
  const { nombre, correo, contrasena, id_rol } = req.body;
  if (!nombre || !correo || !contrasena || !id_rol) {
    return res.status(400).json({ mensaje: 'Todos los campos son obligatorios' });
  }
  db.query(
    'INSERT INTO usuario (nombre, correo, contrasena, id_rol) VALUES (?, ?, ?, ?)',
    [nombre, correo, contrasena, id_rol],
    (err, result) => {
      if (err) {
        if (err.code === 'ER_DUP_ENTRY') {
          return res.status(409).json({ mensaje: 'El correo ya está registrado' });
        }
        return res.status(500).json({ mensaje: 'Error al crear usuario', error: err });
      }
      res.status(201).json({ mensaje: 'Usuario creado con éxito', id: result.insertId });
    }
  );
});

// ACTUALIZAR un usuario
app.put('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  const { nombre, correo, contrasena, id_rol } = req.body;

  if (contrasena && contrasena.trim() !== '') {
    db.query(
      'UPDATE usuario SET nombre = ?, correo = ?, contrasena = ?, id_rol = ? WHERE id_usuario = ?',
      [nombre, correo, contrasena, id_rol, id],
      (err) => {
        if (err) return res.status(500).json({ mensaje: 'Error al actualizar usuario', error: err });
        res.json({ mensaje: 'Usuario actualizado con éxito' });
      }
    );
  } else {
    db.query(
      'UPDATE usuario SET nombre = ?, correo = ?, id_rol = ? WHERE id_usuario = ?',
      [nombre, correo, id_rol, id],
      (err) => {
        if (err) return res.status(500).json({ mensaje: 'Error al actualizar usuario', error: err });
        res.json({ mensaje: 'Usuario actualizado con éxito' });
      }
    );
  }
});

// ELIMINAR un usuario
app.delete('/usuarios/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM usuario WHERE id_usuario = ?', [id], (err) => {
    if (err) return res.status(500).json({ mensaje: 'Error al eliminar usuario', error: err });
    res.json({ mensaje: 'Usuario eliminado con éxito' });
  });
});
// OBTENER dependencias
app.get('/dependencias', (req, res) => {
  db.query('SELECT * FROM dependencia', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// OBTENER recintos
app.get('/recintos', (req, res) => {
  db.query('SELECT * FROM recinto', (err, results) => {
    if (err) return res.status(500).json({ error: err });
    res.json(results);
  });
});

// CREAR evento
app.post('/eventos', (req, res) => {
  const {
    nombre, modalidad, fecha_inicio, fecha_fin, hora_inicio, hora_fin,
    cantidad_asistentes, tipo_evento, monto_poa, moneda,
    id_usuario, id_dependencia, id_recinto,
    detalles_corporativos, alimentos, observaciones
  } = req.body;

  db.query(
    `INSERT INTO evento (nombre, modalidad, fecha_inicio, fecha_fin, hora_inicio, hora_fin,
      cantidad_asistentes, tipo_evento, monto_poa, moneda, id_usuario, id_dependencia, id_recinto)
     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    [nombre, modalidad, fecha_inicio, fecha_fin, hora_inicio, hora_fin,
     cantidad_asistentes, tipo_evento, monto_poa, moneda, id_usuario, id_dependencia, id_recinto],
    (err, result) => {
      if (err) return res.status(500).json({ mensaje: 'Error al crear evento', error: err });

      const id_evento = result.insertId;

      // Guardar detalles corporativos
      if (detalles_corporativos && detalles_corporativos.length > 0) {
        const valoresCorp = detalles_corporativos.map(tipo => [id_evento, tipo]);
        db.query('INSERT INTO detalle_corporativo (id_evento, tipo) VALUES ?', [valoresCorp], () => {});
      }

      // Guardar alimentos
      if (alimentos && alimentos.length > 0) {
        db.query('SELECT id_alimento, nombre FROM alimento', (err2, alimentosDB) => {
          if (!err2) {
            const valores = [];
            alimentos.forEach(nombreAlimento => {
              const encontrado = alimentosDB.find(a => a.nombre === nombreAlimento);
              if (encontrado) valores.push([id_evento, encontrado.id_alimento]);
            });
            if (valores.length > 0) {
              db.query('INSERT INTO evento_alimento (id_evento, id_alimento) VALUES ?', [valores], () => {});
            }
          }
        });
      }

      // Guardar observaciones como detalle de montaje
      if (observaciones && observaciones.trim() !== '') {
        db.query('INSERT INTO detalle_montaje (id_evento, descripcion) VALUES (?, ?)', [id_evento, observaciones], () => {});
      }

      res.status(201).json({ mensaje: 'Evento creado con éxito', id_evento });
    }
  );
});
// ── EVENTOS — OBTENER TODOS ────────────────────────────
app.get('/eventos', (req, res) => {
  db.query(
    `SELECT
       e.id_evento, e.nombre, e.modalidad, e.fecha_inicio, e.fecha_fin,
       e.hora_inicio, e.hora_fin, e.cantidad_asistentes, e.tipo_evento,
       e.monto_poa, e.moneda, e.estado, e.fecha_creacion,
       u.nombre  AS solicitante,
       d.nombre  AS dependencia,
       r.nombre  AS recinto
     FROM evento e
     LEFT JOIN usuario     u ON e.id_usuario     = u.id_usuario
     LEFT JOIN dependencia d ON e.id_dependencia = d.id_dependencia
     LEFT JOIN recinto     r ON e.id_recinto     = r.id_recinto
     ORDER BY e.fecha_creacion DESC`,
    (err, results) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(results);
    }
  );
});

// ── EVENTOS — ACTUALIZAR ESTADO ────────────────────────
app.put('/eventos/:id/estado', (req, res) => {
  const { id } = req.params;
  const { estado } = req.body;
  const estadosValidos = ['Pendiente', 'Aprobado', 'Rechazado', 'Finalizado'];
  if (!estadosValidos.includes(estado))
    return res.status(400).json({ mensaje: 'Estado no válido' });
  db.query('UPDATE evento SET estado=? WHERE id_evento=?', [estado, id], (err) => {
    if (err) return res.status(500).json({ mensaje: 'Error al actualizar estado', error: err.message });
    res.json({ mensaje: 'Estado actualizado con éxito' });
  });
});

// ── EVENTOS — ELIMINAR ─────────────────────────────────
app.delete('/eventos/:id', (req, res) => {
  const { id } = req.params;
  db.query('DELETE FROM detalle_corporativo WHERE id_evento=?', [id], () => {
    db.query('DELETE FROM evento_alimento WHERE id_evento=?', [id], () => {
      db.query('DELETE FROM detalle_montaje WHERE id_evento=?', [id], () => {
        db.query('DELETE FROM evento WHERE id_evento=?', [id], (err) => {
          if (err) return res.status(500).json({ mensaje: 'Error al eliminar evento', error: err.message });
          res.json({ mensaje: 'Evento eliminado con éxito' });
        });
      });
    });
  });
});

// ── AUDIOVISUAL — CREAR SOLICITUD ──────────────────────
app.post('/audiovisual', (req, res) => {
  const { id_evento, servicios } = req.body;
  // servicios será un array de objetos: { equipo: 'Proyector', cantidad: 2, descripcion: '...', ubicacion: '...', observaciones: '...' }

  if (!id_evento || !servicios || servicios.length === 0) {
    return res.status(400).json({ mensaje: 'Faltan datos requeridos o servicios audiovisuales.' });
  }

  // 1. Validar la regla de 15 días de anticipación
  db.query('SELECT fecha_inicio FROM evento WHERE id_evento = ?', [id_evento], (err, results) => {
    if (err) return res.status(500).json({ mensaje: 'Error al buscar el evento', error: err.message });
    if (results.length === 0) return res.status(404).json({ mensaje: 'Evento no encontrado' });

    const fechaEvento = new Date(results[0].fecha_inicio);
    const fechaActual = new Date();
    // Neutralizar horas para calcular la diferencia de días correctamente
    fechaEvento.setHours(0, 0, 0, 0);
    fechaActual.setHours(0, 0, 0, 0);

    const diferenciaTiempo = fechaEvento.getTime() - fechaActual.getTime();
    const diferenciaDias = Math.ceil(diferenciaTiempo / (1000 * 3600 * 24));

    if (diferenciaDias < 15) {
      return res.status(400).json({ 
        mensaje: `Políticas institucionales: La solicitud de equipos audiovisuales requiere un mínimo de 15 días de antelación. Faltan ${diferenciaDias} días para el evento.`,
        dias_restantes: diferenciaDias 
      });
    }

    // 2. Insertar los servicios reales en la DB con las nuevas columnas
    const values = servicios.map(s => {
      // (id_evento, tipo_servicio, estado, cantidad, ubicacion, observaciones)
      return [
        id_evento, 
        s.equipo, 
        'Pendiente', 
        s.cantidad || 1, 
        s.ubicacion || '', 
        s.observaciones || ''
      ];
    });

    db.query('INSERT INTO servicio_audiovisual (id_evento, tipo_servicio, estado, cantidad, ubicacion, observaciones) VALUES ?', [values], (errInsert) => {
      if (errInsert) return res.status(500).json({ mensaje: 'Error al registrar servicios', error: errInsert.message });
      res.status(201).json({ mensaje: 'Solicitud audiovisual registrada con éxito' });
    });
  });
});

// ── AUDIOVISUAL — OBTENER TODAS ─────────────────────────
app.get('/audiovisual', (req, res) => {
  db.query(
    `SELECT 
       s.id_servicio, s.id_evento, s.tipo_servicio, s.estado AS estado_av,
       s.cantidad, s.ubicacion, s.observaciones,
       e.nombre AS nombre_evento, e.fecha_inicio, r.nombre AS recinto
     FROM servicio_audiovisual s
     JOIN evento e ON s.id_evento = e.id_evento
     LEFT JOIN recinto r ON e.id_recinto = r.id_recinto
     ORDER BY s.id_servicio DESC`,
    (err, results) => {
      if (err) return res.status(500).json({ error: err.message });
      
      const parsedResults = results.map(row => {
        // Fallback robusto en caso de que aún exista data comprimida vieja (ej: Proyector|Cant:2|Ubic:A)
        let equipo = row.tipo_servicio;
        let cant = row.cantidad;
        let ubic = row.ubicacion;
        let obs = row.observaciones;

        if (row.tipo_servicio.includes('|Cant:')) {
           const parts = row.tipo_servicio.split('|');
           equipo = parts[0];
           if (parts[1]) cant = parts[1].replace('Cant:', '');
           if (parts[2]) ubic = parts[2].replace('Ubic:', '');
           if (parts[3]) obs = parts[3].replace('Obs:', '');
        }

        return {
          id_servicio: row.id_servicio,
          id_evento: row.id_evento,
          nombre_evento: row.nombre_evento,
          fecha_evento: row.fecha_inicio,
          estado_av: row.estado_av,
          equipo: equipo,
          cantidad: cant || 1,
          ubicacion: ubic || '',
          observaciones: obs || ''
        };
      });

      res.json(parsedResults);
    }
  );
});

// ── AUDIOVISUAL — ACTUALIZAR ESTADO ─────────────────────
app.put('/audiovisual/:id/estado', (req, res) => {
  const { id } = req.params;
  const { estado } = req.body;
  const estadosValidos = ['Pendiente', 'En revisión', 'Aprobado', 'Rechazado', 'Completado'];
  
  if (!estadosValidos.includes(estado))
    return res.status(400).json({ mensaje: 'Estado audiovisual no válido' });
    
  db.query('UPDATE servicio_audiovisual SET estado=? WHERE id_servicio=?', [estado, id], (err) => {
    if (err) return res.status(500).json({ mensaje: 'Error al actualizar estado', error: err.message });
    res.json({ mensaje: 'Estado audiovisual actualizado con éxito' });
  });
});

app.listen(8080, () => {
  console.log('🚀 Servidor corriendo en http://localhost:8080');
});