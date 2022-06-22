<?php
    include 'function.php';
    $peminjaman_inventaris = tampil("SELECT * FROM pj_inventaris");
    $peminjaman_buku = tampil("SELECT * FROM pj_buku");
    
    
?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>DAFTAR PEMINJAMAN   </h3><hr class="bg-secondary mb-5">        

            <h2>Inventaris</h2>
              <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th scope="col">Id Peminjaman</th>
                      <th scope="col">Nama Peminjam</th>
                      <th scope="col">Kode Inventaris</th>
                      <th scope="col">Nama Barang</th>
                      <th scope="col">Kategori</th>
                      <th scope="col">Waktu Pinjam</th>
                      <th scope="col">Batas Pinjam</th>
                      <th scope="col">Kontak</th>
                      <th scope="col" >Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php foreach($peminjaman_inventaris as $pi): ?>
                    <tr>
                      <th scope="row"><?= $pi['id'] ?></th>
                      <td><?= $pi['nama_peminjam'] ?></td>
                      <td><?= $pi['kode_inventaris'] ?></td>
                      <td><?= $pi['nama_barang'] ?></td> 
                      <td><?= $pi['kategori'] ?></td>
                      <td><?= $pi['waktu_pinjam'] ?></td>
                      <td><?= $pi['batas_pinjam'] ?></td>
                      <td><?= $pi['kontak'] ?></td>
                      <td><a href="layout/hapus_pj_inventaris.php?id=<?= $pi['id']; ?>&id_barang=<?= $pi['kode_inventaris']; ?>"><i class="fas fa-trash-alt bg-danger p-2 text-white rounded" data-toggle="tooltip" title="Hapus data"></i></a></td>
                    </tr>
                  <?php endforeach; ?>
                  </tbody>
              </table>

            <br><h2>Buku</h2>
              <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                        <th scope="col">Id Peminjaman</th>
                        <th scope="col">Nama Peminjam</th>
                        <th scope="col">Id Buku</th>
                        <th scope="col">Judul Buku</th>
                        <th scope="col">Kategori</th>
                        <th scope="col">Waktu Pinjam</th>
                        <th scope="col">Batas Pinjam</th>
                      <th scope="col">Kontak</th>
                        <th scope="col">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php foreach($peminjaman_buku as $pb): ?>
                    <tr>
                      <th scope="row"><?= $pb['id_peminjam'] ?></th>
                      <td><?= $pb['nama_peminjam'] ?></td>
                      <td><?= $pb['kode_buku'] ?></td>
                      <td><?= $pb['judul_buku'] ?></td>
                      <td><?= $pb['kategori'] ?></td>
                      <td><?= $pb['waktu_pinjam'] ?></td>
                      <td><?= $pb['batas_pinjam'] ?></td>
                      <td><?= $pb['kontak'] ?></td>
                      <td><a href="layout/hapus_pj_buku.php?id=<?= $pb['id_peminjam']; ?>&id_buku=<?= $pb['kode_buku']; ?>"><i class="fas fa-trash-alt bg-danger p-2 text-white rounded" data-toggle="tooltip" title="Hapus data"></i></a></td>
                    </tr>
                  <?php endforeach; ?>
                  </tbody>
              </table>