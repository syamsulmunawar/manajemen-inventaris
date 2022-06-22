<?php

    $conn = mysqli_connect("localhost","root","","inventaris");


    $id_peminjaman = $_GET['id'];
    $id_barang   = $_GET['id_barang'];

    mysqli_query($conn, "UPDATE dt_inventaris SET status='ada' WHERE kode_inventaris='$id_barang'");
    mysqli_query($conn, "UPDATE dt_inventaris SET posisi='sekret' WHERE kode_inventaris='$id_barang'");
    mysqli_query($conn, "DELETE FROM pj_inventaris WHERE id='$id_peminjaman'");

    echo "
                <script>
                    alert('berhasil dihapus!');
                    document.location.href='../index.php?page=peminjaman';
                </script>
            ";

?>