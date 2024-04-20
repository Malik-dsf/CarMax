<?php
class CompteManager extends Model{

    public function getCompte(){
        $this->getBdd();
        return $this->getAll('comptes','Compte','id_compte');
    }
}