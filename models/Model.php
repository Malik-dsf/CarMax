<?php


abstract class Model{
    private static $_bdd;
    //instancie la connection a la bdd
    private static function setBdd(){
        self::$_bdd = new PDO('mysql:host=localhost;dbname=carmax;charset=utf8,root,');
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
        $req = self::$_bdd->prepare('SELECT * FROM ' .$table.' ORDER BY id desc');
        $req->execute();
        while($data = $req->fetch(PDO::FETCH_ASSOC)){
            $var[] = new $obj($data);
        }
        return $var;
        $req->closeCursor();
    }
}


?>