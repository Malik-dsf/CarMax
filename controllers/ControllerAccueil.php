<?php
class ControllerAccueil{
    private $_produitManager;
    private $_view;

    public function __construct($url)
    {
        if(isset($url) && is_array($url) && count($url) > 1){
            throw new Exception('Page introuvable');
        }
        else{
            $this->produits();
        }
    }

    private function produits(){
        $this->_produitManager = new ProduitManager;
        $produits = $this->_produitManager->getProduits();
        require_once('views/ViewAccueil.php');
    }
}