<?php
    include 'function.php';
    $data = tampil("SELECT * FROM dt_inventaris");
    
    
?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>DAFTAR INVENTARIS</h3><hr class="bg-secondary mb-5">        


              <a href="?page=tambah_inventaris" class="btn btn-primary mb-1"><i class="fas fa-plus-square mr-2"></i>Tambah Inventaris</a>
              <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th scope="col">No</th>
                      <th scope="col">Nama Barang</th>
                      <th scope="col">Kategori</th>
                      <th scope="col">Kondisi</th>
                      <th scope="col">Status</th>
                      <th scope="col">Posisi</th>
                      <th scope="col" colspan="3">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php foreach($data as $dt): ?>
                    <tr>
                      <th scope="row"><?= $dt['kode_inventaris'] ?></th>
                      <td><?= $dt['nama_barang'] ?></td>
                      <td><?= $dt['kategori'] ?></td>
                      <td><?= $dt['kondisi'] ?></td>
                      <td><?= $dt['status'] ?></td>
                      <td><?= $dt['posisi'] ?></td>
                      <td><a href="?page=pinjam_inventaris&id=<?= $dt['kode_inventaris'] ?>" class="btn btn-primary" data-toggle="tooltip" title="Pinjamkan">Pinjamkan</a></td>
                      <td><a href="?page=edit_inventaris&id=<?= $dt['kode_inventaris'] ?>"><i class="fas fa-edit bg-success p-2 text-white rounded" data-toggle="tooltip" title="Edit data"></i></a></td>
                      <td><a href="layout/hapus_inventaris.php?id=<?= $dt['kode_inventaris']; ?>"><i class="fas fa-trash-alt bg-danger p-2 text-white rounded" data-toggle="tooltip" title="Hapus data"></i></a></td>
                    </tr>
                  <?php endforeach; ?>
                  </tbody>
              </table>