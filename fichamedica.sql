-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fichamedica
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichas`
--

DROP TABLE IF EXISTS `fichas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fichas` (
  `rut` varchar(10) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `fechaNacimiento` varchar(15) DEFAULT NULL,
  `estadoCivil` varchar(40) DEFAULT NULL,
  `comentarios` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`rut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichas`
--

LOCK TABLES `fichas` WRITE;
/*!40000 ALTER TABLE `fichas` DISABLE KEYS */;
INSERT INTO `fichas` VALUES ('15932128-7','felipe hernan','rodriguez ajenjo','antonia lopez de bello 1001','iquique','77775555','felipe.as@gmail.com','1765-06-06','soltero','paciente con enfermedad coronaria'),('16654345-2','Constanza','Pereda','Purisima 2345','Coquimbo','333444777','cota.pereda@gmail.com','1985-07-26','Soltera','paciente dado de alta'),('7543783-2','fernando','larrain','alameda 37692','san pedro de la paz','666533332','fer.larrain@hotmail.com','1978-02-12','Casado','paciente rehabilitado'),('7655999-2','Felipe','Rodriguez','172 Liverpool street','Darlinghurst','0435090102','f.rodriguez.asenjo@gmail.com','2023-09-08','viudo','enfermedad respiratoria'),('8516781-2','pilar vilma','asenjo vera','constitucion 345','providencia','65944455','vilma.pilar@gmail.com','1978-10-25','divorciada','paciente rehabilitada'),('8534789-0','Paulo','Contreras','Rodrigo de Araya 198','Temuco','7788845','paul.contrer@gmail.com','1981-07-23','Casado(a)','Paciente presenta riesgo de caidas'),('8765498-2','julieta','parra','calle bonita 2121','concepcion','569222222','ju.parra@gmail.com','2010-11-06','soltera','paciente con enfermedad cardiaca'),('9637932-3','john','azua','sebastian bach 1001','arica','986360665','j.azua@gmail.com','1963-11-11','Casado(a)','paciente con trombocitopenia');
/*!40000 ALTER TABLE `fichas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-09 23:43:17
