<?php
	
	$fdiv = div(div(par("Goto society"), "panel-heading"), "panel panel-primary");
	$form = make_form("soc.php", "GET", "form-inline");
	$form = add_field($form, "soc", "society", true, "form-control");
	$form = add_button($form, "Go", "btn btn-default");
	$fdiv["children"][] = div(div($form, "form-group"), "panel-body");
	
	echo to_html($fdiv);
	
	$fdiv = div(div(par("Create a new society"), "panel-heading"), "panel panel-primary");
	$form = make_form("new_soc.php", "GET", "form-inline");
	$form = add_field($form, "soc", "society", true, "form-control");
	$form = add_button($form, "Create", "btn btn-default");
	$fdiv["children"][] = div(div($form, "form-group"), "panel-body");
	
	echo to_html($fdiv);

	$table = div(div(par("Subscribed societies"), "panel-heading"), "panel panel-primary");
	$table["children"][] = make_table($subs, ["society", "subbed since"], "table");

	echo to_html($table);

?>
</div>