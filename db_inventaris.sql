-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2020 at 09:53 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acc`
--
CREATE DATABASE IF NOT EXISTS `acc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `acc`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nip` int(11) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `bagian` varchar(50) DEFAULT NULL,
  `jk` enum('pria','wanita') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ahay` varchar(10) DEFAULT NULL,
  `ahayy` varchar(10) DEFAULT NULL,
  `id_transaksi` int(11) NOT NULL,
  `kode_brg` int(11) DEFAULT NULL,
  `jumlah_beli` int(11) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL,
  `total_transaksi` bigint(20) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `nip` int(11) DEFAULT NULL,
  `ket` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uhuy`
--

CREATE TABLE `uhuy` (
  `ahay` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `nip` (`nip`),
  ADD KEY `ahay` (`ahay`);

--
-- Indexes for table `uhuy`
--
ALTER TABLE `uhuy`
  ADD PRIMARY KEY (`ahay`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `kode_brg` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `nip` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `karyawan` (`nip`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`ahay`) REFERENCES `uhuy` (`ahay`);
--
-- Database: `acc1`
--
CREATE DATABASE IF NOT EXISTS `acc1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `acc1`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(15) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `harga`) VALUES
('01', 'buku', 5000),
('02', 'pulpen', 3000),
('03', 'mistar', 1000),
('04', 'pensil', 2000),
('05', 'penghapus', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `membeli`
--

CREATE TABLE `membeli` (
  `id` int(11) DEFAULT NULL,
  `kd_barang` varchar(20) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membeli`
--

INSERT INTO `membeli` (`id`, `kd_barang`, `jumlah`) VALUES
(1, '01', 5),
(2, '02', 4),
(3, '03', 3),
(4, '04', 2),
(5, '05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL,
  `jenis_kelamain` enum('L','P') DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nama`, `jenis_kelamain`, `alamat`) VALUES
(1, 'abid', 'L', 'kandea'),
(2, 'tauhid', 'L', 'racing'),
(3, 'islamuddin', 'P', 'pampang'),
(4, 'akhyar', 'P', 'sukaria'),
(5, 'abdullah', 'L', 'barawaja');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `membeli`
--
ALTER TABLE `membeli`
  ADD KEY `id` (`id`),
  ADD KEY `kd_barang` (`kd_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membeli`
--
ALTER TABLE `membeli`
  ADD CONSTRAINT `membeli_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `membeli_ibfk_2` FOREIGN KEY (`id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `membeli_ibfk_3` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`);
--
-- Database: `acc2`
--
CREATE DATABASE IF NOT EXISTS `acc2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `acc2`;

-- --------------------------------------------------------

--
-- Table structure for table `bpjs_pegawai`
--

CREATE TABLE `bpjs_pegawai` (
  `no_bpjs` varchar(15) NOT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL,
  `kelas` enum('I','II','III') DEFAULT NULL,
  `iuran` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpjs_pegawai`
--

INSERT INTO `bpjs_pegawai` (`no_bpjs`, `id_pegawai`, `kelas`, `iuran`) VALUES
('00097821', 'p001', 'II', 300000),
('00097822', 'p002', 'I', 150000),
('00097823', 'p003', 'I', 150000),
('00097824', 'p004', 'III', 450000),
('00097825', 'p005', 'II', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `jenis_kelamin` enum('pria','wanita') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `umur`, `jenis_kelamin`) VALUES
('p001', 'Bima', 25, 'pria'),
('p002', 'Baim', 23, 'pria'),
('p003', 'Bimo', 19, 'pria'),
('p004', 'ana', 28, 'wanita'),
('p005', 'ani', 25, 'wanita'),
('p006', 'ina', 20, 'wanita'),
('p007', 'arham', 23, 'pria'),
('p008', 'ilham', 21, 'pria'),
('p009', 'aziz', 25, 'pria'),
('p010', 'rani', 27, 'wanita');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bpjs_pegawai`
--
ALTER TABLE `bpjs_pegawai`
  ADD PRIMARY KEY (`no_bpjs`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bpjs_pegawai`
--
ALTER TABLE `bpjs_pegawai`
  ADD CONSTRAINT `bpjs_pegawai_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
--
-- Database: `accc`
--
CREATE DATABASE IF NOT EXISTS `accc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `accc`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(15) DEFAULT NULL,
  `harga_barang` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_barang`, `nama_barang`, `harga_barang`) VALUES
('b001', 'buku', 5000),
('b002', 'pulpen', 3000),
('b003', 'mistar', 1000),
('b004', 'pensil', 2000),
('b005', 'penghapus', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `membeli`
--

CREATE TABLE `membeli` (
  `kd_pelanggan` varchar(10) DEFAULT NULL,
  `kd_barang` varchar(10) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membeli`
--

INSERT INTO `membeli` (`kd_pelanggan`, `kd_barang`, `jumlah`) VALUES
('p001', 'b001', 5),
('p002', 'b002', 4),
('p003', 'b003', 3),
('p004', 'b004', 2),
('p005', 'b005', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(20) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kd_pelanggan`, `nama_pelanggan`, `alamat`) VALUES
('p001', 'abid', 'kandea'),
('p002', 'tauhid', 'racing'),
('p003', 'islamuddin', 'pampang'),
('p004', 'akhyar', 'sukaria'),
('p005', 'abdullah', 'barawaja');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `membeli`
--
ALTER TABLE `membeli`
  ADD KEY `kd_pelanggan` (`kd_pelanggan`),
  ADD KEY `kd_barang` (`kd_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `membeli`
--
ALTER TABLE `membeli`
  ADD CONSTRAINT `membeli_ibfk_1` FOREIGN KEY (`kd_pelanggan`) REFERENCES `pelanggan` (`kd_pelanggan`),
  ADD CONSTRAINT `membeli_ibfk_2` FOREIGN KEY (`kd_barang`) REFERENCES `barang` (`kd_barang`);
--
-- Database: `ahhay`
--
CREATE DATABASE IF NOT EXISTS `ahhay` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ahhay`;

-- --------------------------------------------------------

--
-- Table structure for table `tb_ahhay`
--

CREATE TABLE `tb_ahhay` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `stb` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_ahhay`
--

INSERT INTO `tb_ahhay` (`id`, `nama`, `stb`) VALUES
(1, 'sambarang', '13020150148');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_ahhay`
--
ALTER TABLE `tb_ahhay`
  ADD PRIMARY KEY (`id`);
--
-- Database: `akademik`
--
CREATE DATABASE IF NOT EXISTS `akademik` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `akademik`;

-- --------------------------------------------------------

--
-- Table structure for table `history_alamat_mhs`
--

CREATE TABLE `history_alamat_mhs` (
  `waktu` datetime DEFAULT NULL,
  `stb` varchar(12) DEFAULT NULL,
  `alamat` text,
  `oleh` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_alamat_mhs`
--

INSERT INTO `history_alamat_mhs` (`waktu`, `stb`, `alamat`, `oleh`) VALUES
('2019-12-17 06:46:24', '13020170001', 'jl. aa no.1', 'root@localhost');

-- --------------------------------------------------------

--
-- Table structure for table `mhs`
--

CREATE TABLE `mhs` (
  `stb` varchar(12) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jk` enum('l''p') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mhs`
--

INSERT INTO `mhs` (`stb`, `nama`, `alamat`, `jk`) VALUES
('13020170001', 'septario sagita', 'jl. pampang', ''),
('13020170002', 'taurio taufik n', 'jl. aa no.2', '');

--
-- Triggers `mhs`
--
DELIMITER $$
CREATE TRIGGER `trig_delete_mhss` BEFORE DELETE ON `mhs` FOR EACH ROW begin
delete from history_alamat_mhs where stb=old.stb;
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig_update_mhs` AFTER UPDATE ON `mhs` FOR EACH ROW begin
if old.alamat <> new.alamat then
insert into history_alamat_mhs
values (now(),old.stb,old.alamat,user());
end if;

end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `no` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `saldo` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `notransaksi` int(11) NOT NULL,
  `waktutransaksi` datetime DEFAULT NULL,
  `norekpengirim` int(11) DEFAULT NULL,
  `norekpenerima` int(11) DEFAULT NULL,
  `besartransfer` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `transfer`
--
DELIMITER $$
CREATE TRIGGER `trig_insert_rek` AFTER INSERT ON `transfer` FOR EACH ROW begin
insert into rekening values (new.notransaksi,new.norekpenerima, new.besartransfer);
end
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history_alamat_mhs`
--
ALTER TABLE `history_alamat_mhs`
  ADD KEY `stb` (`stb`);

--
-- Indexes for table `mhs`
--
ALTER TABLE `mhs`
  ADD PRIMARY KEY (`stb`);

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`notransaksi`),
  ADD KEY `norekpengirim` (`norekpengirim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `notransaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `history_alamat_mhs`
--
ALTER TABLE `history_alamat_mhs`
  ADD CONSTRAINT `history_alamat_mhs_ibfk_1` FOREIGN KEY (`stb`) REFERENCES `mhs` (`stb`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`norekpengirim`) REFERENCES `rekening` (`no`);
--
-- Database: `asistensi`
--
CREATE DATABASE IF NOT EXISTS `asistensi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `asistensi`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(15) DEFAULT NULL,
  `harga_barang` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `membeli`
--

CREATE TABLE `membeli` (
  `kd_pelanggan` varchar(10) DEFAULT NULL,
  `kd_barang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kd_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(20) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kd_pelanggan`);
--
-- Database: `cafe`
--
CREATE DATABASE IF NOT EXISTS `cafe` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cafe`;

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `kode_bahan` varchar(7) NOT NULL,
  `nama_bahan` varchar(30) DEFAULT NULL,
  `satuan` varchar(15) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahan`
--

INSERT INTO `bahan` (`kode_bahan`, `nama_bahan`, `satuan`, `jumlah`) VALUES
('b001', 'kopi', 'gram', 25),
('b002', 'susu', 'kaleng', 9),
('b003', 'greentea', 'bungkus', 5),
('b004', 'kentang', 'buah', 35),
('b005', 'pisang', 'sisir', 4);

-- --------------------------------------------------------

--
-- Stand-in structure for view `buku_tamu`
-- (See below for the actual view)
--
CREATE TABLE `buku_tamu` (
`id_pelanggan` varchar(7)
,`nama_pelanggan` varchar(30)
,`jk` enum('pria','wanita')
);

-- --------------------------------------------------------

--
-- Table structure for table `history_karyawan`
--

CREATE TABLE `history_karyawan` (
  `id_karyawan` varchar(7) NOT NULL,
  `nama_karyawan` varchar(30) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `jk` enum('pria','wanita') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `history_pelanggan`
--

CREATE TABLE `history_pelanggan` (
  `id_pelanggan` varchar(7) NOT NULL,
  `nama_pelanggan` varchar(30) DEFAULT NULL,
  `jk` enum('pria','wanita') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_pelanggan`
--

INSERT INTO `history_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk`) VALUES
('p006', 'alim', 'pria');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(7) NOT NULL,
  `nama_karyawan` varchar(30) DEFAULT NULL,
  `umur` int(11) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `jk` enum('pria','wanita') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `nama_karyawan`, `umur`, `alamat`, `jk`) VALUES
('k001', 'alhim', 23, 'pampang', 'pria'),
('k002', 'ilham', 24, 'barawaja', 'pria'),
('k003', 'rina', 27, 'kandea', 'wanita'),
('k004', 'rani', 25, 'kandea', 'wanita'),
('k005', 'ajis', 19, 'ablam', 'pria');

--
-- Triggers `karyawan`
--
DELIMITER $$
CREATE TRIGGER `trig_history_karyawan` AFTER DELETE ON `karyawan` FOR EACH ROW begin 
insert into history_karyawan values (old.id_karyawan, old.nama_karyawan, old.umur, old.alamat, old.jk);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mengecek`
--

CREATE TABLE `mengecek` (
  `id_karyawan` varchar(7) DEFAULT NULL,
  `kode_item` varchar(7) DEFAULT NULL,
  `kode_bahan` varchar(7) DEFAULT NULL,
  `ketersediaan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mengecek`
--

INSERT INTO `mengecek` (`id_karyawan`, `kode_item`, `kode_bahan`, `ketersediaan`) VALUES
('k001', 'i001', 'b001', 'tersedia'),
('k002', 'i002', 'b002', 'tersedia'),
('k003', 'i003', 'b003', 'tersedia'),
('k004', 'i004', 'b004', 'tersedia'),
('k005', 'i005', 'b005', 'tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `kode_item` varchar(7) NOT NULL,
  `nama_item` varchar(30) DEFAULT NULL,
  `harga` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`kode_item`, `nama_item`, `harga`) VALUES
('i001', 'kopi susu', 15000),
('i002', 'green tea', 17000),
('i003', 'cappucino', 18000),
('i004', 'pisang nugget', 15000),
('i005', 'kentang goreng', 17000);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(7) NOT NULL,
  `nama_pelanggan` varchar(30) DEFAULT NULL,
  `jk` enum('pria','wanita') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk`) VALUES
('', NULL, NULL),
('p001', 'ani', 'wanita'),
('p002', 'ina', 'wanita'),
('p003', 'baim', 'pria'),
('p004', 'bima', 'pria'),
('p005', 'boim', 'pria'),
('p006', 'alim', 'pria'),
('p009', 'abid', 'pria');

--
-- Triggers `pelanggan`
--
DELIMITER $$
CREATE TRIGGER `trig_history_pelanggan` AFTER DELETE ON `pelanggan` FOR EACH ROW begin 
insert into history_pelanggan values (old.id_pelanggan, old.nama_pelanggan, old.jk);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig_update_pelanggan` AFTER UPDATE ON `pelanggan` FOR EACH ROW begin
insert into history_pelanggan values (new.id_pelanggan, new.nama_pelanggan, new.jk);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `piket`
--

CREATE TABLE `piket` (
  `id_karyawan` varchar(7) DEFAULT NULL,
  `kode_shift` varchar(7) DEFAULT NULL,
  `hari` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `piket`
--

INSERT INTO `piket` (`id_karyawan`, `kode_shift`, `hari`) VALUES
('k001', 's001', 'senin'),
('k002', 's002', 'selasa'),
('k003', 's003', 'rabu'),
('k004', 's004', 'kamis'),
('k005', 's005', 'jumat');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `kode_shift` varchar(7) NOT NULL,
  `jenis` varchar(15) DEFAULT NULL,
  `waktu_mulai` time DEFAULT NULL,
  `waktu_selesai` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`kode_shift`, `jenis`, `waktu_mulai`, `waktu_selesai`) VALUES
('s001', 'subuh', '05:00:00', '13:00:00'),
('s002', 'pagi', '08:00:00', '16:00:00'),
('s003', 'siang', '12:00:00', '20:00:00'),
('s004', 'sore', '16:00:00', '00:00:00'),
('s005', 'malam', '00:00:00', '08:00:00');

--
-- Triggers `shift`
--
DELIMITER $$
CREATE TRIGGER `hapus_shift` AFTER DELETE ON `shift` FOR EACH ROW begin 
delete from piket where kode_shift = old.kode_shift;
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pelanggan` varchar(7) DEFAULT NULL,
  `kode_item` varchar(7) DEFAULT NULL,
  `id_karyawan` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pelanggan`, `kode_item`, `id_karyawan`) VALUES
('p001', 'i001', 'k001'),
('p002', 'i002', 'k002'),
('p003', 'i003', 'k003'),
('p004', 'i004', 'k004'),
('p005', 'i005', 'k005');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_karyawan_shift`
-- (See below for the actual view)
--
CREATE TABLE `vw_karyawan_shift` (
`id_karyawan` varchar(7)
,`nama_karyawan` varchar(30)
,`jenis` varchar(15)
,`waktu_mulai` time
,`waktu_selesai` time
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `vw_transaksi` (
`id_pelanggan` varchar(7)
,`nama_pelanggan` varchar(30)
,`kode_item` varchar(7)
,`id_karyawan` varchar(7)
);

-- --------------------------------------------------------

--
-- Structure for view `buku_tamu`
--
DROP TABLE IF EXISTS `buku_tamu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buku_tamu`  AS  select `pelanggan`.`id_pelanggan` AS `id_pelanggan`,`pelanggan`.`nama_pelanggan` AS `nama_pelanggan`,`pelanggan`.`jk` AS `jk` from `pelanggan` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_karyawan_shift`
--
DROP TABLE IF EXISTS `vw_karyawan_shift`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_karyawan_shift`  AS  select `karyawan`.`id_karyawan` AS `id_karyawan`,`karyawan`.`nama_karyawan` AS `nama_karyawan`,`shift`.`jenis` AS `jenis`,`shift`.`waktu_mulai` AS `waktu_mulai`,`shift`.`waktu_selesai` AS `waktu_selesai` from (`karyawan` join `shift`) ;

-- --------------------------------------------------------

--
-- Structure for view `vw_transaksi`
--
DROP TABLE IF EXISTS `vw_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_transaksi`  AS  select `transaksi`.`id_pelanggan` AS `id_pelanggan`,`pelanggan`.`nama_pelanggan` AS `nama_pelanggan`,`transaksi`.`kode_item` AS `kode_item`,`transaksi`.`id_karyawan` AS `id_karyawan` from (`transaksi` join `pelanggan`) where (`transaksi`.`id_pelanggan` = `pelanggan`.`id_pelanggan`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`kode_bahan`);

--
-- Indexes for table `history_karyawan`
--
ALTER TABLE `history_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `history_pelanggan`
--
ALTER TABLE `history_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `mengecek`
--
ALTER TABLE `mengecek`
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `kode_item` (`kode_item`),
  ADD KEY `kode_bahan` (`kode_bahan`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`kode_item`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `piket`
--
ALTER TABLE `piket`
  ADD KEY `id_karyawan` (`id_karyawan`),
  ADD KEY `kode_shift` (`kode_shift`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`kode_shift`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `kode_item` (`kode_item`),
  ADD KEY `id_karyawan` (`id_karyawan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mengecek`
--
ALTER TABLE `mengecek`
  ADD CONSTRAINT `mengecek_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `mengecek_ibfk_2` FOREIGN KEY (`kode_item`) REFERENCES `menu` (`kode_item`),
  ADD CONSTRAINT `mengecek_ibfk_3` FOREIGN KEY (`kode_bahan`) REFERENCES `bahan` (`kode_bahan`);

--
-- Constraints for table `piket`
--
ALTER TABLE `piket`
  ADD CONSTRAINT `piket_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`),
  ADD CONSTRAINT `piket_ibfk_2` FOREIGN KEY (`kode_shift`) REFERENCES `shift` (`kode_shift`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`kode_item`) REFERENCES `menu` (`kode_item`),
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`id_karyawan`);
--
-- Database: `cek`
--
CREATE DATABASE IF NOT EXISTS `cek` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cek`;
--
-- Database: `dasar`
--
CREATE DATABASE IF NOT EXISTS `dasar` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dasar`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nrp` varchar(12) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `email` varchar(35) NOT NULL,
  `jurusan` varchar(40) NOT NULL,
  `gambar` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nrp`, `nama`, `email`, `jurusan`, `gambar`) VALUES
(1, '13020150148', 'Syamsul Munawar', 'syamsulmunawarabbas@gmail.com', 'Teknik Informatika', 'munes.jpg'),
(2, '13020150149', 'Saldi', 'saldy@gmail.com', 'Teknik Informatika', 'saldi.jpg'),
(3, '13020150150', 'Syawal Alauddin', 'syawal@gmail.com', 'Teknik Informatika', 'syawal.jpg'),
(4, '123456789', 'Mutakhir', 'abe@gmail.com', 'Teknologi Pertanian', 'abe.jpg'),
(5, '234567890', 'Asbar Tanjung', 'asbar@gmail.com', 'Farmasi', 'asbar.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `data`
--
CREATE DATABASE IF NOT EXISTS `data` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `data`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user` varchar(20) NOT NULL,
  `password` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user`, `password`, `created_at`, `updated_at`) VALUES
(1, 'user', '$2y$05$WmKaAQCeMaEXF1zScMUe7OmD5Mf.3cffLmq2BrWoNKWz8fPthXbUq', '2019-05-05 10:31:49', '0000-00-00 00:00:00'),
(2, 'admins', '$2y$05$B7/T.mwU3DvY79iiAecHq.m64cGIMEjZqx5ZP7YhFCejljw8Rp2UC', '2019-05-05 10:39:01', '0000-00-00 00:00:00'),
(3, 'admin1', '$2y$05$RRYcVpYR5j7ar3dedz9bI.4G5eVO5FDY/2WHQzIRYier4zZXeAL8O', '2019-05-05 10:40:09', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `data_kependudukan`
--
CREATE DATABASE IF NOT EXISTS `data_kependudukan` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `data_kependudukan`;

-- --------------------------------------------------------

--
-- Table structure for table `data_desa_kelurahan`
--

CREATE TABLE `data_desa_kelurahan` (
  `kode_desa_kelurahan` varchar(15) NOT NULL,
  `nama_desa_kelurahana` varchar(60) NOT NULL,
  `kecamatan` varchar(60) NOT NULL,
  `kab_kota` varchar(60) NOT NULL,
  `provinsi` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `data_kk`
--

CREATE TABLE `data_kk` (
  `no_kk` varchar(17) NOT NULL,
  `nama_kepalakeluarga` varchar(45) NOT NULL,
  `alamat` varchar(80) NOT NULL,
  `rt` int(4) NOT NULL,
  `rw` int(4) NOT NULL,
  `kodepos` int(8) NOT NULL,
  `kode_desa_kelurahan` varchar(15) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detail_kk`
--

CREATE TABLE `detail_kk` (
  `no_kk` varchar(17) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `status_hub_dalam_keluarga` enum('ayah','ibu','anak pertama','anak kedua','anak keempat','anak kelima') NOT NULL,
  `no_paspor` varchar(17) NOT NULL,
  `no_kitap` varchar(17) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelahiran`
--

CREATE TABLE `kelahiran` (
  `no_pengajuan` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `nama_bayi` varchar(45) NOT NULL,
  `tempat_lahir` varchar(80) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `lahir_secara` enum('normal','caesar') NOT NULL,
  `berat_bayi` int(7) NOT NULL,
  `tinggi_bayi` int(7) NOT NULL,
  `nama_ayah` varchar(45) NOT NULL,
  `nama_ibu` varchar(45) NOT NULL,
  `anak_ke` int(4) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `validasi` enum('sudah','belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kematian`
--

CREATE TABLE `kematian` (
  `no_pengajuan` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `tgl_kematian` date NOT NULL,
  `waktu_kematian` time NOT NULL,
  `tempat_kematian` varchar(80) NOT NULL,
  `sebab_kematian` varchar(80) NOT NULL,
  `validasi` enum('sudah','belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kependudukan`
--

CREATE TABLE `kependudukan` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(45) NOT NULL,
  `tempat_lahir` varchar(80) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `alamat` varchar(80) NOT NULL,
  `rt` int(3) NOT NULL,
  `rw` int(3) NOT NULL,
  `kode_desa_kelurahan` varchar(15) NOT NULL,
  `agama` enum('islam','kristen','hindu','budha','kongucu','lain') NOT NULL,
  `status_perkawinan` enum('belum menikah','sudah menikah') NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `kewarganegaraan` varchar(35) NOT NULL,
  `pendidikan` enum('SD/Sederajat','SLTP/Sederajat','SLTA/Sederajat','D1','D2','D3','S1','S2','S3') NOT NULL,
  `ayah` varchar(45) NOT NULL,
  `ibu` varchar(45) NOT NULL,
  `status` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pindah_datang`
--

CREATE TABLE `pindah_datang` (
  `no_pengajuan` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `tgl_pindah` date NOT NULL,
  `alamat_asal` varchar(80) NOT NULL,
  `kode_desa_kelurahan` varchar(15) NOT NULL,
  `validasi` enum('sudah','belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pindah_keluar`
--

CREATE TABLE `pindah_keluar` (
  `no_pengajuan` varchar(20) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `nik` varchar(16) NOT NULL,
  `tgl_pindah` date NOT NULL,
  `alamat_baru` varchar(80) NOT NULL,
  `kode_desa_kelurahan` varchar(15) NOT NULL,
  `validasi` enum('sudah','belum') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_desa_kelurahan`
--
ALTER TABLE `data_desa_kelurahan`
  ADD PRIMARY KEY (`kode_desa_kelurahan`);

--
-- Indexes for table `data_kk`
--
ALTER TABLE `data_kk`
  ADD PRIMARY KEY (`no_kk`),
  ADD KEY `kodepos` (`kodepos`),
  ADD KEY `kode_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Indexes for table `detail_kk`
--
ALTER TABLE `detail_kk`
  ADD KEY `nik` (`nik`),
  ADD KEY `no_kk` (`no_kk`);

--
-- Indexes for table `kelahiran`
--
ALTER TABLE `kelahiran`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `nik` (`nik`),
  ADD KEY `nik_2` (`nik`);

--
-- Indexes for table `kematian`
--
ALTER TABLE `kematian`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `nik` (`nik`);

--
-- Indexes for table `kependudukan`
--
ALTER TABLE `kependudukan`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `kode_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Indexes for table `pindah_datang`
--
ALTER TABLE `pindah_datang`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `nik` (`nik`),
  ADD KEY `kode_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Indexes for table `pindah_keluar`
--
ALTER TABLE `pindah_keluar`
  ADD PRIMARY KEY (`no_pengajuan`),
  ADD KEY `nik` (`nik`),
  ADD KEY `kode_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_kk`
--
ALTER TABLE `data_kk`
  ADD CONSTRAINT `data_kk_ibfk_1` FOREIGN KEY (`kode_desa_kelurahan`) REFERENCES `data_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Constraints for table `detail_kk`
--
ALTER TABLE `detail_kk`
  ADD CONSTRAINT `detail_kk_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `kependudukan` (`nik`),
  ADD CONSTRAINT `detail_kk_ibfk_2` FOREIGN KEY (`no_kk`) REFERENCES `data_kk` (`no_kk`);

--
-- Constraints for table `kelahiran`
--
ALTER TABLE `kelahiran`
  ADD CONSTRAINT `kelahiran_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `kependudukan` (`nik`);

--
-- Constraints for table `kematian`
--
ALTER TABLE `kematian`
  ADD CONSTRAINT `kematian_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `kependudukan` (`nik`);

--
-- Constraints for table `kependudukan`
--
ALTER TABLE `kependudukan`
  ADD CONSTRAINT `kependudukan_ibfk_1` FOREIGN KEY (`kode_desa_kelurahan`) REFERENCES `data_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Constraints for table `pindah_datang`
--
ALTER TABLE `pindah_datang`
  ADD CONSTRAINT `pindah_datang_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `kependudukan` (`nik`),
  ADD CONSTRAINT `pindah_datang_ibfk_2` FOREIGN KEY (`kode_desa_kelurahan`) REFERENCES `data_desa_kelurahan` (`kode_desa_kelurahan`);

--
-- Constraints for table `pindah_keluar`
--
ALTER TABLE `pindah_keluar`
  ADD CONSTRAINT `pindah_keluar_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `kependudukan` (`nik`),
  ADD CONSTRAINT `pindah_keluar_ibfk_2` FOREIGN KEY (`kode_desa_kelurahan`) REFERENCES `data_desa_kelurahan` (`kode_desa_kelurahan`);
--
-- Database: `dbtransfer`
--
CREATE DATABASE IF NOT EXISTS `dbtransfer` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dbtransfer`;

-- --------------------------------------------------------

--
-- Table structure for table `rekening`
--

CREATE TABLE `rekening` (
  `no` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `saldo` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening`
--

INSERT INTO `rekening` (`no`, `nama`, `saldo`) VALUES
(1, 'alim', 200);

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `notransaksi` int(11) NOT NULL,
  `waktutransaksi` datetime DEFAULT NULL,
  `norekpengirim` int(11) DEFAULT NULL,
  `norekpenerima` int(11) DEFAULT NULL,
  `besartransfer` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transfer`
--

INSERT INTO `transfer` (`notransaksi`, `waktutransaksi`, `norekpengirim`, `norekpenerima`, `besartransfer`) VALUES
(101, '2019-12-11 23:45:20', 1, 987, 500000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`notransaksi`),
  ADD KEY `norekpengirim` (`norekpengirim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `notransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`norekpengirim`) REFERENCES `rekening` (`no`);
--
-- Database: `db_login`
--
CREATE DATABASE IF NOT EXISTS `db_login` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_login`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(9) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- Database: `diknas`
--
CREATE DATABASE IF NOT EXISTS `diknas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `diknas`;

-- --------------------------------------------------------

--
-- Table structure for table `t_deskripsi`
--

CREATE TABLE `t_deskripsi` (
  `id_deskripsi` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL DEFAULT 'Deskripsi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_deskripsi`
--

INSERT INTO `t_deskripsi` (`id_deskripsi`, `id_pembagian_kelas`, `no_stambuk`, `deskripsi`) VALUES
(13, 1, '13401', 'aaaa'),
(14, 2, '13401', 'Deskripsi'),
(15, 7, '13401', 'Deskripsi'),
(16, 8, '13401', 'Deskripsi'),
(17, 9, '13401', 'Deskripsi'),
(18, 1, '13402', 'Deskripsi'),
(19, 2, '13402', 'Deskripsi'),
(20, 7, '13402', 'Deskripsi'),
(21, 8, '13402', 'Deskripsi'),
(22, 9, '13402', 'Deskripsi');

-- --------------------------------------------------------

--
-- Table structure for table `t_guru_kelas`
--

CREATE TABLE `t_guru_kelas` (
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(10) UNSIGNED NOT NULL,
  `id_mata_pelajaran` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_guru_kelas`
--

INSERT INTO `t_guru_kelas` (`id_pembagian_kelas`, `id_tahun_ajar`, `id_guru`, `id_kelas`, `id_mata_pelajaran`) VALUES
(1, 3, 2, 1, 2),
(2, 3, 2, 1, 3),
(3, 3, 3, 2, 3),
(4, 3, 3, 3, 4),
(5, 3, 2, 19, 4),
(6, 3, 2, 19, 5),
(7, 3, 2, 1, 5),
(8, 3, 3, 1, 6),
(9, 3, 6, 1, 4),
(10, 3, 3, 22, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_keterampilan_kinerja`
--

CREATE TABLE `t_keterampilan_kinerja` (
  `id_keterampilan_kinerja` int(10) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_keterampilan_kinerja`
--

INSERT INTO `t_keterampilan_kinerja` (`id_keterampilan_kinerja`, `no_stambuk`, `id_pembagian_kelas`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, '13401', 1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '13401', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '13401', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '13401', 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '13401', 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '13402', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '13402', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '13402', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '13402', 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '13402', 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_keterampilan_praktek`
--

CREATE TABLE `t_keterampilan_praktek` (
  `id_keterampilan_praktek` int(10) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `praktek1` float NOT NULL DEFAULT '0',
  `praktek2` float NOT NULL DEFAULT '0',
  `praktek3` float NOT NULL DEFAULT '0',
  `praktek4` float NOT NULL DEFAULT '0',
  `ulangan_praktek` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_keterampilan_praktek`
--

INSERT INTO `t_keterampilan_praktek` (`id_keterampilan_praktek`, `no_stambuk`, `id_pembagian_kelas`, `praktek1`, `praktek2`, `praktek3`, `praktek4`, `ulangan_praktek`) VALUES
(1, '13401', 1, 0, 0, 0, 0, 100),
(2, '13401', 2, 0, 0, 0, 0, 0),
(3, '13401', 7, 0, 0, 0, 0, 0),
(4, '13401', 8, 0, 0, 0, 0, 0),
(5, '13401', 9, 0, 0, 0, 0, 0),
(6, '13402', 1, 0, 0, 0, 0, 0),
(7, '13402', 2, 0, 0, 0, 0, 0),
(8, '13402', 7, 0, 0, 0, 0, 0),
(9, '13402', 8, 0, 0, 0, 0, 0),
(10, '13402', 9, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_master_guru`
--

CREATE TABLE `t_master_guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_guru`
--

INSERT INTO `t_master_guru` (`id_guru`, `nama_guru`, `nip`, `id_tahun_ajar`) VALUES
(2, 'Amden Junianto, JM', '1232', 3),
(3, 'Ridha Aprilia, S.Pd', '8989', 3),
(4, 'Moh. Bandrigo Talai', '888', 3),
(5, 'Sri Wahyuni, S. Ak', '7878', 3),
(6, 'asdasd', '454', 3),
(7, 'Fandrik, ST', '909', 3),
(8, 'gfgf', '213123', 3),
(9, 'ganti toh', '77777', 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_master_kelas`
--

CREATE TABLE `t_master_kelas` (
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `wali_kelas` int(11) NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_kelas`
--

INSERT INTO `t_master_kelas` (`id_kelas`, `nama_kelas`, `wali_kelas`, `id_tahun_ajar`) VALUES
(1, 'X.1', 5, 3),
(2, 'X.2', 2, 3),
(3, 'X.3', 3, 3),
(4, 'X.4', 4, 3),
(18, 'X.5', 6, 3),
(19, 'X.6', 8, 3),
(20, 'X.7', 9, 3),
(21, 'XII IA I', 4, 3),
(22, 'aaaaa', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_master_mata_pelajaran`
--

CREATE TABLE `t_master_mata_pelajaran` (
  `id_mata_pelajaran` int(10) UNSIGNED NOT NULL,
  `kode_matpel` char(20) NOT NULL,
  `nama_mata_pelajaran` varchar(100) NOT NULL,
  `kkm` double NOT NULL DEFAULT '0',
  `kategori` char(20) NOT NULL,
  `keterangan_mata_pelajaran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_mata_pelajaran`
--

INSERT INTO `t_master_mata_pelajaran` (`id_mata_pelajaran`, `kode_matpel`, `nama_mata_pelajaran`, `kkm`, `kategori`, `keterangan_mata_pelajaran`) VALUES
(2, 'MTK', 'Matematika', 75, 'Wajib', ''),
(3, 'B.INDO', 'Bahasa Indonesia', 75, 'Wajib', ''),
(4, 'B.ING', 'Bahasa Inggris', 75, 'Wajib', ''),
(5, 'PENDAIS', 'Pendidikan Agama Islam dan Budi Pekerti', 88, 'Wajib', 'keterangannya'),
(6, 'PPKN', 'Pendidikan Pancasila dan Kewarganegaraan	', 70, 'Wajib', 'wow'),
(7, 'SI', 'Sejarah Indonesia', 75, 'Wajib', ''),
(8, 'SB', 'Seni Budaya', 75, 'Pilihan', ''),
(9, 'PJOK', 'Pendidikan Jasmani, Olah Raga dan Kesehatan', 75, 'Pilihan', ''),
(10, 'PK', 'Prakarya dan Kewirausahaan', 75, 'Pilihan', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_pegawai`
--

CREATE TABLE `t_master_pegawai` (
  `id_pegawai` int(10) UNSIGNED NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `nip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_pegawai`
--

INSERT INTO `t_master_pegawai` (`id_pegawai`, `nama_pegawai`, `nip`) VALUES
(1, 'Moh. Bandrigo', '66161'),
(2, 'Amden Junianto', '1727');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_sekolah`
--

CREATE TABLE `t_master_sekolah` (
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `nama_sekolah` varchar(200) NOT NULL,
  `npsn` varchar(100) NOT NULL,
  `nss` varchar(100) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kepala_sekolah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_sekolah`
--

INSERT INTO `t_master_sekolah` (`id_sekolah`, `nama_sekolah`, `npsn`, `nss`, `alamat_sekolah`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `website`, `email`, `kepala_sekolah`) VALUES
(1, 'SMA NEGERI 4 KENDARI', '111111111111', '888', 'Jalan Jenderal Ahmad Yani No. 13', 'Bende 66', 'Kadia 55', 'Kendari 44', 'Sulawesi Tenggara 33', 'sman4kdi.sch.id', 'sman4kdi@gmail.com', 'Muh. Ruslan Saribi');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_siswa`
--

CREATE TABLE `t_master_siswa` (
  `no_stambuk` varchar(100) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `alamat` text,
  `no_induk_nasional` varchar(100) NOT NULL,
  `nomor_induk_peserta_didik` varchar(100) NOT NULL,
  `tempat_tanggal_lahi` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `agama` varchar(100) NOT NULL,
  `status_dalam_keluarga` varchar(100) NOT NULL,
  `anak_ke` varchar(100) NOT NULL,
  `nomor_telp_rumah` varchar(100) NOT NULL,
  `nomor_telp_ayah` varchar(100) NOT NULL,
  `nomor_telp_ibu` varchar(100) NOT NULL,
  `sekolah_asal` varchar(100) NOT NULL,
  `diterima_dikelas` varchar(100) NOT NULL,
  `diterima_tanggal` varchar(100) NOT NULL,
  `terima_semester` varchar(100) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(100) NOT NULL,
  `nama_wali` varchar(100) NOT NULL,
  `no_telp_wali` varchar(100) NOT NULL,
  `alamat_wali` text NOT NULL,
  `pekerjaan_wali` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_siswa`
--

INSERT INTO `t_master_siswa` (`no_stambuk`, `nama_siswa`, `alamat`, `no_induk_nasional`, `nomor_induk_peserta_didik`, `tempat_tanggal_lahi`, `jenis_kelamin`, `agama`, `status_dalam_keluarga`, `anak_ke`, `nomor_telp_rumah`, `nomor_telp_ayah`, `nomor_telp_ibu`, `sekolah_asal`, `diterima_dikelas`, `diterima_tanggal`, `terima_semester`, `pekerjaan_ayah`, `pekerjaan_ibu`, `nama_wali`, `no_telp_wali`, `alamat_wali`, `pekerjaan_wali`) VALUES
('13401', 'Muh. Irwansyah', 'Kendari', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('13402', 'Aan Rusdi', 'Lepo lepo', '098756', '787878', 'kendari, 29 Juli 2019', 'Laki Laki', 'Islam', 'Anak kandung', '3', '09090', '8998', '787', 'SMA 1 KENDARI', 'XI', '10', '2', 'pekerjaan ayah', 'pekerjaan ibu', 'nama wali', 'telp wali', 'alamat wali', 'pekerjaan wali');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_user`
--

CREATE TABLE `t_master_user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_guru` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level_user` varchar(50) NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_user`
--

INSERT INTO `t_master_user` (`id_user`, `id_guru`, `username`, `password`, `level_user`, `id_tahun_ajar`) VALUES
(3, 2, 'amden', 'amden', 'Guru', 3),
(4, 3, 'ridha', 'ridha', 'Kurikulum', 3),
(5, 5, 'nuni', 'nuni', 'Wali Kelas', 3),
(6, 7, 'has', 'has', 'Wali Kelas', 3),
(7, 3, 'ridha', 'ridha', 'Guru', 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_tugas_kelompok`
--

CREATE TABLE `t_pengetahuan_tugas_kelompok` (
  `id_tugas_kelompok` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_tugas_kelompok`
--

INSERT INTO `t_pengetahuan_tugas_kelompok` (`id_tugas_kelompok`, `id_pembagian_kelas`, `no_stambuk`, `id_guru`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_tugas_mandiri`
--

CREATE TABLE `t_pengetahuan_tugas_mandiri` (
  `id_tugas_mandiri` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_tugas_mandiri`
--

INSERT INTO `t_pengetahuan_tugas_mandiri` (`id_tugas_mandiri`, `id_pembagian_kelas`, `no_stambuk`, `id_guru`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_ujian`
--

CREATE TABLE `t_pengetahuan_ujian` (
  `id_ujian` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `uts` float NOT NULL DEFAULT '0',
  `uas` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_ujian`
--

INSERT INTO `t_pengetahuan_ujian` (`id_ujian`, `id_pembagian_kelas`, `no_stambuk`, `id_guru`, `uts`, `uas`) VALUES
(1, 1, '13401', 0, 100, 100),
(2, 2, '13401', 0, 0, 0),
(3, 7, '13401', 0, 0, 0),
(4, 8, '13401', 0, 0, 0),
(5, 9, '13401', 0, 0, 0),
(6, 1, '13402', 0, 0, 100),
(7, 2, '13402', 0, 0, 0),
(8, 7, '13402', 0, 0, 0),
(9, 8, '13402', 0, 0, 0),
(10, 9, '13402', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_ulangan_harian`
--

CREATE TABLE `t_pengetahuan_ulangan_harian` (
  `id_ulangan_harian` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_ulangan_harian`
--

INSERT INTO `t_pengetahuan_ulangan_harian` (`id_ulangan_harian`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, 1, '13401', 60, 60, 8, 8, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_kehadiran`
--

CREATE TABLE `t_sikap_kehadiran` (
  `id_kehadiran` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_kehadiran`
--

INSERT INTO `t_sikap_kehadiran` (`id_kehadiran`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, 1, '13401', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_kejujuran`
--

CREATE TABLE `t_sikap_kejujuran` (
  `id_kejujuran` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_kejujuran`
--

INSERT INTO `t_sikap_kejujuran` (`id_kejujuran`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_peduli`
--

CREATE TABLE `t_sikap_peduli` (
  `id_peduli` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_peduli`
--

INSERT INTO `t_sikap_peduli` (`id_peduli`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_percaya_diri`
--

CREATE TABLE `t_sikap_percaya_diri` (
  `id_percaya_diri` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_percaya_diri`
--

INSERT INTO `t_sikap_percaya_diri` (`id_percaya_diri`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_santun`
--

CREATE TABLE `t_sikap_santun` (
  `id_santun` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_santun`
--

INSERT INTO `t_sikap_santun` (`id_santun`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_tanggung_jawab`
--

CREATE TABLE `t_sikap_tanggung_jawab` (
  `id_tanggung_jawab` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_tanggung_jawab`
--

INSERT INTO `t_sikap_tanggung_jawab` (`id_tanggung_jawab`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(73, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(76, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_siswa_kelas`
--

CREATE TABLE `t_siswa_kelas` (
  `id_siswa_kelas` int(10) UNSIGNED NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL,
  `id_kelas` int(10) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_siswa_kelas`
--

INSERT INTO `t_siswa_kelas` (`id_siswa_kelas`, `id_tahun_ajar`, `id_kelas`, `no_stambuk`) VALUES
(32, 3, 1, '13401'),
(33, 3, 1, '13402');

-- --------------------------------------------------------

--
-- Table structure for table `t_tahun_ajar`
--

CREATE TABLE `t_tahun_ajar` (
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL,
  `tahun_ajar` char(10) NOT NULL,
  `semester` char(20) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_tahun_ajar`
--

INSERT INTO `t_tahun_ajar` (`id_tahun_ajar`, `tahun_ajar`, `semester`, `id_sekolah`) VALUES
(3, '2019/2020', 'Genap', 1),
(4, 'xax', '33', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_deskripsi`
--
ALTER TABLE `t_deskripsi`
  ADD PRIMARY KEY (`id_deskripsi`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`),
  ADD KEY `no_stambuk` (`no_stambuk`);

--
-- Indexes for table `t_guru_kelas`
--
ALTER TABLE `t_guru_kelas`
  ADD PRIMARY KEY (`id_pembagian_kelas`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_matpel` (`id_mata_pelajaran`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_keterampilan_kinerja`
--
ALTER TABLE `t_keterampilan_kinerja`
  ADD PRIMARY KEY (`id_keterampilan_kinerja`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_keterampilan_praktek`
--
ALTER TABLE `t_keterampilan_praktek`
  ADD PRIMARY KEY (`id_keterampilan_praktek`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_master_guru`
--
ALTER TABLE `t_master_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_master_kelas`
--
ALTER TABLE `t_master_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `wali_kelas` (`wali_kelas`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_master_mata_pelajaran`
--
ALTER TABLE `t_master_mata_pelajaran`
  ADD PRIMARY KEY (`id_mata_pelajaran`);

--
-- Indexes for table `t_master_pegawai`
--
ALTER TABLE `t_master_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `t_master_sekolah`
--
ALTER TABLE `t_master_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `t_master_siswa`
--
ALTER TABLE `t_master_siswa`
  ADD PRIMARY KEY (`no_stambuk`);

--
-- Indexes for table `t_master_user`
--
ALTER TABLE `t_master_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_pegawai` (`id_guru`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_pengetahuan_tugas_kelompok`
--
ALTER TABLE `t_pengetahuan_tugas_kelompok`
  ADD PRIMARY KEY (`id_tugas_kelompok`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_pengetahuan_tugas_mandiri`
--
ALTER TABLE `t_pengetahuan_tugas_mandiri`
  ADD PRIMARY KEY (`id_tugas_mandiri`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_pengetahuan_ujian`
--
ALTER TABLE `t_pengetahuan_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_pengetahuan_ulangan_harian`
--
ALTER TABLE `t_pengetahuan_ulangan_harian`
  ADD PRIMARY KEY (`id_ulangan_harian`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_kehadiran`
--
ALTER TABLE `t_sikap_kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_kejujuran`
--
ALTER TABLE `t_sikap_kejujuran`
  ADD PRIMARY KEY (`id_kejujuran`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_peduli`
--
ALTER TABLE `t_sikap_peduli`
  ADD PRIMARY KEY (`id_peduli`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_percaya_diri`
--
ALTER TABLE `t_sikap_percaya_diri`
  ADD PRIMARY KEY (`id_percaya_diri`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_santun`
--
ALTER TABLE `t_sikap_santun`
  ADD PRIMARY KEY (`id_santun`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_tanggung_jawab`
--
ALTER TABLE `t_sikap_tanggung_jawab`
  ADD PRIMARY KEY (`id_tanggung_jawab`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_siswa_kelas`
--
ALTER TABLE `t_siswa_kelas`
  ADD PRIMARY KEY (`id_siswa_kelas`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_tahun_ajar`
--
ALTER TABLE `t_tahun_ajar`
  ADD PRIMARY KEY (`id_tahun_ajar`),
  ADD KEY `tahun_ajar` (`tahun_ajar`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_sekolah_2` (`id_sekolah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_deskripsi`
--
ALTER TABLE `t_deskripsi`
  MODIFY `id_deskripsi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `t_guru_kelas`
--
ALTER TABLE `t_guru_kelas`
  MODIFY `id_pembagian_kelas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_keterampilan_kinerja`
--
ALTER TABLE `t_keterampilan_kinerja`
  MODIFY `id_keterampilan_kinerja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_keterampilan_praktek`
--
ALTER TABLE `t_keterampilan_praktek`
  MODIFY `id_keterampilan_praktek` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_master_guru`
--
ALTER TABLE `t_master_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_master_kelas`
--
ALTER TABLE `t_master_kelas`
  MODIFY `id_kelas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `t_master_mata_pelajaran`
--
ALTER TABLE `t_master_mata_pelajaran`
  MODIFY `id_mata_pelajaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_master_pegawai`
--
ALTER TABLE `t_master_pegawai`
  MODIFY `id_pegawai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_master_sekolah`
--
ALTER TABLE `t_master_sekolah`
  MODIFY `id_sekolah` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_master_user`
--
ALTER TABLE `t_master_user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_pengetahuan_tugas_kelompok`
--
ALTER TABLE `t_pengetahuan_tugas_kelompok`
  MODIFY `id_tugas_kelompok` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_pengetahuan_tugas_mandiri`
--
ALTER TABLE `t_pengetahuan_tugas_mandiri`
  MODIFY `id_tugas_mandiri` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_pengetahuan_ujian`
--
ALTER TABLE `t_pengetahuan_ujian`
  MODIFY `id_ujian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_pengetahuan_ulangan_harian`
--
ALTER TABLE `t_pengetahuan_ulangan_harian`
  MODIFY `id_ulangan_harian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_kehadiran`
--
ALTER TABLE `t_sikap_kehadiran`
  MODIFY `id_kehadiran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_kejujuran`
--
ALTER TABLE `t_sikap_kejujuran`
  MODIFY `id_kejujuran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_peduli`
--
ALTER TABLE `t_sikap_peduli`
  MODIFY `id_peduli` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_percaya_diri`
--
ALTER TABLE `t_sikap_percaya_diri`
  MODIFY `id_percaya_diri` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_santun`
--
ALTER TABLE `t_sikap_santun`
  MODIFY `id_santun` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_tanggung_jawab`
--
ALTER TABLE `t_sikap_tanggung_jawab`
  MODIFY `id_tanggung_jawab` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `t_siswa_kelas`
--
ALTER TABLE `t_siswa_kelas`
  MODIFY `id_siswa_kelas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `t_tahun_ajar`
--
ALTER TABLE `t_tahun_ajar`
  MODIFY `id_tahun_ajar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_deskripsi`
--
ALTER TABLE `t_deskripsi`
  ADD CONSTRAINT `t_deskripsi_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_deskripsi_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_guru_kelas`
--
ALTER TABLE `t_guru_kelas`
  ADD CONSTRAINT `t_guru_kelas_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `t_master_kelas` (`id_kelas`),
  ADD CONSTRAINT `t_guru_kelas_ibfk_2` FOREIGN KEY (`id_guru`) REFERENCES `t_master_guru` (`id_guru`),
  ADD CONSTRAINT `t_guru_kelas_ibfk_3` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `t_master_mata_pelajaran` (`id_mata_pelajaran`),
  ADD CONSTRAINT `t_guru_kelas_ibfk_4` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `t_keterampilan_kinerja`
--
ALTER TABLE `t_keterampilan_kinerja`
  ADD CONSTRAINT `t_keterampilan_kinerja_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_keterampilan_kinerja_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_keterampilan_praktek`
--
ALTER TABLE `t_keterampilan_praktek`
  ADD CONSTRAINT `t_keterampilan_praktek_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_keterampilan_praktek_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_master_guru`
--
ALTER TABLE `t_master_guru`
  ADD CONSTRAINT `t_master_guru_ibfk_1` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `t_master_kelas`
--
ALTER TABLE `t_master_kelas`
  ADD CONSTRAINT `t_master_kelas_ibfk_1` FOREIGN KEY (`wali_kelas`) REFERENCES `t_master_guru` (`id_guru`),
  ADD CONSTRAINT `t_master_kelas_ibfk_2` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `t_master_sekolah`
--
ALTER TABLE `t_master_sekolah`
  ADD CONSTRAINT `t_master_sekolah_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `t_tahun_ajar` (`id_sekolah`);

--
-- Constraints for table `t_master_user`
--
ALTER TABLE `t_master_user`
  ADD CONSTRAINT `t_master_user_ibfk_2` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`),
  ADD CONSTRAINT `t_master_user_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `t_master_guru` (`id_guru`);

--
-- Constraints for table `t_pengetahuan_tugas_kelompok`
--
ALTER TABLE `t_pengetahuan_tugas_kelompok`
  ADD CONSTRAINT `t_pengetahuan_tugas_kelompok_ibfk_2` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_pengetahuan_tugas_kelompok_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_pengetahuan_tugas_mandiri`
--
ALTER TABLE `t_pengetahuan_tugas_mandiri`
  ADD CONSTRAINT `t_pengetahuan_tugas_mandiri_ibfk_2` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_pengetahuan_tugas_mandiri_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_pengetahuan_ujian`
--
ALTER TABLE `t_pengetahuan_ujian`
  ADD CONSTRAINT `t_pengetahuan_ujian_ibfk_2` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_pengetahuan_ujian_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_pengetahuan_ulangan_harian`
--
ALTER TABLE `t_pengetahuan_ulangan_harian`
  ADD CONSTRAINT `t_pengetahuan_ulangan_harian_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pengetahuan_ulangan_harian_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_kehadiran`
--
ALTER TABLE `t_sikap_kehadiran`
  ADD CONSTRAINT `t_sikap_kehadiran_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_kehadiran_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_kejujuran`
--
ALTER TABLE `t_sikap_kejujuran`
  ADD CONSTRAINT `t_sikap_kejujuran_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_kejujuran_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_peduli`
--
ALTER TABLE `t_sikap_peduli`
  ADD CONSTRAINT `t_sikap_peduli_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_peduli_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_percaya_diri`
--
ALTER TABLE `t_sikap_percaya_diri`
  ADD CONSTRAINT `t_sikap_percaya_diri_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_percaya_diri_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_santun`
--
ALTER TABLE `t_sikap_santun`
  ADD CONSTRAINT `t_sikap_santun_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_santun_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_tanggung_jawab`
--
ALTER TABLE `t_sikap_tanggung_jawab`
  ADD CONSTRAINT `t_sikap_tanggung_jawab_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_tanggung_jawab_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_siswa_kelas`
--
ALTER TABLE `t_siswa_kelas`
  ADD CONSTRAINT `t_siswa_kelas_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_siswa_kelas_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `t_master_kelas` (`id_kelas`),
  ADD CONSTRAINT `t_siswa_kelas_ibfk_3` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);
--
-- Database: `fikom`
--
CREATE DATABASE IF NOT EXISTS `fikom` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fikom`;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`, `create_at`, `update_at`) VALUES
(1, 'admin', '$2y$05$GrkYCi95pl.0pRerKypi.OHQsHtYgyPptW..JfDiKaZQexDgGsS0y', 2, '2019-11-16 06:20:27', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `inventaris`
--
CREATE DATABASE IF NOT EXISTS `inventaris` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `inventaris`;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `kode_buku` varchar(10) NOT NULL,
  `nama_buku` varchar(40) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `penulis` varchar(30) NOT NULL,
  `penerbit` varchar(30) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `status` enum('ada','dipinjam') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`kode_buku`, `nama_buku`, `kategori`, `penulis`, `penerbit`, `tahun_terbit`, `status`) VALUES
('BK0001', 'Pendidikan Kaum Tertindas', 'Pendidikan', 'Paulo Freire', 'LPS', 2020, 'ada');

-- --------------------------------------------------------

--
-- Table structure for table `dt_inventaris`
--

CREATE TABLE `dt_inventaris` (
  `kode_inventaris` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `kondisi` varchar(20) NOT NULL,
  `status` enum('ada','dipinjam') NOT NULL,
  `posisi` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dt_inventaris`
--

INSERT INTO `dt_inventaris` (`kode_inventaris`, `nama_barang`, `kategori`, `kondisi`, `status`, `posisi`) VALUES
('IV0001', 'gelas', 'Alat Dapur', 'Baik', 'ada', 'Sekret'),
('IV0002', 'lemari', 'alat kantor', 'Baik', 'ada', 'sekret'),
('IV0003', 'Gelas', 'Alat Dapur', 'Baik', 'ada', 'Sekret'),
('IV0004', 'mouse', 'alat kantor', 'baik', 'ada', 'rumah');

-- --------------------------------------------------------

--
-- Table structure for table `pj_buku`
--

CREATE TABLE `pj_buku` (
  `id_peminjam` int(11) NOT NULL,
  `nama_peminjam` varchar(30) NOT NULL,
  `kode_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `kategori` varchar(30) NOT NULL,
  `waktu_pinjam` date NOT NULL,
  `batas_pinjam` date NOT NULL,
  `kontak` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pj_inventaris`
--

CREATE TABLE `pj_inventaris` (
  `id` int(11) NOT NULL,
  `nama_peminjam` varchar(50) NOT NULL,
  `kode_inventaris` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `waktu_pinjam` date NOT NULL,
  `batas_pinjam` date NOT NULL,
  `kontak` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`kode_buku`);

--
-- Indexes for table `dt_inventaris`
--
ALTER TABLE `dt_inventaris`
  ADD PRIMARY KEY (`kode_inventaris`);

--
-- Indexes for table `pj_buku`
--
ALTER TABLE `pj_buku`
  ADD PRIMARY KEY (`id_peminjam`);

--
-- Indexes for table `pj_inventaris`
--
ALTER TABLE `pj_inventaris`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pj_buku`
--
ALTER TABLE `pj_buku`
  MODIFY `id_peminjam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pj_inventaris`
--
ALTER TABLE `pj_inventaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `login`
--
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `login`;

-- --------------------------------------------------------

--
-- Table structure for table `id_role`
--

CREATE TABLE `id_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `id_role`
--

INSERT INTO `id_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Table structure for table `t_deskripsi`
--

CREATE TABLE `t_deskripsi` (
  `id_deskripsi` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `deskripsi` varchar(100) NOT NULL DEFAULT 'Deskripsi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_deskripsi`
--

INSERT INTO `t_deskripsi` (`id_deskripsi`, `id_pembagian_kelas`, `no_stambuk`, `deskripsi`) VALUES
(13, 1, '13401', 'aaaa'),
(14, 2, '13401', 'Deskripsi'),
(15, 7, '13401', 'Deskripsi'),
(16, 8, '13401', 'Deskripsi'),
(17, 9, '13401', 'Deskripsi'),
(18, 1, '13402', 'Deskripsi'),
(19, 2, '13402', 'Deskripsi'),
(20, 7, '13402', 'Deskripsi'),
(21, 8, '13402', 'Deskripsi'),
(22, 9, '13402', 'Deskripsi');

-- --------------------------------------------------------

--
-- Table structure for table `t_guru_kelas`
--

CREATE TABLE `t_guru_kelas` (
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(10) UNSIGNED NOT NULL,
  `id_mata_pelajaran` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_guru_kelas`
--

INSERT INTO `t_guru_kelas` (`id_pembagian_kelas`, `id_tahun_ajar`, `id_guru`, `id_kelas`, `id_mata_pelajaran`) VALUES
(1, 3, 2, 1, 2),
(2, 3, 2, 1, 3),
(3, 3, 3, 2, 3),
(4, 3, 3, 3, 4),
(5, 3, 2, 19, 4),
(6, 3, 2, 19, 5),
(7, 3, 2, 1, 5),
(8, 3, 3, 1, 6),
(9, 3, 6, 1, 4),
(10, 3, 3, 22, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_keterampilan_kinerja`
--

CREATE TABLE `t_keterampilan_kinerja` (
  `id_keterampilan_kinerja` int(10) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_keterampilan_kinerja`
--

INSERT INTO `t_keterampilan_kinerja` (`id_keterampilan_kinerja`, `no_stambuk`, `id_pembagian_kelas`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, '13401', 1, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '13401', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '13401', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '13401', 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '13401', 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '13402', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '13402', 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '13402', 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '13402', 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '13402', 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_keterampilan_praktek`
--

CREATE TABLE `t_keterampilan_praktek` (
  `id_keterampilan_praktek` int(10) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `praktek1` float NOT NULL DEFAULT '0',
  `praktek2` float NOT NULL DEFAULT '0',
  `praktek3` float NOT NULL DEFAULT '0',
  `praktek4` float NOT NULL DEFAULT '0',
  `ulangan_praktek` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_keterampilan_praktek`
--

INSERT INTO `t_keterampilan_praktek` (`id_keterampilan_praktek`, `no_stambuk`, `id_pembagian_kelas`, `praktek1`, `praktek2`, `praktek3`, `praktek4`, `ulangan_praktek`) VALUES
(1, '13401', 1, 0, 0, 0, 0, 100),
(2, '13401', 2, 0, 0, 0, 0, 0),
(3, '13401', 7, 0, 0, 0, 0, 0),
(4, '13401', 8, 0, 0, 0, 0, 0),
(5, '13401', 9, 0, 0, 0, 0, 0),
(6, '13402', 1, 0, 0, 0, 0, 0),
(7, '13402', 2, 0, 0, 0, 0, 0),
(8, '13402', 7, 0, 0, 0, 0, 0),
(9, '13402', 8, 0, 0, 0, 0, 0),
(10, '13402', 9, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_master_guru`
--

CREATE TABLE `t_master_guru` (
  `id_guru` int(11) NOT NULL,
  `nama_guru` varchar(100) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_guru`
--

INSERT INTO `t_master_guru` (`id_guru`, `nama_guru`, `nip`, `id_tahun_ajar`) VALUES
(2, 'Amden Junianto, JM', '1232', 3),
(3, 'Ridha Aprilia, S.Pd', '8989', 3),
(4, 'Moh. Bandrigo Talai', '888', 3),
(5, 'Sri Wahyuni, S. Ak', '7878', 3),
(6, 'asdasd', '454', 3),
(7, 'Fandrik, ST', '909', 3),
(8, 'gfgf', '213123', 3),
(9, 'ganti toh', '77777', 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_master_kelas`
--

CREATE TABLE `t_master_kelas` (
  `id_kelas` int(11) UNSIGNED NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `wali_kelas` int(11) NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_kelas`
--

INSERT INTO `t_master_kelas` (`id_kelas`, `nama_kelas`, `wali_kelas`, `id_tahun_ajar`) VALUES
(1, 'X.1', 5, 3),
(2, 'X.2', 2, 3),
(3, 'X.3', 3, 3),
(4, 'X.4', 4, 3),
(18, 'X.5', 6, 3),
(19, 'X.6', 8, 3),
(20, 'X.7', 9, 3),
(21, 'XII IA I', 4, 3),
(22, 'aaaaa', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_master_mata_pelajaran`
--

CREATE TABLE `t_master_mata_pelajaran` (
  `id_mata_pelajaran` int(10) UNSIGNED NOT NULL,
  `kode_matpel` char(20) NOT NULL,
  `nama_mata_pelajaran` varchar(100) NOT NULL,
  `kkm` double NOT NULL DEFAULT '0',
  `kategori` char(20) NOT NULL,
  `keterangan_mata_pelajaran` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_mata_pelajaran`
--

INSERT INTO `t_master_mata_pelajaran` (`id_mata_pelajaran`, `kode_matpel`, `nama_mata_pelajaran`, `kkm`, `kategori`, `keterangan_mata_pelajaran`) VALUES
(2, 'MTK', 'Matematika', 75, 'Wajib', ''),
(3, 'B.INDO', 'Bahasa Indonesia', 75, 'Wajib', ''),
(4, 'B.ING', 'Bahasa Inggris', 75, 'Wajib', ''),
(5, 'PENDAIS', 'Pendidikan Agama Islam dan Budi Pekerti', 88, 'Wajib', 'keterangannya'),
(6, 'PPKN', 'Pendidikan Pancasila dan Kewarganegaraan	', 70, 'Wajib', 'wow'),
(7, 'SI', 'Sejarah Indonesia', 75, 'Wajib', ''),
(8, 'SB', 'Seni Budaya', 75, 'Pilihan', ''),
(9, 'PJOK', 'Pendidikan Jasmani, Olah Raga dan Kesehatan', 75, 'Pilihan', ''),
(10, 'PK', 'Prakarya dan Kewirausahaan', 75, 'Pilihan', '');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_pegawai`
--

CREATE TABLE `t_master_pegawai` (
  `id_pegawai` int(10) UNSIGNED NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `nip` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_pegawai`
--

INSERT INTO `t_master_pegawai` (`id_pegawai`, `nama_pegawai`, `nip`) VALUES
(1, 'Moh. Bandrigo', '66161'),
(2, 'Amden Junianto', '1727');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_sekolah`
--

CREATE TABLE `t_master_sekolah` (
  `id_sekolah` int(10) UNSIGNED NOT NULL,
  `nama_sekolah` varchar(200) NOT NULL,
  `npsn` varchar(100) NOT NULL,
  `nss` varchar(100) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `provinsi` varchar(100) NOT NULL,
  `website` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kepala_sekolah` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_sekolah`
--

INSERT INTO `t_master_sekolah` (`id_sekolah`, `nama_sekolah`, `npsn`, `nss`, `alamat_sekolah`, `kelurahan`, `kecamatan`, `kota`, `provinsi`, `website`, `email`, `kepala_sekolah`) VALUES
(1, 'SMA NEGERI 4 KENDARI', '111111111111', '888', 'Jalan Jenderal Ahmad Yani No. 13', 'Bende 66', 'Kadia 55', 'Kendari 44', 'Sulawesi Tenggara 33', 'sman4kdi.sch.id', 'sman4kdi@gmail.com', 'Muh. Ruslan Saribi');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_siswa`
--

CREATE TABLE `t_master_siswa` (
  `no_stambuk` varchar(100) NOT NULL,
  `nama_siswa` varchar(100) NOT NULL,
  `alamat` text,
  `no_induk_nasional` varchar(100) NOT NULL,
  `nomor_induk_peserta_didik` varchar(100) NOT NULL,
  `tempat_tanggal_lahi` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(100) NOT NULL,
  `agama` varchar(100) NOT NULL,
  `status_dalam_keluarga` varchar(100) NOT NULL,
  `anak_ke` varchar(100) NOT NULL,
  `nomor_telp_rumah` varchar(100) NOT NULL,
  `nomor_telp_ayah` varchar(100) NOT NULL,
  `nomor_telp_ibu` varchar(100) NOT NULL,
  `sekolah_asal` varchar(100) NOT NULL,
  `diterima_dikelas` varchar(100) NOT NULL,
  `diterima_tanggal` varchar(100) NOT NULL,
  `terima_semester` varchar(100) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(100) NOT NULL,
  `nama_wali` varchar(100) NOT NULL,
  `no_telp_wali` varchar(100) NOT NULL,
  `alamat_wali` text NOT NULL,
  `pekerjaan_wali` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_siswa`
--

INSERT INTO `t_master_siswa` (`no_stambuk`, `nama_siswa`, `alamat`, `no_induk_nasional`, `nomor_induk_peserta_didik`, `tempat_tanggal_lahi`, `jenis_kelamin`, `agama`, `status_dalam_keluarga`, `anak_ke`, `nomor_telp_rumah`, `nomor_telp_ayah`, `nomor_telp_ibu`, `sekolah_asal`, `diterima_dikelas`, `diterima_tanggal`, `terima_semester`, `pekerjaan_ayah`, `pekerjaan_ibu`, `nama_wali`, `no_telp_wali`, `alamat_wali`, `pekerjaan_wali`) VALUES
('13401', 'Muh. Irwansyah', 'Kendari', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('13402', 'Aan Rusdi', 'Lepo lepo', '098756', '787878', 'kendari, 29 Juli 2019', 'Laki Laki', 'Islam', 'Anak kandung', '3', '09090', '8998', '787', 'SMA 1 KENDARI', 'XI', '10', '2', 'pekerjaan ayah', 'pekerjaan ibu', 'nama wali', 'telp wali', 'alamat wali', 'pekerjaan wali');

-- --------------------------------------------------------

--
-- Table structure for table `t_master_user`
--

CREATE TABLE `t_master_user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `id_guru` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level_user` varchar(50) NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_master_user`
--

INSERT INTO `t_master_user` (`id_user`, `id_guru`, `username`, `password`, `level_user`, `id_tahun_ajar`) VALUES
(3, 2, 'amden', 'amden', 'Guru', 3),
(4, 3, 'ridha', 'ridha', 'Kurikulum', 3),
(5, 5, 'nuni', 'nuni', 'Wali Kelas', 3),
(6, 7, 'has', 'has', 'Wali Kelas', 3),
(7, 3, 'ridha', 'ridha', 'Guru', 3);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_tugas_kelompok`
--

CREATE TABLE `t_pengetahuan_tugas_kelompok` (
  `id_tugas_kelompok` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_tugas_kelompok`
--

INSERT INTO `t_pengetahuan_tugas_kelompok` (`id_tugas_kelompok`, `id_pembagian_kelas`, `no_stambuk`, `id_guru`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_tugas_mandiri`
--

CREATE TABLE `t_pengetahuan_tugas_mandiri` (
  `id_tugas_mandiri` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_tugas_mandiri`
--

INSERT INTO `t_pengetahuan_tugas_mandiri` (`id_tugas_mandiri`, `id_pembagian_kelas`, `no_stambuk`, `id_guru`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_ujian`
--

CREATE TABLE `t_pengetahuan_ujian` (
  `id_ujian` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `uts` float NOT NULL DEFAULT '0',
  `uas` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_ujian`
--

INSERT INTO `t_pengetahuan_ujian` (`id_ujian`, `id_pembagian_kelas`, `no_stambuk`, `id_guru`, `uts`, `uas`) VALUES
(1, 1, '13401', 0, 100, 100),
(2, 2, '13401', 0, 0, 0),
(3, 7, '13401', 0, 0, 0),
(4, 8, '13401', 0, 0, 0),
(5, 9, '13401', 0, 0, 0),
(6, 1, '13402', 0, 0, 100),
(7, 2, '13402', 0, 0, 0),
(8, 7, '13402', 0, 0, 0),
(9, 8, '13402', 0, 0, 0),
(10, 9, '13402', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengetahuan_ulangan_harian`
--

CREATE TABLE `t_pengetahuan_ulangan_harian` (
  `id_ulangan_harian` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_pengetahuan_ulangan_harian`
--

INSERT INTO `t_pengetahuan_ulangan_harian` (`id_ulangan_harian`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, 1, '13401', 60, 60, 8, 8, 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_kehadiran`
--

CREATE TABLE `t_sikap_kehadiran` (
  `id_kehadiran` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_kehadiran`
--

INSERT INTO `t_sikap_kehadiran` (`id_kehadiran`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, 1, '13401', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 100, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_kejujuran`
--

CREATE TABLE `t_sikap_kejujuran` (
  `id_kejujuran` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_kejujuran`
--

INSERT INTO `t_sikap_kejujuran` (`id_kejujuran`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_peduli`
--

CREATE TABLE `t_sikap_peduli` (
  `id_peduli` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_peduli`
--

INSERT INTO `t_sikap_peduli` (`id_peduli`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_percaya_diri`
--

CREATE TABLE `t_sikap_percaya_diri` (
  `id_percaya_diri` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_percaya_diri`
--

INSERT INTO `t_sikap_percaya_diri` (`id_percaya_diri`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_santun`
--

CREATE TABLE `t_sikap_santun` (
  `id_santun` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0',
  `n17` float NOT NULL DEFAULT '0',
  `n18` float NOT NULL DEFAULT '0',
  `n19` float NOT NULL DEFAULT '0',
  `n20` float NOT NULL DEFAULT '0',
  `n21` float NOT NULL DEFAULT '0',
  `n22` float NOT NULL DEFAULT '0',
  `n23` float NOT NULL DEFAULT '0',
  `n24` float NOT NULL DEFAULT '0',
  `n25` float NOT NULL DEFAULT '0',
  `n26` float NOT NULL DEFAULT '0',
  `n27` float NOT NULL DEFAULT '0',
  `n28` float NOT NULL DEFAULT '0',
  `n29` float NOT NULL DEFAULT '0',
  `n30` float NOT NULL DEFAULT '0',
  `n31` float NOT NULL DEFAULT '0',
  `n32` float NOT NULL DEFAULT '0',
  `n33` float NOT NULL DEFAULT '0',
  `n34` float NOT NULL DEFAULT '0',
  `n35` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_santun`
--

INSERT INTO `t_sikap_santun` (`id_santun`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`, `n17`, `n18`, `n19`, `n20`, `n21`, `n22`, `n23`, `n24`, `n25`, `n26`, `n27`, `n28`, `n29`, `n30`, `n31`, `n32`, `n33`, `n34`, `n35`) VALUES
(1, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_sikap_tanggung_jawab`
--

CREATE TABLE `t_sikap_tanggung_jawab` (
  `id_tanggung_jawab` int(10) UNSIGNED NOT NULL,
  `id_pembagian_kelas` int(11) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL,
  `n1` float NOT NULL DEFAULT '0',
  `n2` float NOT NULL DEFAULT '0',
  `n3` float NOT NULL DEFAULT '0',
  `n4` float NOT NULL DEFAULT '0',
  `n5` float NOT NULL DEFAULT '0',
  `n6` float NOT NULL DEFAULT '0',
  `n7` float NOT NULL DEFAULT '0',
  `n8` float NOT NULL DEFAULT '0',
  `n9` float NOT NULL DEFAULT '0',
  `n10` float NOT NULL DEFAULT '0',
  `n11` float NOT NULL DEFAULT '0',
  `n12` float NOT NULL DEFAULT '0',
  `n13` float NOT NULL DEFAULT '0',
  `n14` float NOT NULL DEFAULT '0',
  `n15` float NOT NULL DEFAULT '0',
  `n16` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_sikap_tanggung_jawab`
--

INSERT INTO `t_sikap_tanggung_jawab` (`id_tanggung_jawab`, `id_pembagian_kelas`, `no_stambuk`, `n1`, `n2`, `n3`, `n4`, `n5`, `n6`, `n7`, `n8`, `n9`, `n10`, `n11`, `n12`, `n13`, `n14`, `n15`, `n16`) VALUES
(73, 1, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 2, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 7, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(76, 8, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, 9, '13401', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, 1, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79, 2, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 7, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 8, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 9, '13402', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_siswa_kelas`
--

CREATE TABLE `t_siswa_kelas` (
  `id_siswa_kelas` int(10) UNSIGNED NOT NULL,
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL,
  `id_kelas` int(10) UNSIGNED NOT NULL,
  `no_stambuk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_siswa_kelas`
--

INSERT INTO `t_siswa_kelas` (`id_siswa_kelas`, `id_tahun_ajar`, `id_kelas`, `no_stambuk`) VALUES
(32, 3, 1, '13401'),
(33, 3, 1, '13402');

-- --------------------------------------------------------

--
-- Table structure for table `t_tahun_ajar`
--

CREATE TABLE `t_tahun_ajar` (
  `id_tahun_ajar` int(10) UNSIGNED NOT NULL,
  `tahun_ajar` char(10) NOT NULL,
  `semester` char(20) NOT NULL,
  `id_sekolah` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_tahun_ajar`
--

INSERT INTO `t_tahun_ajar` (`id_tahun_ajar`, `tahun_ajar`, `semester`, `id_sekolah`) VALUES
(3, '2019/2020', 'Genap', 1),
(4, 'xax', '33', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `id_role`
--
ALTER TABLE `id_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_deskripsi`
--
ALTER TABLE `t_deskripsi`
  ADD PRIMARY KEY (`id_deskripsi`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`),
  ADD KEY `no_stambuk` (`no_stambuk`);

--
-- Indexes for table `t_guru_kelas`
--
ALTER TABLE `t_guru_kelas`
  ADD PRIMARY KEY (`id_pembagian_kelas`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_matpel` (`id_mata_pelajaran`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_keterampilan_kinerja`
--
ALTER TABLE `t_keterampilan_kinerja`
  ADD PRIMARY KEY (`id_keterampilan_kinerja`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_keterampilan_praktek`
--
ALTER TABLE `t_keterampilan_praktek`
  ADD PRIMARY KEY (`id_keterampilan_praktek`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_master_guru`
--
ALTER TABLE `t_master_guru`
  ADD PRIMARY KEY (`id_guru`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_master_kelas`
--
ALTER TABLE `t_master_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `wali_kelas` (`wali_kelas`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_master_mata_pelajaran`
--
ALTER TABLE `t_master_mata_pelajaran`
  ADD PRIMARY KEY (`id_mata_pelajaran`);

--
-- Indexes for table `t_master_pegawai`
--
ALTER TABLE `t_master_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `t_master_sekolah`
--
ALTER TABLE `t_master_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `t_master_siswa`
--
ALTER TABLE `t_master_siswa`
  ADD PRIMARY KEY (`no_stambuk`);

--
-- Indexes for table `t_master_user`
--
ALTER TABLE `t_master_user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_pegawai` (`id_guru`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_pengetahuan_tugas_kelompok`
--
ALTER TABLE `t_pengetahuan_tugas_kelompok`
  ADD PRIMARY KEY (`id_tugas_kelompok`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_pengetahuan_tugas_mandiri`
--
ALTER TABLE `t_pengetahuan_tugas_mandiri`
  ADD PRIMARY KEY (`id_tugas_mandiri`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_pengetahuan_ujian`
--
ALTER TABLE `t_pengetahuan_ujian`
  ADD PRIMARY KEY (`id_ujian`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_pengetahuan_ulangan_harian`
--
ALTER TABLE `t_pengetahuan_ulangan_harian`
  ADD PRIMARY KEY (`id_ulangan_harian`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_kehadiran`
--
ALTER TABLE `t_sikap_kehadiran`
  ADD PRIMARY KEY (`id_kehadiran`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_kejujuran`
--
ALTER TABLE `t_sikap_kejujuran`
  ADD PRIMARY KEY (`id_kejujuran`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_peduli`
--
ALTER TABLE `t_sikap_peduli`
  ADD PRIMARY KEY (`id_peduli`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_percaya_diri`
--
ALTER TABLE `t_sikap_percaya_diri`
  ADD PRIMARY KEY (`id_percaya_diri`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_santun`
--
ALTER TABLE `t_sikap_santun`
  ADD PRIMARY KEY (`id_santun`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_sikap_tanggung_jawab`
--
ALTER TABLE `t_sikap_tanggung_jawab`
  ADD PRIMARY KEY (`id_tanggung_jawab`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_pembagian_kelas` (`id_pembagian_kelas`);

--
-- Indexes for table `t_siswa_kelas`
--
ALTER TABLE `t_siswa_kelas`
  ADD PRIMARY KEY (`id_siswa_kelas`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `no_stambuk` (`no_stambuk`),
  ADD KEY `id_tahun_ajar` (`id_tahun_ajar`);

--
-- Indexes for table `t_tahun_ajar`
--
ALTER TABLE `t_tahun_ajar`
  ADD PRIMARY KEY (`id_tahun_ajar`),
  ADD KEY `tahun_ajar` (`tahun_ajar`),
  ADD KEY `id_sekolah` (`id_sekolah`),
  ADD KEY `id_sekolah_2` (`id_sekolah`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `id_role`
--
ALTER TABLE `id_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_deskripsi`
--
ALTER TABLE `t_deskripsi`
  MODIFY `id_deskripsi` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `t_guru_kelas`
--
ALTER TABLE `t_guru_kelas`
  MODIFY `id_pembagian_kelas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_keterampilan_kinerja`
--
ALTER TABLE `t_keterampilan_kinerja`
  MODIFY `id_keterampilan_kinerja` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_keterampilan_praktek`
--
ALTER TABLE `t_keterampilan_praktek`
  MODIFY `id_keterampilan_praktek` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_master_guru`
--
ALTER TABLE `t_master_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_master_kelas`
--
ALTER TABLE `t_master_kelas`
  MODIFY `id_kelas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `t_master_mata_pelajaran`
--
ALTER TABLE `t_master_mata_pelajaran`
  MODIFY `id_mata_pelajaran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_master_pegawai`
--
ALTER TABLE `t_master_pegawai`
  MODIFY `id_pegawai` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_master_sekolah`
--
ALTER TABLE `t_master_sekolah`
  MODIFY `id_sekolah` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `t_master_user`
--
ALTER TABLE `t_master_user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_pengetahuan_tugas_kelompok`
--
ALTER TABLE `t_pengetahuan_tugas_kelompok`
  MODIFY `id_tugas_kelompok` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_pengetahuan_tugas_mandiri`
--
ALTER TABLE `t_pengetahuan_tugas_mandiri`
  MODIFY `id_tugas_mandiri` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_pengetahuan_ujian`
--
ALTER TABLE `t_pengetahuan_ujian`
  MODIFY `id_ujian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_pengetahuan_ulangan_harian`
--
ALTER TABLE `t_pengetahuan_ulangan_harian`
  MODIFY `id_ulangan_harian` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_kehadiran`
--
ALTER TABLE `t_sikap_kehadiran`
  MODIFY `id_kehadiran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_kejujuran`
--
ALTER TABLE `t_sikap_kejujuran`
  MODIFY `id_kejujuran` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_peduli`
--
ALTER TABLE `t_sikap_peduli`
  MODIFY `id_peduli` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_percaya_diri`
--
ALTER TABLE `t_sikap_percaya_diri`
  MODIFY `id_percaya_diri` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_santun`
--
ALTER TABLE `t_sikap_santun`
  MODIFY `id_santun` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_sikap_tanggung_jawab`
--
ALTER TABLE `t_sikap_tanggung_jawab`
  MODIFY `id_tanggung_jawab` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `t_siswa_kelas`
--
ALTER TABLE `t_siswa_kelas`
  MODIFY `id_siswa_kelas` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `t_tahun_ajar`
--
ALTER TABLE `t_tahun_ajar`
  MODIFY `id_tahun_ajar` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_deskripsi`
--
ALTER TABLE `t_deskripsi`
  ADD CONSTRAINT `t_deskripsi_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_deskripsi_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_guru_kelas`
--
ALTER TABLE `t_guru_kelas`
  ADD CONSTRAINT `t_guru_kelas_ibfk_1` FOREIGN KEY (`id_kelas`) REFERENCES `t_master_kelas` (`id_kelas`),
  ADD CONSTRAINT `t_guru_kelas_ibfk_2` FOREIGN KEY (`id_guru`) REFERENCES `t_master_guru` (`id_guru`),
  ADD CONSTRAINT `t_guru_kelas_ibfk_3` FOREIGN KEY (`id_mata_pelajaran`) REFERENCES `t_master_mata_pelajaran` (`id_mata_pelajaran`),
  ADD CONSTRAINT `t_guru_kelas_ibfk_4` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `t_keterampilan_kinerja`
--
ALTER TABLE `t_keterampilan_kinerja`
  ADD CONSTRAINT `t_keterampilan_kinerja_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_keterampilan_kinerja_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_keterampilan_praktek`
--
ALTER TABLE `t_keterampilan_praktek`
  ADD CONSTRAINT `t_keterampilan_praktek_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_keterampilan_praktek_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_master_guru`
--
ALTER TABLE `t_master_guru`
  ADD CONSTRAINT `t_master_guru_ibfk_1` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `t_master_kelas`
--
ALTER TABLE `t_master_kelas`
  ADD CONSTRAINT `t_master_kelas_ibfk_1` FOREIGN KEY (`wali_kelas`) REFERENCES `t_master_guru` (`id_guru`),
  ADD CONSTRAINT `t_master_kelas_ibfk_2` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);

--
-- Constraints for table `t_master_sekolah`
--
ALTER TABLE `t_master_sekolah`
  ADD CONSTRAINT `t_master_sekolah_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `t_tahun_ajar` (`id_sekolah`);

--
-- Constraints for table `t_master_user`
--
ALTER TABLE `t_master_user`
  ADD CONSTRAINT `t_master_user_ibfk_2` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`),
  ADD CONSTRAINT `t_master_user_ibfk_3` FOREIGN KEY (`id_guru`) REFERENCES `t_master_guru` (`id_guru`);

--
-- Constraints for table `t_pengetahuan_tugas_kelompok`
--
ALTER TABLE `t_pengetahuan_tugas_kelompok`
  ADD CONSTRAINT `t_pengetahuan_tugas_kelompok_ibfk_2` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_pengetahuan_tugas_kelompok_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_pengetahuan_tugas_mandiri`
--
ALTER TABLE `t_pengetahuan_tugas_mandiri`
  ADD CONSTRAINT `t_pengetahuan_tugas_mandiri_ibfk_2` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_pengetahuan_tugas_mandiri_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_pengetahuan_ujian`
--
ALTER TABLE `t_pengetahuan_ujian`
  ADD CONSTRAINT `t_pengetahuan_ujian_ibfk_2` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_pengetahuan_ujian_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_pengetahuan_ulangan_harian`
--
ALTER TABLE `t_pengetahuan_ulangan_harian`
  ADD CONSTRAINT `t_pengetahuan_ulangan_harian_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pengetahuan_ulangan_harian_ibfk_3` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_kehadiran`
--
ALTER TABLE `t_sikap_kehadiran`
  ADD CONSTRAINT `t_sikap_kehadiran_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_kehadiran_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_kejujuran`
--
ALTER TABLE `t_sikap_kejujuran`
  ADD CONSTRAINT `t_sikap_kejujuran_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_kejujuran_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_peduli`
--
ALTER TABLE `t_sikap_peduli`
  ADD CONSTRAINT `t_sikap_peduli_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_peduli_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_percaya_diri`
--
ALTER TABLE `t_sikap_percaya_diri`
  ADD CONSTRAINT `t_sikap_percaya_diri_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_percaya_diri_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_santun`
--
ALTER TABLE `t_sikap_santun`
  ADD CONSTRAINT `t_sikap_santun_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_santun_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_sikap_tanggung_jawab`
--
ALTER TABLE `t_sikap_tanggung_jawab`
  ADD CONSTRAINT `t_sikap_tanggung_jawab_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_sikap_tanggung_jawab_ibfk_2` FOREIGN KEY (`id_pembagian_kelas`) REFERENCES `t_guru_kelas` (`id_pembagian_kelas`);

--
-- Constraints for table `t_siswa_kelas`
--
ALTER TABLE `t_siswa_kelas`
  ADD CONSTRAINT `t_siswa_kelas_ibfk_1` FOREIGN KEY (`no_stambuk`) REFERENCES `t_master_siswa` (`no_stambuk`),
  ADD CONSTRAINT `t_siswa_kelas_ibfk_2` FOREIGN KEY (`id_kelas`) REFERENCES `t_master_kelas` (`id_kelas`),
  ADD CONSTRAINT `t_siswa_kelas_ibfk_3` FOREIGN KEY (`id_tahun_ajar`) REFERENCES `t_tahun_ajar` (`id_tahun_ajar`);
--
-- Database: `mid`
--
CREATE DATABASE IF NOT EXISTS `mid` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mid`;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `iddokter` varchar(7) NOT NULL,
  `nama_dokter` varchar(30) DEFAULT NULL,
  `spesialisasi` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`iddokter`, `nama_dokter`, `spesialisasi`) VALUES
('d001', 'baim', 'jantung'),
('d002', 'bima', 'ginjal'),
('d003', 'boim', 'kulit'),
('d004', 'ajis', 'gusi'),
('d005', 'agam', 'gigi');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `idpasien` varchar(7) NOT NULL,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `tglmasuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`idpasien`, `nama_pasien`, `tglmasuk`) VALUES
('p001', 'ani', '2019-11-01'),
('p002', 'ina', '2019-11-12'),
('p003', 'nia', '2019-11-17'),
('p004', 'anu', '2019-11-18'),
('p005', 'una', '2019-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idbayar` varchar(7) NOT NULL,
  `idpasien` varchar(7) DEFAULT NULL,
  `iddokter` varchar(7) DEFAULT NULL,
  `bayar` bigint(20) DEFAULT NULL,
  `tglkeluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`idbayar`, `idpasien`, `iddokter`, `bayar`, `tglkeluar`) VALUES
('b001', 'p001', 'd001', 500000, '2019-12-05'),
('b002', 'p002', 'd002', 430000, '2019-12-09'),
('b003', 'p003', 'd003', 1500000, '2019-12-23'),
('b004', 'p004', 'd003', 1500000, '2019-12-26'),
('b005', 'p005', 'd003', 1500000, '2019-12-29');

-- --------------------------------------------------------

--
-- Table structure for table `urut`
--

CREATE TABLE `urut` (
  `no_urut` int(11) NOT NULL,
  `nama` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `urut`
--

INSERT INTO `urut` (`no_urut`, `nama`) VALUES
(1, 'alim'),
(2, 'rijal'),
(3, 'hasim');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`iddokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idpasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idbayar`),
  ADD KEY `idpasien` (`idpasien`),
  ADD KEY `iddokter` (`iddokter`);

--
-- Indexes for table `urut`
--
ALTER TABLE `urut`
  ADD PRIMARY KEY (`no_urut`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `urut`
--
ALTER TABLE `urut`
  MODIFY `no_urut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`idpasien`) REFERENCES `pasien` (`idpasien`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`iddokter`) REFERENCES `dokter` (`iddokter`);
--
-- Database: `miniproject`
--
CREATE DATABASE IF NOT EXISTS `miniproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `miniproject`;

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id` int(11) NOT NULL,
  `kode` varchar(6) NOT NULL,
  `waktu` date NOT NULL,
  `judul` varchar(50) NOT NULL,
  `isi` varchar(255) NOT NULL,
  `sumber` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catatan`
--

INSERT INTO `catatan` (`id`, `kode`, `waktu`, `judul`, `isi`, `sumber`) VALUES
(1, 'iu1', '2019-10-01', 'Bara-barayya kembali digugat oleh Ahli Waris', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est fugit sequi error, voluptas soluta mollitia perspiciatis facere numquam minus, adipisci accusantium autem. Quia esse quaerat fuga distinctio est nesciunt magnam? Lorem ipsum dolor sit amet conse', 'Afif from konsol'),
(2, 'iu2', '2019-10-07', 'Anggota SJPM diintimidasi', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Est fugit sequi error, voluptas soluta mollitia perspiciatis facere numquam minus, adipisci accusantium autem. Quia esse quaerat fuga distinctio est nesciunt magnam? Lorem ipsum dolor sit amet conse', '2019-10-07'),
(9, 'ikp3', '2019-10-10', 'jokowi perintahkan TNI AD amankan massa aksi', 'waktu peristiwa : Selasa, 27 November 2019\r\n\r\nJokowi saaat diwawancarai mengaku perlu menurunkan tni karena massa aksi dianggap:\r\n1. merusak\r\n2. anarkis\r\n3. ditunggangi\r\n\r\n', 'tirto'),
(10, 'ikp10', '2019-12-10', 'senior si A tidak suka saat germafik adakan lapaka', 'sklfjsklf ksfjkdsfjksljfs\r\nskdlfjskljflsk\r\ndsfklsjdfk\r\n', 'ippank'),
(11, 'iu11', '2019-12-10', 'klsfjsklf', 'skfjslfj', 'sklfjskl'),
(12, 'iu12', '0000-00-00', '', '', ''),
(13, 'ikp13', '2019-10-10', 'sambarang', 'asdafafs', 'sfs'),
(14, 'ikp14', '2019-12-10', 'Tawaran agar Germafik terintegrasi Federasi Mahasi', 'FMK merupakan lembaga penyatuan mahasiswa kerakyatan yang secara demokratis mengintegrasi organisasi yang ingin sepakat untuk berperspektif kerakyatan. \r\nTerintegrasi artinya terlibat dalam konsolidasi FMK  (pembacaan situasi, update isu, serta kesepakata', 'Pace');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`, `create_at`, `update_at`) VALUES
(1, 'admin', '$2y$05$GrkYCi95pl.0pRerKypi.OHQsHtYgyPptW..JfDiKaZQexDgGsS0y', 2, '2019-11-16 06:20:27', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `modul4`
--
CREATE DATABASE IF NOT EXISTS `modul4` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `modul4`;

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `stambuk` varchar(15) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jenis_kelamin` enum('pria','wanita') DEFAULT NULL,
  `alamat` text,
  `telp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`stambuk`, `nama`, `jenis_kelamin`, `alamat`, `telp`) VALUES
('1301', 'ana', 'wanita', 'pampang', '085242411'),
('1302', 'ani', 'wanita', 'barawaja', '085242412'),
('1303', 'ina', 'wanita', 'rappokalling', '085242413'),
('1304', 'nia', 'wanita', 'rekgek', '085242414'),
('1305', 'anu', 'wanita', 'pambers', '085242415'),
('1306', 'ajis', 'pria', 'kandea', '085242416');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `stambuk` varchar(15) DEFAULT NULL,
  `id_buku` varchar(10) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`stambuk`, `id_buku`, `tgl_peminjaman`, `tgl_pengembalian`) VALUES
('stb001', 'b001', '2019-09-10', '2019-09-17'),
('stb002', 'b002', '2019-09-12', '2019-09-19'),
('stb003', 'b003', '2019-10-01', '2019-10-08'),
('stb004', 'b004', '2019-10-04', '2019-10-11'),
('stb005', 'b005', '2019-10-06', '2019-10-13');

-- --------------------------------------------------------

--
-- Table structure for table `perpustakaan_buku`
--

CREATE TABLE `perpustakaan_buku` (
  `id_buku` varchar(10) NOT NULL,
  `judul_buku` varchar(255) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `kategori` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `jumlah_halaman` bigint(20) DEFAULT NULL,
  `tahun_terbit` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perpustakaan_buku`
--

INSERT INTO `perpustakaan_buku` (`id_buku`, `judul_buku`, `penulis`, `kategori`, `penerbit`, `jumlah_halaman`, `tahun_terbit`) VALUES
('b001', 'pendidikan kaum tertindas', 'paulo freire', 'pendidikan', 'margin kiri', 300, 2001),
('b002', 'sejarah untuk pembaca muda', 'ernest h. gombrich', 'sejarah', 'resist', 400, 2002),
('b003', 'feminisme untuk pemula', 'icha anarko', 'gender', 'insist', 230, 2003),
('b004', 'marxisme dan agama', 'dewisseng', 'filsafat', 'pustaka merdeka', 200, 2004),
('b005', 'perang tani', 'dewisseng', 'sosial', 'lp3s', 300, 2005);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`stambuk`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `perpustakaan_buku`
--
ALTER TABLE `perpustakaan_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `perpustakaan_buku` (`id_buku`);
--
-- Database: `perpus`
--
CREATE DATABASE IF NOT EXISTS `perpus` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `perpus`;

-- --------------------------------------------------------

--
-- Table structure for table `perpus_anggota`
--

CREATE TABLE `perpus_anggota` (
  `id_anggota` varchar(7) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `no_hp` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perpus_anggota`
--

INSERT INTO `perpus_anggota` (`id_anggota`, `nama`, `no_hp`) VALUES
('a001', 'bima', '08100000001'),
('a002', 'baim', '08100000002'),
('a003', 'bimo', '08100000003');

-- --------------------------------------------------------

--
-- Table structure for table `perpus_buku`
--

CREATE TABLE `perpus_buku` (
  `id_buku` varchar(7) NOT NULL,
  `judul` varchar(50) DEFAULT NULL,
  `pengarang` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perpus_buku`
--

INSERT INTO `perpus_buku` (`id_buku`, `judul`, `pengarang`) VALUES
('b001', 'feminisme untuk pemula', 'susan alice watkins'),
('b002', 'oligarki', 'jefrey winters'),
('b003', 'bumi manusia', 'pramoedya a. toer');

-- --------------------------------------------------------

--
-- Table structure for table `perpus_peminjaman`
--

CREATE TABLE `perpus_peminjaman` (
  `id_anggota` varchar(7) DEFAULT NULL,
  `id_buku` varchar(7) DEFAULT NULL,
  `tgl_peminjaman` date DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perpus_peminjaman`
--

INSERT INTO `perpus_peminjaman` (`id_anggota`, `id_buku`, `tgl_peminjaman`, `tgl_pengembalian`) VALUES
('a001', 'b001', '2019-11-10', '2019-11-13'),
('a002', 'b002', '2019-11-14', '2019-11-17'),
('a003', 'b003', '2019-11-15', '2019-11-18');

-- --------------------------------------------------------

--
-- Stand-in structure for view `piu`
-- (See below for the actual view)
--
CREATE TABLE `piu` (
`nama` varchar(50)
,`judul` varchar(50)
,`tgl_pengembalian` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `piu1`
-- (See below for the actual view)
--
CREATE TABLE `piu1` (
`judul` varchar(50)
,`batas pengembalian` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `piu_piu`
-- (See below for the actual view)
--
CREATE TABLE `piu_piu` (
`id_anggota` varchar(7)
,`nama` varchar(50)
,`no_hp` varchar(12)
);

-- --------------------------------------------------------

--
-- Structure for view `piu`
--
DROP TABLE IF EXISTS `piu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `piu`  AS  select `perpus_anggota`.`nama` AS `nama`,`perpus_buku`.`judul` AS `judul`,`perpus_peminjaman`.`tgl_pengembalian` AS `tgl_pengembalian` from ((`perpus_anggota` join `perpus_buku`) join `perpus_peminjaman`) where ((`perpus_anggota`.`id_anggota` = `perpus_peminjaman`.`id_anggota`) and (`perpus_buku`.`id_buku` = `perpus_peminjaman`.`id_buku`)) ;

-- --------------------------------------------------------

--
-- Structure for view `piu1`
--
DROP TABLE IF EXISTS `piu1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `piu1`  AS  select `perpus_buku`.`judul` AS `judul`,`perpus_peminjaman`.`tgl_pengembalian` AS `batas pengembalian` from ((`perpus_anggota` join `perpus_buku`) join `perpus_peminjaman`) where ((`perpus_anggota`.`id_anggota` = `perpus_peminjaman`.`id_anggota`) and (`perpus_buku`.`id_buku` = `perpus_peminjaman`.`id_buku`)) ;

-- --------------------------------------------------------

--
-- Structure for view `piu_piu`
--
DROP TABLE IF EXISTS `piu_piu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `piu_piu`  AS  select `perpus_anggota`.`id_anggota` AS `id_anggota`,`perpus_anggota`.`nama` AS `nama`,`perpus_anggota`.`no_hp` AS `no_hp` from `perpus_anggota` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `perpus_anggota`
--
ALTER TABLE `perpus_anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `perpus_buku`
--
ALTER TABLE `perpus_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `perpus_peminjaman`
--
ALTER TABLE `perpus_peminjaman`
  ADD KEY `id_anggota` (`id_anggota`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `perpus_peminjaman`
--
ALTER TABLE `perpus_peminjaman`
  ADD CONSTRAINT `perpus_peminjaman_ibfk_1` FOREIGN KEY (`id_anggota`) REFERENCES `perpus_anggota` (`id_anggota`),
  ADD CONSTRAINT `perpus_peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `perpus_buku` (`id_buku`);
--
-- Database: `phpdasar`
--
CREATE DATABASE IF NOT EXISTS `phpdasar` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phpdasar`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nrp` char(11) NOT NULL,
  `nama` varchar(35) NOT NULL,
  `email` varchar(45) NOT NULL,
  `jurusan` varchar(30) NOT NULL,
  `gambar` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nrp`, `nama`, `email`, `jurusan`, `gambar`) VALUES
(1, '13020150148', 'Munes Abbas Jalali', 'syamsulmunawarabbas@gmail.com', 'Teknik Informatika', ''),
(2, '00120100123', 'Akhmad Jalali', 'akhmad@gmail.com', 'Pendidikan Bhs. Indonesia', 'akhmad.jpg'),
(3, '00220060124', 'Asbar Tanjung', 'asbartanjung@gmail.com', 'Farmasi', 'asbar.jpg'),
(21, '13020110123', 'Mutakhir Abbas', 'mutakhir@gmail.com', 'Teknologi Pertanian', '5cf3ec98d7228.jpg'),
(22, '13020150150', 'Syawal Alauddin', 'syawal@gmail.com', 'Teknik Informatika', 'munes.jpg'),
(32, '040', 'Mira', 'mirayati23@gmail.com', 'Ilmu Hukum', '5cf3eda04bb4e.jpg'),
(33, 'sjflsk', 'skldfjsl', 'skdfjsl', 'ksldfjs', '5e5539f28d4e8jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(3, 'munes', '$2y$10$d2C4GlbYXcCVNVVG3HqQbeJ9JhbVOPCc/RkBLZyJ5vBLurx0W3oJW'),
(4, 'abe', '$2y$10$RN6CezE0S5NMZyNER3w0Hew24p7rSG4ALMuRznz0i214.ZwreQBtK'),
(5, 'asbar', '$2y$10$zqoBGvNOYL7oxszn7qkAcuDelyWyxZ6Ew5wGN/fDv9EY13Bd4qAbW'),
(6, 'admin', '$2y$10$nQKRehAcmwZq0gzmBgfV6Oi5G1Ct2MzMxTjQGodeQ8MQygFZ4ATba');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"relation_lines\":\"true\",\"snap_to_grid\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'inventaris', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"acc\",\"acc1\",\"acc2\",\"accc\",\"ahhay\",\"akademik\",\"asistensi\",\"cafe\",\"cek\",\"dasar\",\"data\",\"data_kependudukan\",\"dbtransfer\",\"db_login\",\"diknas\",\"fikom\",\"inventaris\",\"login\",\"mid\",\"miniproject\",\"modul4\",\"perpus\",\"phpdasar\",\"phpmyadmin\",\"phpunpas\",\"rumahsakit\",\"rumah_sakit\",\"sambarang\",\"tesrong\",\"test\",\"testes\",\"tugasapp\",\"user\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"data_kependudukan\",\"table\":\"data_kk\"},{\"db\":\"data_kependudukan\",\"table\":\"kependudukan\"},{\"db\":\"data_kependudukan\",\"table\":\"data_desa_kelurahan\"},{\"db\":\"data_kependudukan\",\"table\":\"pindah_keluar\"},{\"db\":\"data_kependudukan\",\"table\":\"pindah_datang\"},{\"db\":\"data_kependudukan\",\"table\":\"detail_kk\"},{\"db\":\"data_kependudukan\",\"table\":\"kematian\"},{\"db\":\"data_kependudukan\",\"table\":\"kelahiran\"},{\"db\":\"inventaris\",\"table\":\"pj_buku\"},{\"db\":\"inventaris\",\"table\":\"buku\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'rumah_sakit', 'pasien', '{\"CREATE_TIME\":\"2019-04-21 04:03:27\"}', '2019-04-21 11:22:36');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('', '2019-12-21 19:05:01', '{\"Console\\/Mode\":\"collapse\"}'),
('root', '2020-04-28 07:50:01', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `phpunpas`
--
CREATE DATABASE IF NOT EXISTS `phpunpas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phpunpas`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nrp` char(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `jurusan` varchar(64) NOT NULL,
  `gambar` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nrp`, `nama`, `email`, `jurusan`, `gambar`) VALUES
(1, '1302015001', 'Syamsul', 'syamsul@gmail.com', 'teknik informatika', 'syamsul.jpg'),
(2, '1302015002', 'syawal alauddin', 'syawal@gmail.com', 'sistem informasi', 'syawal.jpg'),
(3, '1302015003', 'saldy', 'saldy@gmail.com', 'teknik informatika', 'saldy.jpg'),
(4, '1302015004', 'saiful', 'saiful@gmail.com', 'teknik pertambangan', 'saiful.jpg'),
(5, '1302015005', 'abid tauhid islamuddin', 'abid@gmail.com', 'sistem informasi', 'abid.jpg'),
(9, '1302015006', 'abdul kadir paduaiji', 'kadir@gmail.com', 'Hukum Ekonomi Syariah', 'kadir.jpg'),
(10, '234121', 'sdfsf', 'sfdsfd', 'sdfsdf', 'sdfsf.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(2, 'admin', '$2y$10$3h91H5eD5NkSpQLkbK7Cf.Eghu/DZ0Lntsj21aE67q8C2PyDcgd5a'),
(3, 'munes', '$2y$10$ueg6BnYwpI2jolxPPoaf0eRgiZlW3cduTvXvC34HBuaNxFG9/bO4a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `rumahsakit`
--
CREATE DATABASE IF NOT EXISTS `rumahsakit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rumahsakit`;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `iddokter` varchar(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `spesialisasi` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`iddokter`, `nama`, `spesialisasi`) VALUES
('d001', 'abid', 'kelamin'),
('d002', 'bima', 'jantung'),
('d003', 'bimo', 'gigi');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `idpasien` varchar(7) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `golda` varchar(5) DEFAULT NULL,
  `tglmasuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`idpasien`, `nama`, `golda`, `tglmasuk`) VALUES
('p001', 'abid', 'z', '2019-11-12'),
('p002', 'ina', 'b', '2019-11-12'),
('p003', 'nia', 'o', '2019-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idpembayaran` varchar(7) NOT NULL,
  `idpasien` varchar(7) DEFAULT NULL,
  `iddokter` varchar(5) DEFAULT NULL,
  `bayar` bigint(20) DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`idpembayaran`, `idpasien`, `iddokter`, `bayar`, `tgl_keluar`) VALUES
('b001', 'p001', 'd001', 3000, '2019-11-01'),
('b002', 'p002', 'd002', 4000, '2019-11-01'),
('b003', 'p003', 'd003', 6000, '2019-11-01');

-- --------------------------------------------------------

--
-- Stand-in structure for view `piupiu`
-- (See below for the actual view)
--
CREATE TABLE `piupiu` (
`nama` varchar(30)
,`golda` varchar(5)
,`tglmasuk` date
,`tgl_keluar` date
,`nama_dokter` varchar(30)
,`spesialisasi` varchar(30)
,`bayar` bigint(20)
);

-- --------------------------------------------------------

--
-- Structure for view `piupiu`
--
DROP TABLE IF EXISTS `piupiu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `piupiu`  AS  select `pasien`.`nama` AS `nama`,`pasien`.`golda` AS `golda`,`pasien`.`tglmasuk` AS `tglmasuk`,`pembayaran`.`tgl_keluar` AS `tgl_keluar`,`dokter`.`nama` AS `nama_dokter`,`dokter`.`spesialisasi` AS `spesialisasi`,`pembayaran`.`bayar` AS `bayar` from ((`pasien` join `dokter`) join `pembayaran`) where ((`pasien`.`idpasien` = `pembayaran`.`idpasien`) and (`dokter`.`iddokter` = `pembayaran`.`iddokter`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`iddokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idpasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idpembayaran`),
  ADD KEY `idpasien` (`idpasien`),
  ADD KEY `iddokter` (`iddokter`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`idpasien`) REFERENCES `pasien` (`idpasien`),
  ADD CONSTRAINT `pembayaran_ibfk_2` FOREIGN KEY (`iddokter`) REFERENCES `dokter` (`iddokter`);
--
-- Database: `rumah_sakit`
--
CREATE DATABASE IF NOT EXISTS `rumah_sakit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rumah_sakit`;

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(30) NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `usia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `usia`) VALUES
(1, 'Syamsul Munawar', 'laki-laki', 21);
--
-- Database: `sambarang`
--
CREATE DATABASE IF NOT EXISTS `sambarang` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sambarang`;
--
-- Database: `tesrong`
--
CREATE DATABASE IF NOT EXISTS `tesrong` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tesrong`;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` varchar(5) NOT NULL,
  `nama_dsn` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama_dsn`, `alamat`) VALUES
('111', 'bima', 'pampang');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `stb` varchar(5) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`stb`, `nama`, `jurusan`) VALUES
('001', 'anu', 'TI');

-- --------------------------------------------------------

--
-- Table structure for table `matkul`
--

CREATE TABLE `matkul` (
  `kd_matkul` varchar(5) NOT NULL,
  `nama_matkul` varchar(25) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matkul`
--

INSERT INTO `matkul` (`kd_matkul`, `nama_matkul`, `sks`) VALUES
('mk01', 'APS', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mengajar`
--

CREATE TABLE `mengajar` (
  `nip` varchar(5) DEFAULT NULL,
  `kd_matkul` varchar(5) DEFAULT NULL,
  `jam` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`stb`);

--
-- Indexes for table `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`kd_matkul`);

--
-- Indexes for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD KEY `kd_matkul` (`kd_matkul`),
  ADD KEY `nip` (`nip`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mengajar`
--
ALTER TABLE `mengajar`
  ADD CONSTRAINT `mengajar_ibfk_1` FOREIGN KEY (`kd_matkul`) REFERENCES `matkul` (`kd_matkul`),
  ADD CONSTRAINT `mengajar_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `testes`
--
CREATE DATABASE IF NOT EXISTS `testes` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `testes`;

-- --------------------------------------------------------

--
-- Table structure for table `coba`
--

CREATE TABLE `coba` (
  `id` varchar(7) NOT NULL,
  `nama` varchar(15) DEFAULT NULL,
  `hobi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coba`
--

INSERT INTO `coba` (`id`, `nama`, `hobi`) VALUES
('001', 'munes abbas', 'ngodings');

-- --------------------------------------------------------

--
-- Stand-in structure for view `gabung`
-- (See below for the actual view)
--
CREATE TABLE `gabung` (
`id` varchar(7)
,`nama` varchar(15)
,`hobi` varchar(20)
,`kode` varchar(5)
,`ket` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `tes`
--

CREATE TABLE `tes` (
  `kode` varchar(5) NOT NULL,
  `id` varchar(7) DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tes`
--

INSERT INTO `tes` (`kode`, `id`, `ket`) VALUES
('kd1', '001', 'agak mantep');

-- --------------------------------------------------------

--
-- Structure for view `gabung`
--
DROP TABLE IF EXISTS `gabung`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `gabung`  AS  select `coba`.`id` AS `id`,`coba`.`nama` AS `nama`,`coba`.`hobi` AS `hobi`,`tes`.`kode` AS `kode`,`tes`.`ket` AS `ket` from (`coba` join `tes`) where (`coba`.`id` = `tes`.`id`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `coba`
--
ALTER TABLE `coba`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tes`
--
ALTER TABLE `tes`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `id` (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tes`
--
ALTER TABLE `tes`
  ADD CONSTRAINT `tes_ibfk_1` FOREIGN KEY (`id`) REFERENCES `coba` (`id`);
--
-- Database: `tugasapp`
--
CREATE DATABASE IF NOT EXISTS `tugasapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tugasapp`;

-- --------------------------------------------------------

--
-- Table structure for table `aduan`
--

CREATE TABLE `aduan` (
  `id` int(11) NOT NULL,
  `kategori` varchar(70) NOT NULL,
  `aduan` varchar(255) NOT NULL,
  `waktu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aduan`
--

INSERT INTO `aduan` (`id`, `kategori`, `aduan`, `waktu`) VALUES
(7, 'fasilitas', 'WC laki-laki dilantai 3 pintunya rusak ', '2019-12-22'),
(8, 'pelayanan', 'bla bla bla bla bla bla', '2019-12-22'),
(9, 'akademik', 'bla bla bla bla', '2019-12-22'),
(10, 'fasilitas', 'sambarang', '2019-12-24'),
(11, 'pelayanan', 'sembarang mo', '2019-12-26'),
(12, 'fasilitas', 'kurang memadai untuk kebutuhan mahasiswa', '2019-12-28'),
(13, 'fasilitas', 'Skop Sampah', '2019-12-28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `stambuk` varchar(11) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `stambuk`, `nama`, `password`) VALUES
(4, '13020150140', 'Ramdani Lestaluhu', '$2y$10$JVUczrcNwJw8O4eboje6bu4CMNQrzs.3E0vBj171aMS052zdlUvPy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aduan`
--
ALTER TABLE `aduan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aduan`
--
ALTER TABLE `aduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `user`
--
CREATE DATABASE IF NOT EXISTS `user` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `user`;

-- --------------------------------------------------------

--
-- Table structure for table `username`
--

CREATE TABLE `username` (
  `id` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `username`
--
ALTER TABLE `username`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
