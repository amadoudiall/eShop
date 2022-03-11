<?php
session_start();

if(!empty($_SESSION['user'])){
    session_destroy();
}

if(isset($_SESSION['user'])){
    $msg = "Vous etes déjà connecté a un compte !";
    header('location: ../index.php?msg='.$msg);
}
require('../src/Controller/Database.php');
require('../src/Controller/Entity/User.php');
require('../src/Controller/Inscription.php');
require('../src/HTML/Form.php');
require('../src/HTML/bootstrapForm.php');

$inscription = new subscribUser();

if (isset($_POST['inscription'])) {
    $inscription->Subscrib();
}
session_start();
if(!empty($_SESSION['user'])){
    header('location: /');
}
$title = "Inscription";
ob_start();
?>
<div class="inscription">
    <div class="form">

        <?php $form = new bootstrapForm($_POST);
        $erreur = $inscription->getErreur();
        if (isset($erreur)) {
            echo $erreur;
        } ?>
        <form class="form-material" action="" method="post">
            <?php
            echo $form->input('text', 'nom', 'Nom');
            echo $form->input('text', 'prenom', 'Prénom');
            echo $form->input('number', 'age', 'Âge');
            echo $form->input('text', 'adresse', 'Adresse');
            echo $form->input('tel', 'tel', 'Téléphone');
            echo $form->input('email', 'email', 'E-mail');
            echo $form->inputPassword('pwd', 'Nouveau mot de passe');
            echo $form->inputPassword('pwdc', 'Confirmer le mot de passe');
            echo $form->submit('inscription', 'S\'inscrire');
            ?>
        </form>
    </div>
</div>
<?php $content = ob_get_clean();
require('../template/template.php');
?>