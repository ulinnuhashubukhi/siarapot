-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2018 at 12:01 PM
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `agama`
--

CREATE TABLE `agama` (
  `kd_agama` varchar(2) NOT NULL,
  `agama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agama`
--

INSERT INTO `agama` (`kd_agama`, `agama`) VALUES
('01', 'Islam'),
('02', 'Kristen/Protestan'),
('03', 'Katholik'),
('04', 'Hindu'),
('05', 'Budha'),
('06', 'Kong Hu Chu'),
('99', 'Lain-lain');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `nip` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT 'L',
  `alamat` varchar(255) DEFAULT NULL,
  `kd_agama` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`nip`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `kd_agama`) VALUES
('9900117001', 'PURWANTO, S.Kom', 'Surabaya', '2018-01-09', 'L', '                            Bintaro', '03'),
('9900117002', 'Drs. DESMAN LUMBANTORUAN', 'Subang', '1958-04-29', 'L', '              Meruya Ilir', '01'),
('9900117003', 'RITA ELFIRA, S.Pd', 'Malang', '1977-11-30', 'P', '              Palmerah\r\n', '02');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kd_jadwal` int(11) NOT NULL,
  `kd_tahun_ajaran` varchar(4) DEFAULT NULL,
  `kd_mapel` varchar(3) DEFAULT NULL,
  `nip` varchar(10) DEFAULT NULL,
  `jam` varchar(20) DEFAULT NULL,
  `kd_kelas` varchar(4) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `hari` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kd_jadwal`, `kd_tahun_ajaran`, `kd_mapel`, `nip`, `jam`, `kd_kelas`, `semester`, `hari`) VALUES
(1, '1415', 'AQH', '9900117002', '07:00 - 08:30', '01B ', NULL, 'Senin'),
(2, '1415', 'BAR', '9900117001', '07:00 - 08:30', '01A', NULL, 'Senin'),
(3, '1415', 'IPA', '9900117001', '07:00 - 08:30', '01A', NULL, 'Selasa'),
(9, '1718', 'BIG', '9900117001', '10:30 - 12:00', '01A', NULL, 'Selasa'),
(10, '1718', 'BAR', '9900117002', '08:30 - 10:00', '01A', NULL, 'Senin'),
(11, '1718', 'PJS', '9900117001', '12:30 - 14:00', '02A', NULL, 'Senin'),
(12, '1718', 'BIG', '9900117003', '07:00 - 08:30', '01B ', NULL, 'Senin'),
(13, '1718', 'BIN', '9900117002', '07:00 - 08:30', '01A', NULL, 'Senin');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kd_kelas` varchar(10) NOT NULL,
  `kelas` varchar(10) NOT NULL,
  `wali_kelas` varchar(10) NOT NULL DEFAULT '0000000000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`kd_kelas`, `kelas`, `wali_kelas`) VALUES
('01A', 'KELAS 1 A', '0000000000'),
('01B ', 'KELAS 1 B', '0000000000'),
('02A', 'KELAS 2 A', '0000000000'),
('02B', 'KELAS 2 B', '0000000000');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE `kelas_siswa` (
  `kd_kelas_siswa` int(11) NOT NULL,
  `kd_kelas` varchar(5) NOT NULL,
  `kd_tahun_ajaran` varchar(5) NOT NULL,
  `nis` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_siswa`
--

INSERT INTO `kelas_siswa` (`kd_kelas_siswa`, `kd_kelas`, `kd_tahun_ajaran`, `nis`) VALUES
(1, '01A', '1718', '8800117001'),
(2, '01A', '1718', '8800117002'),
(3, '01B ', '1718', '8800117004'),
(4, '01B ', '1718', '8800117005');

-- --------------------------------------------------------

--
-- Table structure for table `level_user`
--

CREATE TABLE `level_user` (
  `id_level_user` int(1) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_user`
--

INSERT INTO `level_user` (`id_level_user`, `level`) VALUES
(1, 'Admin'),
(2, 'Guru');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `kd_mapel` varchar(3) NOT NULL,
  `mapel` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`kd_mapel`, `mapel`) VALUES
('AQH', 'Al Qur\'an dan Hadist'),
('BAR', 'Bahasa Arab'),
('BIG', 'Bahasa Inggris'),
('BIN', 'Bahasa Indonesia'),
('IPA', 'Ilmu Pengetahuan Alam'),
('IPS', 'Ilmu Pengetahuan Sosial'),
('MTK', 'Matematika'),
('PAI', 'Pendidikan Agama Islam'),
('PJS', 'Pendidikan Jasmani'),
('PKN', 'Pendidikan Kewarganegaraan'),
('TIK', 'Teknologi Informasi dan Komunikasi');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `kd_nilai` int(11) NOT NULL,
  `kd_mapel` varchar(3) NOT NULL,
  `nis` varchar(10) NOT NULL,
  `tugas` int(11) NOT NULL DEFAULT '0',
  `uts` int(11) NOT NULL DEFAULT '0',
  `uas` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`kd_nilai`, `kd_mapel`, `nis`, `tugas`, `uts`, `uas`) VALUES
(7, 'AQH', '8800117001', 90, 0, 0),
(8, 'BAR', '8800117001', 80, 90, 0),
(9, 'AQH', '8800117004', 78, 55, 65),
(10, 'IPS', '8800117007', 80, 0, 80),
(11, 'AQH', '8800117005', 0, 0, 0),
(12, 'AQH', '8800117006', 80, 90, 100),
(13, 'PJS', '8800117002', 76, 65, 88),
(14, 'BIN', '8800117002', 80, 88, 92),
(15, 'MTK', '8800117006', 80, 76, 95);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tempatLahir` varchar(50) DEFAULT NULL,
  `tanggalLahir` date DEFAULT NULL,
  `jenisKelamin` enum('L','P') DEFAULT 'L',
  `alamatSiswa` varchar(255) DEFAULT NULL,
  `namaWali` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `tempatLahir`, `tanggalLahir`, `jenisKelamin`, `alamatSiswa`, `namaWali`) VALUES
