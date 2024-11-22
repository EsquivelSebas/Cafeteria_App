-- verificar los users
SELECT User, Host FROM mysql.user;
SHOW GRANTS FOR 'usuario_prueba'@'%';
GRANT ALL PRIVILEGES ON cafeteria.* TO 'usuario_prueba'@'%';
FLUSH PRIVILEGES;
DROP USER 'usuario_prueba'@'%';
CREATE USER 'usuario_prueba'@'localhost' IDENTIFIED BY 'root';
GRANT ALL PRIVILEGES ON `cafeteria`.* TO 'usuario_prueba'@'%';
GRANT ALL PRIVILEGES ON `fide_autos`.* TO 'usuario_prueba'@'%';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'usuario_prueba'@'localhost';


-- Crear la base de datos llamada "cafeteria"
CREATE DATABASE IF NOT EXISTS `cafeteria` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_0900_ai_ci;

-- Seleccionar la base de datos para usarla
USE `cafeteria`;

-- Simplified MySQL Dump for `category` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `category`;

-- Create the `category` table
CREATE TABLE `category` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `category` table
INSERT INTO `category` (`id`, `name`) VALUES
  (1, 'Pastelería'),
  (2, 'Postres'),
  (3, 'Repostería Salada'),
  (4, 'Desayunos'),
  (5, 'Ensaladas'),
  (6, 'Para Compartir'),
  (7, 'Bebidas Frías'),
  (8, 'Bebidas Calientes'),
  (9, 'Smoothies');


-- Simplified MySQL Dump for `order_item` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `order_item`;

