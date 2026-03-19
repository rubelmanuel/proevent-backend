-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: uapa_proevent
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `id_alimento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alimento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alimento`
--

LOCK TABLES `alimento` WRITE;
/*!40000 ALTER TABLE `alimento` DISABLE KEYS */;
INSERT INTO `alimento` VALUES (1,'Desayuno'),(2,'Coffee Break'),(3,'Buffet-Almuerzo'),(5,'Refigerio ');
/*!40000 ALTER TABLE `alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_movimiento`
--

DROP TABLE IF EXISTS `bitacora_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_movimiento` (
  `id_bitacora` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `accion` varchar(150) NOT NULL,
  `detalles` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_bitacora`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `bitacora_movimiento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `bitacora_movimiento_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_movimiento`
--

LOCK TABLES `bitacora_movimiento` WRITE;
/*!40000 ALTER TABLE `bitacora_movimiento` DISABLE KEYS */;
INSERT INTO `bitacora_movimiento` VALUES (1,18,1,'LOGIN','Inicio de sesión manual exitoso','2026-03-15 15:31:26'),(2,18,1,'LOGIN','Inicio de sesión manual exitoso','2026-03-15 15:52:48'),(3,18,1,'LOGIN','Inicio de sesión manual exitoso','2026-03-15 15:55:16'),(4,18,1,'CREACION_USUARIO','Se creó el usuario Father021967@gmail.com con rol 3','2026-03-15 15:57:51'),(5,18,1,'ACTUALIZACION_USUARIO','Se actualizó el usuario ID 21','2026-03-15 16:00:14'),(6,18,1,'ELIMINACION_USUARIO','Se eliminó el usuario ID 21','2026-03-15 16:02:24'),(7,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 16:15:09'),(8,18,1,'CREACION_USUARIO','Registro de nuevo usuario. ID asignado: 22, Nombre: Victor Diaz, Correo: Father021967@gmail.com, Nivel de Rol ID: 3.','2026-03-15 16:16:12'),(9,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 22:22:37'),(10,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 22:55:32'),(11,18,1,'LOGIN_GOOGLE','Sesión Inicada (Google OAuth). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 23:01:01'),(12,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 23:12:02'),(13,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 23:12:58'),(14,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-15 23:30:00'),(15,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-16 00:07:44'),(16,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-16 23:07:08'),(17,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-16 23:41:39'),(18,1,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Administrador (100049725@p.uapa.edu.do) bajo el rol de Administrador.','2026-03-17 00:41:58'),(19,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 00:45:35'),(20,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:03:27'),(21,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:05:52'),(22,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:06:09'),(23,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:20:34'),(24,18,1,'CREACION_USUARIO','Registro de nuevo usuario. ID asignado: 23, Nombre: Ismael Cruz , Correo: 100042222@p.uapa.edu.do, Nivel de Rol ID: 4.','2026-03-17 01:21:30'),(25,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-17 01:21:52'),(26,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:23:32'),(27,18,1,'CREACION_USUARIO','Registro de nuevo usuario. ID asignado: 24, Nombre: manuel, Correo: 100041111@p.uapa.edu.do, Nivel de Rol ID: 5.','2026-03-17 01:24:09'),(28,24,5,'LOGIN','Sesión Inicada (Manual). Autenticado como manuel (100041111@p.uapa.edu.do) bajo el rol de Administrador de Evento.','2026-03-17 01:24:29'),(29,24,5,'CREACION_EVENTO','Nueva Solicitud de Evento. ID generado: 13. Título: \"Reunion publica  - Reunion publica de\". Modalidad: Presencial. Cantidad de Asistentes: 2000. Creado para dependencia ID: 7.','2026-03-17 01:28:07'),(30,24,5,'ACTUALIZACION_EVENTO','Resolución de Estado del Evento. El Evento con ID 6 ha pasado al estado: \"Rechazado\".','2026-03-17 01:28:35'),(31,24,5,'ACTUALIZACION_EVENTO','Resolución de Estado del Evento. El Evento con ID 12 ha pasado al estado: \"Rechazado\".','2026-03-17 01:28:53'),(32,24,5,'ACTUALIZACION_EVENTO','Resolución de Estado del Evento. El Evento con ID 1 ha pasado al estado: \"Rechazado\".','2026-03-17 01:28:59'),(33,24,5,'ACTUALIZACION_EVENTO','Resolución de Estado del Evento. El Evento con ID 10 ha pasado al estado: \"Rechazado\".','2026-03-17 01:29:04'),(34,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-17 01:31:19'),(35,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:32:16'),(36,24,5,'LOGIN','Sesión Inicada (Manual). Autenticado como manuel (100041111@p.uapa.edu.do) bajo el rol de Administrador de Evento.','2026-03-17 01:39:57'),(37,24,5,'LOGIN','Sesión Inicada (Manual). Autenticado como manuel (100041111@p.uapa.edu.do) bajo el rol de Administrador de Evento.','2026-03-17 01:47:01'),(38,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 01:47:59'),(39,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-17 01:48:55'),(40,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 22:42:08'),(41,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 23:00:08'),(42,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-17 23:00:43'),(43,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 23:01:59'),(44,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-17 23:02:48'),(45,24,5,'LOGIN','Sesión Inicada (Manual). Autenticado como manuel (100041111@p.uapa.edu.do) bajo el rol de Administrador de Evento.','2026-03-17 23:05:43'),(46,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-17 23:19:15'),(47,24,5,'LOGIN','Sesión Inicada (Manual). Autenticado como manuel (100041111@p.uapa.edu.do) bajo el rol de Administrador de Evento.','2026-03-17 23:19:46'),(48,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-17 23:57:56'),(49,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 18:32:22'),(50,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 18:36:50'),(51,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-18 18:38:20'),(52,24,5,'LOGIN','Sesión Inicada (Manual). Autenticado como manuel (100041111@p.uapa.edu.do) bajo el rol de Administrador de Evento.','2026-03-18 18:39:28'),(53,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 20:23:52'),(54,18,1,'LOGIN_GOOGLE','Sesión Inicada (Google OAuth). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 20:28:16'),(55,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 20:30:34'),(56,23,4,'LOGIN','Sesión Inicada (Manual). Autenticado como Ismael Cruz  (100042222@p.uapa.edu.do) bajo el rol de Administrador de Audiovisual.','2026-03-18 20:33:47'),(57,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 20:42:49'),(58,22,3,'LOGIN','Sesión Inicada (Manual). Autenticado como Victor Diaz (Father021967@gmail.com) bajo el rol de Solicitante.','2026-03-18 20:43:31'),(59,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 21:00:26'),(60,18,1,'CREACION_EVENTO','Nueva Solicitud de Evento. ID generado: 14. Título: \"charla \". Modalidad: Virtual. Cantidad de Asistentes: 40. Creado para dependencia ID: 8.','2026-03-18 21:07:32'),(61,18,1,'LOGIN','Sesión Inicada (Manual). Autenticado como Rubel  (rubelmanuelc@gmail.com) bajo el rol de Administrador.','2026-03-18 23:20:18');
/*!40000 ALTER TABLE `bitacora_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependencia`
--

DROP TABLE IF EXISTS `dependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependencia` (
  `id_dependencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `responsable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_dependencia`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependencia`
--

LOCK TABLES `dependencia` WRITE;
/*!40000 ALTER TABLE `dependencia` DISABLE KEYS */;
INSERT INTO `dependencia` VALUES (1,'Ceges',NULL),(2,'Rectoría',NULL),(3,'Centro de apoyo',NULL),(4,'Asesoría legal',NULL),(5,'Dirección de tecnología informática',NULL),(6,'Secretaría general',NULL),(7,'Archivo central',NULL),(8,'Registro',NULL),(9,'Vicerrectoría académica',NULL),(10,'Dirección académica',NULL),(11,'Servicio al participante y vida universitaria',NULL),(12,'Evaluación de los aprendizajes',NULL),(13,'Menciones tecnopedagógicas',NULL),(14,'Práctica profesional y servicio social',NULL),(15,'Dirección académica de recintos',NULL),(16,'Vicerrectoría de investigación y posgrado',NULL),(17,'Investigación divulgación científica',NULL),(18,'Investigación formativa',NULL),(19,'Dirección de programa de posgrado',NULL),(20,'Biblioteca',NULL),(21,'Vicerrectorías administrativa y financiera',NULL),(22,'Dirección administrativa',NULL),(23,'Dirección financiera',NULL),(24,'Gestión humana',NULL),(25,'Publicaciones',NULL),(26,'Cap',NULL),(27,'Cude',NULL),(28,'Vicerrectoría de planificación innovación y desarrollo',NULL),(29,'Aseguración de la calidad',NULL),(30,'Planificación y control',NULL),(31,'Innovación',NULL),(32,'Vicerrectoría de vinculación y comunicación',NULL),(33,'Relaciones institucionales e interinstitucionales',NULL),(34,'Dirección de vinculación y extensión',NULL),(35,'Extensión voluntariado',NULL),(36,'Admisiones',NULL),(37,'Protocolo y eventos',NULL),(38,'Relaciones públicas',NULL),(39,'Captación de nuevos participantes',NULL),(40,'Coopfre UAPA',NULL);
/*!40000 ALTER TABLE `dependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_corporativo`
--

DROP TABLE IF EXISTS `detalle_corporativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_corporativo` (
  `id_detalle_corporativo` int(11) NOT NULL AUTO_INCREMENT,
  `id_evento` int(11) NOT NULL,
  `tipo` enum('Bultos','T-shirt','Editoriales UAPA','Lapiceros','Llaveros','Vasos','Libreta','Otros','No aplica') NOT NULL,
  `descripcion_otro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_corporativo`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `detalle_corporativo_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_corporativo`
--

LOCK TABLES `detalle_corporativo` WRITE;
/*!40000 ALTER TABLE `detalle_corporativo` DISABLE KEYS */;
INSERT INTO `detalle_corporativo` VALUES (1,1,'No aplica',NULL),(2,8,'No aplica',NULL),(3,9,'No aplica',NULL),(4,9,'Vasos',NULL),(5,10,'Llaveros',NULL),(6,10,'Libreta',NULL),(7,11,'Lapiceros',NULL),(8,11,'Vasos',NULL),(9,14,'Otros',NULL);
/*!40000 ALTER TABLE `detalle_corporativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_montaje`
--

DROP TABLE IF EXISTS `detalle_montaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_montaje` (
  `id_detalle_montaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_evento` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id_detalle_montaje`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `detalle_montaje_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_montaje`
--

LOCK TABLES `detalle_montaje` WRITE;
/*!40000 ALTER TABLE `detalle_montaje` DISABLE KEYS */;
INSERT INTO `detalle_montaje` VALUES (1,1,'explicar todo'),(2,9,'Tener cuidado'),(3,12,'evento ');
/*!40000 ALTER TABLE `detalle_montaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_presupuesto`
--

DROP TABLE IF EXISTS `detalle_presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_presupuesto` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_presupuesto` int(11) NOT NULL,
  `concepto` varchar(150) DEFAULT NULL,
  `proveedor` varchar(150) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `subtotal` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_presupuesto` (`id_presupuesto`),
  CONSTRAINT `detalle_presupuesto_ibfk_1` FOREIGN KEY (`id_presupuesto`) REFERENCES `presupuesto` (`id_presupuesto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_presupuesto`
--

LOCK TABLES `detalle_presupuesto` WRITE;
/*!40000 ALTER TABLE `detalle_presupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_audiovisual`
--

DROP TABLE IF EXISTS `equipo_audiovisual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_audiovisual` (
  `id_equipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `icono` varchar(50) DEFAULT 'FiMonitor',
  PRIMARY KEY (`id_equipo`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_audiovisual`
--

LOCK TABLES `equipo_audiovisual` WRITE;
/*!40000 ALTER TABLE `equipo_audiovisual` DISABLE KEYS */;
INSERT INTO `equipo_audiovisual` VALUES (1,'Proyector','FiMonitor'),(2,'Sistema de sonido','FiSpeaker'),(3,'Micrófonos','FiMic'),(4,'Cámaras (Grabación)','FiVideo'),(5,'Transmisión en vivo','FiRadio'),(6,'Iluminación','FiSun'),(7,'Pantallas o monitores extras','FiCast'),(8,'Camara de alta velocidad ','FiVideo');
/*!40000 ALTER TABLE `equipo_audiovisual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion` (
  `id_evaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_evento` int(11) NOT NULL,
  `respuesta_solicitud` enum('Si','No') DEFAULT NULL,
  `recinto` enum('Cibao Oriental','Nagua','Santo Domingo Oriental','Santiago') DEFAULT NULL,
  `valoracion_respuesta` enum('Muy eficiente','Excelente','Eficiente','Deficiente') DEFAULT NULL,
  `satisfaccion` int(11) DEFAULT NULL CHECK (`satisfaccion` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_evaluacion`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` VALUES (1,1,'Si','Santiago','Excelente',4,'Prueba de endpoint','2026-03-16 00:00:08');
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `modalidad` enum('Virtual','Presencial','Hibrido') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `cantidad_asistentes` int(11) NOT NULL,
  `tipo_evento` varchar(100) NOT NULL,
  `monto_poa` decimal(15,2) DEFAULT NULL,
  `moneda` enum('USD','EUR','DOP') DEFAULT NULL,
  `estado` enum('Pendiente','Aprobado','Rechazado','Finalizado') DEFAULT 'Pendiente',
  `id_usuario` int(11) NOT NULL,
  `id_dependencia` int(11) NOT NULL,
  `id_recinto` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_evento`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_dependencia` (`id_dependencia`),
  KEY `id_recinto` (`id_recinto`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `evento_ibfk_2` FOREIGN KEY (`id_dependencia`) REFERENCES `dependencia` (`id_dependencia`),
  CONSTRAINT `evento_ibfk_3` FOREIGN KEY (`id_recinto`) REFERENCES `recinto` (`id_recinto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Reunión de servicio social','Virtual','2026-03-25','2026-03-25','07:20:00','19:45:00',80,'Reunión',100.00,'DOP','Rechazado',1,14,1,'2026-03-08 18:24:37'),(6,'Evento Válido (>15 días)','Presencial','2026-03-29','2026-03-29','10:00:00','12:00:00',50,'Conferencia',0.00,'DOP','Rechazado',1,1,1,'2026-03-09 01:10:07'),(7,'Evento Inválido (<15 días)','Virtual','2026-03-14','2026-03-14','14:00:00','16:00:00',20,'Taller',0.00,'DOP','Rechazado',1,1,1,'2026-03-09 01:10:07'),(8,'presentacion','Presencial','2026-03-10','2026-03-24','09:30:00','02:24:00',90,'Reunión',2000.00,'USD','Pendiente',1,10,1,'2026-03-09 22:20:48'),(9,'Reunión ','Presencial','2026-03-13','2026-04-09','02:26:00','01:29:00',87,'Charlas',30000.00,'DOP','Pendiente',1,8,1,'2026-03-11 22:30:05'),(10,'Reunion ','Hibrido','2026-03-14','2026-03-30','01:00:00','02:50:00',50,'CursoTaller',40000.00,'USD','Rechazado',1,8,1,'2026-03-13 21:51:31'),(11,'Reunión de evento ','Presencial','2026-03-16','2026-04-05','13:23:00','12:28:00',898,'Reunión',4500.00,'DOP','Pendiente',18,10,1,'2026-03-15 12:27:07'),(12,'Reunion evenro','Virtual','2026-03-27','2026-04-05','13:22:00','13:22:00',90,'Investigación',45000.00,'DOP','Rechazado',18,8,1,'2026-03-15 13:20:21'),(13,'Reunion publica  - Reunion publica de','Presencial','2026-03-17','2026-03-24','08:25:00','08:25:00',2000,'Reunion publica ',30000.00,'USD','Pendiente',24,7,1,'2026-03-17 01:28:07'),(14,'charla ','Virtual','2026-03-19','2026-03-19','02:06:00','21:12:00',40,'Firma de convenio',10000.00,'DOP','Pendiente',18,8,3,'2026-03-18 21:07:32');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_alimento`
--

DROP TABLE IF EXISTS `evento_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_alimento` (
  `id_evento` int(11) NOT NULL,
  `id_alimento` int(11) NOT NULL,
  PRIMARY KEY (`id_evento`,`id_alimento`),
  KEY `evento_alimento_ibfk_2` (`id_alimento`),
  CONSTRAINT `evento_alimento_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE,
  CONSTRAINT `evento_alimento_ibfk_2` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_alimento`
--

LOCK TABLES `evento_alimento` WRITE;
/*!40000 ALTER TABLE `evento_alimento` DISABLE KEYS */;
INSERT INTO `evento_alimento` VALUES (11,3),(12,3),(13,1),(13,2);
/*!40000 ALTER TABLE `evento_alimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presupuesto`
--

DROP TABLE IF EXISTS `presupuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presupuesto` (
  `id_presupuesto` int(11) NOT NULL AUTO_INCREMENT,
  `id_evento` int(11) NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `estado` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_presupuesto`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `presupuesto_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presupuesto`
--

LOCK TABLES `presupuesto` WRITE;
/*!40000 ALTER TABLE `presupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `presupuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recinto`
--

DROP TABLE IF EXISTS `recinto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recinto` (
  `id_recinto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_recinto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recinto`
--

LOCK TABLES `recinto` WRITE;
/*!40000 ALTER TABLE `recinto` DISABLE KEYS */;
INSERT INTO `recinto` VALUES (1,'Sede Santiago'),(2,'Santo Domingo Oriental'),(3,'Sibao Oriental Nagua'),(4,'Europa'),(5,'Estados Unidos'),(6,'Neyba'),(7,'San Juan'),(8,'Higüey'),(9,'Pedernales');
/*!40000 ALTER TABLE `recinto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restablecimiento_token`
--

DROP TABLE IF EXISTS `restablecimiento_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restablecimiento_token` (
  `id_token` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(120) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expiracion` datetime NOT NULL,
  PRIMARY KEY (`id_token`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restablecimiento_token`
--

LOCK TABLES `restablecimiento_token` WRITE;
/*!40000 ALTER TABLE `restablecimiento_token` DISABLE KEYS */;
INSERT INTO `restablecimiento_token` VALUES (3,'202105774@uapa.edu.do','95667deb46302e73e5334522dd67d0d36a36c4d6ae2fe5291083e21c426fb721','2026-03-14 21:02:56'),(4,'202105774@uapa.edu.do','fbe41f04e87e409968f7406ec02fe63f60a975c4a9ab4b596515e6f3f169c95a','2026-03-14 21:06:08'),(10,'202105774@uapa.edu.do','951dbceac11ddc3bdadecf9d0e9231021fdd6383d48fb3a79216dcee0291e6d5','2026-03-15 00:25:39'),(11,'202105774@p.uapa.edu.do','478db01e231009b16615e07942336c69e3070d3960816e657a7487260b8245d6','2026-03-15 00:29:46'),(12,'202105774@p.uapa.edu.do','ab178c8f806d894ac2570035a0353cbc5badcb081635b28d3a4ae6b0c31d897b','2026-03-15 00:30:28'),(13,'202105774@p.uapa.edu.do','942e4e51085b252b58f0a8d50332a2f811b9942c79f2244d3890f52894b1c708','2026-03-15 00:31:03'),(14,'202105774@p.uapa.edu.do','0a55cd280a9ed6447c78f9373f1e2d0fe1ad7e4437ab6e2f15323b1779f4da71','2026-03-15 00:32:55'),(16,'202105774@p.uapa.edu.do','955333e650d0a498a1f7271044f028652e13bdea67230965ac6889a69a8a0f37','2026-03-15 00:43:54');
/*!40000 ALTER TABLE `restablecimiento_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador'),(4,'Administrador de Audiovisual'),(5,'Administrador de Evento'),(2,'Desarrollador'),(3,'Solicitante');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_audiovisual`
--

DROP TABLE IF EXISTS `servicio_audiovisual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_audiovisual` (
  `id_servicio` int(11) NOT NULL AUTO_INCREMENT,
  `id_evento` int(11) NOT NULL,
  `tipo_servicio` varchar(150) NOT NULL,
  `estado` enum('Pendiente','Aprobado','Rechazado') DEFAULT 'Pendiente',
  `cantidad` int(11) DEFAULT 1,
  `ubicacion` varchar(255) DEFAULT '',
  `observaciones` text DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `servicio_audiovisual_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id_evento`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_audiovisual`
--

LOCK TABLES `servicio_audiovisual` WRITE;
/*!40000 ALTER TABLE `servicio_audiovisual` DISABLE KEYS */;
INSERT INTO `servicio_audiovisual` VALUES (1,6,'Proyector|Cant:2|Ubic:N/A|Obs:N/A','Pendiente',1,'',NULL),(2,6,'Micrófonos|Cant:4|Ubic:N/A|Obs:N/A','Pendiente',1,'',NULL),(3,6,'Proyector|Cant:2|Ubic:N/A|Obs:N/A','Pendiente',1,'',NULL),(4,6,'Micrófonos|Cant:4|Ubic:N/A|Obs:N/A','Pendiente',1,'',NULL),(5,6,'Proyector','Pendiente',1,'','Prueba de subagent Jetski.'),(6,6,'Micrófonos','Pendiente',2,'','Prueba de subagent Jetski.'),(7,6,'Proyector','',2,'salón principal ',''),(8,6,'Micrófonos','Pendiente',5,'salon principal',''),(9,6,'Transmisión en vivo','Pendiente',1,'salon',''),(10,6,'Pantallas o monitores extras','Aprobado',1,'salon',''),(11,6,'Sistema de sonido','Aprobado',3,'salon',''),(12,6,'Cámaras (Grabación)','Aprobado',5,'salon',''),(13,1,'Proyector','Aprobado',4,'pasillo principal ',''),(14,1,'Micrófonos','Aprobado',5,'pasillo ',''),(15,1,'Transmisión en vivo','Aprobado',2,'tarima ',''),(16,1,'Iluminación','Rechazado',3,'salon principal',''),(17,1,'Proyector','Pendiente',4,'',''),(18,1,'Micrófonos','Pendiente',1,'',''),(19,1,'Transmisión en vivo','Pendiente',1,'',''),(20,1,'Iluminación','Rechazado',1,'',''),(21,6,'Proyector','Pendiente',5,'Principal',''),(22,6,'Micrófonos','Pendiente',3,'Pincipal',''),(23,6,'Iluminación','Pendiente',1,'',''),(24,6,'Transmisión en vivo','Pendiente',1,'',''),(25,6,'Cámaras (Grabación)','Aprobado',1,'',''),(26,6,'Proyector','Pendiente',3,'',''),(27,6,'Micrófonos','Pendiente',1,'',''),(28,6,'Transmisión en vivo','Pendiente',1,'',''),(29,6,'Iluminación','Rechazado',1,'','');
/*!40000 ALTER TABLE `servicio_audiovisual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_detalle_corporativo`
--

DROP TABLE IF EXISTS `tipo_detalle_corporativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_detalle_corporativo` (
  `id_detalle_corp` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id_detalle_corp`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_detalle_corporativo`
--

LOCK TABLES `tipo_detalle_corporativo` WRITE;
/*!40000 ALTER TABLE `tipo_detalle_corporativo` DISABLE KEYS */;
INSERT INTO `tipo_detalle_corporativo` VALUES (1,'Bultos, T-shert'),(2,'Editoriales UAPA (libros)'),(3,'Lapiceros'),(6,'Libreta'),(4,'Llaveros'),(8,'No aplica'),(7,'Otros'),(5,'Vasos');
/*!40000 ALTER TABLE `tipo_detalle_corporativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_evento_master`
--

DROP TABLE IF EXISTS `tipo_evento_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evento_master` (
  `id_tipo_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  PRIMARY KEY (`id_tipo_evento`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_evento_master`
--

LOCK TABLES `tipo_evento_master` WRITE;
/*!40000 ALTER TABLE `tipo_evento_master` DISABLE KEYS */;
INSERT INTO `tipo_evento_master` VALUES (7,'Conferencia magistral'),(6,'Congreso internacional'),(2,'Curso taller práctico'),(8,'Evento curso cultural'),(10,'Feria universitaria'),(4,'Firma de convenio'),(9,'Jornada de investigación'),(1,'Reunión'),(13,'Reunión de cuentas'),(5,'Seminario académico'),(14,'Visitas guiada de colegio');
/*!40000 ALTER TABLE `tipo_evento_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `token_acceso_rapido` varchar(255) DEFAULT NULL,
  `ultimo_login` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Administrador','100049725@p.uapa.edu.do','12345678',1,'activo',NULL,NULL,'2026-03-07 15:29:14'),(12,'Rubel ','1000468@uapa.edu.do','admin123',1,'activo',NULL,NULL,'2026-03-13 21:55:10'),(18,'Rubel ','rubelmanuelc@gmail.com','123456789',1,'activo',NULL,NULL,'2026-03-15 12:15:17'),(22,'Victor Diaz','Father021967@gmail.com','12345678',3,'activo',NULL,NULL,'2026-03-15 16:16:12'),(23,'Ismael Cruz ','100042222@p.uapa.edu.do','12345678',4,'activo',NULL,NULL,'2026-03-17 01:21:30'),(24,'manuel','100041111@p.uapa.edu.do','12345678',5,'activo',NULL,NULL,'2026-03-17 01:24:09');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 23:32:33
