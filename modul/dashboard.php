<?php

    include 'function.php';
    $inventaris     = mysqli_query($conn,"SELECT * FROM dt_inventaris");
    $buku           = mysqli_query($conn,"SELECT * FROM buku");
    $pj_inventaris  = mysqli_query($conn,"SELECT * FROM pj_inventaris");
    $pj_buku        = mysqli_query($conn,"SELECT * FROM pj_buku");

    $jml_inventaris     = mysqli_num_rows($inventaris);
    $jml_buku           = mysqli_num_rows($buku);
    $jml_pj_inventaris  = mysqli_num_rows($pj_inventaris);
    $jml_pj_buku        = mysqli_num_rows($pj_buku);


?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>DASHBOARD</h3><hr class="bg-secondary mb-5">

<div class="row text-white">
    <div class="card ml-5 mb-3 bg-info " style="width: 18rem;">
        <div class="card-body">
            <div class="card-body-icon">
                
            </div>
            <h5 class="card-title">DAFTAR INVENTARIS</h5>
            <div class="display-4"><?= $jml_inventaris ?></div>
          <a href="?page=inventaris"><p class="card-text text-white mt-2">Lihat Detail<i class="fas fa-angle-double-right ml-2"></i></p></a>
        </div>
    </div>


    <div class="card ml-5 mb-3 bg-danger" style="width: 18rem;">
        <div class="card-body">
            <div class="card-body-icon">
                
            </div>
            <h5 class="card-title">DAFTAR BUKU</h5>
            <div class="display-4"><?= $jml_buku ?> </div>
          <a href="?page=buku"><p class="card-text text-white mt-2">Lihat Detail<i class="fas fa-angle-double-right ml-2"></i></p></a>
        </div>
    </div>


    <div class="card mb-3 ml-5 bg-success" style="width: 18rem;">
        <div class="card-body">
            <div class="card-body-icon">
                
            </div>
            <h5 class="card-title">DAFTAR PEMINJAMAN</h5>
            <div class="display-4"><?= $jml_pj_inventaris + $jml_pj_buku ?></div>
          <a href="?page=peminjaman"><p class="card-text text-white mt-2">Lihat Detail<i class="fas fa-angle-double-right ml-2"></i></p></a>
        </div>
    </div>
</div>    