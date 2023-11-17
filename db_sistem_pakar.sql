-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2023 at 04:23 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sistem_pakar`
--

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `disease_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`disease_id`, `name`) VALUES
(1, 'Bronkitis'),
(2, 'Sinusitis'),
(3, 'Bronkiolitis'),
(4, 'Pneumonia'),
(5, 'Faringitis'),
(6, 'Epiglotitis'),
(7, 'Pleuritis'),
(8, 'Common Cold'),
(9, 'ILI (Influenza Like Illness)');

-- --------------------------------------------------------

--
-- Table structure for table `diseases_symptoms`
--

CREATE TABLE `diseases_symptoms` (
  `disease_id` int(11) NOT NULL,
  `symptom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `diseases_symptoms`
--

INSERT INTO `diseases_symptoms` (`disease_id`, `symptom_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 7),
(1, 8),
(1, 11),
(1, 23),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 8),
(2, 9),
(2, 10),
(2, 13),
(2, 15),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(3, 1),
(3, 2),
(3, 7),
(3, 8),
(3, 10),
(3, 11),
(3, 12),
(3, 15),
(3, 30),
(4, 1),
(4, 2),
(4, 4),
(4, 8),
(4, 10),
(4, 12),
(4, 16),
(4, 23),
(4, 24),
(4, 25),
(5, 1),
(5, 2),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 9),
(5, 12),
(5, 13),
(5, 25),
(6, 1),
(6, 4),
(6, 5),
(6, 6),
(6, 11),
(6, 13),
(6, 14),
(7, 1),
(7, 2),
(7, 8),
(7, 10),
(7, 16),
(7, 21),
(7, 22),
(7, 23),
(7, 26),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 9),
(8, 13),
(8, 17),
(8, 27),
(8, 29),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(9, 13),
(9, 17),
(9, 22),
(9, 29);

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `symptom_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `certainty` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`symptom_id`, `name`, `certainty`) VALUES
(1, 'Demam', 0.4),
(2, 'Batuk-batuk', 0.34),
(3, 'Hidung tersumbat/Pilek', 0.18),
(4, 'Sakit kepala/Pusing', 0.24),
(5, 'Sakit tenggorokan', 0.22),
(6, 'Susah menelan', 0.1),
(7, 'Badan lemas & lesu', 0.18),
(8, 'Sesak nafas', 0.4),
(9, 'Bersin-bersin', 0.8),
(10, 'Frekuensi nafas cepat', 0.24),
(11, 'Suara nafas kasar', 0.22),
(12, 'Nafsu makan berkurang', 0.2),
(13, 'Suara serak', 0.28),
(14, 'Gelisah', 0.16),
(15, 'Susah tidur', 0.16),
(16, 'Nyeri di dada', 0.26),
(17, 'Berkurangnya kemampuan indra penciuman', 0.8),
(18, 'Wajah terasa nyeri atau tertekan', 0.1),
(19, 'Bau mulut', 0.8),
(20, 'Sakit gigi', 0.1),
(21, 'Nyeri sendi atau nyeri otot', 0.1),
(22, 'Berkeringat dan menggigil', 0.1),
(23, 'Batuk dengan dahak kental berwarna hijau, kuning, atau disertai darah', 0.1),
(24, 'Diare', 0.4),
(25, 'Mual atau muntah', 0.2),
(26, 'Nyeri bahu dan punggung', 0.1),
(27, 'Hidung berair', 0.1),
(28, 'Nyeri telinga', 0.6),
(29, 'Mata berair', 0.1),
(30, 'Dehidrasi', 0.6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `role`, `username`, `password`) VALUES
(1, 0, 'admin', '$2y$10$ASS50col3niwOOku4Zkky.HpmF18hiPWL9pi2DnE8CS'),
(2, 1, 'adi', '$2y$10$ge9myh0TIg1tGwsOm6KZ5eriUxWhYswmHFx84dEsrwx'),
(11, 1, 'ari', '$2y$10$AMqONb9QD9COW1/9VmNwyOCo3eLFl/AUxQwGTMhwYor'),
(17, 1, 'geats', '$2y$10$oe2igmq7Gfq0KKmPEJo3UOD4xmgduzkY..WSK6JmlRWn.6uvQELl6'),
(18, 1, 'user', '$2y$10$vpoR1U./.6R64PcnZ26qn.Y5A6S87SzjG6uCEfGe9MVdQvHtd7ETS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `diseases_symptoms`
--
ALTER TABLE `diseases_symptoms`
  ADD KEY `disease_id` (`disease_id`),
  ADD KEY `symptom_id` (`symptom_id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`symptom_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `diseases_symptoms`
--
ALTER TABLE `diseases_symptoms`
  ADD CONSTRAINT `diseases_symptoms_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`disease_id`),
  ADD CONSTRAINT `diseases_symptoms_ibfk_2` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`symptom_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
