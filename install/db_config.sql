SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

CREATE TABLE IF NOT EXISTS `droit` (
  `idDROIT` int(11) NOT NULL AUTO_INCREMENT,
  `DROITnom` varchar(45) DEFAULT NULL,
  `DROITdcr` date DEFAULT NULL,
  `DROITmark` varchar(45) DEFAULT NULL,
  `idGRBDROIT` int(11) NOT NULL,
  PRIMARY KEY (`idDROIT`),
  KEY `fk_DROIT_GRBDROIT1_idx` (`idGRBDROIT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

INSERT INTO `droit` (`idDROIT`, `DROITnom`, `DROITdcr`, `DROITmark`, `idGRBDROIT`) VALUES
(99, 'Page d''accueil', '2015-11-24', NULL, 25);

CREATE TABLE IF NOT EXISTS `droit_has_modul` (
  `idDROIT` int(11) NOT NULL AUTO_INCREMENT,
  `idMODUL` int(11) NOT NULL,
  PRIMARY KEY (`idDROIT`,`idMODUL`),
  KEY `fk_DROIT_has_MODUL_MODUL1_idx` (`idMODUL`),
  KEY `fk_DROIT_has_MODUL_DROIT1_idx` (`idDROIT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `droit_has_modul` (`idDROIT`, `idMODUL`) VALUES
(99, 433),
(99, 434),
(99, 435),
(99, 436),
(99, 437),
(99, 438),
(99, 439),
(99, 440),
(99, 441),
(99, 442),
(99, 443),
(99, 444);

CREATE TABLE IF NOT EXISTS `ent` (
  `idENT` int(11) NOT NULL AUTO_INCREMENT,
  `ENTcod` int(11) DEFAULT NULL,
  `ENTnom` varchar(45) DEFAULT NULL,
  `SRVidsup` int(11) DEFAULT NULL,
  `idHERA` int(11) DEFAULT NULL,
  PRIMARY KEY (`idENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `ent` (`idENT`, `ENTcod`, `ENTnom`, `SRVidsup`, `idHERA`) VALUES
(1, 1000, 'Administrateur', NULL, NULL);

CREATE TABLE IF NOT EXISTS `etat` (
  `idETAT` int(11) NOT NULL,
  `ETATnom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idETAT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `etat` (`idETAT`, `ETATnom`) VALUES
(21, 'Module dÃ©sactivÃ©'),
(22, 'Module activÃ©'),
(31, 'profil activÃ©'),
(32, 'profil dÃ©sactivÃ©');

CREATE TABLE IF NOT EXISTS `etatgen` (
  `idETAT` int(11) NOT NULL AUTO_INCREMENT,
  `ETAdesc` varchar(50) NOT NULL,
  `ETAparam` text NOT NULL,
  `ETAdatecr` datetime NOT NULL,
  PRIMARY KEY (`idETAT`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `exe` (
  `exe` int(11) NOT NULL,
  `idETAT` int(11) NOT NULL,
  PRIMARY KEY (`exe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `grbdroit` (
  `idGRBDROIT` int(11) NOT NULL AUTO_INCREMENT,
  `GRBDROITnom` varchar(45) DEFAULT NULL,
  `GRBDROITdcr` date DEFAULT NULL,
  PRIMARY KEY (`idGRBDROIT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `grbdroit` (`idGRBDROIT`, `GRBDROITnom`, `GRBDROITdcr`) VALUES
(25, 'Accueil', '2015-11-24');

CREATE TABLE IF NOT EXISTS `hera` (
  `idHERA` int(11) NOT NULL AUTO_INCREMENT,
  `HERAnom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idHERA`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mag` (
  `MAGCOD` int(11) NOT NULL,
  `MAGLIB` varchar(45) DEFAULT NULL,
  `MAGDCR` date DEFAULT NULL,
  `OPECOD` int(11) DEFAULT NULL,
  `OPEEXE` int(11) DEFAULT NULL,
  `TMAGCOD` int(11) DEFAULT NULL,
  `ETATCOD` int(11) NOT NULL,
  PRIMARY KEY (`MAGCOD`),
  KEY `fk_MAG_ETAT1_idx` (`ETATCOD`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `menu` (
  `idMENU` int(11) NOT NULL AUTO_INCREMENT,
  `MENUnom` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `MENUparent` int(11) DEFAULT NULL,
  `MENUmod` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `MENUicon` varchar(100) CHARACTER SET utf8 NOT NULL,
  `MENUmnseq` int(11) DEFAULT NULL,
  `MENUdcr` date DEFAULT NULL,
  PRIMARY KEY (`idMENU`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `modul` (
  `idMODUL` int(11) NOT NULL AUTO_INCREMENT,
  `MODULnom` varchar(45) DEFAULT NULL,
  `MODULpath` varchar(45) DEFAULT NULL,
  `MODULtask` varchar(45) DEFAULT NULL,
  `MODULmod` varchar(45) DEFAULT NULL,
  `MODULmnseq` varchar(45) DEFAULT NULL,
  `MODULdcr` date DEFAULT NULL,
  `MODULtype` varchar(45) DEFAULT NULL,
  `MODULcat` varchar(1) NOT NULL,
  `MODULicon` varchar(100) NOT NULL,
  `idMENU` int(11) NOT NULL,
  `MODULupdate` int(11) NOT NULL,
  `idETAT` int(11) NOT NULL,
  PRIMARY KEY (`idMODUL`),
  KEY `fk_MODUL_MENU1_idx` (`idMENU`),
  KEY `fk_MODUL_ETAT1_idx` (`idETAT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

INSERT INTO `modul` (`idMODUL`, `MODULnom`, `MODULpath`, `MODULtask`, `MODULmod`, `MODULmnseq`, `MODULdcr`, `MODULtype`, `MODULcat`, `MODULicon`, `idMENU`, `MODULupdate`, `idETAT`) VALUES
(348, 'crudmaker-index', 'crudmaker', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(349, 'crudmaker-asyn_get_shema_db2', 'crudmaker', 'asyn_get_shema_db2', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(350, 'crudmaker-asyn_get_shema_mysql', 'crudmaker', 'asyn_get_shema_mysql', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(351, 'crudmaker-asyn_compile', 'crudmaker', 'asyn_compile', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(352, 'login-index', 'login', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(353, 'etatgensys-index', 'etatgensys', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(354, 'etatgensys-asyn_get_config_etat', 'etatgensys', 'asyn_get_config_etat', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(355, 'etatgensys-asyn_get_shema_db2', 'etatgensys', 'asyn_get_shema_db2', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(356, 'etatgensys-asyn_get_shema_mysql', 'etatgensys', 'asyn_get_shema_mysql', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(357, 'etatgensys-asyn_get_base_mysql', 'etatgensys', 'asyn_get_base_mysql', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(358, 'etatgensys-asyn_get_table_mysql', 'etatgensys', 'asyn_get_table_mysql', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(359, 'etatgensys-asyn_get_table_column_mysql', 'etatgensys', 'asyn_get_table_column_mysql', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(360, 'etatgensys-asyn_compile', 'etatgensys', 'asyn_compile', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(361, 'gestion-index', 'gestion', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(362, 'gestion-asyn_get_supser', 'gestion', 'asyn_get_supser', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(363, 'gestion-asyn_get_srvlist', 'gestion', 'asyn_get_srvlist', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(364, 'gestion-asyn_aj_prf', 'gestion', 'asyn_aj_prf', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(365, 'gestion-asyn_get_prf', 'gestion', 'asyn_get_prf', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(366, 'gestion-asyn_sup_prf', 'gestion', 'asyn_sup_prf', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(367, 'gestion-asyn_aj_util', 'gestion', 'asyn_aj_util', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(368, 'gestion-asyn_get_allutil', 'gestion', 'asyn_get_allutil', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(369, 'gestion-asyn_get_util', 'gestion', 'asyn_get_util', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(370, 'gestion-asyn_ck_login', 'gestion', 'asyn_ck_login', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(371, 'gestion-asyn_modif_util', 'gestion', 'asyn_modif_util', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(372, 'gestion-asyn_sup_util', 'gestion', 'asyn_sup_util', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(373, 'gestion-asyn_autocomplete_user', 'gestion', 'asyn_autocomplete_user', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(374, 'gestion-asyn_serch_user', 'gestion', 'asyn_serch_user', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(375, 'gestion-asyn_ajout_menu', 'gestion', 'asyn_ajout_menu', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(376, 'gestion-asyn_get_allvu', 'gestion', 'asyn_get_allvu', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(377, 'gestion-asyn_get_menulist', 'gestion', 'asyn_get_menulist', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(378, 'gestion-asyn_menu_remove', 'gestion', 'asyn_menu_remove', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(379, 'gestion-asyn_module_cat', 'gestion', 'asyn_module_cat', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(380, 'gestion-asyn_module_renome', 'gestion', 'asyn_module_renome', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(381, 'gestion-asyn_modif_menu', 'gestion', 'asyn_modif_menu', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(382, 'gestion-asyn_modif_menu_menu', 'gestion', 'asyn_modif_menu_menu', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(383, 'gestion-asyn_modif_modul', 'gestion', 'asyn_modif_modul', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(384, 'gestion-asyn_ajout_menu_icone', 'gestion', 'asyn_ajout_menu_icone', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(385, 'gestion-asyn_modif_menu_position', 'gestion', 'asyn_modif_menu_position', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(386, 'gestion-_sub_menu_position', 'gestion', '_sub_menu_position', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(387, 'gestion-asyn_get_droit_list', 'gestion', 'asyn_get_droit_list', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(388, 'gestion-asyn_aj_droit', 'gestion', 'asyn_aj_droit', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(389, 'gestion-asyn_sup_droit', 'gestion', 'asyn_sup_droit', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(390, 'gestion-asyn_get_grbdoit_list', 'gestion', 'asyn_get_grbdoit_list', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(391, 'gestion-asyn_aj_grbdroit', 'gestion', 'asyn_aj_grbdroit', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(392, 'gestion-asyn_sup_grbdroit', 'gestion', 'asyn_sup_grbdroit', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(393, 'gestion-asyn_get_modul_list', 'gestion', 'asyn_get_modul_list', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(394, 'gestion-asyn_droit_moduls', 'gestion', 'asyn_droit_moduls', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(395, 'gestion-asyn_get_all_droits', 'gestion', 'asyn_get_all_droits', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(396, 'gestion-asyn_ajout_marqueur', 'gestion', 'asyn_ajout_marqueur', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(397, 'gestion-asyn_prf_droit', 'gestion', 'asyn_prf_droit', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(398, 'gestion-asyn_get_all_mag', 'gestion', 'asyn_get_all_mag', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(399, 'gestion-asyn_mag_prf', 'gestion', 'asyn_mag_prf', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(400, 'gestion-asyn_get_all_exe', 'gestion', 'asyn_get_all_exe', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(401, 'gestion-asyn_exe_prf', 'gestion', 'asyn_exe_prf', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(402, 'gestion-asyn_get_hist_action', 'gestion', 'asyn_get_hist_action', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(403, 'gestion-asyn_get_hist_action_ftr', 'gestion', 'asyn_get_hist_action_ftr', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(404, 'EditMenu-index', 'EditMenu', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(405, 'EditMenu-edit', 'EditMenu', 'edit', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(406, 'EditMenu-asyn_get_access_groupe', 'EditMenu', 'asyn_get_access_groupe', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(407, 'EditMenu-asyn_delete_item_access_list', 'EditMenu', 'asyn_delete_item_access_list', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(408, 'EditMenu-asyn_menu_affect', 'EditMenu', 'asyn_menu_affect', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(409, 'EditMenu-asyn_get_modules', 'EditMenu', 'asyn_get_modules', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(410, 'EditMenu-asyn_get_groupes', 'EditMenu', 'asyn_get_groupes', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(411, 'EditMenu-asyn_create_access_groupe_item', 'EditMenu', 'asyn_create_access_groupe_item', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(412, 'EditMenu-asyn_change_module_name', 'EditMenu', 'asyn_change_module_name', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(413, 'EditMenu-asyn_change_groupe_name', 'EditMenu', 'asyn_change_groupe_name', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(414, 'EditMenu-asyn_edit_access', 'EditMenu', 'asyn_edit_access', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(415, 'EditMenu-asyn_delete_menu_affectation', 'EditMenu', 'asyn_delete_menu_affectation', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(416, 'EditMenu-asyn_get_groupe_params', 'EditMenu', 'asyn_get_groupe_params', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(417, 'main-index', 'main', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(418, 'main-asyn_ajout_module', 'main', 'asyn_ajout_module', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(419, 'main-asyn_get_prim_function', 'main', 'asyn_get_prim_function', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(420, 'main-asyn_deconection', 'main', 'asyn_deconection', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(421, 'main-asyn_create_exception', 'main', 'asyn_create_exception', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(422, 'main-asyn_get_msg', 'main', 'asyn_get_msg', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(423, 'main-asyn_get_exception', 'main', 'asyn_get_exception', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(424, 'main-asyn_get_all_right', 'main', 'asyn_get_all_right', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(425, 'updateMod-index', 'updateMod', 'index', 'ad', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(426, 'updateMod-asyn_update_ad', 'updateMod', 'asyn_update_ad', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(427, 'updateMod-asyn_update_front', 'updateMod', 'asyn_update_front', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(428, 'updateMod-asyn_reset_update_state', 'updateMod', 'asyn_reset_update_state', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(429, 'updateMod-asyn_get_com_arborecense', 'updateMod', 'asyn_get_com_arborecense', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(430, 'updateMod-asyn_get_net_modul', 'updateMod', 'asyn_get_net_modul', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(431, 'updateMod-asyn_supp_perim_modul', 'updateMod', 'asyn_supp_perim_modul', 'ad', NULL, '2015-11-24', 'asyn', '', '', 0, 1, 21),
(432, 'Page de connection', 'login', 'index', 'front', NULL, '2015-11-24', 'vu', '', '', 0, 1, 21),
(433, 'Page d''accueil', 'main', 'index', 'front', NULL, '2015-11-24', 'vu', 'P', '', 0, 1, 21),
(434, 'Deconnection', 'main', 'asyn_deconection', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(435, 'RecupÃ©rer les paramÃ©tre de l''utilisateur', 'main', 'asyn_get_profil_det', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(436, 'RecupÃ©rer le nom de l''utilisateur', 'main', 'asyn_get_utilog', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(437, 'Sauvegarder les paramÃ©tre utilisateur', 'main', 'asyn_sauv_profil', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(438, 'Generer une exception', 'main', 'asyn_create_exception', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(439, 'RecupÃ©rer message', 'main', 'asyn_get_msg', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(440, 'RecupÃ©rer exception', 'main', 'asyn_get_exception', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(441, 'Changer Exercice', 'main', 'asyn_change_exe', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(442, 'Changer un magasin', 'main', 'asyn_change_mag', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(443, 'Exercice courant', 'main', 'asyn_get_curent_exe', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21),
(444, 'Lire tout les droits de l''utilisateur', 'main', 'asyn_get_all_right', 'front', NULL, '2015-11-24', 'asyn', 'P', '', 0, 1, 21);

CREATE TABLE IF NOT EXISTS `oper` (
  `idOPER` int(20) NOT NULL AUTO_INCREMENT,
  `idMODUL` int(20) NOT NULL,
  `actionOPER` varchar(100) NOT NULL,
  `descriptOPER` varchar(150) NOT NULL,
  `dateOPER` datetime NOT NULL,
  `catOPER` varchar(1) NOT NULL,
  `idPRF` int(20) NOT NULL,
  `IDUTIL` int(20) NOT NULL,
  `UTINOM` varchar(50) NOT NULL,
  `UTIPNOM` varchar(50) NOT NULL,
  `paramOPER` text NOT NULL,
  `ipOPER` varchar(20) NOT NULL,
  PRIMARY KEY (`idOPER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `prf` (
  `idPRF` int(11) NOT NULL AUTO_INCREMENT,
  `PRFnom` varchar(45) DEFAULT NULL,
  `PRFtype` int(11) DEFAULT NULL,
  `PRFdcr` date DEFAULT NULL,
  `idENT` int(11) NOT NULL,
  `PRFetat` int(11) NOT NULL,
  PRIMARY KEY (`idPRF`),
  KEY `fk_PRF_ENT1_idx` (`idENT`),
  KEY `fk_PRF_ETAT1_idx` (`PRFetat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

INSERT INTO `prf` (`idPRF`, `PRFnom`, `PRFtype`, `PRFdcr`, `idENT`, `PRFetat`) VALUES
(0, 'Supper administrateur', 2, '2015-11-24', 1, 31);

CREATE TABLE IF NOT EXISTS `prf_has_droit` (
  `idPRF` int(11) NOT NULL,
  `idDROIT` int(11) NOT NULL,
  PRIMARY KEY (`idPRF`,`idDROIT`),
  KEY `fk_PRF_has_DROIT_DROIT1_idx` (`idDROIT`),
  KEY `fk_PRF_has_DROIT_PRF1_idx` (`idPRF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `prf_has_exe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPRF` int(11) NOT NULL,
  `exe` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `prf_has_mag` (
  `idPRF` int(11) NOT NULL,
  `MAGCOD` int(11) NOT NULL,
  PRIMARY KEY (`idPRF`,`MAGCOD`),
  KEY `fk_PRF_has_MAG_MAG1_idx` (`MAGCOD`),
  KEY `fk_PRF_has_MAG_PRF1_idx` (`idPRF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `util` (
  `IDUTIL` int(11) NOT NULL AUTO_INCREMENT,
  `UTILOG` varchar(45) DEFAULT NULL,
  `UTIPWD` varchar(45) DEFAULT NULL,
  `UTINOM` varchar(45) DEFAULT NULL,
  `UTIPNOM` varchar(45) DEFAULT NULL,
  `UTIDCR` date DEFAULT NULL,
  `UTImat` decimal(10,0) DEFAULT NULL,
  `OPECOD` decimal(10,0) DEFAULT NULL,
  `OPEEXE` decimal(10,0) DEFAULT NULL,
  `PROFCOD` decimal(10,0) DEFAULT NULL,
  `ETATCOD` decimal(10,0) DEFAULT NULL,
  `idPRF` int(11) NOT NULL,
  PRIMARY KEY (`IDUTIL`),
  KEY `fk_UTIL_PRF1_idx` (`idPRF`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

