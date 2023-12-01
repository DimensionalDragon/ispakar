-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Des 2023 pada 12.48
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.28

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
-- Struktur dari tabel `diseases`
--

CREATE TABLE `diseases` (
  `disease_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `diseases`
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
-- Struktur dari tabel `diseases_symptoms`
--

CREATE TABLE `diseases_symptoms` (
  `disease_id` int(11) NOT NULL,
  `symptom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `diseases_symptoms`
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
-- Struktur dari tabel `solusi`
--

CREATE TABLE `solusi` (
  `solusi_id` int(11) NOT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `solusi` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `solusi`
--

INSERT INTO `solusi` (`solusi_id`, `disease_id`, `solusi`) VALUES
(1, 1, 'Untuk mengurangi gejala bronkitis, Anda dapat mengambil obat seperti: obat pereda demam dan nyeri, seperti paracetamol atau ibuprofen; obat antitusif atau ekspektoran, seperti codeine, dextromethorphan, guaifenesin, dan erdosteine; atau Disarankan untuk memeriksakan ke dokter jika gejala belum hilang dalam beberapa minggu.'),
(2, 2, 'Untuk meredakan gejala sinusitis, bisa menggunakan obat-obatan tanpa resep dokter. Anda dapat membeli obat pereda nyeri seperti ibuprofen atau paracetamol jika Anda menyebabkan rasa sakit. Obat dekongestan juga dapat membantu mengurangi pembengkakan sinus. Ini akan mengurangi penumpukan lendir dan membuat hidung Anda lebih tenang.'),
(3, 3, 'Untuk meredakan gejala bronkiolitis yang diderita jika Si Kecil demam, berikan dosis yang disarankan dokter atau petunjuk pemakaian yang tertera pada kemasan obat pereda panas, yang dapat dibeli secara gratis di apotek. Obat pereda panas dapat diberikan pada Si Kecil setelah berusia lebih dari tiga bulan. Obat antiinflamasi ini hanya boleh diberikan kepada individu berusia 16 tahun ke atas.'),
(4, 4, 'Untuk membantu menurunkan demam dengan mengonsumsi obat pereda rasa nyeri seperti parasetamol atau ibuprofen. Namun, obat pereda rasa sakit tidak disarankan untuk dikonsumsi oleh pengidap pneumonia yang alergi terhadap aspirin atau yang mengidap asma, tukak lambung, dan gangguan hati.'),
(5, 4, 'Jangan minum obat batuk. Hindari menggunakan obat batuk untuk meredakan gejala batuk karena itu hanyalah cara tubuh mengeluarkan dahak dari paru-paru. Anda bisa meminum air hangat yang dicampur madu dan lemon dapat membantu mengurangi batuk.'),
(6, 5, 'Obat digunakan untuk menurunkan gejala. Biasanya penggunaan obat kortikosteroid selama 1-2 hari untuk menurunkan risiko gejala, seperti keluhan sakit saat menelan, makan, atau minum. Penggunaan obat penurunan demam juga disarankan untuk mengatasi demam yang dialami. '),
(7, 6, 'Segera cari pertolongan medis bila melihat seseorang yang menunjukkan gejala epiglotitis. Penting diingat, jangan membaringkan penderita dalam posisi telentang atau memeriksa tenggorokannya tanpa didampingi petugas medis. Hal tersebut justru dapat memperburuk kondisi penderita.'),
(8, 6, 'Epiglotitis harus diobati secepatnya. Jika tidak, epiglotis yang membengkak bisa menutupi batang tenggorokan sehingga menghambat pasokan oksigen. Kondisi tersebut bisa menyebabkan kematian.'),
(9, 7, 'Epiglotitis harus diobati secepatnya. Jika tidak, epiglotis yang membengkak bisa menutupi batang tenggorokan sehingga menghambat pasokan oksigen. Kondisi tersebut bisa menyebabkan kematian.'),
(10, 7, 'Pleuritis yang disebabkan oleh virus dapat sembuh dalam beberapa hari dengan istirahat yang cukup sehingga obat-obatan antivirus tidak diperlukan. Sementara itu, operasi dapat dilakukan pada pleuritis yang disebabkan oleh kanker paru-paru. Operasi bertujuan untuk mengangkat sebagian atau seluruh organ paru-paru. Selain operasi, radioterapi atau kemoterapi juga dapat dilakukan untuk menangani kanker paru'),
(11, 8, 'Pada dasarnya, tidak ada obat yang bisa melawan virus penyebab common cold atau selesma. Artinya, common cold biasanya akan sembuh dengan sendirinya. Obat pilek dan batuk yang ada biasanya hanya digunakan untuk meredakan gejala yang Anda rasakan, seperti hidung tersumbat, demam, dan sakit kepala.'),
(12, 8, 'Beberapa obat yang biasa digunakan antara lain obat dekongestan untuk melegakan hidung tersumbat serta paracetamol atau ibuprofen untuk menurunkan panas dan meredakan nyeri.'),
(13, 9, 'Anda perlu mengkarantina diri dan tetap di rumah untuk menghindari kontak dengan orang lain.'),
(14, 9, 'Kebanyakan penderita penyakit influenza mengalami gejala ringan dan tidak memerlukan rawat inap atau obat antivirus. Namun, jika gejala Anda memburuk, segera cari pertolongan medis.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `symptoms`
--

CREATE TABLE `symptoms` (
  `symptom_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `certainty` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `symptoms`
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
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(70) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `role`, `username`, `password`) VALUES
(1, 0, 'admin', '$2y$10$ASS50col3niwOOku4Zkky.HpmF18hiPWL9pi2DnE8CS'),
(2, 1, 'adi', '$2y$10$ge9myh0TIg1tGwsOm6KZ5eriUxWhYswmHFx84dEsrwx'),
(11, 1, 'ari', '$2y$10$AMqONb9QD9COW1/9VmNwyOCo3eLFl/AUxQwGTMhwYor'),
(17, 1, 'geats', '$2y$10$oe2igmq7Gfq0KKmPEJo3UOD4xmgduzkY..WSK6JmlRWn.6uvQELl6'),
(18, 1, 'user', '$2y$10$vpoR1U./.6R64PcnZ26qn.Y5A6S87SzjG6uCEfGe9MVdQvHtd7ETS'),
(19, 1, 'hit', '$2y$10$w/A2kX7tX.oWvnc7Hx1UK.GtuT7tw99htRyHdWbZYZ13fgNuygAVi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indeks untuk tabel `diseases_symptoms`
--
ALTER TABLE `diseases_symptoms`
  ADD KEY `disease_id` (`disease_id`),
  ADD KEY `symptom_id` (`symptom_id`);

--
-- Indeks untuk tabel `solusi`
--
ALTER TABLE `solusi`
  ADD PRIMARY KEY (`solusi_id`),
  ADD KEY `disease_id` (`disease_id`);

--
-- Indeks untuk tabel `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`symptom_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `diseases_symptoms`
--
ALTER TABLE `diseases_symptoms`
  ADD CONSTRAINT `diseases_symptoms_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`disease_id`),
  ADD CONSTRAINT `diseases_symptoms_ibfk_2` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`symptom_id`);

--
-- Ketidakleluasaan untuk tabel `solusi`
--
ALTER TABLE `solusi`
  ADD CONSTRAINT `solusi_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`disease_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
