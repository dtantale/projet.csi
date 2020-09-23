-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 23 sep. 2020 à 10:46
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `calendrier`
--

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_agenda`
--

DROP TABLE IF EXISTS `xlagenda_agenda`;
CREATE TABLE IF NOT EXISTS `xlagenda_agenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `heure_debut` time DEFAULT NULL,
  `heure_fin` time DEFAULT NULL,
  `description` text,
  `lieu` text,
  `categorie` int(11) DEFAULT NULL,
  `contact` text,
  `adresse` text,
  `email` text,
  `telephone` text,
  `fax` text,
  `lien` text,
  `url` text,
  `id_user` int(11) DEFAULT NULL,
  `actif` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_categorie` (`categorie`),
  KEY `fk_user` (`id_user`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table principale';

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_categories`
--

DROP TABLE IF EXISTS `xlagenda_categories`;
CREATE TABLE IF NOT EXISTS `xlagenda_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `couleur` text,
  `actif` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des categories';

--
-- Déchargement des données de la table `xlagenda_categories`
--

INSERT INTO `xlagenda_categories` (`id`, `nom`, `couleur`, `actif`) VALUES
(4, 'prise de mesure', 'FFFFFF', 1),
(25, 'Devis', 'FFFFFF', 1),
(32, 'Conseil', 'FFFFFF', 1);

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_config`
--

DROP TABLE IF EXISTS `xlagenda_config`;
CREATE TABLE IF NOT EXISTS `xlagenda_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `valeur` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Paramètres';

--
-- Déchargement des données de la table `xlagenda_config`
--

INSERT INTO `xlagenda_config` (`id`, `nom`, `valeur`) VALUES
(1, 'current_version', '4.5.2'),
(2, 'date_install', '23/09/2020');

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_demande`
--

DROP TABLE IF EXISTS `xlagenda_demande`;
CREATE TABLE IF NOT EXISTS `xlagenda_demande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `prenom` text,
  `email` text,
  `user` text,
  `pass` text,
  `motif` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des demandes de comptes';

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_logs`
--

DROP TABLE IF EXISTS `xlagenda_logs`;
CREATE TABLE IF NOT EXISTS `xlagenda_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` text,
  `pass` text,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `ip` text,
  `domain` text,
  `result` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des logs';

--
-- Déchargement des données de la table `xlagenda_logs`
--

INSERT INTO `xlagenda_logs` (`id`, `user`, `pass`, `date`, `time`, `ip`, `domain`, `result`) VALUES
(1, 'root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:44:55', '::1', 'DESKTOP-QNM3ETB', 'ok'),
(2, ' root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:45:25', '::1', 'DESKTOP-QNM3ETB', 'erreur'),
(3, 'root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:45:34', '::1', 'DESKTOP-QNM3ETB', 'ok'),
(4, 'root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:46:05', '::1', 'DESKTOP-QNM3ETB', 'ok'),
(5, 'root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:46:38', '::1', 'DESKTOP-QNM3ETB', 'ok'),
(6, 'root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:55:37', '::1', 'DESKTOP-QNM3ETB', 'ok'),
(7, 'root', '8a68592f5e553277c2c0db706c814d2b', '2020-09-23', '08:58:02', '::1', 'DESKTOP-QNM3ETB', 'ok');

-- --------------------------------------------------------

--
-- Structure de la table `xlagenda_users`
--

DROP TABLE IF EXISTS `xlagenda_users`;
CREATE TABLE IF NOT EXISTS `xlagenda_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` text,
  `password` text,
  `nom` text,
  `prenom` text,
  `email` text,
  `ajouter` tinyint(4) NOT NULL DEFAULT '0',
  `modifier` tinyint(4) NOT NULL DEFAULT '0',
  `supprimer` tinyint(4) NOT NULL DEFAULT '0',
  `valider` tinyint(4) NOT NULL DEFAULT '0',
  `gerer` tinyint(4) NOT NULL DEFAULT '0',
  `actif` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='XLAgenda - Table des utilisateurs';

--
-- Déchargement des données de la table `xlagenda_users`
--

INSERT INTO `xlagenda_users` (`id`, `user`, `password`, `nom`, `prenom`, `email`, `ajouter`, `modifier`, `supprimer`, `valider`, `gerer`, `actif`) VALUES
(1, 'root', '8a68592f5e553277c2c0db706c814d2b', 'admin', 'damien', 'tantale.damien@gmail.com', 1, 2, 2, 1, 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
