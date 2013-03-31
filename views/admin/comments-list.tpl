<div class="page-header">
	<h2>{$page->title}</h2>
</div>

{if $commentslist}
{$pager}

<table class="data Sortable highlight table table-striped">

	<tr>
		<th>user</th>
		<th>date</th>
		<th>comment</th>
		<th>host</th>
		<th>options</th>
	</tr>

	
	{foreach from=$commentslist item=comment}
	<tr class="{cycle values=",alt"}">
		<td><a href="{$smarty.const.WWW_TOP}/user-edit.php?id={$comment.userID}">{$comment.username}</a></td>
		<td title="{$comment.createddate}">{$comment.createddate|date_format}</td>
		<td>{$comment.text|escape:"htmlall"|nl2br}</td>
		<td>{$comment.host}</td>
		<td>
			<div class="btn-group">
				<a class="btn btn-mini" href="{$smarty.const.WWW_TOP}/../details/{$comment.guid}#comments">view</a> 
				<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/comments-delete.php?id={$comment.ID}">delete</a>
			</div>
		</td>
	</tr>
	{/foreach}


</table>
{else}
	<div class="alert">
	    <button type="button" class="close" data-dismiss="alert">&times;</button>
	    <h4>Sorry!</h4>
	        No comments available.
	</div>
{/if}
