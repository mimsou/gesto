<?php

class mainframe {

    public $vars = 1;

// initialisation de l'application
    public function init() {

        require PATH_ROOT . DS . 'core/application/config.php';
        config::init();
        //Model::addConnections();
        
    }

    public function render() {

        Exceptions::init();
        View::init();

        // recupérer les variable de l'url
        $param = controler::get_params();

        //controlleur
        $ctl = $param[0];

        //action
        $task = isset($param[1]) ? $param[1] : 'index';
        $task = !empty($task) ? $task : "index";

        //controle d'identification
        if ($ctl != "login" && $task != "asyn_get_all_right")
            controler::checkAcess($param);

        define('CTL', $ctl);

        define('TASK', $task);

        if (controler::has_params("opt") && file_exists(BASE_PATH . DS . 'com/' . $ctl . "/" . $ctl . '.php')) {

            require (BASE_PATH . DS . 'com/' . $ctl . "/" . $ctl . '.php');

            $controle = new $ctl();

            //si controlleur (action) existe passer a excution
            if (method_exists($controle, $task)) {
                if (strpos($task, "asyn_") !== false) {
                    $request = new Zend_Controller_Request_Http();
                    if ($request->isXmlHttpRequest()) {
                        $controle->$task();
                        controler::journalise($param);
                    } else {
                        Exceptions::setLastException(Exceptions::getExceptionByCode(1003));
                        controler::redirectphp(WEBROOT . "main");
                    }
                } else {
                    $controle->$task();
                    controler::journalise($param);
                }
            } else {
                Exceptions::setLastException(Exceptions::getExceptionByCode(1002));
                controler::redirectphp(WEBROOT . "main");
            }
        } else {
            Exceptions::setLastException(Exceptions::getExceptionByCode(1002));
            controler::redirectphp(WEBROOT . "main");
        }
    }

}

?>
