<div class="span4 offset3" 
style="
background-color:#d9edf7; 
padding:40px;
background-color: #f7f7f9;
border: 1px solid #e1e1e8;
  -webkit-border-radius: 4px;
     -moz-border-radius: 4px;
          border-radius: 4px;
">
  <h1>Login</h1>
  <p>Please login or have you <a href="{$smarty.const.WWW_TOP}/forgottenpassword">forgotten</a> your password?</p>
  <p>
	<form class="form-horizontal" action="login" method="post">
		<table class="data">
		<input type="hidden" name="redirect" value="{$redirect|escape:"htmlall"}" />
		
		{if $error != ''}
			<div class="alert alert-error">
				<button type="button" class="close" data-dismiss="alert">&times;</button>
				  <h4>Error!</h4>
				  {$error}
			</div>
		{/if}
		<input class="span12" type="text" id="username prependedInput" value="{$username}" name="username" placeholder="Username" style="margin-bottom:5px;"><br />
		<input class="span12" id="password" name="password" type="password" placeholder="Password" style="margin-bottom:20px;"><br />
		
		<input id="rememberme" {if $rememberme == 1}checked="checked"{/if} name="rememberme" type="checkbox"/> <span class="help-inline" style="vertical-align:sub;">Remember me </span>
		<button type="submit" class="btn btn-success pull-right">Login</button>

		</table>
	</form>
  </p>
</div>

