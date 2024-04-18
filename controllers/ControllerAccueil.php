<?php
class ControllerAccueil{
    private $_produitManager;
    private $_view;

    public function __construct($url)
    {
        if(isset($url) && count($url) > 1){
            throw new Exception('Page introuvable');
        }
        else{
            $this->Produits();
        }
    }

    private function Produits(){
        $this->_produitManager = new ProduitManager;
        $produits = $this->_produitManager->getProduits();

        require_once('views/ViewAccueil.php');
    }
}