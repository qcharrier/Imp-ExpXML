<?php
include '../fonctions/fct_Import.php';
include '../fonctions/fct_Export.php';
?>
<HTML>
    <HEAD>
        <TITLE>Gestion d'un fichier XML</TITLE>
    </HEAD>
    <BODY>
        <h1>Rechercher un fichier :</h1>
        <form method="post" action=".?page=affichageXML" >
            <input type="file" name="fichierXML" id="fichierXML" /><br />
            <input type="submit" name="submit" value="Envoyer" />
        </form>
    </BODY>
<HTML>