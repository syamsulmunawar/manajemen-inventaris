<?php
    include 'function.php';
    $buku = tampil("SELECT * FROM buku");
    
    
?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>DAFTAR BUKU</h3><hr class="bg-secondary mb-5">        


              <a href="?page=tambah_buku" class="btn btn-primary mb-1"><i class="fas fa-plus-square mr-2"></i>Tambah Buku</a>
              <table class="table table-striped table-bordered">
                  <thead>
                    <tr>
                      <th scope="col">Kode Buku</th>
                      <th scope="col">Nama Buku</th>
                      <th scope="col">Kategori</th>
                      <th scope="col">Penulis</th>
                      <th scope="col">Penerbit</th>
                      <th scope="col">Tahun terbit</th>
                      <th scope="col">Status</th>
                      <th scope="col" colspan="4">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                  <?php foreach($buku as $bk): ?>
                    <tr>
                      <th scope="row"><?= $bk['kode_buku'] ?></th>
                      <td><?= $bk['nama_buku'] ?></td>
                      <td><?= $bk['kategori'] ?></td>
                      <td><?= $bk['penulis'] ?></td>
                      <td><?= $bk['penerbit'] ?></td>
                       <td><?= $bk['tahun_terbit'] ?></td>
                       <td><?= $bk['status'] ?></td>
                      <td><a href="?page=pinjam_buku&id=<?= $bk['kode_buku'] ?>" class="btn btn-primary" data-toggle="tooltip" title="Pinjamkan">Pinjamkan</a></td>
                      <td><a href="?page=edit_buku&id=<?= $bk['kode_buku'] ?>"><i class="fas fa-edit bg-success p-2 text-white rounded" data-toggle="tooltip" title="Edit data"></i></a></td>
                      <td><a href="layout/hapus_buku.php?id=<?= $bk['kode_buku']; ?>"><i class="fas fa-trash-alt bg-danger p-2 text-white rounded" data-toggle="tooltip" title="Hapus data"></i></a></td>
                    </tr>
                  <?php endforeach; ?>
                  </tbody>

                  <div class="modal fade" id="detail" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title">Deskripsi</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                          </button>
                        </div>
                        <div class="modal-body">
                          <form action="">
                            label
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>

              </table>