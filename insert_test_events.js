const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

const today = new Date();
const farDate = new Date();
farDate.setDate(today.getDate() + 20);
const closeDate = new Date();
closeDate.setDate(today.getDate() + 5);

const formatDate = (date) => date.toISOString().split('T')[0];

db.connect(err => {
  if (err) { console.error(err); return; }
  
  db.query('SELECT id_usuario FROM usuario LIMIT 1', (err, uRows) => {
    const idUsuario = uRows && uRows.length > 0 ? uRows[0].id_usuario : 1;
    
    db.query('SELECT id_dependencia FROM dependencia LIMIT 1', (err, dRows) => {
      const idDependencia = dRows && dRows.length > 0 ? dRows[0].id_dependencia : 1;
      
      db.query('SELECT id_recinto FROM recinto LIMIT 1', (err, rRows) => {
        const idRecinto = rRows && rRows.length > 0 ? rRows[0].id_recinto : 1;

        db.query(`INSERT INTO evento (nombre, modalidad, fecha_inicio, fecha_fin, hora_inicio, hora_fin, cantidad_asistentes, tipo_evento, monto_poa, moneda, estado, id_usuario, id_dependencia, id_recinto)
                  VALUES ('Evento Válido (>15 días)', 'Presencial', '${formatDate(farDate)}', '${formatDate(farDate)}', '10:00:00', '12:00:00', 50, 'Conferencia', 0, 'DOP', 'Aprobado', ?, ?, ?)`, 
        [idUsuario, idDependencia, idRecinto],
        (err, resFar) => {
          if (err) console.error(err);
          else console.log("Created Valid Event EVT-" + resFar.insertId);
          
          db.query(`INSERT INTO evento (nombre, modalidad, fecha_inicio, fecha_fin, hora_inicio, hora_fin, cantidad_asistentes, tipo_evento, monto_poa, moneda, estado, id_usuario, id_dependencia, id_recinto)
                    VALUES ('Evento Inválido (<15 días)', 'Virtual', '${formatDate(closeDate)}', '${formatDate(closeDate)}', '14:00:00', '16:00:00', 20, 'Taller', 0, 'DOP', 'Pendiente', ?, ?, ?)`,
          [idUsuario, idDependencia, idRecinto],
          (err, resClose) => {
            if (err) console.error(err);
            else console.log("Created Invalid Event EVT-" + resClose.insertId);
            db.end();
          });
        });
      });
    });
  });
});
