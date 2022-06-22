
<?php
        include 'function.php';
        $id = $_GET['id'];
        $data = tampil("SELECT * FROM buku WHERE kode_buku='$id'")[0];

        if(isset($_POST["pinjamkan"])){
            if(pinjamkan_buku($_POST) > 0){
                echo "
                    <script>
                        alert('berhasil dipinjamkan');
                        document.location.href='index.php?page=buku';
                    </script>
                ";
            }else{
                echo "gagal meminjamkan";
            }
        }

?>

<h3><i class="fas fa-tachometer-alt mr-2 mt-5"></i>PINJAMKAN BUKU</h3><hr class="bg-secondary mb-5">        
        <div class="col-md-5 ml-5">

            <form action="" method="POST">
                <input type="hidden" name="id" value="<?= $data['kode_buku'] ?>">
                <label class="mb-0" for="peminjam"><b>Peminjam</b></label>
                <input class="form-control mb-3" name="peminjam" id="peminjam" type="text" placeholder="">
                <label class="mb-0" for="kontak"><b>Kontak/No. Hp</b></label>
                <input class="form-control mb-3" name="kontak" id="kontak" type="text" placeholder="">
                <label class="mb-0" for="batas_waktu"><b>Batas Waktu</b></label>
                <input class="form-control mb-3" name="batas_waktu" id="batas_waktu" type="text" placeholder="">
                <button class="btn btn-success bg-success center-block text-white" 
                value="pinjamkan" name="pinjamkan" type="submit">Submit</button>
            </form>
    </div>