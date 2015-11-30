<?php

	require("../includes/config.php");

	if (!isset($_POST["del_post_id"]))	apologize("Post not specified.");

	session_start();

	if (del_post($_POST["del_post_id"], $_GET["soc"], $_POST["del_post_reason"]) === false)
		apologize("Something went wrong.");

	redirect("post.php?soc=".$_GET["soc"]);

?>