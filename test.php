<?php 
include 'function.php';
if (isset($_SESSION['role'])) {
    if ($_SESSION['role'] == 0) {
        header("location: indexAdmin.php");
    }
} else {
    header('location: index.php');
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
    rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
    crossorigin="anonymous"/>
    <link
    href="https://fonts.googleapis.com/css?family=Poppins:300,400,700&display=swap"
    rel="stylesheet"/>
    <link rel="stylesheet" href="custom.css" />
    <title>Halaman Pertanyaan</title>
</head>
<body>
    <nav class="navbar py-2 navbar-expand-lg navbar-light">
        <div class="container">
            <a class="navbar-brand" href="#"
            ><img src="gambar/logo2.png" width="80" alt="logo"
            /></a>
            <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
            >
            <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li>
                        <a class="btn px-4 btn-primary ml-2" href="logout.php" role="button"
                    >Log Out</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>

    <section class="test mt-5">
        <div class="container">
            <div class="row">
                <div class="col align-self-center">
                    <h2 class="mb-4">Pertanyaan : </h2>
                    <form action="" method="post" enctype="multipart/form-data" role="form">
                    <?php
                        if(!isset($_SESSION['list_penyakit'])) {
                            $_SESSION['list_penyakit'] = [];
                            $penyakit = mysqli_query($koneksi, "SELECT disease_id, name FROM diseases");
                            while($penyakit_row = mysqli_fetch_assoc($penyakit)) {
                                $penyakit_id = intval($penyakit_row['disease_id']);
                                $penyakit_row['list_gejala'] = gejala($penyakit_id);
                                $_SESSION['list_penyakit'][] = $penyakit_row;
                            }
                        }

                        if(!isset($_SESSION['list_gejala'])) {
                            $_SESSION['list_gejala'] = [];
                            $gejala = mysqli_query($koneksi, "SELECT symptom_id, name, certainty FROM symptoms");
                            while($gejala_row = mysqli_fetch_assoc($gejala)) {
                                $_SESSION['list_gejala'][] = $gejala_row;
                            }
                        }

                        $list_penyakit = $_SESSION['list_penyakit'];
                        $list_gejala = $_SESSION['list_gejala'];

                        $idx_penyakit = 0;
                        $idx_gejala = 0;

                        if(!isset($_SESSION['idx_gejala'])){
                            $_SESSION['idx_gejala'] = $idx_gejala;
                        }else{
                            $idx_gejala = $_SESSION['idx_gejala'];
                        }
                    ?>
                    <p class="mb-4">
                        Seberapa sering anda mengalami <?= strtolower($list_gejala[$idx_gejala]['name']); ?>?
                    </p>
                    <div>
                        <input required class="btn btn-primary mr-2 px-4 py-2" type="radio" name="answer" value="0" id="ans_0">
                        <label for="ans_0">Tidak Pernah</label>
                    </div>
                    <div>
                        <input required class="btn btn-primary mr-2 px-4 py-2" type="radio" name="answer" value="0.2" id="ans_1">
                        <label for="ans_1">Sangat Jarang</label>
                    </div>
                    <div>
                        <input required class="btn btn-primary mr-2 px-4 py-2" type="radio" name="answer" value="0.4" id="ans_2">
                        <label for="ans_2">Jarang</label>
                    </div>
                    <div>
                        <input required class="btn btn-primary mr-2 px-4 py-2" type="radio" name="answer" value="0.6" id="ans_3">
                        <label for="ans_3">Sering</label>
                    </div>
                    <div>
                        <input required class="btn btn-primary mr-2 px-4 py-2" type="radio" name="answer" value="0.8" id="ans_4">
                        <label for="ans_4">Sangat Sering</label>
                    </div>
                    <div>
                        <input required class="btn btn-primary mr-2 px-4 py-2" type="radio" name="answer" value="1.0" id="ans_5">
                        <label for="ans_5">Setiap Saat</label>
                    </div>
                    <div>
                        <input required type="submit" class="btn btn-primary mr-2 mt-3 px-4 py-2">
                    </div>
                    <?php
                        if(!isset($_SESSION['persentase'])) {
                            $_SESSION['persentase'] = [];
                        }

                        if(!isset($_SESSION['hasil'])) {
                            $_SESSION['hasil'] = [];
                        }

                        $persentase = $_SESSION['persentase'];
                        
                        if(isset($_POST['answer'])){
                            if(isset($idx_gejala)){
                                $temp = $idx_gejala;
                                array_push($persentase, [$temp, floatval($_POST['answer'])]);
                            }
                            $_SESSION['persentase'] = $persentase;
                        }

                        if($_SESSION['idx_gejala'] >= count($list_gejala)) {
                            foreach ($list_penyakit as $penyakit) {
                                $certainty_penyakit = -1;
                                foreach ($persentase as $value) {
                                    if (in_array($value[0], $penyakit['list_gejala'])) {
                                        $answer_certainty = $value[1];
                                        $expert_certainty = floatval($_SESSION['list_gejala'][$value[0] - 1]['certainty']);
                                        $combined_certainty = $answer_certainty * $expert_certainty;
                                        
                                        if($certainty_penyakit == -1) {
                                            $certainty_penyakit = $combined_certainty;
                                        } else {
                                            $certainty_penyakit = $certainty_penyakit + ($combined_certainty * (1 - $certainty_penyakit));
                                        }
                                    }
                                }
                                $_SESSION['hasil'][$penyakit['disease_id']] = [
                                    "name" => $penyakit['name'],
                                    "certainty" => $certainty_penyakit
                                ];
                            }
                            echo "here";
                            header('Location: hasil.php');
                        }

                        $_SESSION['idx_gejala'] = $idx_gejala + 1;
                    ?>
                    <br />
                </div>
                    </form>
                <div class="col d-none d-sm-block">
                    <img width="500" src="gambar/jawab1.jpg" alt="hero" />
                </div>
            </div>
        </div>
    </section>
</body>

<script
    src="https://code.jquery.com/jquery-3.4.1.js"
    integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"
></script>
<script
    src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"
></script>
<script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"
></script>
<script
    src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"
></script>
</html>