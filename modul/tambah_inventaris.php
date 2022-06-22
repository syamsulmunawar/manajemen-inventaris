<?php
    include 'function.php';

    if(isset($_POST["tambah"])){
        if(tambah($_POST) > 0){
            echo "
                <script>
                    alert('data berhasil ditambahkan');
                    document.location.href='index.php?page=inventaris';
                </script>
            ";
        }else{
            echo " <br> data gagal ditambahkan <br>";
            echo mysqli_error($conn);
        }
    }

?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>TAMBAH INVENTARIS</h3><hr class="bg-secondary mb-5">        
        <div class="col-md-5 ml-5">
            <form action="" method="POST">
                <label class="mb-0" for="nama"><b>Nama Barang</b></label>
                <input class="form-control mb-3" name="nama" id="nama" type="text" placeholder="">
                <label class="mb-0" for="kategori"><b>Kategori</b></label>
                <input class="form-control mb-3" name="kategori" id="kategori" type="text" placeholder="">
                <label class="mb-0" for="kondisi"><b>Kondisi</b></label>
                <input class="form-control mb-3" name="kondisi" id="kondisi" type="text" placeholder="">
                <label class="mb-0" for="posisi"><b>Posisi</b></label>
                <input class="form-control mb-3" name="posisi" id="posisi" type="text" placeholder="">
                <button class="btn btn-success bg-success center-block text-white" value="tambah" name="tambah" type="submit">Tambah</button>
            </form>
    </div>