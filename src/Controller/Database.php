<?php
class Database{
    public $host = 'mysql:host=localhost;dbname=eShop;charset=utf8';
    public $username = 'root';
    public $password = 'root';
    public $database;
    

    public function connect()
    {

        try {

            $connect = new \PDO(
                'mysql:host=localhost;dbname=eShop;charset=utf8',
                'root',
                'root'
            );
        } catch (\PDOException $exception) {

            echo $exception->getMessage();
            exit('Erreur de connexion à la base de données');
        }

        return $connect;
    }
}