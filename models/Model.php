<?php
abstract class Model{
    private static $_bdd;

    //instancie la connection a la bdd
    private static function setBdd(){
        $host = 'localhost'; // Adresse du serveur de base de données
        $dbname = 'carmax'; // Nom de la base de données
        $username = 'root'; // Nom d'utilisateur de la base de données
        $password = ''; // Mot de passe de la base de données
        self::$_bdd = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
        self::$_bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
    }
    //récupère la connection a la bdd
    protected function getBdd(){
        if(self::$_bdd == null){
            $this->setBdd();
        }
        return self::$_bdd;
    }

    protected function getAll($table,$obj){
        $var = [];
        $req = self::$_bdd->prepare('SELECT * FROM ' .$table);
        $req->execute();
        while($data = $req->fetch(PDO::FETCH_ASSOC)){
            $var[] = new $obj($data);
        }
        return $var;
        $req->closeCursor();
    }
}


?>