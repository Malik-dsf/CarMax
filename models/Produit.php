<?php
class Produit{


    //(faut que ça soit = au nom dans la bdd)
    private $id_prod;
    private $nom_prod;
    private $prix_prod;
    private $img_prod;
    private $_type_prod;
    private $_motor_prod;
    private $_carbu_prod;
    private $_couleur_prod;

    //constructeur
    public function __construct(array $data)
    {
        $this->hydrate($data);
    }

    //hydratation (attribution des données)
    public function hydrate(array $data){
        foreach($data as $key => $value){
            $method = 'set'.ucfirst($key);

            if(method_exists($this,$method)){
                $this->$method($value);
            }
        }
    }

    //Setters
    //(ici aussi = au nom dans la bdd)
    public function setId_prod($id_prod){
        $id_prod = (int) $id_prod;
        if($id_prod > 0 ){
            $this->id_prod = $id_prod;
        }
    }

    public function setNom_prod($nom){
        if(is_string ($nom)){
            $this->nom_prod = $nom;
        } 
    }

    public function setPrix_prod($prix){
        if(is_double ($prix)){
            $this->prix_prod = $prix;
        } 
    }

    public function setImg_prod($img){
        if(is_string($img)){
            $this->img_prod = $img;
        } 
    }


    //Getter
    public function getId(){
        return $this->id_prod;
    }

    public function getNom(){
        return $this->nom_prod;
    }
    public function getprix(){
        return $this->prix_prod;
    }
    public function getimg(){
        return $this->img_prod;
    }
    

}