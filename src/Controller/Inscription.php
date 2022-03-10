<?php
class subscribUser{
    public $erreur;
    public $success;
    
    public function Subscrib(){
        // Verifier si la formulaire a été remplis
        if(isset($_POST['nom']) AND !empty($_POST['nom']) 
        AND isset($_POST['prenom']) AND !empty($_POST['prenom'])
        AND isset($_POST['age']) AND !empty($_POST['age'])
        AND isset($_POST['adresse']) AND !empty($_POST['adresse'])
        AND isset($_POST['tel']) AND !empty($_POST['tel'])
        AND isset($_POST['email']) AND !empty($_POST['email'])
        AND isset($_POST['pwd']) AND !empty($_POST['pwd'])
        AND isset($_POST['pwdc']) AND !empty($_POST['pwdc'])
        ){
            $nom = htmlspecialchars($_POST['nom']);
            $prenom = htmlspecialchars($_POST['prenom']);
            $age = htmlspecialchars($_POST['age']);
            $adresse = htmlspecialchars($_POST['adresse']);
            $tel = htmlspecialchars($_POST['tel']);
            $email = htmlspecialchars($_POST['email']);
            $pwd = htmlspecialchars($_POST['pwd']);
            $pwdc = htmlspecialchars($_POST['pwdc']);


        }else{
            $this->setErreur('Tout les champs sont obligatoire !');
        }
    }

    /**
     * Get the value of erreur
     */ 
    public function getErreur()
    {
        return $this->erreur;
    }

    /**
     * Set the value of erreur
     *
     * @return  self
     */ 
    public function setErreur($erreur)
    {
        $this->erreur = $erreur;

        return $this;
    }

    /**
     * Get the value of success
     */ 
    public function getSuccess()
    {
        return $this->success;
    }

    /**
     * Set the value of success
     *
     * @return  self
     */ 
    public function setSuccess($success)
    {
        $this->success = $success;

        return $this;
    }
}
?>