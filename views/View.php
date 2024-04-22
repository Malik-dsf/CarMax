<?php
class View{
    private $_file;
    private $_t; //titre

    public function __construct($action)
    {
        $this->_file = 'views/view'.$action.'.php';
    }

    //génère + affiche la vue
    public function generate($data)
    {
        //partie vue
        $content = $this->generateFile($this->_file,$data);

        // partie template
        $view = $this->generateFile('views/template.php', array('t'=> $this->_t,'content'=>$content));
    }

    //génère un fichier vue + renvoie le resultat produit
    private function generateFile($file,$data){
        if(file_exists($file)){
            extract($data);

            ob_start(); //mise en tampon

            require $file;

            return ob_get_clean(); //fin de la mise en tampon
        }
        else{
            throw new Exception('Fichier '.$file.' introuvable');
        }
    }
}