-- Create the `order_item` table
CREATE TABLE `order_item` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `quantity` INT DEFAULT NULL,
  `order_id` BIGINT DEFAULT NULL,
  `product_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_id` (`order_id`),
  KEY `FK_product_id` (`product_id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `order_item` table
INSERT INTO `order_item` (`id`, `quantity`, `order_id`, `product_id`) VALUES
  (1, 2, 1, 12),
  (2, 1, 1, 26),
  (3, 1, 2, 10),
  (4, 2, 3, 25),
  (5, 1, 4, 1),
  (6, 2, 5, 1),
  (7, 1, 5, 4),
  (8, 1, 5, 10),
  (9, 1, 6, 1);



ALTER USER 'usuario_prueba'@'localhost' IDENTIFIED BY 'root';

-- Simplified MySQL Dump for `orders_table` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `orders_table`;

-- Create the `orders_table` table
CREATE TABLE `orders_table` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME(6) DEFAULT NULL,
  `total_price` DOUBLE DEFAULT NULL,
  `customer_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn0v8hqqhb5c8kbgsq6tdlq9nj` (`customer_id`),
  CONSTRAINT `FKn0v8hqqhb5c8kbgsq6tdlq9nj` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `orders_table` table
INSERT INTO `orders_table` (`id`, `order_date`, `total_price`, `customer_id`) VALUES
  (1, '2024-11-12 17:17:29.318281', 11500, 2),
  (2, '2024-11-11 17:17:29.318281', 3500, 2),
  (3, '2024-11-10 17:17:29.318281', 5000, 2),
  (4, '2024-11-12 18:12:21.853872', 12000, 3),
  (5, '2024-11-12 18:29:08.456734', 30000, 4),
  (6, '2024-11-12 18:32:33.708762', 12000, 2);






-- Simplified MySQL Dump for `payment_method` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `payment_method`;

-- Create the `payment_method` table
CREATE TABLE `payment_method` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(255) DEFAULT NULL,
  `expiry_date` VARCHAR(255) DEFAULT NULL,
  `user_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9qgi86n91j5kxnymanelaa1ag` (`user_id`),
  CONSTRAINT `FK9qgi86n91j5kxnymanelaa1ag` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `payment_method` table
-- No data is included in the dump you provided, so no `INSERT` statements for this table.












-- Simplified MySQL Dump for `product` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `product`;

-- Create the `product` table
CREATE TABLE `product` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `price` DOUBLE DEFAULT NULL,
  `category_id` BIGINT NOT NULL,
  `subcategory_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  KEY `FKku369nri8u3s17uom8or57trs` (`subcategory_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FKku369nri8u3s17uom8or57trs` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `product` table
INSERT INTO `product` VALUES 
(1, 'Delicioso pastel de chocolate con un relleno de dulce de leche y Nutella, cubierto con chispas de chocolate y otra capa de Nutella.', 'pastel_chocolate.jpg', 'Pastel de Chocolate', 12000, 1, NULL),
(2, 'Pastel de red velvet con relleno de leche condensada y una cobertura de coco.', 'pastel_red_velvet.jpg', 'Pastel de Red Velvet', 12000, 1, NULL),
(3, 'Pastel frío de frutas y vainilla con crema pastelera y esponja de vainilla.', 'pastel_frutas_vainilla.jpg', 'Pastel Frío de Frutas y Vainilla', 12000, 1, NULL),
(4, 'Cheesecake con una variedad de frutos rojos.', 'cheesecake_frutos_rojos.jpg', 'Cheesecake de Frutos Rojos', 2500, 2, NULL),
(5, 'Cheesecake con sabor a maracuyá.', 'cheesecake_maracuya.jpg', 'Cheesecake de Maracuyá', 2500, 2, NULL),
(6, 'Cheesecake con un toque de zanahoria.', 'cheesecake_zanahoria.jpg', 'Cheesecake de Zanahoria', 2500, 2, NULL),
(7, 'Cheesecake con sabor a Oreo.', 'cheesecake_oreo.jpg', 'Cheesecake de Oreo', 2500, 2, NULL),
(8, 'Bowl con base de fresa y toppings de frutas frescas como frambuesa, almendra y mango.', 'bowl_fresa.jpg', 'Bowl de Fresa', 3500, 4, 1),
(9, 'Bowl de açaí con toppings de kiwi, arándano, coco y mango.', 'bowl_acai.jpg', 'Bowl de Açaí', 3500, 4, 1),
(10, 'Deliciosas tostadas francesas con frambuesas y miel de maple.', 'tostadas_francesas_frutas.jpg', 'Tostadas Francesas con Frutas', 3500, 4, 2),
(11, 'Tostadas francesas rellenas de Nutella.', 'tostadas_francesas_nutella.jpg', 'Tostadas Francesas con Nutella', 3500, 4, 2),
(12, 'Croissant relleno de aguacate, jamón de pavo y queso fresco.', 'croissant_aguacate_pavo.jpg', 'Croissant con Aguacate y Pavo', 4500, 4, 3),
(13, 'Gallo pinto con queso frito, plátano maduro y aguacate.', 'brunch_pinto.jpg', 'Brunch de Pinto', 5500, 4, 4),
(14, 'Orden de papas fritas.', 'papas_fritas.jpg', 'Papas Fritas', 2500, 6, NULL),
(15, 'Orden de papas a la mexicana.', 'papas_mexicana.jpg', 'Papas a la Mexicana', 3000, 6, NULL),
(16, 'Orden de papas planas.', 'papas_planas.jpg', 'Papas Planas', 2500, 6, NULL),
(17, 'Orden de camote frito.', 'camote_frito.jpg', 'Camote Frito', 2500, 6, NULL),
(18, 'Ensalada de la casa con espinaca, tomate, zanahoria, queso parmesano, y bacon.', 'ensalada_casa.jpg', 'Ensalada de la Casa', 4500, 5, NULL),
(19, 'Ensalada de quinoa con brócoli, chile asado, zucchini, zanahoria, tomate cherry, y pepino.', 'ensalada_quinoa.jpg', 'Ensalada de Quinoa', 4500, 5, NULL),
(20, 'Ensalada fresca con lechuga, tomate cherry, zanahoria, mango, y ajonjolí.', 'ensalada_fresca.jpg', 'Ensalada Fresca', 4500, 5, NULL),
(21, 'Ensalada con lechuga, pepino, cebolla morada, rábano, y crotones.', 'ensalada_lechuga.jpg', 'Ensalada con Lechuga y Pepino', 4500, 5, NULL),
(22, 'Café frío con caramelo salado.', 'salted_caramel_coffee.jpg', 'Salted Caramel Coffee', 2500, 7, NULL),
(23, 'Café frío con azúcar moreno.', 'iced_brown_sugar.jpg', 'Iced Brown Sugar', 3500, 7, NULL),
(24, 'Mocaccino frío.', 'mocaccino.jpg', 'Mocaccino', 2500, 7, NULL),
(25, 'Café frío con gelatina.', 'jelly_coffee.jpg', 'Jelly Coffee', 2500, 7, NULL),
(26, 'Café Americano caliente.', 'cafe_americano.jpg', 'Café Americano', 2500, 8, NULL),
(27, 'Latte caliente con especias de calabaza.', 'pumpkin_spice_latte.jpg', 'Pumpkin Spice Latte', 3500, 8, NULL),
(28, 'Chocolate caliente.', 'chocolate_caliente.jpg', 'Chocolate Caliente', 2500, 8, NULL),
(29, 'Café mocha caliente.', 'mocha.jpg', 'Mocha', 2500, 8, NULL),
(30, 'Smoothie de vegetales verdes.', 'batido_verde.jpg', 'Batido Verde', 2500, 9, NULL),
(31, 'Smoothie de sandía.', 'smoothie_sandia.jpg', 'Smoothie de Sandía', 2500, 9, NULL),
(32, 'Smoothie de banano con mantequilla de maní.', 'smoothie_banano_mantequilla.jpg', 'Smoothie de Banano y Mantequilla de Maní', 2500, 9, NULL),
(33, 'Smoothie de fresa y mora.', 'smoothie_fresa_mora.jpg', 'Smoothie de Fresa y Mora', 2500, 9, NULL);







-- Simplified MySQL Dump for `role` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `role`;

-- Create the `role` table
CREATE TABLE `role` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` ENUM('ADMIN', 'CUSTOMER', 'GUEST') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `role` table
INSERT INTO `role` VALUES 
(1, 'ADMIN'),
(2, 'CUSTOMER'),
(3, 'GUEST');








-- Simplified MySQL Dump for `subcategory` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `subcategory`;

-- Create the `subcategory` table
CREATE TABLE `subcategory` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) DEFAULT NULL,
  `category_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKe4hdbsmrx9bs9gpj1fh4mg0ku` (`category_id`),
  CONSTRAINT `FKe4hdbsmrx9bs9gpj1fh4mg0ku` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `subcategory` table
INSERT INTO `subcategory` VALUES 
(1, 'Bowl', 4),
(2, 'Dulce', 4),
(3, 'Salado', 4),
(4, 'Brunch', 4);










-- Simplified MySQL Dump for `user` Table

-- Drop table if it exists
DROP TABLE IF EXISTS `user`;

-- Create the `user` table
CREATE TABLE `user` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `password` VARCHAR(255) DEFAULT NULL,
  `phone` VARCHAR(255) DEFAULT NULL,
  `role_id` BIGINT DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn82ha3ccdebhokx3a8fgdqeyy` (`role_id`),
  CONSTRAINT `FKn82ha3ccdebhokx3a8fgdqeyy` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Insert initial data into the `user` table
INSERT INTO `user` VALUES 
(1, 'admin@cafeteria.com', 'Admin', '$2a$10$A41Tddoz.smR7iI2Gusc/eaJbQHel9iy4cwmjdwG3IR1lDN46cvhG', '1234567890', 1),
(2, 'cliente@cafeteria.com', 'Cliente', '$2a$10$QoKJ1dV3lZ2ET1SKpy2dDuyKg90QWuUOccUyY.q0t6FfXcQcO//2i', '1122334455', 2),
(3, 'sop02869@gmail.com', 'Sofia', '$2a$10$iZR0DCPEtzEBp3fAPd8l8uByNQnb5JgUqryafvL/TyqQ0dJ6NvmJ2', '72511639', 2),
(4, 'aghattaalvarado@gmail.com', 'Aghatta Alvarado', '$2a$10$M2BTn8PAWry8wRoWV3Lyy.iwAAGG2Tl9B75m7EVME19x/jWterRyi', '72511639', 2);
