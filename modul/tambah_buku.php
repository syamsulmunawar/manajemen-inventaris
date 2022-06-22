<?php
    include 'function.php';

    if(isset($_POST["tambah"])){
        if(tambah_buku($_POST) > 0){
            echo "
                <script>
                    alert('data berhasil ditambahkan');
                    document.location.href='index.php?page=buku';
                </script>
            ";
        }else{
            echo " <br> data gagal ditambahkan <br>";
            echo mysqli_error($conn);
        }
    }

?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>TAMBAH BUKU</h3><hr class="bg-secondary mb-5">        
        <div class="col-md-5 ml-5">
            <form action="" method="POST">
                <label class="mb-0" for="nama"><b>Nama Buku</b></label>
                <input class="form-control mb-3" name="nama" id="nama" type="text" placeholder="">
                <label class="mb-0" for="kategori"><b>Kategori</b></label>
                <input class="form-control mb-3" name="kategori" id="kategori" type="text" placeholder="">
                <label class="mb-0" for="penulis"><b>Penulis</b></label>
                <input class="form-control mb-3" name="penulis" id="penulis" type="text" placeholder="">
                <label class="mb-0" for="penerbit"><b>Penerbit</b></label>
                <input class="form-control mb-3" name="penerbit" id="penerbit" type="text" placeholder="">
                <label class="mb-0" for="tahun"><b>Tahun Terbit</b></label>
                <input class="form-control mb-3" name="tahun" id="tahun" type="text" placeholder="">
                <button class="btn btn-success bg-success center-block text-white" value="tambah" name="tambah" type="submit">Tambah</button>
            </form>
    </div>