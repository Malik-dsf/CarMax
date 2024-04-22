<?php
require_once('views/View.php');

class ControllerAccueil{
    private $_produitManager;
    private $_view;

    public function __construct($url)
    {
        if(isset($url) && count($url) > 1){
            throw new Exception('Page introuvable');
        }
        else{
            $this->produits();
        }
    }

    private function produits(){
        $this->_produitManager = new ProduitManager;
        $produits = $this->_produitManager->getProduits();
        
        $this->_view = new View('Accueil');
        $this->_view->generate(array('produits'=>$produits));
    }
}