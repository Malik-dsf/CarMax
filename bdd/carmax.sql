-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 21 avr. 2024 à 00:58
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

--
-- Déchargement des données de la table `carburant`
--

INSERT INTO `carburant` (`id_carbu`, `nom_carbu`) VALUES
(1, 'essence'),
(2, 'gazole'),
(3, 'hybride'),
(4, 'electrique');

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

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id_compte`, `nom_compte`, `mdp_compte`, `role_compte`, `adresse_compte`, `codep_compte`, `tel_compte`, `mel_compte`) VALUES
(1, 'admin', '@DMinistrator1235', 1, '', 0, '', ''),
(2, 'malik', 'malik123', 2, '7 rue des arbres', 75000, '066666', 'malik.desenfant@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `couleur`
--

CREATE TABLE `couleur` (
  `id_couleur` int(11) NOT NULL,
  `nom_couleur` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `couleur`
--

INSERT INTO `couleur` (`id_couleur`, `nom_couleur`) VALUES
(2, 'Rouge'),
(3, 'Bleu'),
(4, 'Jaune'),
(5, 'Vert'),
(6, 'Gris'),
(7, 'Blanc'),
(8, 'Noir'),
(9, 'Ciel'),
(10, 'Argent'),
(11, 'Orange'),
(12, 'Rose'),
(13, 'Violet'),
(14, 'Gallardo'),
(15, 'Bordeaux'),
(16, 'Marron'),
(17, 'Nuit'),
(18, 'Platine');

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
-- Structure de la table `marque`
--

CREATE TABLE `marque` (
  `id_marque` int(11) NOT NULL,
  `nom_marque` varchar(32) NOT NULL,
  `pays_marque` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom_marque`, `pays_marque`) VALUES
(1, 'Renault', 'France'),
(2, 'Peugeot', 'France'),
(3, 'Citroën', 'France'),
(4, 'Volkswagen', 'Allemagne'),
(5, 'Mercedes', 'Allemagne'),
(6, 'Audi', 'Allemagne'),
(7, 'BMW', 'Allemagne'),
(8, 'Lamborghini', 'Italie'),
(9, 'Volvo', 'Suède'),
(10, 'Toyota', 'Japon'),
(11, 'Honda', 'Japon'),
(12, 'Bentley', 'Angleterre'),
(13, 'Tesla', 'État-Unis'),
(14, 'Ford', 'État-Unis');

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
  `nom_moto` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `motorisation`
--

INSERT INTO `motorisation` (`id_motor`, `nom_moto`) VALUES
(1, 'propulsion'),
(2, 'traction'),
(3, '4 roue motrice');

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
  `marque_prod` int(11) NOT NULL,
  `prix_prod` double NOT NULL,
  `img_prod` text NOT NULL,
  `type_prod` int(11) NOT NULL,
  `motor_prod` int(11) NOT NULL,
  `carbu_prod` int(11) NOT NULL,
  `couleur_prod` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id_prod`, `nom_prod`, `marque_prod`, `prix_prod`, `img_prod`, `type_prod`, `motor_prod`, `carbu_prod`, `couleur_prod`) VALUES
(3, 'supra', 10, 68000, '', 3, 1, 1, 8),
(4, 'supra', 10, 68000, '', 3, 1, 1, 5);

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
-- Index pour la table `marque`
--
ALTER TABLE `marque`
  ADD PRIMARY KEY (`id_marque`);

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
  ADD KEY `couleur_prod` (`couleur_prod`),
  ADD KEY `marque_prod` (`marque_prod`);

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
  MODIFY `id_carbu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compte`
--
ALTER TABLE `compte`
  MODIFY `id_compte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `couleur`
--
ALTER TABLE `couleur`
  MODIFY `id_couleur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `expedition`
--
ALTER TABLE `expedition`
  MODIFY `id_expedition` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `marque`
--
ALTER TABLE `marque`
  MODIFY `id_marque` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `methode`
--
ALTER TABLE `methode`
  MODIFY `methode_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `motorisation`
--
ALTER TABLE `motorisation`
  MODIFY `id_motor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `payement`
--
ALTER TABLE `payement`
  MODIFY `paymentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`compte_client`) REFERENCES `compte` (`id_compte`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`produit_commande`) REFERENCES `produits` (`id_prod`);

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`role_compte`) REFERENCES `roles` (`id_roles`);

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
-- Contraintes pour la table `payement`
--
ALTER TABLE `payement`
  ADD CONSTRAINT `payement_ibfk_1` FOREIGN KEY (`paymentID`) REFERENCES `commande` (`payement_commande`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`type_prod`) REFERENCES `types` (`id_type`),
  ADD CONSTRAINT `produits_ibfk_3` FOREIGN KEY (`motor_prod`) REFERENCES `motorisation` (`id_motor`),
  ADD CONSTRAINT `produits_ibfk_4` FOREIGN KEY (`marque_prod`) REFERENCES `marque` (`id_marque`),
  ADD CONSTRAINT `produits_ibfk_5` FOREIGN KEY (`carbu_prod`) REFERENCES `carburant` (`id_carbu`),
  ADD CONSTRAINT `produits_ibfk_6` FOREIGN KEY (`couleur_prod`) REFERENCES `couleur` (`id_couleur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
