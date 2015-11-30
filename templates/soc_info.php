<div class="panel panel-default well">
	<div class="panel-heading"><h3>Info</h3></div>
	<div class="panel-body well">
		<?php 
			echo "<small><p>Latest revision by ".user_link($soc["r_name"]);
			echo " (".$soc["time"].")";
			echo "<p></small>";
			echo "<div class=\"well\"><p>".$soc["info"]."</p></div>";
		?>
	</div>
</div>