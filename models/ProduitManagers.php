<?php
class ProduitManager extends Model{

    public function getProduits(){
        $this->getBdd();
        return $this->getAll('produits', 'Produit');
    }
}