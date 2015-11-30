<?php

	require("../includes/config.php");

	if (!isset($_GET["soc"]))
		redirect("home.php");

	if(!make_soc($_GET["soc"]))
		redirect("soc.php?soc=".$_GET["soc"]);

?>