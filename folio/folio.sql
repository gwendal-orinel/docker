-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 26 sep. 2018 à 08:58
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `folio`
--
CREATE DATABASE IF NOT EXISTS `folio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `folio`;

-- --------------------------------------------------------

--
-- Structure de la table `competences`
--

DROP TABLE IF EXISTS `competences`;
CREATE TABLE IF NOT EXISTS `competences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `niveau` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `competences`
--

INSERT INTO `competences` (`id`, `nom`, `niveau`, `contenu`) VALUES
(1, 'Solution de Virtualisation', 'Avancé', 'Openstack;KVM;Proxmox;VMware;Amazon AWS;Cloudwatt;Docker;CloudFoundry;Cloud-computing'),
(2, 'Réseaux', 'Avancé', 'TCP/IP;Lan/Wlan;VPN;SSL;Routage;Protocoles de Redondance'),
(3, 'Langages informatiques', 'Avancé', 'Html;Php;Framework Symfony 2;C/C++;Javascript;Java;Css;Twig'),
(4, 'Systèmes de données / BDD', 'Intermediaire', 'MySQL;Oracle;PhpMyAdmin;NoSQL;Base de connaissance en BigData'),
(5, 'Système D\'exploitation', 'Intermediaire', 'Windows XP à Windows 10;RedHat;CentOs;Ubuntu;Debian;ChromeOS'),
(6, 'Outils', 'Intermediaire', 'Microsoft Office;Lotus;Easyvista;DOS;Shell;MSproject;Gantt;Bouml;Jmerise;Ansible'),
(7, 'Langues Vivantes', 'Intermediaire', 'Anglais: Lu, Ecrit, Parlé (Niveau Scolaire + Technique)');

-- --------------------------------------------------------

--
-- Structure de la table `diplomes`
--

