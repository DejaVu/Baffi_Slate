<div class="page-header">
	<h2>{$page->title}</h2>
</div>

<table class="data Sortable highlight table table-striped">

	<tr>
		<th width="60">ordinal</th>
		<th width="30">id</th>
		<th>title</th>
		<th>url</th>
		<th>type</th>
		<th>status</th>
		<th>role</th>
		<th>in menu</th>
		<th>body</th>
		<th>options</th>
	</tr>

	
	{foreach from=$contentlist item=content}
	<tr class="{cycle values=",alt"}">
		<td>{$content.ordinal}</td>
		<td>{$content.id}</td>
		<td><a href="{$smarty.const.WWW_TOP}/content-add.php?id={$content.id}" title="Edit {$content.title}">{$content.title}</a></td>
		<td><a title="Preview in new window" href="{$smarty.const.WWW_TOP}/../content/{$content.id}{$content.url}" target="null">/content/{$content.id}{$content.url}</a></td>
		<td>
			{if $content.contenttype == "1"}
				Useful Link
			{elseif $content.contenttype == "2"}
				Article
			{elseif $content.contenttype == "3"}
				Homepage
			{/if}
		</td>
		<td>
			{if $content.status == "1"}
				Enabled
			{else}
				Disabled
			{/if}
		</td>
		<td>
			{if $content.role == "0"}
				Everyone
			{elseif $content.role == "1"}
				Users
			{elseif $content.role == "2"}
				Admins
			{/if}
		</td>		
		<td style="width:50px;">
			{if $content.showinmenu == "1"}
				Yes
			{else}
				No
			{/if}
		</td>
		<td title="{$content.body|escape:'htmlall'}">{$content.body|truncate:100|escape:'htmlall'}</td>
		<td>{if $content.contenttype != "3"}<a class="confirm_action btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/content-delete.php?id={$content.id}">delete</a>{/if}</td>
	</tr>
	{/foreach}


</table>
