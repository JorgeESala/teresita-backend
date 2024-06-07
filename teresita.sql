-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: teresita
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_has_products`
--

DROP TABLE IF EXISTS `cart_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_has_products` (
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`cart_id`,`product_id`),
  KEY `fk_carritos_has_productos_productos1_idx` (`product_id`),
  KEY `fk_carritos_has_productos_carritos1_idx` (`cart_id`),
  CONSTRAINT `fk_carritos_has_productos_carritos1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart` (`id`),
  CONSTRAINT `fk_carritos_has_productos_productos1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_has_products`
--

LOCK TABLES `cart_has_products` WRITE;
/*!40000 ALTER TABLE `cart_has_products` DISABLE KEYS */;
INSERT INTO `cart_has_products` VALUES (2,2,3);
/*!40000 ALTER TABLE `cart_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Dragon Ball'),(2,'Naruto'),(3,'One Piece'),(4,'Demon Slayer'),(5,'Sombrero');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(250) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int NOT NULL,
  `total` double NOT NULL,
  `Usuario_id` int NOT NULL,
  PRIMARY KEY (`id`,`Usuario_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Compras_Usuario_idx` (`Usuario_id`),
  CONSTRAINT `fk_Compras_Usuario` FOREIGN KEY (`Usuario_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'calle siempre viva 1','2024-04-14',38,728954.59,1),(2,'calle siempre viva 2','2024-06-27',5,450,2),(3,'calle siempre viva 3','2024-07-09',2,240,3),(4,'calle siempre viva 4','2024-08-16',1,100,4),(5,'calle siempre viva 5','2024-09-12',3,180,4);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_has_products`
--

DROP TABLE IF EXISTS `order_has_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_has_products` (
  `compras_id` int NOT NULL,
  `productos_id` int NOT NULL,
  PRIMARY KEY (`compras_id`,`productos_id`),
  KEY `fk_compras_has_productos_productos1_idx` (`productos_id`),
  KEY `fk_compras_has_productos_compras1_idx` (`compras_id`),
  CONSTRAINT `fk_compras_has_productos_compras1` FOREIGN KEY (`compras_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_compras_has_productos_productos1` FOREIGN KEY (`productos_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_products`
--

LOCK TABLES `order_has_products` WRITE;
/*!40000 ALTER TABLE `order_has_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_has_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `numero_tarjeta` varchar(16) NOT NULL,
  `fecha` varchar(5) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`numero_tarjeta`,`usuario_id`),
  KEY `fk_metodoPago_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_metodoPago_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(150) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Gorry Luffy','Gorro para adulto',100,'https://raw.githubusercontent.com/JorgeESala/teresita-shop/main/src/assets/img/Gorro%20Luffy.jpg',3),(2,'Monedero de Naruto','Monedero que usa naruto en el ánime',100,'https://raw.githubusercontent.com/JorgeESala/teresita-shop/main/src/assets/img/Monedero%20naruto.jpg',3),(3,'Figura pikachu gengar','Figura de pikachu disfrazado de gengar con caja',270,'https://raw.githubusercontent.com/JorgeESala/teresita-shop/main/src/assets/img/Pikachu%20gengar.jpg',1),(4,'Playera pokemon','Playera neón talla chica',200,'https://raw.githubusercontent.com/JorgeESala/teresita-shop/main/src/assets/img/Playera%20pokemon.jpg',1),(5,'Rosa amarilla armable','Rosa armable tipo lego',120,'https://raw.githubusercontent.com/JorgeESala/teresita-shop/main/src/assets/img/Rosa%20amarilla%20armable.jpg',3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_has_categories`
--

DROP TABLE IF EXISTS `product_has_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_has_categories` (
  `producto_id` int NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`producto_id`,`categoria_id`),
  KEY `fk_Productos_has_Categorias_Categorias1_idx` (`categoria_id`),
  KEY `fk_Productos_has_Categorias_Productos1_idx` (`producto_id`),
  CONSTRAINT `fk_Productos_has_Categorias_Categorias1` FOREIGN KEY (`categoria_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_Productos_has_Categorias_Productos1` FOREIGN KEY (`producto_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_has_categories`
--

LOCK TABLES `product_has_categories` WRITE;
/*!40000 ALTER TABLE `product_has_categories` DISABLE KEYS */;
INSERT INTO `product_has_categories` VALUES (3,1),(2,2),(4,2),(1,3),(5,4),(1,5);
/*!40000 ALTER TABLE `product_has_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_address` (
  `calle` varchar(100) DEFAULT NULL,
  `numero` int NOT NULL,
  `colonia` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `codigo_postal` varchar(6) NOT NULL,
  `num_telefono` varchar(45) DEFAULT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_direccion_de_envio_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart`
--

DROP TABLE IF EXISTS `shopping_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`,`usuario_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  KEY `usuario_id_idx` (`usuario_id`),
  CONSTRAINT `usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart`
--

LOCK TABLES `shopping_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart` VALUES (1,9),(2,5);
/*!40000 ALTER TABLE `shopping_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) NOT NULL,
  `numero` varchar(14) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `tipo_usuario` varchar(1) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `correoElect_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Juan Perez','5487251022','example1@hotmail.com','1234','1',1),(2,'Jorge Buen Rostro','5578120368','example2@hotmail.com','1234','1',1),(3,'Serch de la Parra','5519874502','example3@hotmail.com','1234','1',1),(4,'Pedro Mendoza','5423684702','exampleadmin1@hotmail.com','admin','2',1),(5,'Panfilo Bonilla','5689874512','exampleadmin2@hotmail.com','admin','2',1),(6,'ejemplo_usuario','9991234567','ejemplo@dominio.org','password123','1',1),(8,'ejemplo_usuario','9991234567','ejemplo@dominio.mx','password','1',NULL),(9,'John Juan','9991234567','ejemplo@correochido.com','pass12345','1',1),(10,'Cristian Yañez','9991234567','ejemplo@probando.com','pass123','1',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-07 13:25:49
