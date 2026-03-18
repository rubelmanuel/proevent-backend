const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

db.connect((err) => {
  if (err) {
    console.error('❌ Error conectando a MySQL:', err.message);
    process.exit(1);
  }
  console.log('✅ Conectado a MySQL correctamente');
  
  db.query('SHOW TABLES', (err, results) => {
    if (err) {
      console.error('❌ Error al listar tablas:', err.message);
    } else {
      console.log('Tablas encontradas:', results.map(r => Object.values(r)[0]));
    }
    db.end();
  });
});
