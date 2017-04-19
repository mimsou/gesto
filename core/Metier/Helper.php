<?php

class Metier_Helper {

    private static $_instance = null;

    private function __construct() {
        //definire la date d'exercice actuel
    }
    
    
    public static function get_exercice($exe = "") {

        $db = Model::getDb();
        $idprf = Zend_Auth::getInstance()->getIdentity()->idPRF;
        
        $tables = new Zend_Db_Table('exe');
        $tablesrel = new Zend_Db_Table('prf_has_exe');

        $qrexe = $tables->select();
        $rsexe = $qrexe->query();
        $exelist = $rsexe->fetchAll();
        $exes = array();

        foreach ($exelist as $item) {

            if ($item["idETAT"] != 51) {

                $qrrel = $tablesrel->select()->where("exe = ?", $item["exe"])->where("idPRF = ?", $idprf);
                $rsrel = $qrrel->query();
                $droirel = $rsrel->fetchAll();

                if (!empty($droirel)) {
                    array_push($exes, $item["exe"]);
                }
            } else {
                array_push($exes, $item["exe"]);
            }
        }

        if (empty($exe)) {
            arsort($exes);
            return $exes;
        } else {
            
            if (in_array($exe, $exes)) {
                return $exe;
            } else {
                Message::set_info_msg("Vous n'avez pas l'autorisation de modifier sur cet exercice");
                echo json_encode(array("etat" => "1"));
                die();
            }
        }
    }

    public static function getInstance() {
        if (is_null(self::$_instance)) {
            self::$_instance = new Metier_Bc();
        }
        return self::$_instance;
    }

    public static function mk_cod($param) {
        $code = "";
        foreach ($param as $item) {
            if ($item[1] !== false) {
                $code .= substr($item[0], $item[1], $item[2]);
            } else {
                $code .= $item[0];
            }
        }
        return $code;
    }

}
