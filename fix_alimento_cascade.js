const mysql = require('mysql2');
require('dotenv').config();

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

db.connect((err) => {
  if (err) {
    console.error('Error conectando a MySQL:', err);
    process.exit(1);
  }

  const dropFK = 'ALTER TABLE evento_alimento DROP FOREIGN KEY evento_alimento_ibfk_2';
  const addFK = 'ALTER TABLE evento_alimento ADD CONSTRAINT evento_alimento_ibfk_2 FOREIGN KEY (id_alimento) REFERENCES alimento(id_alimento) ON DELETE CASCADE';

  console.log('--- Aplicando ON DELETE CASCADE a id_alimento ---');

  db.query(dropFK, (err) => {
    if (err) {
      console.warn('Advertencia al borrar FK (podría no existir con ese nombre o ya estar borrada):', err.message);
    }
    
    db.query(addFK, (err2) => {
      if (err2) {
        console.error('Error al añadir FK con CASCADE:', err2.message);
      } else {
        console.log('✅ Cambio aplicado con éxito: id_alimento ahora tiene ON DELETE CASCADE');
      }
      db.end();
    });
  });
});
