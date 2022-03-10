DROP DATABASE IF EXISTS `eShop`;
-- C(CREATE) Créer les bases de donnée et ces tables
CREATE DATABASE IF NOT EXISTS `eShop`;
USE `eShop`;

-- Creation de la table User
CREATE TABLE `User`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nom` VARCHAR(100),
    `prenom` VARCHAR(100),
    `age` INT(2),
    `adresse` VARCHAR(255),
    `tel` VARCHAR(50) UNIQUE,
    `roles` ENUM('admin', 'boutiquier', 'client'),
    `email` VARCHAR(50) UNIQUE,
    `pwd` VARCHAR(255),
    `created_at` DATETIME,
    `is_active` INT
);

-- Creation de la table category
CREATE TABLE `Category`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(255),
    `desc` TEXT
);

-- Creation de la table product
CREATE TABLE `Product`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `nom` VARCHAR(255),
    `price` FLOAT,
    `is_promo` INT(11) NULL,
    `promo` INT(11) NULL,
    `Category_id` INT,
    `img` VARCHAR(100),
    `desc` TEXT,
    `stock_actuel` INT(11),
    `stock_min` INT(11),
    `date_expiration` DATE NULL,
    `updated_at` DATETIME,
    `created_at` DATETIME,
    `User_id` INT(11),
    CONSTRAINT FOREIGN KEY (`Category_id`) REFERENCES `Category`(`id`),
    CONSTRAINT FOREIGN KEY (`User_id`) REFERENCES `User`(`id`)
);

-- Panier
CREATE TABLE `Panier`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `User_id` INT,
    `montant` FLOAT,
    CONSTRAINT FOREIGN KEY (`User_id`) REFERENCES `User`(`id`)
);

-- Panier product
CREATE TABLE `Panier_product`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `Panier_id` INT,
    `Product_id` INT,
    `quantity` INT,
    CONSTRAINT FOREIGN KEY (`Product_id`) REFERENCES `Product`(`id`),
    CONSTRAINT FOREIGN KEY (`Panier_id`) REFERENCES `Panier`(`id`)

);

CREATE TABLE `Commande`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `User_id` INT,
    `createdAt` DATE,
    CONSTRAINT FOREIGN KEY (`User_id`) REFERENCES `User`(`id`)
);

CREATE TABLE `Commande_product`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `Commande_id` INT,
    `Product_id`INT,
    `quantity` INT,
    `montant` FLOAT,
    CONSTRAINT FOREIGN KEY (`Commande_id`) REFERENCES `Commande`(`id`),
    CONSTRAINT FOREIGN KEY (`Product_id`) REFERENCES `Product`(`id`)
);

-- insertion d'un utilisateur dans User
INSERT INTO `User` VALUE(
    null,
    "Diallo",
    "Amadou",
    "22",
    "Grand-Mabo",
    "783841245",
    'client',
    "am@gmail.com",
    "bente",
    CURRENT_TIMESTAMP,
    '1'
);

-- insertion d'un utilisateur dans User
INSERT INTO `User` VALUE(
    null,
    "Balde",
    "Mamadou",
    "20",
    "Peti-Mabo",
    "776696347",
    'admin',
    "madou@gmail.com",
    "baillo",
    CURRENT_TIMESTAMP,
    "2"
);

INSERT INTO `User` VALUE(
    null,
    "Bente",
    "Amadou",
    "19",
    "Grand-Mabo",
    "771051350",
    'boutiquier',
    "bente@gmail.com",
    "bente",
    CURRENT_TIMESTAMP,
    "1"
);

INSERT INTO `User` VALUE(
    null,
    "Barry",
    "Mahmoud",
    "21",
    "Keur-Mbay fall",
    "771051361",
    'boutiquier',
    "barry@gmail.com",
    "bente",
    CURRENT_TIMESTAMP,
    "3"
);

-- Insertion des catégories dans category
INSERT INTO `Category` VALUE(
    null,
    "Alimentaire",
    "Produit consomable"
);

-- Insertion des catégories dans category
INSERT INTO `Category` VALUE(
    null,
    "Bureautique",
    "Fourniture scolaire et bureautique"
);

-- Insertion des catégories dans category
INSERT INTO `Category` VALUE(
    null,
    "Electronique",
    "Composant et materiel electronique"
);
INSERT INTO `Category` VALUE(
    null,
    "Electro ménager",
    "Pour la maison"
);

-- Insertion d'un produit dans product
INSERT INTO `Product` VALUE(
    null,
    "Bombon",
    "100",
    null,
    null,
    "1"
    "https://via.placeholder.com/150",
    "Bombon sucre au chocolat",
    "20",
    "5",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    "3"
);

-- Insertion d'un produit dans product
INSERT INTO `Product` VALUE(
    null,
    "Stylo",
    "1500",
    null,
    null,
    "2",
    "https://via.placeholder.com/150",
    "Un stylo pas comme les autres",
    "20",
    "5",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    "3",
    "3"
);

-- Insertion d'un produit dans product
INSERT INTO `Product` VALUE(
    null,
    "Rame de 8Go",
    "40000",
    null,
    null,
    "3",
    "https://via.placeholder.com/150",
    "Pour rendre votre machine plus rapide",
    "20",
    "5",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    "3",
    "4"
);

-- Insertion d'un produit dans product
INSERT INTO `Product` VALUE(
    null,
    "Huil d'arachide",
    "5000",
    "1",
    "https://via.placeholder.com/150",
    "Huil sans colesterole",
    "20",
    "5",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    "3",
    "4"
);

-- Insertion d'un produit dans product
INSERT INTO `Product` VALUE(
    null,
    "Riz parfumé",
    "16000",
    null,
    null,
    "1",
    "https://via.placeholder.com/150",
    "Riz de haut qualité",
    "20",
    "5",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    "3",
    "3"
);

INSERT INTO `Product` VALUE(
    null,
    "Frigo",
    "400000",
    null,
    null,
    "4",
    "https://via.placeholder.com/150",
    "Frigidère tres grande",
    "20",
    "5",
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    "3",
    "3"
);

-- SELECT * FROM `Boutique` 
/* -- R (READ)::SELLECTIONNER ET LIRE DES DONNEE
SELECT * FROM `User`;
SELECT `nom`, `prenom` FROM `User`;
-- R(READ SOMME DATA)
SELECT * FROM `User` WHERE `id`=1;
SELECT * FROM `User` WHERE `tel`='783841245';
SELECT * FROM `User` WHERE `prenom`='Amadou' AND `nom`='Diallo';
SELECT * FROM `User` WHERE `email`='am@gmail.com' AND `password`='bente';
SELECT * FROM `User` WHERE `prenom` LIKE 'Amadou' OR `prenom` LIKE 'Mamadou';

-- U(UPDATE)
UPDATE `User` SET `nom` = 'Balde' WHERE "id"=1;
UPDATE 'User' SET `nom` = `Diouf`, `prenom` = `Modou` WHERE `id` = 1;
*/