DROP TABLE IF EXISTS `diplomes`;
CREATE TABLE IF NOT EXISTS `diplomes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `duree` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `diplomes`
--

INSERT INTO `diplomes` (`id`, `titre`, `description`, `duree`) VALUES
(1, 'Master MSIR (SIIC)', 'Manager en Informatique & Robotique spécialité sécurité informatique des industries connectées', '2'),
(2, 'Licence ACSID', 'Licence d\'Analyste-Concepteur de Système d\'Information et de Decision', '1'),
(3, 'Bts SIO (SISR)', 'BTS Services Informatiques aux Organisations spécialité Solutions d\'Infrastructure, Système et réseau', '2'),
(4, 'BacPro ELEEC', 'BacPro Electrotechnique Energies et Equipements Communicants', '3');

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

DROP TABLE IF EXISTS `documents`;
CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `documents`
--

INSERT INTO `documents` (`id`, `titre`, `contenu`, `section`) VALUES
(1, 'Déploiement d’une nouvelle infrastructure réseau M2L sécurisée', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9MzczeVphNHFmXzA', 'E4'),
(2, 'Gestion et administration de l\'infrastructure M2L', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9TkpJTV91NGtqWFU', 'E4'),
(3, 'Dossier E4 : Conception et maintenance de  solutions informatiques', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9WHdqV3FPQmZHdTA', 'E4'),
(4, 'Conception et réalisation d’un site web', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9WWNVcXdJam53N0E', 'E6'),
(5, 'Implémentation AD - DNS sous Win2012', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9aHdYaTZDRFJkNmc', 'E6'),
(6, 'PRA - DHCP Failover sous Win2012', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9amdKeklRME1ndWc', 'E6'),
(7, 'Installation et mise en place AD RMS sous Win2012', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9NWdNbGEwOFFrWXc', 'E6'),
(8, 'Installation et configuration Proxmox', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9V0VIUjdjSTcwcVk', 'E6'),
(9, 'Renouvellement de parc avec étude chiffrée', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9R0NnTXNFVUVraXM', 'E6'),
(10, 'Configuration SGBD et Administration BDD', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9R1FERUZ3aTZoZE0', 'E6'),
(11, 'Remasterisation d\'un poste', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9ZVFKQVpoV0dYYWM', 'E6'),
(12, 'Administration copieur XEROX', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9ZVVLQXVWX0ZVZUE', 'E6'),
(13, 'Gestion des utilisateurs sous Win2012', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9eld5LWI2bFRhUzQ', 'E6'),
(14, 'Mise en place de Eye Of Network', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9VW9INWxOVkNTUVk', 'E6'),
(15, 'Installation et mise en place de GLPI', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9SnF2VWxiMVhPYnc', 'E6'),
(16, 'Procedure de reparation de Firefox sur DELL760', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9MG1WNG8yVThBcVE', 'E6'),
(17, 'Etude et mise en place d\'un VPN Ipsec IKEv2', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9ZGFvWGh5TVMwMlU', 'E6'),
(18, 'Tableau de Synthese - Epreuve E6', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9U2lLOHRKTGwzZXc', 'E6'),
(19, 'Presentation - Epreuve E6', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9RTAxdm9odThVeWs', 'E6'),
(20, 'Dossier - Mise en place d’un outil décisionnel et de gestion de matériels d’une animalerie', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9YzhHeGFhRHdQcW8', 'ACSID'),
(21, 'Présentation - Mise en place d’un outil décisionnel et de gestion de matériels d’une animalerie', 'https://docs.google.com/file/d/0B8uPyJ9Suzy9QUlMYmw5UTVPVjg', 'ACSID'),
(22, 'Capture The Flag (réalisé en projet M2)', 'http://ctf.orinel.net/', 'lien-utile'),
(23, 'Bootstrap', 'http://getbootstrap.com/##bootstrap.jpg', 'lien-ressources'),
(24, 'Symfony', 'https://symfony.com/##symfony.png', 'lien-ressources'),
(25, 'Xda-developers', 'http://www.xda-developers.com/##xda.png', 'lien-ressources'),
(26, 'Stackoverflow', 'http://stackoverflow.com/##stackoverflow.jpg', 'lien-ressources'),
(27, 'Openstack.org', 'https://www.openstack.org/##openstack.png', 'lien-ressources'),
(28, 'Reddit', 'https://www.reddit.com/##reddit.png', 'lien-ressources'),
(29, 'Fontawesome', 'http://fontawesome.io/##fontawesome.png', 'lien-ressources'),
(30, 'Twig', 'http://twig.sensiolabs.org/##twig.png', 'lien-ressources'),
(31, 'Openclassrooms', 'https://openclassrooms.com/##openclassrooms.jpg', 'lien-ressources'),
(34, 'Application Amizoo (réalisé en projet Licence) [Beta access]', 'http://test:test@amizoo.orinel.net', 'lien-utile'),
(35, 'Repository GitHub de mes projets MSIR', 'https://github.com/MSIR2018', 'lien-utile'),
(36, 'RaspberryPi - Blog idleman', 'http://blog.idleman.fr/', 'lien-utile'),
(37, 'MyChromeBook', 'http://mychromebook.fr/##mychromebook.png', 'lien-ressources'),
(38, 'Android Developers', 'https://developer.android.com/##androiddev.png', 'lien-ressources'),
(39, 'Reddit Chromebook', 'https://www.reddit.com/r/chrultrabook/', 'lien-utile'),
(40, 'Réalisation d’une plateforme de Capture The Flag (CTF) en partenariat avec l’AFNIC', 'https://docs.google.com/file/d/1C3sCBI6xpvwFrArwbgcAmalDiWC7o2w_', 'MSIR'),
(41, 'Réalisation d’une infrastructure sécurisée\r\nen accord avec un cahier des charges', 'https://docs.google.com/file/d/1d-wAoGxJdIkOX6cxoD-Id951LPstgCOI', 'MSIR'),
(42, 'Projet d’intégration - Mise en place d\'une infrastructure réseau et système sécurisée.', 'https://docs.google.com/file/d/1UOHyPrGH4MHFonuy9NxXUde7Tq8MtG_r', 'MSIR'),
(43, 'Mise en place d’un Plan de Continuité d’Activité', 'https://docs.google.com/file/d/1hr93c16H_wnfezAFbCCK8V22ZqcmgwfS', 'MSIR'),
(44, 'Réalisation d\'une solution de supervision multi-plateforme', 'https://docs.google.com/file/d/1IlxSY18ns-uK320Uig_8G7PDHqYcbO-Z', 'MSIR'),
(45, 'Hackaton - Réalisation d\'un logiciel d\'inventaire d’équipements d\'infrastructure', 'https://docs.google.com/file/d/17c-yqRau-sIyozbJwArlHkuisAxIzIN9', 'MSIR'),
(46, 'RaspberryPI - Magdiblog', 'http://www.magdiblog.fr/', 'lien-utile'),
(47, 'Protocoles de technologies sans fil - Zigbee versus Zwave', 'https://docs.google.com/file/d/1B5NIMOHUtyalnovcQ0_e6kNAyVPciwN-', 'MSIR'),
(48, 'Entreprenariat - Création d\'entreprise', 'https://docs.google.com/file/d/1K55H2wt2QKd5wqkfyuVFVvXiADNqNjk6', 'MSIR');

-- --------------------------------------------------------

--
-- Structure de la table `etablissements`
--

DROP TABLE IF EXISTS `etablissements`;
CREATE TABLE IF NOT EXISTS `etablissements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `localisation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lien` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `etablissements`
--

