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
  
  const queries = [
    "ALTER TABLE servicio_audiovisual ADD COLUMN cantidad INT DEFAULT 1;",
    "ALTER TABLE servicio_audiovisual ADD COLUMN ubicacion VARCHAR(255) DEFAULT '';",
    "ALTER TABLE servicio_audiovisual ADD COLUMN observaciones TEXT;"
  ];

  let completed = 0;
  
  // We'll run them sequentially to avoid issues
  db.query(queries[0], (err) => {
    if (err && err.code !== 'ER_DUP_FIELDNAME') console.error("Error Q1:", err.message);
    else console.log("Added cantidad");
    
    db.query(queries[1], (err) => {
      if (err && err.code !== 'ER_DUP_FIELDNAME') console.error("Error Q2:", err.message);
      else console.log("Added ubicacion");
      
      db.query(queries[2], (err) => {
        if (err && err.code !== 'ER_DUP_FIELDNAME') console.error("Error Q3:", err.message);
        else console.log("Added observaciones");
        
        db.query("DESCRIBE servicio_audiovisual", (err, results) => {
           console.table(results);
           db.end();
        });
      });
    });
  });
});
