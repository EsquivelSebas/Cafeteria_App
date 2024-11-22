-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: cafeteria
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `category_id` bigint NOT NULL,
  `subcategory_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKku369nri8u3s17uom8or57trs` (`subcategory_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKku369nri8u3s17uom8or57trs` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Delicioso pastel de chocolate con un relleno de dulce de leche y Nutella, cubierto con chispas de chocolate y otra capa de Nutella.','pastel_chocolate.jpg','Pastel de Chocolate',12000,1,NULL),(2,'Pastel de red velvet con relleno de leche condensada y una cobertura de coco.','pastel_red_velvet.jpg','Pastel de Red Velvet',12000,1,NULL),(3,'Pastel frío de frutas y vainilla con crema pastelera y esponja de vainilla.','pastel_frutas_vainilla.jpg','Pastel Frío de Frutas y Vainilla',12000,1,NULL),(4,'Cheesecake con una variedad de frutos rojos.','cheesecake_frutos_rojos.jpg','Cheesecake de Frutos Rojos',2500,2,NULL),(5,'Cheesecake con sabor a maracuyá.','cheesecake_maracuya.jpg','Cheesecake de Maracuyá',2500,2,NULL),(6,'Cheesecake con un toque de zanahoria.','cheesecake_zanahoria.jpg','Cheesecake de Zanahoria',2500,2,NULL),(7,'Cheesecake con sabor a Oreo.','cheesecake_oreo.jpg','Cheesecake de Oreo',2500,2,NULL),(8,'Bowl con base de fresa y toppings de frutas frescas como frambuesa, almendra y mango.','bowl_fresa.jpg','Bowl de Fresa',3500,4,1),(9,'Bowl de açaí con toppings de kiwi, arándano, coco y mango.','bowl_acai.jpg','Bowl de Açaí',3500,4,1),(10,'Deliciosas tostadas francesas con frambuesas y miel de maple.','tostadas_francesas_frutas.jpg','Tostadas Francesas con Frutas',3500,4,2),(11,'Tostadas francesas rellenas de Nutella.','tostadas_francesas_nutella.jpg','Tostadas Francesas con Nutella',3500,4,2),(12,'Croissant relleno de aguacate, jamón de pavo y queso fresco.','croissant_aguacate_pavo.jpg','Croissant con Aguacate y Pavo',4500,4,3),(13,'Gallo pinto con queso frito, plátano maduro y aguacate.','brunch_pinto.jpg','Brunch de Pinto',5500,4,4),(14,'Orden de papas fritas.','papas_fritas.jpg','Papas Fritas',2500,6,NULL),(15,'Orden de papas a la mexicana.','papas_mexicana.jpg','Papas a la Mexicana',3000,6,NULL),(16,'Orden de papas planas.','papas_planas.jpg','Papas Planas',2500,6,NULL),(17,'Orden de camote frito.','camote_frito.jpg','Camote Frito',2500,6,NULL),(18,'Ensalada de la casa con espinaca, tomate, zanahoria, queso parmesano, y bacon.','ensalada_casa.jpg','Ensalada de la Casa',4500,5,NULL),(19,'Ensalada de quinoa con brócoli, chile asado, zucchini, zanahoria, tomate cherry, y pepino.','ensalada_quinoa.jpg','Ensalada de Quinoa',4500,5,NULL),(20,'Ensalada fresca con lechuga, tomate cherry, zanahoria, mango, y ajonjolí.','ensalada_fresca.jpg','Ensalada Fresca',4500,5,NULL),(21,'Ensalada con lechuga, pepino, cebolla morada, rábano, y crotones.','ensalada_lechuga.jpg','Ensalada con Lechuga y Pepino',4500,5,NULL),(22,'Café frío con caramelo salado.','salted_caramel_coffee.jpg','Salted Caramel Coffee',2500,7,NULL),(23,'Café frío con azúcar moreno.','iced_brown_sugar.jpg','Iced Brown Sugar',3500,7,NULL),(24,'Mocaccino frío.','mocaccino.jpg','Mocaccino',2500,7,NULL),(25,'Café frío con gelatina.','jelly_coffee.jpg','Jelly Coffee',2500,7,NULL),(26,'Café Americano caliente.','cafe_americano.jpg','Café Americano',2500,8,NULL),(27,'Latte caliente con especias de calabaza.','pumpkin_spice_latte.jpg','Pumpkin Spice Latte',3500,8,NULL),(28,'Chocolate caliente.','chocolate_caliente.jpg','Chocolate Caliente',2500,8,NULL),(29,'Café mocha caliente.','mocha.jpg','Mocha',2500,8,NULL),(30,'Smoothie de vegetales verdes.','batido_verde.jpg','Batido Verde',2500,9,NULL),(31,'Smoothie de sandía.','smoothie_sandia.jpg','Smoothie de Sandía',2500,9,NULL),(32,'Smoothie de banano con mantequilla de maní.','smoothie_banano_mantequilla.jpg','Smoothie de Banano y Mantequilla de Maní',2500,9,NULL),(33,'Smoothie de fresa y mora.','smoothie_fresa_mora.jpg','Smoothie de Fresa y Mora',2500,9,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 18:19:20
