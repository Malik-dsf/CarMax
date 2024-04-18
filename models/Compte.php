<?php

abstract class Compte{
    private $_id;
    private $_nom;
    private $_mdp;
    private $_role;
    private $_adresse;
    private $_codep;
    private $_tel;
    private $_mel;


    //Setters
    public function setNom($nom){
        if(is_string ($nom)){
            $this->_nom = $nom;
        } 
    }

    public function setMdp($mdp){
        if(is_string ($mdp)){
            $this->_mdp = $mdp;
        }
    }

    public function setAdresse($adresse){
        if(is_string ($adresse)){
            $this->_adresse = $adresse;
        }
    }

    public function setCodep($codep){
        if(is_string ($codep)){
            $this->_codep = $codep;
        }
    }


    //Getter
    public function getId(){
        return $this->_id;
    }

    public function getNom(){
        return $this->_nom;
    }
    public function getAdresse(){
        return $this->_adresse;
    }
    public function getCodep(){
        return $this->_codep;
    }
    
}