INSERT INTO `etablissements` (`id`, `nom`, `icon`, `localisation`, `lien`, `section`, `description`) VALUES
(1, 'CFI Montigny -  (anciennement IFA-Delorozoy)', 'src/cfi.png', 'https://www.google.fr/maps/place/CFI+-+Site+Montigny/@48.774299,2.0142801,17z/data=!3m1!4b1!4m5!3m4!1s0x47e6814f0028bebb:0x7f43e2fdf62e623b!8m2!3d48.7742955!4d2.0164688', 'https://www.cfi-formations.fr/montigny-bretonneux-78/', 'ecoles', 'Ecole de la Chambre de Commerce et d\'Industrie de Paris Ile-de-France (CCI paris IDF). Formation de Bac à Bac+5'),
(2, 'Collège Lycée Saint-Exupéry', 'src/stex.png', 'https://www.google.fr/maps/place/Coll%C3%A8ge+Lyc%C3%A9e+Saint-Exup%C3%A9ry/@48.7952786,2.0476004,17z/data=!3m1!4b1!4m5!3m4!1s0x47e68727421cb061:0xfe1322139418a863!8m2!3d48.7952751!4d2.0497891', 'http://www.etablissementprive-saintexupery.com/', 'ecoles', 'Etablissement privé Collège-Lycée Saint-Exupéry'),
(3, 'Orange', 'src/orange.png', 'https://www.google.fr/maps/place/4+Avenue+du+8+Mai+1945,+78280+Guyancourt/@48.7857105,2.0506663,17z/', 'http://www.orange.com/', 'entreprises', 'Grande société française de télécommunications'),
(4, 'Renault-Nissan', 'src/renault.jpg', 'https://www.google.fr/maps/place/13+Avenue+Paul+Langevin,+92350+Le+Plessis-Robinson/@48.7749197,2.2473245,17z/', 'https://group.renault.com/', 'entreprises', 'Constructeur automobile français. Il est lié au constructeur japonais Nissan depuis 1999 à travers l\'alliance Renault-Nissan'),
(5, 'Econocom-Osiatis', 'src/econocom_osiatis.png', 'https://www.google.fr/maps/place/1+Rue+du+Petit+Clamart,+92360+Vélizy-Villacoublay/@48.78263,2.2219588,17z', 'https://www.econocom.com/', 'entreprises', 'Entreprise de services du numérique français, reconnue comme spécialiste des services aux infrastructures (SSII dans l\'IT)'),
(6, 'Idips', 'src/idips.png', 'https://www.google.fr/maps/place/104+Avenue+Jean+Moulin,+78380+La+Celle-Saint-Cloud/@48.8545491,2.1347847,17z/data=!4m5!3m4!1s0x47e67d294d768c69:0xe46cc9f9c6a34953!8m2!3d48.8545484!4d2.1370094', 'http://www.idips.com/', 'entreprises', 'Spécialiste des serrures électroniques, électromécaniques et mécaniques de haute sécurité pour coffre-fort, porte blindée, armoire forte de tous secteurs d’activités.');

