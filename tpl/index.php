<!DOCTYPE html>
<html>
    <head>
        <title>Gestion des achats de la transtu </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Header -->
        <?php self::getHead(); ?>


    </head>
    <body class="nav-md">
           <div class="preload">
            <img  class="preloadimg" src="<?php echo SCRIPTROOT . "/lib/img/bigRotLoader.gif"; ?>" />
        </div>
        <div class="container body" id="flscr" >
            <div class="main_container" >
                <div class="col-md-3 left_col">
                    <div class="left_col scroll-view">
                        <div class="navbar nav_title" style="border: 0;">
                            <a href="<?php echo WEBROOT ?>main" class="site_title"><i class="fa fa-train"></i> <span> G.Achat </span> </a>
                        </div>

                        <div class="clearfix"></div>

                        <!-- menu profile quick info -->
                        <?php
                        $nom = Zend_Auth::getInstance()->getIdentity()->UTINOM;
                        $pnom = Zend_Auth::getInstance()->getIdentity()->UTIPNOM;
                        ?>
                        <div class="profile">
                            <div class="profile_pic">
                                <img src="<?php echo WEBROOT ?>/lib/css/images/User.png" alt="..." class="img-circle profile_img">
                            </div>
                            <div class="profile_info">
                                <span>Bienvenu,</span>
                                <h2><?php echo $nom . " " . $pnom; ?></h2>
                            </div>
                        </div>
                        <!-- /menu profile quick info -->

                        <br />

                        <!-- sidebar menu -->
                        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                            <div class="menu_section">
                                <?php self::menu(); ?>
                            </div>
                            <div class="menu_section">
                                <?php self::util_bar(); ?>
                            </div>
                        </div>
                        <!-- /sidebar menu -->

                        <!-- /menu footer buttons -->
                        <div class="sidebar-footer hidden-small">
                            <a data-toggle="tooltip" data-placement="top" title="Settings">
                                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Lock">
                                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                            </a>
                            <a data-toggle="tooltip" data-placement="top" title="Logout">
                                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                            </a>
                        </div>
                        <!-- /menu footer buttons -->


                    </div>
                </div>

                <div class="top_nav">

                    <div class="nav_menu">
                        <nav class="" role="navigation"> 
                            <div class="nav toggle">
                                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                            </div>
                            <div class="nav navbar-nav navbar-left navbar-breacrumb">
                                <ol class="breadcrumb inblock">
                                    <?php self::chemin(); ?>
                                </ol>
                                <span style="font-size: 22px;top: 5px;" class="glyphicon glyphicon-menu-right" ></span>
                               
                               
                            </div>

                            <ul class="nav navbar-nav navbar-right">
                                <li class="">
                                    <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                        <?php echo $nom; ?>
                                        <span class=" fa fa-angle-down"></span>
                                    </a>
                                    <ul class="dropdown-menu dropdown-usermenu pull-right">

                                        <li>
                                            <a href="javascript:;"  id="editprofil">
                                                <span>Changement de mot de passe</span>
                                            </a>
                                        </li>
                                        <li><a href="javascript:;"  id="deconection" ><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                                        </li>
                                    </ul>
                                </li>

                                <li role="presentation" class="dropdown">
                                    <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                                        <i class="fa fa-envelope-o"></i>
                                        <span class="badge bg-green">6</span>
                                    </a>
                                    <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                                        <li>
                                            <a>
                                                <span class="image">
                                                    <img src="images/img.jpg" alt="Profile Image" />
                                                </span>
                                                <span>
                                                    <span>John Smith</span>
                                                    <span class="time">3 mins ago</span>
                                                </span>
                                                <span class="message">
                                                    Film festivals used to be do-or-die moments for movie makers. They were where...
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                               
                                <li>
                                    <div class="ajaxspin">
                                        <img src="<?php echo SCRIPTROOT . "/lib/img/load.gif"; ?>" /> 
                                    </div>
                                </li>
                                
                                 <li class="leftli">
                                     <?php self::rendermodhead() ?>
                                </li>
                            </ul>
                        </nav>
                    </div>

                </div>



                <!-- Bare de navigation -->


                <!-- Message du system -->



                <div class="right_col bgimg" role="main">
                    <?php echo self::message(); ?>
                    <?php self::renderCom(); ?>
                    <div class="clearfix"></div>
                </div>


                <footer>

                </footer>



            </div>


    </body>
</html>
