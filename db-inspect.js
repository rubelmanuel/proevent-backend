const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

db.connect(err => {
  if (err) { console.error(err); return; }
  db.query('SHOW TABLES', (err, results) => {
    if (err) { console.error(err); return; }
    console.log("TABLES:", results);
    
    // Get schema of each table
    const tables = results.map(row => Object.values(row)[0]);
    let completed = 0;
    
    tables.forEach(table => {
      db.query(`DESCRIBE ${table}`, (err, desc) => {
        console.log(`\n--- SCHEMA FOR ${table} ---`);
        console.table(desc);
        completed++;
        if (completed === tables.length) {
          db.end();
        }
      });
    });
  });
});
