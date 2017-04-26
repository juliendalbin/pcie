-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `competence`
--

DROP TABLE IF EXISTS `competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competence` (
  `idcompetence` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `titre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcompetence`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competence`
--

LOCK TABLES `competence` WRITE;
/*!40000 ALTER TABLE `competence` DISABLE KEYS */;
INSERT INTO `competence` VALUES (45,NULL,'langage C'),(49,NULL,'langage C++'),(51,NULL,'langage Java'),(52,NULL,'langage PHP 5'),(53,NULL,'langage Python'),(54,NULL,'shell Scripts'),(55,NULL,'programmation sockets'),(56,NULL,'Svn'),(57,NULL,'Git'),(58,NULL,'Framework Qt'),(59,NULL,'Linux Debian'),(60,NULL,'JBOSS'),(61,NULL,'PostgreSQL'),(62,NULL,'Java/J2E'),(63,NULL,'Javascript'),(64,NULL,'WS Rest'),(65,NULL,'JPA'),(66,NULL,'Hibernate'),(67,NULL,'Orika'),(68,NULL,'React.js'),(69,NULL,'Datastage'),(70,NULL,'Nightwatch.js'),(71,NULL,'Arquillian'),(72,NULL,'Maven'),(73,NULL,'Grunt'),(74,NULL,'Eclipse'),(75,NULL,'Jenkins'),(76,NULL,'SonarQube'),(77,'(FW, IPS, Proxy, DNS, SMTP, DNSSec)','Sécurité'),(78,'(BGP, DDOS, Peering Internet)','Réseau'),(80,NULL,'SQL'),(81,NULL,'MySQL'),(82,NULL,'AngularJS'),(83,NULL,'HTML5'),(84,NULL,'conception d\'interfaces'),(85,NULL,'réalisation de développements'),(86,NULL,'requêtage SQL'),(87,NULL,'rédaction de documentations'),(88,NULL,'AD'),(89,NULL,'Messagerie Exchange'),(90,NULL,'Office 365'),(91,NULL,'LYNC'),(92,NULL,'Sharepoint'),(93,'LAN, WLAN, Wifi Ruckus technology : WLAN','architectures CISCO'),(94,NULL,'NAC (802,11x)'),(95,NULL,'Cisco ISE (1.4)'),(96,NULL,'Firewalling'),(97,NULL,'radius'),(98,NULL,'GPP'),(99,NULL,'Wifi'),(100,NULL,'ISA100'),(101,NULL,'WirelessHarT'),(102,NULL,'Lora'),(103,NULL,'3G'),(104,NULL,'4G/LTE'),(105,NULL,'Sigfox'),(106,NULL,'Lifi'),(107,NULL,'langage C#'),(108,NULL,'VB.NET'),(109,NULL,'ASP.NET'),(110,NULL,'visual studio'),(111,NULL,'WPF'),(112,NULL,'WCF'),(113,'routeurs, switch, Wifi, VPN, loadbalancing','réseau'),(114,'BGP, MPLS, OSPF, RIP','Protocoles réseau'),(115,NULL,'Agile');
/*!40000 ALTER TABLE `competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveau`
--

DROP TABLE IF EXISTS `niveau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `niveau` (
  `idUtilisateur` int(11) NOT NULL,
  `idOffre` int(11) NOT NULL,
  `idcompetence` int(11) NOT NULL,
  `niveau` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`,`idOffre`,`idcompetence`),
  KEY `fk_table1_tag1_idx` (`idcompetence`),
  CONSTRAINT `fk_table1_tag1` FOREIGN KEY (`idcompetence`) REFERENCES `competence` (`idcompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_utilisateur_has_offre1` FOREIGN KEY (`idUtilisateur`, `idOffre`) REFERENCES `utilisateur_has_offre` (`idUtilisateur`, `idOffre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveau`
--

LOCK TABLES `niveau` WRITE;
/*!40000 ALTER TABLE `niveau` DISABLE KEYS */;
INSERT INTO `niveau` VALUES (29,5,45,'4'),(29,5,49,'4'),(29,5,53,'2'),(29,5,54,'4'),(29,5,55,'4'),(29,5,56,'3'),(29,5,57,'3'),(29,5,58,'4'),(29,5,59,'3'),(29,9,88,'2'),(29,9,89,'2'),(29,9,90,'3'),(29,9,91,'2'),(29,9,92,'4'),(29,14,51,'3'),(29,14,56,'3'),(29,14,57,'3'),(29,14,60,'3'),(29,14,61,'3'),(29,14,62,'3'),(29,14,64,'3'),(29,14,65,'3'),(29,14,66,'3'),(29,14,80,'3'),(29,14,81,'3'),(29,14,82,'3'),(29,14,85,'3'),(29,14,86,'3'),(29,14,87,'3');
/*!40000 ALTER TABLE `niveau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre`
--

DROP TABLE IF EXISTS `offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre` (
  `idOffre` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `description` longtext,
  `nbDePostes` varchar(45) DEFAULT NULL,
  `statut` varchar(45) DEFAULT NULL,
  `ville_offre` varchar(45) DEFAULT NULL,
  `zoneDeDeplacement` varchar(45) DEFAULT NULL,
  `salaire_offre` varchar(45) DEFAULT NULL,
  `experience` varchar(45) DEFAULT NULL,
  `suivi` varchar(45) DEFAULT NULL,
  `refApec` varchar(45) DEFAULT NULL,
  `datePublication` varchar(45) DEFAULT NULL,
  `dateActualisation` varchar(45) DEFAULT NULL,
  `typeDeContrat` varchar(45) DEFAULT NULL,
  `code_postal_offre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idOffre`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre`
--

LOCK TABLES `offre` WRITE;
/*!40000 ALTER TABLE `offre` DISABLE KEYS */;
INSERT INTO `offre` VALUES (5,'Concepteur développeur C/C++',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie. \nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\n\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Concepteur développeur PHP VBS (H/F).\nProfil et mission :\nIntégré au sein d\'une équipe, vous participez à des développements en C ou C++ sous linux en fonction des besoins de notre client.\nDans un second temps,\nvous administrez les systèmes Debian Linux.\nEnvironnement technique : Langages C, C++, Python, shell, programmation sockets, Svn, Git, Framework Qt\nCompétences souhaitées :\n- C\n- C++\n- Qt\n- Linux Debian\nVous êtes diplômé d\'un bac +5, et vous possédez environ 5 ans d\'expérience sur un contexte similaire. Une Connaissances en sécurisation des systèmes embarqués serait un plus.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience','1','Cadre du secteur privé','Toulouse','Pas de déplacement','35000','Expérimenté','Eva SAINT-MARTIN','161665899W-200182-3131','12/07/2016','21/07/2016','CDI','31000'),(6,'Architecte sécurité réseau',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Architecte sécurité réseaux (H/F).\ntraiter de sujets d\'architectures d\'infrastructures de sécurité.\n\nDans le cadre de ce poste, vous aurez la responsabilité d\'établir le scénario cible, et serez garant du bon fonctionnement de la solution.\nVous serez amené à travailler dans des groupes projets composés d\'un chef de projet, et d\'experts productions.\nVotre rôle est le suivant :\n-élaborer des cibles d\'évolution du système informatique en adéquation avec les orientations stratégiques de l\'entreprise. \n-Définir et maintenir le référentiel d\'architecture technique de l\'entreprise.\n-Assurer la vision globale de la solution, coordonner les travaux d\'architecture et les différents contributeurs techniques, dans le cadre des projets.\n-Concevoir/ construire l\'architecture des projets conformément aux exigences, à la cohérence globale avec le système informatique et les orientations définies par l\'entreprise.','1','Cadre du secteur privé','Toulouse','Pas de déplacement','40000','Expérimenté','Eva SAINT-MARTIN','161689011W-143850-1796','25/07/2016','01/08/2016','CDD','31000'),(7,'Concepteur développeur PHP',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Concepteur développeur PHP.\nIntégré au sein d\'une équipe projet, votre rôle s\'étend de la  phase de conception jusqu\'au développement et à l\'intégration des applications.\nEnvironnement : PHP 5, SQL, MySQL, AngularJS, HTML5.\nVous êtes diplômé d\'un bac +5, et vous possédez une première expérience sur un contexte similaire. Une maîtrise des bases de données et requêtes SQL serait un plus.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience','1','Cadre du secteur privé','Toulouse','Pas de déplacement','33000','Expérimenté','Eva SAINT-MARTIN','161688962W-200182-999993','21/07/2016','01/08/2016','CDD','31000'),(8,'Concepteur développeur TALEND',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Concepteur développeur TALEND (H/F).\nVous rejoindrez une équipe chargée de prendre en charge tous les projets liés aux échanges des données et au maintien opérationnel du SI décisionnel.\nDéveloppeur autonome vous êtes rompu aux mécanismes de Talend. Vos missions sont les suivantes : \n•	Evaluer le niveau de difficulté des projets, réaliser les spécifications et les évaluations de charges \n•	Proposer la conception en tenant compte des SI existants, des règles et normes en vigueur \n•	Réaliser les développements en ayant conscience des enjeux métiers de vos réalisations \n•	Effectuer les phases de test nécessaires pour assurer le niveau de qualité\nRéaliser le diagnostic et les corrections si nécessaire, sur les dysfonctionnements en production.\nVous êtes diplômé d\'un bac +2 et vous justifiez d\'une expérience d’au moins 2 ans, dont 12 mois minimum sur Talend.\nVous êtes à l’aise sur la conception d\'interfaces, la réalisation de développements, le requêtage SQL ainsi que la rédaction de documentations technique et utilisateurs.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience','1','Cadre du secteur privé','Toulouse','Pas de déplacement','35000','Expérimenté','Eva SAINT-MARTIN','161688937W-200182-999993','21/07/2016','01/08/2016','interim','31000'),(9,'Expert Microsoft',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Expert Microsoft (H/F).\nIntégré au sein du centre de service de notre client, vous avez pour fonction d\'être le référent technique sur tous les projets touchant à l\'environnement Microsoft : \nAD, Messagerie Exchange, Office 365, LYNC, Sharepoint... (affectation en fonction de vos compétences)\nVous intervenez en mode projet et/ou en N3 sur les différentes problématiques techniques qui vous sont soumises. Vous rédigez la documentation.\nVous êtes diplômé d\'un bac +2, et vous possédez mini 6  ans d\'expérience sur un contexte similaire.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience\nMerci d\'envoyer votre dossier de candidature (CV+ lettre de motivation) via le site APEC','1','Cadre du secteur privé','Toulouse','Pas de déplacement','38000','Expérimenté','Eva SAINT-MARTIN','161689074W-143850-1796','25/07/2016','01/08/2016','CDI','31000'),(10,'Expert WIFI et réseaux sans fils',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Expert WIFI et réseaux sans fils (H/F).\nAu sein d\'une équipe technique, vous intervenez sur la conception et la validation des architectures techniques, mais aussi en N3 sur les problématiques remontées par les différents services impactés.\nEn fonction des besoins, vous pourrez aussi réaliser des POC, des audits...\nCompétences souhaitées :\nExpertise sur une ou plusieurs des technologies suivantes : Wifi, ISA100, WirelessHarT, Lora, 3G, 4G/LTE, Sigfox, Lifi\nBon niveau sur les architectures CISCO : LAN, WLAN, Wifi Ruckus technology : WLAN\nConnaissances : NAC (802,11x), Cisco ISE (1.4), Firewalling, radius..., GPP\nVous êtes diplômé d\'un bac +2, et vous possédez mini 5 ans d\'expérience sur un contexte similaire. Un niveau d\'anglais conversationnel est requis pour ce poste.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience\nMerci d\'envoyer votre dossier de candidature (CV+ lettre de motivation) via le site APEC','1','Cadre du secteur privé','Toulouse','Pas de déplacement','40000','Expérimenté','Eva SAINT-MARTIN','161688990W-143850-1796','25/07/2016','01/08/2016','CDI','31000'),(11,'Ingénieur d\'études et développement .NET',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Ingénieur d\'études et développement .NET (H/F).\nIntégré au sein d\'une équipe, vous serez amené à intervenir sur l\'ensemble des projets, depuis le recueil des besoins jusqu\'au développement des applications.\nPassionné de technique, vous possédez une bonne maîtrise du développement Microsoft, particulièrement du langage C#.\nDes compétences en VB.NET ou ASP.NET seraient un plus.\nVous êtes à l\'aise sur les requêtes SQL, de même qu\'avec Visual Studio, le WPF et le WCF.\nVous êtes diplômé d\'un bac +2, et vous possédez une première expérience sur un contexte similaire.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience','1','Cadre du secteur privé','Toulouse','Pas de déplacement','35000','Expérimenté','Eva SAINT-MARTIN','161688848W-200182-999993','21/07/2016','01/08/2016','CDI','31000'),(13,'Ingénieur Sécurité et réseau',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Ingénieur Sécurité et Réseau (H/F).\nIntégré aux équipes de notre client, vous intervenez en mode projet et maintien en conditions opérationnelles sur les équipements de notre client.\nVous assurer leur administration, configuration, déploiement, support... et êtes en charge de la rédaction documentaire.\nCompétences requises :\n- Firewall : PALO ALTO\n- Loadbalancer : F5\n- Réseau : CISCO\nCompétences annexes :\n- Checkpoint, Juniper, Cisco ASA\nVous êtes diplôme d\'un bac +4, et vous possédez une première expérience sur un contexte similaire.\nUn niveau d\'anglais correct (lu, écrit, parlé) serait un plus.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience.\nRetrouvez nous sur www.pcie.fr et les Réseaux Sociaux : www.viadeo.com/fr/company/pcie','1','Cadre du secteur privé','Toulouse','Pas de déplacement','33000','Expérimenté','Eva SAINT-MARTIN','161608685W-200182-999993','13/06/2016','01/08/2016','CDI','31000'),(14,'Ingénieur d\\\'études et développement Java / J2EE',1,'Depuis plus de 10 ans, PCIE accompagne ses clients par la mise en place de solutions sur mesure, au forfait et en régie.\nAvec une 30aine de collaborateurs en région Midi-Pyrénées, nous sommes une structure de taille résolument humaine en pleine croissance.\nNous avons à cœur de faire évoluer nos collaborateurs et de leur proposer un suivi de qualité, car ils sont les acteurs majeurs de notre développement.\nSi nos valeurs (Partenariat, Conseil, Ingéniosité et Evolutivité) sont aussi les vôtres, rejoignez-nous ! \nNous recherchons, pour un de nos clients grands-comptes, un Ingénieur d\'études et développement Java / J2EE.\nIntégré à notre centre de service, ou en prestation chez notre client, vous intégrez une équipe qui travaille ler en mode projet et sur de la maintenance évolutive et corrective d\'applications.\nEnvironnement technique : Java, J2EE, AngularJS, Agile, SQL\nVous êtes diplômé d\'un bac +2, et vous possédez une première expérience sur un contexte similaire. Un connaissance de l\'ETL TALEND serait un plus.\nLe poste est basé à Toulouse.\nRémunération à définir selon expérience','1','Cadre du secteur privé','Toulouse','Pas de déplacement','35000','Expérimenté','Eva SAINT-MARTIN','161688881W-200182-999993','21/07/2016','01/08/2016','CDI','31000');
/*!40000 ALTER TABLE `offre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offre_has_competence`
--

DROP TABLE IF EXISTS `offre_has_competence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offre_has_competence` (
  `idOffre` int(11) NOT NULL,
  `idcompetence` int(11) NOT NULL,
  PRIMARY KEY (`idOffre`,`idcompetence`),
  KEY `fk_offre_has_competence_competence1_idx` (`idcompetence`),
  KEY `fk_offre_has_competence_offre1_idx` (`idOffre`),
  CONSTRAINT `fk_offre_has_competence_competence1` FOREIGN KEY (`idcompetence`) REFERENCES `competence` (`idcompetence`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_offre_has_competence_offre1` FOREIGN KEY (`idOffre`) REFERENCES `offre` (`idOffre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offre_has_competence`
--

LOCK TABLES `offre_has_competence` WRITE;
/*!40000 ALTER TABLE `offre_has_competence` DISABLE KEYS */;
INSERT INTO `offre_has_competence` VALUES (5,45),(5,49),(14,51),(7,52),(5,53),(5,54),(5,55),(5,56),(14,56),(5,57),(14,57),(5,58),(5,59),(14,60),(14,61),(14,62),(14,64),(14,65),(14,66),(6,77),(6,78),(7,80),(14,80),(7,81),(14,81),(7,82),(14,82),(7,83),(8,84),(8,85),(14,85),(8,86),(14,86),(8,87),(14,87),(9,88),(9,89),(9,90),(9,91),(9,92),(10,93),(10,94),(10,95),(13,95),(10,96),(13,96),(10,97),(10,98),(10,99),(10,100),(10,101),(10,102),(10,103),(10,104),(10,105),(10,106),(11,107),(11,108),(11,109),(11,110),(11,111),(11,112),(13,113),(13,114);
/*!40000 ALTER TABLE `offre_has_competence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rang`
--

DROP TABLE IF EXISTS `rang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rang` (
  `idrang` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrang`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rang`
--

LOCK TABLES `rang` WRITE;
/*!40000 ALTER TABLE `rang` DISABLE KEYS */;
INSERT INTO `rang` VALUES (1,'user'),(2,'candidat'),(3,'administrateur'),(4,'RH'),(5,'chef_de_projet');
/*!40000 ALTER TABLE `rang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `idUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `voie` varchar(45) DEFAULT NULL,
  `code_postal` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  `telephone_fixe` varchar(45) DEFAULT NULL,
  `telephone_portable` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `idrang` int(11) NOT NULL,
  `hash` varchar(60) DEFAULT NULL,
  `curriculum_vitae` varchar(45) DEFAULT NULL,
  `lettre_de_motivation` varchar(45) DEFAULT NULL,
  `salaire` varchar(45) DEFAULT NULL,
  `salaire_actuel` varchar(45) DEFAULT NULL,
  `preavis` varchar(45) DEFAULT NULL,
  `commentaire_candidat` varchar(45) DEFAULT NULL,
  `dateDeModification` date DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`,`idrang`),
  KEY `fk_Utilisateur_rang1_idx` (`idrang`),
  CONSTRAINT `fk_Utilisateur_rang1` FOREIGN KEY (`idrang`) REFERENCES `rang` (`idrang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (29,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$8vk1RuJQKWVtE08h7B082eHbZirxhN50AqbTLMhEBTWWtrL0Il1ti','DSPP_DALBIN Julien (1).docx','DSPP_DALBIN Julien (1).docx','36','33','immediate','test1\ntest2\ntest3\ntest4','2017-04-25'),(30,'SAINT MARTIN','Eva','6 avenue du Prat Gimont','31130','balma','0561241515','','eva.saint-martin@pcie.fr',4,'$2a$08$JDI0QdvLB4ubTZkuNItEv.jtL7Q16UPnqHVAfpuZJtc5dwpxsk5mi',NULL,NULL,'36','33','immediate',NULL,NULL),(31,'Riner','Teddy','boulevard des champions','30000','Rio','0123456789','0123456789','teddy.riner@jo.fr',2,'$2a$08$QLAivg6anwlE7YbfwFnX1eqeuCp0uSrJh/5HlmlkrRuXuIHXlXyB2',NULL,NULL,'36','33','immediate',NULL,NULL),(32,'Lescal','Nicolas','31 avenue de Labrousse','69000','Lyon','0405050505','0405050505','n.l@gmail.com',2,'$2a$08$fN640h05qTybpfN4pMtYJuAZRKIAh444AWQvKTbI1pEUi89daazUy',NULL,NULL,'36','33','immediate',NULL,NULL),(33,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$npAxB6DoM1zr/xJOyP2S6.9kDCIS5MU64XFPdzTNB1mk0f118A0vu',NULL,NULL,'36','33','immediate',NULL,NULL),(34,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$W/TaoH18iMogjUskFZm6Q.O.0cxrrMfjK1l3.Oaig48mWUgN0jHrC',NULL,NULL,'36','33','immediate',NULL,NULL),(35,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$Ph52kU9dulbwrL10wJNOk.7lBgAEPQn1IgWOUp0cSuWfkpMikWxOG',NULL,NULL,'36','33','immediate',NULL,NULL),(36,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$3bKnKZnLtEgAGKjdfD6I3.t8NdbmjJDaPu7xBE9aIYTjbPsy5Isoi',NULL,NULL,'36','33','immediate',NULL,NULL),(37,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$L2xa8IvQLM3kPw6u61OiL.rzIFPk8otzNjNGLU65Nez6f/WEPRuqa',NULL,NULL,'36','33','immediate',NULL,NULL),(38,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$Zvtd2qbPt2BrXJH3c.T7FOlcFy4yj47.WBzFoC2MkDSdUw2tlBViS',NULL,NULL,'36','33','immediate',NULL,NULL),(39,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31130','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$uq.AsEY9dZgB/xoTYBL5zuoNCy7P/T5MXyDKxOPwYshzW8o9TU7Em',NULL,NULL,'36','33','immediate',NULL,NULL),(40,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$zGX9Z3FfFdmPaQAE.EA1aew2iRleH2G/EEuhsAUlk.IqqP9ligA6W',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-05'),(41,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$AK5h3O9oMcoNlc2alFy33e2IUqEUDCizWJiDud3ebnaC7YKrzgenC',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-13'),(42,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$km9oQq/KRajKfYPrIqgpB.RneVzXHYIStYTm.ckj8BeKDG8iXB/1y',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-13'),(43,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$B.SbZRF4/Zm1FewdFLWh5OpsL355to1fg6djdJ5b3ZpR4T5LUHDQm',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-13'),(44,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$ZYQEftaVmtAR.J7p5oCy5eZLNjwzDThMYhzVe9DY4jnNtH0eIaevi',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-13'),(45,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$XHFIgB6QQVNXyOfFezlyBeimy6eIrrTLTS2CcfQLmm6VRD7te6gYW',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-13'),(46,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$FhYa9Te1A5k5CFwFZBgcBOuylKMt8kSgT7hPyCRWrdeDsDRl/nOK.',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-23'),(47,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$F3vGOB2NLTEstqsPJpUwVe5PXkXlTobEizdZlwWKWFq4weDD/w5km',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-23'),(48,'DALBIN','Julien','31 avenue Jean Baptiste de Lamarck','31131','balma','0561279594','0768824565','julien.dalbin@gmail.com',2,'$2a$08$.EOw4P6wcanpsf/lzoG3CeJBzkVmf/y.K1sgeR5jCiJqB8EA9TgIS',NULL,NULL,NULL,NULL,NULL,NULL,'2016-09-23');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_has_offre`
--

DROP TABLE IF EXISTS `utilisateur_has_offre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur_has_offre` (
  `idUtilisateur` int(11) NOT NULL,
  `idOffre` int(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`,`idOffre`),
  KEY `fk_Utilisateur_has_Offre_Offre1_idx` (`idOffre`),
  KEY `fk_Utilisateur_has_Offre_Utilisateur1_idx` (`idUtilisateur`),
  CONSTRAINT `fk_Utilisateur_has_Offre_Offre1` FOREIGN KEY (`idOffre`) REFERENCES `offre` (`idOffre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_has_Offre_Utilisateur1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`idUtilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_has_offre`
--

LOCK TABLES `utilisateur_has_offre` WRITE;
/*!40000 ALTER TABLE `utilisateur_has_offre` DISABLE KEYS */;
INSERT INTO `utilisateur_has_offre` VALUES (0,0),(29,5),(31,5),(29,6),(29,7),(29,8),(29,9),(29,10),(29,14);
/*!40000 ALTER TABLE `utilisateur_has_offre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 10:50:31
