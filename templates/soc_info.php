
<div class="panel panel-default well">
	<div class="panel-heading">
		<div class="row">
			<h3 class="col-md-3">Info</h3>
			<div class="col-md-9" style="float:right;">
				<a class="btn btn-default" data-toggle="modal" data-target="#soc-info-edit"  style="float:right;">Edit</a>
			</div>
		</div>
	</div>
	<div class="panel-body well">
		<?php 
			if ($soc["info"])
			{
				echo "<small><p>Latest revision by ".u($soc["r_name"]);
				echo " (".$soc["time"].")";
				echo "<p></small>";
				echo "<div class=\"well\"><p>".$soc["info"]."</p></div>";
			}
		?>
	</div>
</div>

<div id="soc-info-edit" class="modal fade">
	<div class="modal-dialog" role="form">
		<div class="modal-content">
			<div class="modal-header">
				<a class="close" data-dismiss="modal">×</a>
				<h3>Edit</h3>
			</div>
			<form id="soc-info-form" class="" method="POST" action="soc_info.php" >
				<div class="modal-body">
					<div class="form-group">
						<input name="soc_id" class="form-control hidden" value=<?php echo $soc["soc_id"]; ?> hidden readonly>
						<input name="soc_name" class="form-control hidden" value=<?php echo $soc["soc_name"]; ?> hidden readonly>
					</div>
					<div class="form-group">
						<textarea name="info" class="form-control" rows="" placeholder=""><?php echo $soc["info"]; ?></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<input class="btn btn-default" type="submit" value="Submit" id="new_post">
					<a href="#" class="btn" data-dismiss="modal">Cancel</a>
				</div>
			</form>
		</div>
	</div>
</div>