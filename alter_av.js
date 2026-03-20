const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

db.connect((err) => {
  if (err) throw err;
  console.log('Conectado a la base de datos.');
  
  const sql = "ALTER TABLE equipo_audiovisual ADD COLUMN cantidad_total INT DEFAULT 0;";
  
  db.query(sql, (error, results) => {
    if (error) {
      if (error.code === 'ER_DUP_FIELDNAME') {
        console.log('La columna cantidad_total ya existe.');
      } else {
        console.error('Error al alterar la tabla:', error);
      }
    } else {
      console.log('Columna cantidad_total añadida con éxito.');
    }
    db.end();
  });
});
