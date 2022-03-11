<?php

session_start();

class Connection
{

    protected $erreur;
    protected $success;

    public function Login()
    {
        if (
            isset($_POST['username']) and isset($_POST['pwd'])
            and !empty($_POST['username']) and !empty($_POST['pwd'])
        ) {
            $username = htmlspecialchars($_POST['username']);
            $pwd = sha1($_POST['pwd']);

            $users = new User();
            $result = $users->getUserByLogin($username, $pwd);

            if ($result != null) {
                if ($result['email'] == $username or $result['tel'] == $username) {

                    if ($result['pwd'] === $pwd) {
                        $_SESSION['user'] = $result;

                        header('location: /');
                    } else {
                        $this->setErreur('Mot de passe incorecte !');
                    }
                } else {
                    $this->setErreur('Téléphone, E-mail incorecte !');
                }
            }else{
                $this->setErreur('Identifiant incorrecte !');
            }
        } else {
            $this->setErreur('Veuillez remplire tout les champs !');
        }
    }

    public function setErreur($erreur)
    {
        $this->erreur = $erreur;
    }

    public function getErreur()
    {
        return $this->erreur;
    }

    public function Logout()
    {
        unset($_SESSION['user']);
    }
}
