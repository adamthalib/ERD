CREATE TABLE `Pegawai_RS` (
  `id_petugas` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255),
  `alamat` varchar(255),
  `username` varchar(255),
  `password` varchar(255),
  `id_jabatan` int
);

CREATE TABLE `Pasien` (
  `id_pasien` int PRIMARY KEY,
  `nama` varchar(255),
  `alamat` varchar(255),
  `nomer_tlfn` varchar(255),
  `status` varchar(255),
  `tgl_lahir` varchar(255)
);

CREATE TABLE `Dokter` (
  `id_dokter` int PRIMARY KEY,
  `nama` varchar(255),
  `biaya_jasa` int,
  `poli` varchar(255),
  `spesialis` varchar(255)
);

CREATE TABLE `Jabatan` (
  `id_jabatan` int PRIMARY KEY,
  `pegawai` varchar(255),
  `admin` varchar(255)
);

CREATE TABLE `Jadwal` (
  `id_jadwal` int PRIMARY KEY,
  `id_dokter` int,
  `jam` varchar(255),
  `tanggal` date,
  `ruangan` varchar(255),
  `hari` varchar(255)
);

CREATE TABLE `Apoteker` (
  `id_apoteker` int PRIMARY KEY,
  `nama` varchar(255),
  `alamat` varchar(255)
);

CREATE TABLE `Daftar` (
  `no_daftar` int PRIMARY KEY,
  `id_pasien` int,
  `id_jadwal` int,
  `id_petugas` int,
  `tanggal_daftar` date
);

CREATE TABLE `Diagnosa` (
  `id_diagnosa` int PRIMARY KEY,
  `id_dokter` int,
  `id_pasien` int,
  `diagnosa` varchar(255)
);

CREATE TABLE `Obat` (
  `id_obat` int PRIMARY KEY,
  `id_apoteker` int,
  `nama_obat` varchar(255),
  `jenis_obat` varchar(255),
  `dosis` varchar(255),
  `harga` varchar(255)
);

CREATE TABLE `Resep` (
  `id_resep` int PRIMARY KEY,
  `id_pasien` int,
  `id_dokter` int,
  `id_obat` int,
  `id_diagnosa` int,
  `tgl_resep` date,
  `jumlah_bayar` varchar(255)
);

CREATE TABLE `Pembayaran` (
  `id_bayar` int PRIMARY KEY,
  `id_pasien` int,
  `id_resep` int,
  `tgl_bayar` date,
  `jenis_bayar` varchar(255)
);

ALTER TABLE `Jabatan` ADD FOREIGN KEY (`id_jabatan`) REFERENCES `Pegawai_RS` (`id_jabatan`);

ALTER TABLE `Pegawai_RS` ADD FOREIGN KEY (`id_petugas`) REFERENCES `Daftar` (`id_petugas`);

ALTER TABLE `Jadwal` ADD FOREIGN KEY (`id_jadwal`) REFERENCES `Daftar` (`id_jadwal`);

ALTER TABLE `Pasien` ADD FOREIGN KEY (`id_pasien`) REFERENCES `Daftar` (`id_pasien`);

ALTER TABLE `Pasien` ADD FOREIGN KEY (`id_pasien`) REFERENCES `Diagnosa` (`id_pasien`);

ALTER TABLE `Dokter` ADD FOREIGN KEY (`id_dokter`) REFERENCES `Diagnosa` (`id_dokter`);

ALTER TABLE `Apoteker` ADD FOREIGN KEY (`id_apoteker`) REFERENCES `Obat` (`id_apoteker`);

ALTER TABLE `Resep` ADD FOREIGN KEY (`id_obat`) REFERENCES `Obat` (`id_obat`);

ALTER TABLE `Dokter` ADD FOREIGN KEY (`id_dokter`) REFERENCES `Resep` (`id_dokter`);

ALTER TABLE `Pasien` ADD FOREIGN KEY (`id_pasien`) REFERENCES `Resep` (`id_pasien`);

ALTER TABLE `Pasien` ADD FOREIGN KEY (`id_pasien`) REFERENCES `Pembayaran` (`id_pasien`);

ALTER TABLE `Resep` ADD FOREIGN KEY (`id_resep`) REFERENCES `Pembayaran` (`id_resep`);

ALTER TABLE `Diagnosa` ADD FOREIGN KEY (`id_diagnosa`) REFERENCES `Resep` (`id_diagnosa`);
