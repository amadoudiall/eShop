<?php
$title = "Accueil";
ob_start();
?>

<h1>Acceuil</h1>

<?php
$content = ob_get_clean();
require('./template/template.php');

?>