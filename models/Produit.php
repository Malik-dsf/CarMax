<?php
class Produit{

    private $_id;
    private $_nom;
    private $_prix;
    private $_img;
    private $_type;
    private $_motor;
    private $_carbu;
    private $_couleur;

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
    public function setId($id){
        $id = (int) $id;
        if($id > 0 ){
            $this->_id = $id;
        }
    }

    public function setNom($nom){
        if(is_string ($nom)){
            $this->_nom = $nom;
        } 
    }

    public function setPrix($prix){
        if(is_double ($prix)){
            $this->_prix = $prix;
        } 
    }

    public function setImg($img){
        if(is_string ($img)){
            $this->_img = $img;
        } 
    }


    //Getter
    public function getId(){
        return $this->_id;
    }

    public function getNom(){
        return $this->_nom;
    }
    public function getprix(){
        return $this->_prix;
    }
    public function getimg(){
        return $this->_img;
    }
    

}