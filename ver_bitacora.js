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
    console.error('Error conectando a la base de datos:', err);
    process.exit(1);
  }
  
  const query = `
    SELECT 
      b.id_bitacora as ID, 
      u.nombre as Usuario, 
      r.nombre as Rol, 
      b.accion as Acción, 
      b.detalles as Detalles, 
      b.fecha as Fecha
    FROM bitacora_movimiento b
    LEFT JOIN usuario u ON b.id_usuario = u.id_usuario
    LEFT JOIN rol r ON b.id_rol = r.id_rol
    ORDER BY b.fecha DESC
    LIMIT 10;
  `;
  
  db.query(query, (err, results) => {
    if (err) {
      console.error('Error al consultar bitácora:', err);
    } else {
      console.log('\n--- ÚLTIMOS 10 MOVIMIENTOS EN LA BITÁCORA ---');
      if (results.length === 0) {
        console.log('Aún no hay movimientos registrados. Inicia sesión en la plataforma para ver los primeros registros.');
      } else {
        console.table(results);
      }
      console.log('---------------------------------------------\n');
    }
    process.exit(0);
  });
});
