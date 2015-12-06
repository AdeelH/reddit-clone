<script>
	$( document ).ready(function(){
		$(".downvote-active").addClass("btn-danger");
		$(".upvote-active").addClass("btn-success");
		$(".post-upvote").click(function() {
			var hasVoted = $(this).hasClass("btn-success");
		    $.ajax({
			    url: "post_vote.php",
			    data: {
			        post_id: this.value,
			        vote: hasVoted ? "UNVOTE":"UP"
			    },
			    type: "POST",
			    dataType : "json",
			    context: this,
			    success: function( json ) {
			    	if (hasVoted)
			    	{
				    	$(this).removeClass("btn-success").addClass("btn-default");
			    	}
			    	else
			    	{
				    	$("#post-down-"+this.value).removeClass("btn-danger").addClass("btn-default");
				    	$(this).removeClass("btn-default").addClass("btn-success");
				    }
			    },
			    error: function( xhr, status, errorThrown ) {
			        alert( "Sorry, there was a problem!" );
			        console.log( "Error: " + errorThrown );
			        console.log( "Status: " + status );
			        console.dir( xhr );
			    }
			});
		});
		$(".post-downvote").click(function() {
			var hasVoted = $(this).hasClass("btn-danger");
		    $.ajax({
			    url: "post_vote.php",
			    data: {
			        post_id: this.value,
			        vote: hasVoted ? "UNVOTE":"DOWN"
			    },
			    type: "POST",
			    dataType : "json",
			    context: this,
			    success: function( json ) {
			    	if (hasVoted)
			    	{
				    	$(this).removeClass("btn-danger").addClass("btn-default");
			    	}
			    	else
			    	{
				    	$("#post-up-"+this.value).removeClass("btn-success").addClass("btn-default");
				    	$(this).removeClass("btn-default").addClass("btn-danger");
			    	}
			    },
			    error: function( xhr, status, errorThrown ) {
			        alert( "Sorry, there was a problem!" );
			        console.log( "Error: " + errorThrown );
			        console.log( "Status: " + status );
			        console.dir( xhr );
			    }
			});
		});
	});
</script>
<div class="row container-fluid" style="">
	<div class="col-md-10 container-fluid">
		<div class="panel panel-default">
		<!-- Default panel contents -->
			<div class="panel-heading">News Feed</div>
			<div class="list-group panel-body">
				<?php 
					foreach($posts as $p)
					{
						echo "<div class=\"row\">";

						echo to_html(post_summary($p, $p["society"], true));

						echo "</div>";
						echo "<hr>";
					}
				?>
			</div>
		</div>
	</div>
	<div class="col-md-2 container-fluid">
		<?php
					
			// $fdiv = div(div(par("Create a new society"), "panel-heading"), "panel panel-primary");
			// $form = make_form("new_soc.php", "GET", "form-inline");
			// $form = add_field($form, "soc", "society", true, "form-control");
			// $form = add_button($form, "Create", "btn btn-default");
			// $fdiv["children"][] = div(div($form, "form-group"), "panel-body");
			
			// echo to_html($fdiv);

			$table = div(div(par("Subscribed societies"), "panel-heading"), "panel panel-primary");
			$table["children"][] = make_table($subs, ["society"], "table", "sub_socs", [], [0]);

			echo to_html($table);

		?>
	</div>
</div>