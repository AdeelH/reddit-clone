<?php

	// configuration
    require("../includes/config.php");
	
	verify_admin_status();
	
	if (isset($_GET["view"]) && strcasecmp($_GET["view"], "main") != 0)
	{		
		if (strcasecmp($_GET["view"], "bans") == 0)
			require("user_bans.php");
		elseif (strcasecmp($_GET["view"], "societies") == 0)
			require("soc_locks.php");
		elseif (strcasecmp($_GET["view"], "admins") == 0)
			require("admins.php");
		elseif (strcasecmp($_GET["view"], "log") == 0)
			require("admin_log.php");
		elseif (strcasecmp($_GET["view"], "ureps") == 0)
			require("user_reps.php");
		elseif (strcasecmp($_GET["view"], "sreps") == 0)
			require("soc_reps.php");
		else
			apologize("Nothing here");
	}
	else
	{
		
	}
	
?>