
<?php
        include 'function.php';
        $id = $_GET['id'];
        $data = tampil("SELECT * FROM dt_inventaris WHERE kode_inventaris='$id'")[0];

        if(isset($_POST["edit"])){
            if(ubah($_POST) > 0){
                echo "
                    <script>
                        alert('data berhasil diubah');
                        document.location.href='index.php?page=inventaris';
                    </script>
                ";
            }else{
                echo "data gagal diubah";
            }
        }

?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>EDIT DATA INVENTARIS</h3><hr class="bg-secondary mb-5">        
        <div class="col-md-5 ml-5">
            <form action="" method="POST">
                <input type="hidden" name="no"  value="<?= $data['kode_inventaris'] ?>">
                <label class="mb-0" for="nama"><b>Nama Barang</b></label>
                <input class="form-control mb-3" value="<?= $data['nama_barang'] ?>" name="nama" id="nama" type="text" placeholder="">
                <label class="mb-0" for="kategori"><b>Kategori</b></label>
                <input class="form-control mb-3" value="<?= $data['kategori'] ?>" name="kategori" id="kategori" type="text" placeholder="">
                <label class="mb-0" for="kondisi"><b>Kondisi</b></label>
                <input class="form-control mb-3" value="<?= $data['kondisi'] ?>" name="kondisi" id="kondisi" type="text" placeholder="">
                <label class="mb-0" for="posisi"><b>Posisi</b></label>
                <input class="form-control mb-3" value="<?= $data['posisi'] ?>" name="posisi" id="posisi" type="text" placeholder="">
                <button class="btn btn-success bg-success center-block text-white" 
                value="edit" name="edit" type="submit">Simpan</button>
            </form>
    </div>