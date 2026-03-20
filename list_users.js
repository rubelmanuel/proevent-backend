const mysql = require('mysql2');
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uapa_proevent',
  port: 3307
});

db.connect(err => {
  if (err) process.exit(1);
  db.query("SELECT u.id_usuario, u.nombre, r.nombre as rol FROM usuario u JOIN rol r ON u.id_rol = r.id_rol WHERE r.nombre = 'Solicitante'", (err, users) => {
    if (err) process.exit(1);
    console.log(JSON.stringify(users));
    process.exit(0);
  });
});
