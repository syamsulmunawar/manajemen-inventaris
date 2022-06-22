<?php

    $conn = mysqli_connect("localhost","root","","inventaris");


    $id_peminjaman = $_GET['id'];
    $id_buku   = $_GET['id_buku'];

    mysqli_query($conn, "UPDATE buku SET status='ada' WHERE kode_buku='$id_buku'");
    mysqli_query($conn, "DELETE FROM pj_buku WHERE id_peminjam='$id_peminjaman'");

    echo "
                <script>
                    alert('berhasil dihapus!');
                    document.location.href='../index.php?page=peminjaman';
                </script>
            ";

?>