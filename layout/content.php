<?php

    if(isset($_GET['page'])){
        
        $halaman = $_GET['page'];

        if($halaman == 'inventaris'){
            include 'modul/inventaris.php';
        }
        elseif($halaman == 'buku'){
            include 'modul/buku.php';
        }
        elseif($halaman == 'peminjaman'){
            include 'modul/peminjaman.php';
        }
        elseif($halaman == 'tambah_inventaris'){
            include 'modul/tambah_inventaris.php';
        }
        elseif($halaman == 'tambah_buku'){
            include 'modul/tambah_buku.php';
        }
        elseif($halaman == 'edit_inventaris'){
            include 'modul/edit_inventaris.php';
        }
        elseif($halaman == 'edit_buku'){
            include 'modul/edit_buku.php';
        }
        elseif($halaman == 'pinjam_inventaris'){
            include 'modul/pinjam_inventaris.php';
        }
        elseif($halaman == 'pinjam_buku'){
            include 'modul/pinjam_buku.php';
        }
    }
    else{
        include 'modul/dashboard.php';
    }

?>