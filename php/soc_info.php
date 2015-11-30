<?php

	render_mult([
					"soc_common.php", 
					"soc_info.php"
				], 
				[
					"title"  => $soc["soc_name"],
					"soc"    => $soc,
					"status" => $status
				]
				);

?>