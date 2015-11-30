<?php

    // configuration
    require("../includes/config.php"); 
	
	verify_access();

	$subs = get_subbed_socs();
	
	render("home.php", ["title" => "Home", "subs" => $subs]);
  
?>