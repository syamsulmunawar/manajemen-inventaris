
<?php
        include 'function.php';
        $id = $_GET['id'];
        $data = tampil("SELECT * FROM buku WHERE kode_buku='$id'")[0];

        if(isset($_POST["edit"])){
            if(ubah_buku($_POST) > 0){
                echo "
                    <script>
                        alert('data berhasil diubah');
                        document.location.href='index.php?page=buku';
                    </script>
                ";
            }else{
                echo "data gagal diubah";
            }
        }

?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>EDIT DATA BUKU</h3><hr class="bg-secondary mb-5">        
        <div class="col-md-5 ml-5">
            <form action="" method="POST">
                <input type="hidden" name="id"  value="<?= $data['kode_buku'] ?>">
                <label class="mb-0" for="nama"><b>Nama Buku</b></label>
                <input class="form-control mb-3" value="<?= $data['nama_buku'] ?>" name="nama" id="nama" type="text" placeholder="">
                <label class="mb-0" for="kategori"><b>Kategori</b></label>
                <input class="form-control mb-3" value="<?= $data['kategori'] ?>" name="kategori" id="kategori" type="text" placeholder="">
                <label class="mb-0" for="penulis"><b>penulis</b></label>
                <input class="form-control mb-3" value="<?= $data['penulis'] ?>" name="penulis" id="penulis" type="text" placeholder="">
                <label class="mb-0" for="penerbit"><b>penerbit</b></label>
                <input class="form-control mb-3" value="<?= $data['penerbit'] ?>" name="penerbit" id="penerbit" type="text" placeholder="">
                <label class="mb-0" for="tahun"><b>Tahun Terbit</b></label>
                <input class="form-control mb-3" value="<?= $data['tahun_terbit'] ?>" name="tahun" id="tahun" type="text" placeholder="">
                <button class="btn btn-success bg-success center-block text-white" 
                value="edit" name="edit" type="submit">Simpan</button>
            </form>
    </div>