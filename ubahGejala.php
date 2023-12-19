<?php


include "function.php";
if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 1) {
        header("location: test.php");
    }
} else {
    header("location:index.php");
}

$id_gejala = $_GET["id_gejala"];

$queryPenyakit = mysqli_query($koneksi, "SELECT * FROM diseases");

$query = mysqli_query($koneksi, "SELECT symptoms.symptom_id AS symptom_id, diseases.disease_id AS disease_id, diseases.name AS disease, symptoms.name AS symptom, certainty FROM diseases_symptoms INNER JOIN diseases ON diseases_symptoms.disease_id = diseases.disease_id INNER JOIN symptoms ON diseases_symptoms.symptom_id = symptoms.symptom_id WHERE diseases_symptoms.symptom_id = '$id_gejala'");
$data = mysqli_fetch_assoc($query);


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="styles.css">
    <link
        rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
        crossorigin="anonymous"/>
    <link
        href="https://fonts.googleapis.com/css?family=Poppins:300,400,700&display=swap"
        rel="stylesheet"/>
</head>

<body >
    <div class="kiri">
        <section class="logo">
            <img src="gambar/logo2.png" alt="logo" height="70px" />
        </section>
        <div class="sidebar-heading">
            <h5 class="font-weight-bold text-white text-uppercase teks">Data User</h5>
        </div>
        <section class="isi">
            <a class="nav-link" href="indexAdmin.php">
            <span>Data Pasien</span></a>
        </section>
        <section class="isi">
            <a class="nav-link" href="indexPakar.php">
            <span>Data Pakar</span></a>
        </section>
        <div class="sidebar-heading">
            <h5 class="font-weight-bold text-white text-uppercase teks">Gejala & Penyakit</h5> 
        </div>
        <section class="isi">
            <a class="nav-link" href="indexPenyakit.php">
            <span>Data Penyakit</span>
            </a>
        </section>
        <section class="isi">
            <a class="nav-link" href="indexGejala.php">
            <span>Data Gejala</span>
            </a>
        </section>
        <div class="sidebar-heading">
            <h5 class="font-weight-bold text-white text-uppercase teks">Solusi</h5> 
        </div>
        <section class="isi">
            <a class="nav-link" href="indexSolusi.php">
            <span>Data Solusi</span>
            </a>
        </section>
        <section class="isi">
            <a class="nav-link" href="logout.php">
            <span>Logout</span>
            </a>
        </section>
    </div>

    <div class="kanan">
        <div class="container-fluid">

        <!-- Page Heading -->
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Ubah Data Gejala</h1>
            </div>

        <!-- Content Row -->
            <div class="row">

                <form action="function.php?act=ubahGejala&id_gejala=<?= $data['symptom_id']; ?>" id="ubah" method="POST">
                    <div class="form-group">
                        <label for="namaGejala">Nama Gejala</label>
                        <input type="text" class="form-control" id="namaGejala" name="namaGejala" value="<?= $data['symptom']; ?>"">
                    </div>
                    <div class="form-group">
                        <label for="bobotGejala">Bobot Gejala</label>
                        <input type="number" max=1 min=0 step=0.01 class="form-control" id="bobotGejala" name="bobotGejala" value="<?= $data['certainty']; ?>"">
                    </div>
                    <div class="form-group">
                    <label for="id_penyakit" class="form-label">Nama Penyakit</label>
                    <select name="id_penyakit" id="id_penyakit" class="form-control">
                        <option value="<?= $data['disease_id']; ?>"><?= $data['disease']; ?></option>
                        <?php while ($penyakit = mysqli_fetch_assoc($queryPenyakit)) { ?>
                            <option value="<?= $penyakit["disease_id"]; ?>"><?= $penyakit["name"]; ?></option>
                        <?php } ?>
                    </select>
                </div>
                    <input type="submit" name="ubah_btn" id="ubah" class="btn btn-primary" value="Ubah">
                </form>

            </div>

        </div>
    </div>

</body>

</html>