
<div class="container" style="width:300px">

	<form class="form-signin" action="login.php" method="post">
		<h2 class="form-signin-heading">Please sign in</h2>
		
		<label for="inputEmail" class="sr-only">Email address</label>
		<input name="username" type="text" id="inputEmail" class="form-control" placeholder="Username" required="" autofocus=""/>
		
		<label for="inputPassword" class="sr-only">Password</label>
		<input name="password" type="password" id="inputPassword" class="form-control" placeholder="Password" required=""/>
		<p><small>(password = 123 for user 'adeel' (admin account))</small></p>
		<div class="checkbox">
			<label>
			<input type="checkbox" value="remember-me"/> Remember me  </label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	</form>
	<div>
		or <a href="register.php">register</a>
	</div>
</div>
