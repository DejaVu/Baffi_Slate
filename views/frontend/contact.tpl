<div class="page-header">
	<h1>{$page->title}</h1>
</div>

<h4>Getting in touch</h4>

<p>
	<div class="alert alert-info">
		Please email any questions or comments you have in an email to {mailto address=$site->email text=$site->title}.
	</div>
</p>

{if $msg != ""}
<div class="alert alert-success">
	<center>{$msg}</center>
</div>

{else}
<div class="span5 offset2 well well-small" style="padding:40px;">
	<h4>Contact form</h4>
	<p>
		Alternatively use our contact form to get in touch.
	</p>

	<form class="form-horizontal" method="post" action="contact-us">
		<div class="control-group">
			<label class="control-label" for="username">Your name:</label>
			<div class="controls">
				<input id="username" type="text" name="username" value="" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="username">Your email address:</label>
			<div class="controls">
				<input type="text" name="useremail" value="" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="username">Your comment or review:</label>
			<div class="controls">
				<textarea rows="10" cols="40" name="comment"></textarea>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<input class="btn btn-inverse" type="submit" value="Submit" />
			</div>
		</div>
	</form>
</div>
{/if}
