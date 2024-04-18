<?php
class CompteManagers extends Model{

    public function getCompte(){
        $this->getBdd();
        return $this->getAll('comptes', 'Compte');
    }
}