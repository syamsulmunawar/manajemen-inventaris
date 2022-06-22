<?php
    $conn = mysqli_connect("localhost","root","","inventaris");
        $id = $_GET['id'];

        mysqli_query($conn,"DELETE FROM 
                            dt_inventaris WHERE kode_inventaris='$id'");

        echo "<script>
                alert('data berhasil dihapus!');
                document.location.href='../index.php?page=inventaris';
            </script>";
?>