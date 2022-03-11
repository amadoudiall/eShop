<?php

require('../src/Controller/Database.php');
require('../src/Controller/Entity/User.php');
require('../src/Controller/Connection.php');
require('../src/HTML/Form.php');
require('../src/HTML/bootstrapForm.php');
$login = new Connection();

if (isset($_POST['connection'])) {
    $login->Login();
}
if(isset($_GET['logout'])){
    $login->Logout();
    header('location: '.$_SERVER['HTTP_REFERER'].'');
}
$title = "Connexion";
ob_start();
?>
<div class="connection form">
    <div class="form">

        <?php
        $form = new bootstrapForm($_POST);
        $erreur = $login->getErreur();
        if (isset($erreur)) {
            echo $erreur;
        } ?>
        <form class="form-material" action="" method="post">
            <?php
            echo $form->input('username', 'username', 'E-mail ou Téléphone');
            echo $form->inputPassword('pwd', 'Mot de passe...');
            echo $form->submit('connection', 'Se connecter');
            ?>
        </form>
    </div>
</div>
<?php $content = ob_get_clean();
require('../template/template.php');
?>