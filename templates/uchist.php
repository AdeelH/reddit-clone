<script type="text/javascript">
  $(document).ready(function () {
    $('#uchist').DataTable();
    $('#uchist_wrapper').css({"padding":"10px"});
  });
</script>

<?php

	$table = div(div(par("Comment history"), "panel-heading"), "panel panel-primary");
	$table["children"][] = make_table($comms, ["text", "post", "society", "time"], "table", "uchist");

	echo to_html($table);

?>