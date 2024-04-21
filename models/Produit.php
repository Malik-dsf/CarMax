<?php
class Produit{

    private $_id_prod;
    private $_nom_prod;
    private $_prix_prod;
    private $_img_prod;
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
    public function setId($id_prod){
        $id_prod = (int) $id_prod;
        if($id_prod > 0 ){
            $this->_id_prod = $id_prod;
        }
    }

    public function setNom($nom){
        if(is_string ($nom)){
            $this->_nom_prod = $nom;
        } 
    }

    public function setPrix($prix){
        if(is_double ($prix)){
            $this->_prix_prod = $prix;
        } 
    }

    public function setImg($img){
        if(is_string ($img)){
            $this->_img_prod = $img;
        } 
    }


    //Getter
    public function getId(){
        return $this->_id_prod;
    }

    public function getNom(){
        return $this->_nom_prod;
    }
    public function getprix(){
        return $this->_prix_prod;
    }
    public function getimg(){
        return $this->_img_prod;
    }
    

}