('8800117001', 'Bayu Kurniawan', 'Jakarta', '2017-12-25', 'L', 'Jakarta', 'Heru'),
('8800117002', 'Setiadji', 'Jakarta', '2017-12-25', 'L', 'Jakarta', 'Hendra'),
('8800117004', 'Irma Widjianti', 'Surabaya', '2002-03-31', 'P', '                            Jakarta', 'Wahyudi'),
('8800117005', 'Jodi Santoso', 'Jakarta', '2017-12-25', 'L', '              Jakarta', 'Refa'),
('8800117006', 'Ulin', 'Magelang', '1996-11-23', 'L', 'Jakarta', 'Joko'),
('8800117007', 'Surya Herlambang Waluyo', 'Jakarta', '2007-11-30', 'L', '', 'Bambang');

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `kd_tahun_ajaran` varchar(4) NOT NULL,
  `tahun_ajaran` varchar(10) DEFAULT NULL,
  `is_aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tahun_ajaran`
--

INSERT INTO `tahun_ajaran` (`kd_tahun_ajaran`, `tahun_ajaran`, `is_aktif`) VALUES
('1415', '2014/2015', 'N'),
('1516', '2015/2016', 'N'),
('1617', '2016/2017', 'N'),
('1718', '2017/2018', 'Y'),
('1819', '2018/2019', 'N'),
('1920', '2019/2020', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(40) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_level_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `nama`, `password`, `id_level_user`) VALUES
(2, 'admin', 'ADMIN', '21232f297a57a5a743894a0e4a801fc3', 1),
(3, 'refa', 'REFA ULIN NUHA', '6769b796979527460ef3ab1489f62621', 1),
(4, 'rizki', 'MUHAMMAD RIZKI', '3e089c076bf1ec3a8332280ee35c28d4', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`kd_agama`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kd_agama` (`kd_agama`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_jadwal`),
  ADD KEY `kd_kelas` (`kd_kelas`),
  ADD KEY `kd_mapel` (`kd_mapel`),
  ADD KEY `kd_tahun_ajaran` (`kd_tahun_ajaran`),
  ADD KEY `nip` (`nip`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kd_kelas`),
  ADD KEY `wali_kelas` (`wali_kelas`);

--
-- Indexes for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD PRIMARY KEY (`kd_kelas_siswa`),
  ADD KEY `kd_kelas` (`kd_kelas`),
  ADD KEY `kd_tahun_ajaran` (`kd_tahun_ajaran`),
  ADD KEY `nis` (`nis`);

--
-- Indexes for table `level_user`
--
ALTER TABLE `level_user`
  ADD PRIMARY KEY (`id_level_user`);

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`kd_mapel`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`kd_nilai`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`kd_tahun_ajaran`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_level_user` (`id_level_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `kd_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  MODIFY `kd_kelas_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `level_user`
--
ALTER TABLE `level_user`
  MODIFY `id_level_user` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `kd_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`kd_agama`) REFERENCES `agama` (`kd_agama`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas` (`kd_kelas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kd_mapel`) REFERENCES `mata_pelajaran` (`kd_mapel`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`kd_tahun_ajaran`) REFERENCES `tahun_ajaran` (`kd_tahun_ajaran`),
  ADD CONSTRAINT `jadwal_ibfk_4` FOREIGN KEY (`nip`) REFERENCES `guru` (`nip`) ON UPDATE CASCADE;

--
-- Constraints for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD CONSTRAINT `kelas_siswa_ibfk_1` FOREIGN KEY (`kd_kelas`) REFERENCES `kelas` (`kd_kelas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kelas_siswa_ibfk_2` FOREIGN KEY (`kd_tahun_ajaran`) REFERENCES `tahun_ajaran` (`kd_tahun_ajaran`) ON UPDATE CASCADE,
  ADD CONSTRAINT `kelas_siswa_ibfk_3` FOREIGN KEY (`nis`) REFERENCES `siswa` (`nis`) ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_level_user`) REFERENCES `level_user` (`id_level_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
