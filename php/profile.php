<?php

	render_mult([	"user_common.php",
					"profile.php"
				],
				[
					"title" => $u["username"]."'s Profile",
					"u" => $u,
					"pg" => "user.php?u=".$u["username"],
					"self" => $self,
					"u" => $u
				]);

?>