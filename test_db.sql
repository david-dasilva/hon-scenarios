-- MySQL dump 10.13  Distrib 5.7.13, for Linux (i686)
--
-- Host: 127.0.0.1    Database: hon_scenarios
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons` (
  `id_addons` varchar(10) NOT NULL COMMENT 'liste des addons disponibles',
  `name_addon` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_addons`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
INSERT INTO `addons` VALUES ('armyCW','Armée CommonWealth'),('armyGE','Armée Allemande'),('armyUS','Armée US'),('carentan','Scénario pack Carentan'),('core','Boite de base'),('dday','Scénario pack DDay'),('pegasus','Scénario pack Pégasus Bridge');
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenario_prerequis`
--

DROP TABLE IF EXISTS `scenario_prerequis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenario_prerequis` (
  `id_scenario` int(11) NOT NULL,
  `id_addon` varchar(10) NOT NULL,
  PRIMARY KEY (`id_scenario`,`id_addon`),
  KEY `fk_scenario_prerequis_addon_idx` (`id_addon`),
  CONSTRAINT `fk_scenario_prerequis_addon` FOREIGN KEY (`id_addon`) REFERENCES `addons` (`id_addons`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_scenario_prerequis_scenario` FOREIGN KEY (`id_scenario`) REFERENCES `scenarios` (`id_scenario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenario_prerequis`
--

LOCK TABLES `scenario_prerequis` WRITE;
/*!40000 ALTER TABLE `scenario_prerequis` DISABLE KEYS */;
INSERT INTO `scenario_prerequis` VALUES (1,'carentan'),(2,'carentan'),(1,'core'),(3,'core'),(1,'dday'),(3,'pegasus');
/*!40000 ALTER TABLE `scenario_prerequis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scenarios`
--

DROP TABLE IF EXISTS `scenarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scenarios` (
  `id_scenario` int(11) NOT NULL,
  `nom_scenario` varchar(45) DEFAULT NULL COMMENT 'Liste des scénarios disponibles',
  PRIMARY KEY (`id_scenario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scenarios`
--

LOCK TABLES `scenarios` WRITE;
/*!40000 ALTER TABLE `scenarios` DISABLE KEYS */;
INSERT INTO `scenarios` VALUES (1,'Scenario A'),(2,'Scenario B'),(3,'Scenario C');
/*!40000 ALTER TABLE `scenarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_collection`
--

DROP TABLE IF EXISTS `user_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_collection` (
  `id_user` int(11) NOT NULL,
  `id_addon` varchar(10) NOT NULL,
  PRIMARY KEY (`id_user`,`id_addon`),
  KEY `fk_user_collection_addons_idx` (`id_addon`),
  CONSTRAINT `fk_user_collection_addons` FOREIGN KEY (`id_addon`) REFERENCES `addons` (`id_addons`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_collection_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_collection`
--

LOCK TABLES `user_collection` WRITE;
/*!40000 ALTER TABLE `user_collection` DISABLE KEYS */;
INSERT INTO `user_collection` VALUES (1,'armyCW'),(1,'armyGE'),(1,'armyUS'),(1,'core'),(1,'dday'),(1,'pegasus');
/*!40000 ALTER TABLE `user_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'m3phistos');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-03 21:06:22
/*
La requete magique :
SELECT DISTINCT scenarios.nom_scenario FROM hon_scenarios.scenario_prerequis, scenarios
WHERE scenarios.id_scenario = scenario_prerequis.id_scenario AND
    EXISTS (
            SELECT * FROM hon_scenarios.user_collection, users
            WHERE user_collection.id_addon = scenario_prerequis.id_addon
            AND user_collection.id_user = users.id_user
            AND users.username = "m3phistos");

 */