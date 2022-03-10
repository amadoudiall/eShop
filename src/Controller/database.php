<?php
class database{
    const HOST = "mysql:host=localhost;dbname=eShop;charset=utf8";
    const USERNAME = "root";
    const PASSWORD = "root";

    public function connect(){
        
        if($this->database === null){
            try {

                $this->database = new PDO(
                    HOST,
                    USERNAME,
                    PASSWORD
                );
                $this->database->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

            } catch (PDOException $exception) {
    
                echo $exception->getMessage();
                exit('Erreur de connexion à la base de données');
            }
        }
    }
}