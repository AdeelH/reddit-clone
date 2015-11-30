<?php

	// configuration
    require_once("../includes/config.php");

	if (!am_admin())
	{
		apologize("Access Denied.");
	}

	$title = "Admin Panel";
	static $admap = [
						"bans" 	 => "user_bans.php",
						"locks" 	 => "soc_locks.php",
						"admins" => "admins.php",
						"log"    => "admin_log.php",
						"ureps"  => "user_reps.php",
						"sreps"  => "soc_reps.php"
					];

	if (isset($_GET["view"]) && array_key_exists($_GET["view"], $admap))
		require($admap[$_GET["view"]]);
	else
		require("admins.php");
	
?>