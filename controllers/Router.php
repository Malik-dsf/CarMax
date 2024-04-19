<?php

class Router{
    private $_ctrl;
    private $_view;

    public function routeReq()
    {
        try
        {
            //chargement auto des classes
            spl_autoload_register(function($class){
                require('models/'.$class.'php');
            });
            
            $url = '';

            //le controller est inclu selon l'action de l'utilisateur
            if(isset($_GET['url'])){
                $url = explode('/',filter_var($_GET['url'],FILTER_SANITIZE_URL));

                $controller = ucfirst(strtolower($url[0]));
                $controllerClass = "Controller".$controller;
                $controllerFile = "controllers/".$controllerClass.".php";

                if(file_exists(($controllerFile)))
                {
                    require_once($controllerFile);
                    $this->_ctrl = new $controllerClass($url);
                }
                else{
                    throw new Exception(('Page introuvable'));
                }
            }
            else{
                require_once('controllers/ControllerAccueil.php');
                $this->_ctrl = new ControllerAccueil($url);
            }
        }
        //gestion des erreurs
        catch(Exception $e){
            $errorMsg = $e->getMessage();
            require_once('views/viewError.php');
        }
    }

}