<?php
session_start();
if (isset($_POST['seconnecter'])){
    $login=htmlentities($_POST['team_name']);
    $pass=$_POST['team_password'];
    $pass=md5($pass);

    include("include/login_bdd.php");
    $requete="select count(id) as nb, id, team_name, team_password, team_member, team_desc, team_logo, team_admin from equipes where team_name=:login and team_password=:pass GROUP BY id ;";
    $donnees=array(":login"=>$login,":pass"=>$pass);
    $resultat=$connexion->prepare($requete);
    $resultat->execute($donnees);

    $ligne=$resultat->fetch();
    if($ligne['nb']==0){
        header('Location: index.php?page=error');
    }else{
        $_SESSION['connected'] = 'yes';
        $_SESSION['team_name'] = $ligne['team_name'];
        $_SESSION['team_member'] = $ligne['team_member'];
        $_SESSION['team_desc'] = $ligne['team_desc'];
        $_SESSION['team_logo'] = $ligne['team_logo'];
        $_SESSION['team_admin'] = $ligne['team_admin'];
        $_SESSION['id'] = $ligne['id'];
        echo "<script type = 'text/javascript'>document.location.replace('/index.php?page=accueil');</script>";
        }
}
if (isset($_GET['page'])){
    if ($_GET['page'] == 'logout'){
        if (isset($_SESSION['connected'])){
            session_destroy();
            header('Location: index.php?page=accueil');
        }
    }
    if ($_GET['page'] == 'error'){
        $_SESSION['tentative']=$_SESSION['tentative']+1;
        if($_SESSION['tentative'] > 3){ header('Location: index.php?page=accueil'); }
    }

}
if (isset($_SESSION['team_name']) ){

            //Mode connecté
            // si rien est demande on affiche la page profil
           include('php/include/consult_profil.php');

}
else{
    //Mode non connecté
    //Controle compte actif puis @ip valide

    //en cas de deconnection ou de login invalide on affiche un message
    if (isset($_GET['page']) and ($_GET['page'] == 'logout')){
        ?><center><div class="alert alert-info" role="alert">Au revoir !</div></center><?php
    }
    if (isset($_GET['page']) and ($_GET['page'] == 'error')){
        ?><center><div class="alert alert-danger" role="alert">Veuillez verifier vos identifiants</div></center><?php
    }
    ?>
<div class="container">
            <div class="col-md-8">
                 <div class="text-center">
                <img style="width: 100%;" src="ressources/CapturTheFlag-Banner.png"  />
                </div>
            </div>
            <div class="col-md-4">
                <form method="post" action="/index.php?page=accueil">
                    <div class="form-group">
                        <label for="Email">
                            Pseudo d'équipe
                        </label>
                        <input type="text" class="form-control" name="team_name" placeholder="Nom de l'équipe" required="required"/>
                    </div>
                    <div class="form-group">

                        <label for="Password">
                            Mot de passe
                        </label>
                        <input type="password" class="form-control" name="team_password" placeholder="Mot de passe" required="required"/>
                    </div>
                    <button name="seconnecter" type="submit" class="btn btn-primary btn-block">
                        Se connecter
                    </button>
                </form>
            </div>
        <br>
        <br>
</div>
<br>
<br>
    <div class="container">
        <!--JAMBOTRON-->
        <div>
  	<legend>Notre CTF étant terminé, retrouvez ci-dessous notre vidéo de présentation</legend>
  	<center>
    	<iframe src="https://www.youtube.com/embed/I_C0zCHU9ts" allow="autoplay; encrypted-media" allowfullscreen="" style="margin-left: auto;margin-right: auto;" frameborder="0" width="854" height="480"></iframe>
    	</center><br><br>
	</div>

        <div class="row">
            <div class="col-md-4">
                <div class="jumbotron well">
                    <h2>
                        <img src="ressources/challenge.png" alt="CTF all the day"/> Challenges
                    </h2>
                    <p class="text-justify">
                        Plusieurs centaines de challenges sont à votre disposition pour vous entrainer dans des environnements variés, non simulés et maitriser un grand nombre de techniques de hack !
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="jumbotron well">
                    <h2>
                        <img src="ressources/environnement_virtuel.png" alt="CTF all the day"/> Environnements Virtuels
                    </h2>
                    <p class="text-justify">
                        Des dizaines d'environnements virtuels sont à votre disposition, accessibles en quelques clics, pour vous offrir un terrain de jeu toujours plus réaliste, sans aucune limitation.
                    </p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="jumbotron well">
                    <h2>
                        <img src="ressources/solution.png" alt="CTF all the day"/> Solutions
                    </h2>
                    <p class="text-justify">
                        Chaque challenge est associé à une multitude de solutions, de ressources associées vous permettant d'apprendre et de voir le raisonnement suivi par d'autres internautes.
                    </p>
                </div>
            </div>
        </div>
        <!--CAROUSEL-->
        <br><br>
        <div class="row">
            <div class="col-md-8 col-md-offset-2">
                <div class="carousel slide" data-ride="carousel" id="carousel-24612">
                    <div class="carousel-inner">
                        <div class="item">
                            <img alt="Bouygues" src="ressources/bouygues.png" style=""/>
                            <div class="carousel-caption">

                            </div>
                        </div>
                        <div class="item active">
                            <img alt="Laposte" src="ressources/laposte.jpg" style=""/>
                            <div class="carousel-caption">

                            </div>
                        </div>
                        <div class="item">
                            <img alt="Orange" src="ressources/orange.jpg" style=""/>
                            <div class="carousel-caption">

                            </div>
                        </div>
                        <div class="item">
                            <img alt="Econocom" src="ressources/econocom.jpg" style=""/>
                            <div class="carousel-caption">

                            </div>
                        </div>
                    </div> <a class="left carousel-control" href="#carousel-24612" data-slide="prev"><span class="glyphicon"></span> </a> <a class="right carousel-control" href="#carousel-24612" data-slide="next"><span class="glyphicon"></span></a>
                </div>
            </div>
        </div>
<?php
}
?></div>
