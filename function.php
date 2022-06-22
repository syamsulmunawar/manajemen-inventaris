<?php

$conn = mysqli_connect("localhost","root","","inventaris");

function tampil($query){
    
    global $conn;
    
    $result = mysqli_query($conn, $query);
    $rows =[];

    while($row = mysqli_fetch_assoc($result)){
        $rows[] = $row;
    }
    return $rows;
}
    

    function tambah($data){
        
        global $conn;

        $carikode  = mysqli_query($conn, "SELECT MAX(kode_inventaris) FROM dt_inventaris");
        $datakode   = mysqli_fetch_array($carikode);
        
        if($datakode){
            $nilaikode  = substr($datakode[0], 2, 4);
            $kode       = (int) $nilaikode;
            $kode       = $kode + 1;
                $hasilkode  = "IV" . str_pad($kode, 4, "0", STR_PAD_LEFT);
            }else{
                $hasilkode  = "IV0001";
            }
        
        $nama     = htmlspecialchars($data["nama"]);
        $kategori = htmlspecialchars($data["kategori"]);
        $kondisi  = htmlspecialchars($data["kondisi"]);
        $posisi   = htmlspecialchars($data["posisi"]);

        
        $query = "INSERT INTO dt_inventaris VALUES
        ('$hasilkode', '$nama', '$kategori', '$kondisi','ada','$posisi')";
        
        mysqli_query($conn, $query);
        return mysqli_affected_rows($conn);
    }




    function tambah_buku($data){
        
        global $conn;

        $carikode  = mysqli_query($conn, "SELECT MAX(kode_buku) FROM buku");
        $datakode   = mysqli_fetch_array($carikode);
        
        if($datakode){
            $nilaikode  = substr($datakode[0], 2, 4);
            $kode       = (int) $nilaikode;
            $kode       = $kode + 1;
            $hasilkode  = "BK" . str_pad($kode, 4, "0", STR_PAD_LEFT);
        }else{
                $hasilkode  = "BK0001";
            }

        $nama     = htmlspecialchars($data["nama"]);
        $kategori = htmlspecialchars($data["kategori"]);
        $penulis  = htmlspecialchars($data["penulis"]);
        $penerbit = htmlspecialchars($data["penerbit"]);
        $tahun    = htmlspecialchars($data["tahun"]);

        
        $query = "INSERT INTO buku VALUES
        ('$hasilkode', '$nama', '$kategori', '$penulis','$penerbit','$tahun','ada')";
        
        mysqli_query($conn, $query);
        return mysqli_affected_rows($conn);
    }

    function ubah($data){
        
        global $conn;

        $no       = htmlspecialchars($data["no"]);
        $nama     = htmlspecialchars($data["nama"]);
        $kategori = htmlspecialchars($data["kategori"]);
        $kondisi  = htmlspecialchars($data["kondisi"]);
        $posisi   = htmlspecialchars($data["posisi"]);

        $query = "UPDATE dt_inventaris SET 
                    nama_barang ='$nama',kategori='$kategori',kondisi='$kondisi',
                    posisi='$posisi' WHERE kode_inventaris='$no'";

        mysqli_query($conn, $query);
        return mysqli_affected_rows($conn);

    }
    function ubah_buku($data){
        
        global $conn;

        $id       = htmlspecialchars($data["id"]);
        $nama     = htmlspecialchars($data["nama"]);
        $kategori = htmlspecialchars($data["kategori"]);
        $penulis  = htmlspecialchars($data["penulis"]);
        $penerbit = htmlspecialchars($data["penerbit"]);
        $tahun    = htmlspecialchars($data["tahun"]);

        $query = "UPDATE buku SET 
                    nama_buku ='$nama',kategori='$kategori',penulis='$penulis',
                    penerbit='$penerbit',tahun_terbit='$tahun' WHERE kode_buku='$id'";

        mysqli_query($conn, $query);
        return mysqli_affected_rows($conn);

    }

    function pinjamkan_inventaris($data){
        global $conn;

        $id         = htmlspecialchars($data["id"]);
        $peminjam   = htmlspecialchars($data["peminjam"]);
        $kontak     = htmlspecialchars($data["kontak"]);
        $batas      = htmlspecialchars($data["batas_waktu"]);
        
        mysqli_query($conn, "UPDATE dt_inventaris SET status= 'dipinjam' WHERE kode_inventaris='$id'");
        mysqli_query($conn, "UPDATE dt_inventaris SET posisi= '$peminjam' WHERE kode_inventaris='$id'");
        
        $result = mysqli_query($conn, "SELECT * FROM dt_inventaris WHERE kode_inventaris='$id'");
        $row = mysqli_fetch_assoc($result);
        
        $nama_barang = $row["nama_barang"];
        $kategori    = $row["kategori"];

        $query= "INSERT INTO pj_inventaris VALUES ('','$peminjam','$id','$nama_barang',
                '$kategori',now(),'$batas','$kontak')";
        mysqli_query($conn, $query);

        return mysqli_affected_rows($conn);        
    }

    
    function pinjamkan_buku($data){
        global $conn;

        $id         = htmlspecialchars($data["id"]);
        $peminjam   = htmlspecialchars($data["peminjam"]);
        $kontak     = htmlspecialchars($data["kontak"]);
        $batas      = htmlspecialchars($data["batas_waktu"]);
        
        mysqli_query($conn, "UPDATE buku SET status= 'dipinjam' WHERE kode_buku='$id'");
        
        $result = mysqli_query($conn, "SELECT * FROM buku WHERE kode_buku='$id'");
        $row = mysqli_fetch_assoc($result);
        
        $judul_buku = $row["judul_buku"];
        $kategori    = $row["kategori"];

        $query= "INSERT INTO pj_buku VALUES ('','$peminjam','$id','$judul_buku',
                '$kategori',now(),'$batas','$kontak')";
        mysqli_query($conn, $query);

        return mysqli_affected_rows($conn);        
    }
    
    
?>