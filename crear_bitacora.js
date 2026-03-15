const mysql = require('mysql2');
const fs = require('fs');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307,
  multipleStatements: true
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting:', err);
    process.exit(1);
  }
  
  const sql = fs.readFileSync('bitacora.sql', 'utf8');
  
  db.query(sql, (err, results) => {
    if (err) {
      console.error('Error creating table:', err);
      process.exit(1);
    }
    console.log('Tabla bitacora_movimiento creada exitosamente.');
    process.exit(0);
  });
});
