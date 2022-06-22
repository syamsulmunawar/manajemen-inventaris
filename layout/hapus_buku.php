<?php
    $conn = mysqli_connect("localhost","root","","inventaris");
        $id = $_GET['id'];

        mysqli_query($conn,"DELETE FROM 
                            buku WHERE kode_buku='$id'");

        echo "<script>
                alert('data berhasil dihapus!');
                document.location.href='../index.php?page=buku';
            </script>";
?>