-- --------------------------------------------------------

--
-- Structure de la table `experiences`
--

DROP TABLE IF EXISTS `experiences`;
CREATE TABLE IF NOT EXISTS `experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dates` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `experiences`
--

INSERT INTO `experiences` (`id`, `dates`, `description`) VALUES
(1, 'De Septembre 2010 à Aout 2013', 'En formation BacPro Electrotechnique Energies et Equipements Communicants. </br>Apprenti: Technicien Intervenant dans la société <b class=\"text-info\">IDIPS</b>'),
(2, 'De Septembre 2013 à Aout 2015', 'En formation BTS Services Informatiques aux Organisations spécialité Solutions d\'Infrastructure, Système et réseau. </br>Apprenti: Administrateurs réseau sécurité et Support utilisateurs dans la société <b class=\"text-info\">Econocom-Osiatis</b>'),
(3, 'De Septembre 2015 à Aout 2016', 'En formation Licence d\'Analyste-Concepteur de Système d\'Information et de Decision. </br>Apprenti: Architect Infrastructure et solutions cloud dans la société <b class=\"text-info\">Renault</b>'),
(4, 'De Septembre 2016 à Aujourd\'hui', 'En formation de Manager en Informatique et Robotique specialité Sécurité Informatique des Industries Connectées. </br>Apprenti: Recherche et Developement de solutions cloud en Paas/Iaas dans la société <b class=\"text-info\">Orange</b>');

-- --------------------------------------------------------

--
-- Structure de la table `home`
--

DROP TABLE IF EXISTS `home`;
CREATE TABLE IF NOT EXISTS `home` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `home`
--

INSERT INTO `home` (`id`, `name`, `contenu`) VALUES
(1, 'PRESENTATION', '<i class=\"fa fa-quote-left\" aria-hidden=\"true\"></i> L\'informatique est pour moi comme un univers, passionné depuis mon plus jeune âge, j\'ai décidé aujourd\'hui d\'en faire mon métier.. <i class=\"fa fa-quote-right\" aria-hidden=\"true\"></i>\r\n'),
(2, 'LOCALISATION', '<i class=\"fa fa-globe\" aria-hidden=\"true\"></i>  Fontenay-Le-Fleury (78)');

-- --------------------------------------------------------

--
-- Structure de la table `loisirs_et_interets`
--

DROP TABLE IF EXISTS `loisirs_et_interets`;
CREATE TABLE IF NOT EXISTS `loisirs_et_interets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `loisirs_et_interets`
--

INSERT INTO `loisirs_et_interets` (`id`, `nom`, `icon`, `section`) VALUES
(1, 'Informatique', 'src/informatique.png', 'interets'),
(2, 'Nouvelles technologies', 'src/nouvelletechno.png', 'interets'),
(3, 'Course à Pied', 'src/running.jpg', 'loisirs'),
(4, 'Natation', 'src/natation.png', 'loisirs'),
(6, 'Aéromodelisme', 'src/aeromodelisme.jpg', 'loisirs'),
(7, 'Mecanique', 'src/mecanique.jpg', 'loisirs'),
(8, 'Randonnées', 'src/rando.png', 'loisirs'),
(9, 'Vélo', 'src/velo.png', 'loisirs');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(2, 'gwendal', 'gwendal', 'test@test.fr', 'test@test.fr', 1, '86cs4h913qosgco080swk44k80cs04o', '$2y$13$PTywnt852S8SkYF310IEUOmwB5whSX3pUD4868etj1jjYAi7XFSsO', '2017-04-21 17:34:31', 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
