<?php

	// configuration
    require_once("../includes/config.php");
	
	$regs = query("select count(*) regs, datediff(sysdate(), join_date) day
					from users 
					group by datediff(sysdate(), join_date)
					order by day desc
                    limit 30");
	$regs = ($regs);

	render_mult([
					"jq.php"
				],
				[
					"title"=> "Admin Log",
					"regs"=> $regs
			    ]
		   );
	
?>