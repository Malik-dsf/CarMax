-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 18 avr. 2024 à 14:56
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `carmax`
--

-- --------------------------------------------------------

--
-- Structure de la table `carburant`
--

CREATE TABLE `carburant` (
  `id_carbu` int(11) NOT NULL,
  `nom_carbu` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `compte_client` int(11) NOT NULL,
  `produit_commande` int(11) NOT NULL,
  `type_expedition` int(11) NOT NULL,
  `payement_commande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id_compte` int(11) NOT NULL,
  `nom_compte` varchar(32) NOT NULL,
  `mdp_compte` varchar(32) NOT NULL,
  `role_compte` int(11) NOT NULL,
  `adresse_compte` varchar(32) NOT NULL,
  `codep_compte` int(5) NOT NULL,
  `tel_compte` varchar(6) NOT NULL,
  `mel_compte` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

CREATE TABLE `couleur` (
  `id_couleur` int(11) NOT NULL,
  `nom_couleur` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `expedition`
--

CREATE TABLE `expedition` (
  `id_expedition` int(11) NOT NULL,
  `libelle_expedition` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methode`
--

CREATE TABLE `methode` (
  `methode_id` int(11) NOT NULL,
  `nom_methode` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `motorisation`
--

CREATE TABLE `motorisation` (
  `id_motor` int(11) NOT NULL,
  `nom_motor` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payement`
--

CREATE TABLE `payement` (
  `paymentID` int(11) NOT NULL,
  `paymentDate` datetime NOT NULL,
  `solde_payement` double NOT NULL,
  `méthode_payement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id_prod` int(11) NOT NULL,
  `nom_prod` varchar(32) NOT NULL,
  `prix_prod` double NOT NULL,
  `img_prod` text NOT NULL,
  `type_prod` int(11) NOT NULL,
  `motor_prod` int(11) NOT NULL,
  `carbu_prod` int(11) NOT NULL,
  `couleur_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id_roles` int(11) NOT NULL,
  `nom_role` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id_roles`, `nom_role`) VALUES
(1, 'root'),
(2, 'administrateur'),
(3, 'concessionnaire'),
(4, 'client');

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

CREATE TABLE `types` (
  `id_type` int(11) NOT NULL,
  `nom_type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id_type`, `nom_type`) VALUES
(1, 'berline'),
(2, 'SUV'),
(3, 'coupé'),
(4, 'cabriolet'),
(5, 'citadine'),
(6, 'monospace'),
(7, 'utilitaire');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carburant`
--
ALTER TABLE `carburant`
  ADD PRIMARY KEY (`id_carbu`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `compte_client` (`compte_client`,`type_expedition`),
  ADD KEY `payement_commande` (`payement_commande`),
  ADD KEY `produit_commande` (`produit_commande`),
  ADD KEY `type_expedition` (`type_expedition`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`id_compte`),
  ADD KEY `role_compte` (`role_compte`);

--
-- Index pour la table `couleur`
--
ALTER TABLE `couleur`
  ADD PRIMARY KEY (`id_couleur`);

--
-- Index pour la table `expedition`
--
ALTER TABLE `expedition`
  ADD PRIMARY KEY (`id_expedition`);

--
-- Index pour la table `methode`
--
ALTER TABLE `methode`
  ADD PRIMARY KEY (`methode_id`);

--
-- Index pour la table `motorisation`
--
ALTER TABLE `motorisation`
  ADD PRIMARY KEY (`id_motor`);

--
-- Index pour la table `payement`
--
ALTER TABLE `payement`
  ADD PRIMARY KEY (`paymentID`),
  ADD KEY `méthode_payement` (`méthode_payement`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `type_prod` (`type_prod`),
  ADD KEY `motor_prod` (`motor_prod`,`carbu_prod`,`couleur_prod`),
  ADD KEY `motor_prod_2` (`motor_prod`),
  ADD KEY `carbu_prod` (`carbu_prod`),
  ADD KEY `couleur_prod` (`couleur_prod`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roles`);

--
-- Index pour la table `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carburant`
--
ALTER TABLE `carburant`
  MODIFY `id_carbu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id_compte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `couleur`
--
ALTER TABLE `couleur`
  MODIFY `id_couleur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `expedition`
--
ALTER TABLE `expedition`
  MODIFY `id_expedition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `methode`
--
ALTER TABLE `methode`
  MODIFY `methode_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motorisation`
--
ALTER TABLE `motorisation`
  MODIFY `id_motor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payement`
--
ALTER TABLE `payement`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `types`
--
ALTER TABLE `types`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `carburant`
--
ALTER TABLE `carburant`
  ADD CONSTRAINT `carburant_ibfk_1` FOREIGN KEY (`id_carbu`) REFERENCES `produits` (`carbu_prod`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`compte_client`) REFERENCES `compte` (`id_compte`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`role_compte`) REFERENCES `roles` (`id_roles`);

--
-- Contraintes pour la table `couleur`
--
ALTER TABLE `couleur`
  ADD CONSTRAINT `couleur_ibfk_1` FOREIGN KEY (`id_couleur`) REFERENCES `produits` (`couleur_prod`);

--
-- Contraintes pour la table `expedition`
--
ALTER TABLE `expedition`
  ADD CONSTRAINT `expedition_ibfk_1` FOREIGN KEY (`id_expedition`) REFERENCES `commande` (`type_expedition`);

--
-- Contraintes pour la table `methode`
--
ALTER TABLE `methode`
  ADD CONSTRAINT `methode_ibfk_1` FOREIGN KEY (`methode_id`) REFERENCES `payement` (`méthode_payement`);

--
-- Contraintes pour la table `motorisation`
--
ALTER TABLE `motorisation`
  ADD CONSTRAINT `motorisation_ibfk_1` FOREIGN KEY (`id_motor`) REFERENCES `produits` (`motor_prod`);

--
-- Contraintes pour la table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `payement_ibfk_1` FOREIGN KEY (`paymentID`) REFERENCES `commande` (`payement_commande`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`type_prod`) REFERENCES `types` (`id_type`),
  ADD CONSTRAINT `produits_ibfk_2` FOREIGN KEY (`id_prod`) REFERENCES `commande` (`produit_commande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
