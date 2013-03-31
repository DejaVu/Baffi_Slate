<ul class="nav" role="navigation">
	{foreach from=$parentcatlist item=parentcat}
	{if $parentcat.ID == 1000 && $userdata.consoleview=="1"}
	<li class="dropdown">
		<a id="drop1" class="dropdown-toggle" data-toggle="dropdown" href="#">{$parentcat.title} <b class="caret"></b></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="drop1">
			<li><a href="{$smarty.const.WWW_TOP}/console">{$parentcat.title}</a></li>
			<li class="divider"></li>
			{foreach from=$parentcat.subcatlist item=subcat}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/console?t={$subcat.ID}">{$subcat.title}</a></li>
			{/foreach}
		</ul>
	</li>
	{elseif $parentcat.ID == 2000 && $userdata.movieview=="1"}
	<li class="dropdown">
		<a id="drop2" role="button" class="dropdown-toggle" data-toggle="dropdown" href="#">{$parentcat.title} <b class="caret"></b></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="drop2">	
			<li><a href="{$smarty.const.WWW_TOP}/movies">{$parentcat.title}</a></li>
			<li class="divider"></li>
			<li><a href="{$smarty.const.WWW_TOP}/upcoming">In Theatres</a></li>
			<li class="divider"></li>
			{foreach from=$parentcat.subcatlist item=subcat}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/movies?t={$subcat.ID}">{$subcat.title}</a></li>
			{/foreach}
		</ul>
	</li>
	{elseif ($parentcat.ID == 3000 && $userdata.musicview=="1")}
	<li class="dropdown">
		<a id="drop3" class="dropdown-toggle" data-toggle="dropdown" href="#">{$parentcat.title} <b class="caret"></b></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="drop3">
			<li><a href="{$smarty.const.WWW_TOP}/music">{$parentcat.title}</a></li>
			<li class="divider"></li>
			{foreach from=$parentcat.subcatlist item=subcat}
			{if $subcat.ID == 3030}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/browse?t={$subcat.ID}">{$subcat.title}</a></li>
			{else}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/music?t={$subcat.ID}">{$subcat.title}</a></li>
			{/if}
			{/foreach}
		</ul>
	</li>
	{elseif ($parentcat.ID == 5000)}
	<li class="dropdown">
		<a id="drop{$parentcat.ID}" class="dropdown-toggle" data-toggle="dropdown" href="#">{$parentcat.title} <b class="caret"></b></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="drop{$parentcat.ID}">
			<li><a href="{$smarty.const.WWW_TOP}/browse?t={$parentcat.ID}">{$parentcat.title}</a></li>
			<li class="divider"></li>
			<li><a href="{$smarty.const.WWW_TOP}/series">TV Series</a></li>
			<li><a href="{$smarty.const.WWW_TOP}/calendar">TV Calendar</a></li>
			<li class="divider"></li>
			{foreach from=$parentcat.subcatlist item=subcat}
			{if ($subcat.ID == 7020 && $userdata.bookview=="1")}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/books">{$subcat.title}</a></li>
			{else}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/browse?t={$subcat.ID}">{$subcat.title}</a></li>
			{/if}
			{/foreach}
		</ul>
	</li>
	{else}
	<li class="dropdown">
		<a id="drop{$parentcat.ID}" class="dropdown-toggle" data-toggle="dropdown" href="#">{$parentcat.title} <b class="caret"></b></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="drop{$parentcat.ID}">
			<li><a href="{$smarty.const.WWW_TOP}/browse?t={$parentcat.ID}">{$parentcat.title}</a></li>
			<li class="divider"></li>
			{foreach from=$parentcat.subcatlist item=subcat}
			{if ($subcat.ID == 7020 && $userdata.bookview=="1")}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/books">{$subcat.title}</a></li>
			{else}
			<li><a title="Browse {$subcat.title}" href="{$smarty.const.WWW_TOP}/browse?t={$subcat.ID}">{$subcat.title}</a></li>
			{/if}
			{/foreach}
		</ul>
	</li>
	{/if}
	{/foreach}
	<li class="dropdown">
		<a id="dropAll" class="dropdown-toggle" data-toggle="dropdown" href="#">All <b class="caret"></b></a>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dropAll">
			<li><a href="{$smarty.const.WWW_TOP}/browse">All</a></li>
			<li class="divider"></li>
			<li><a title="Browse Groups" href="{$smarty.const.WWW_TOP}/browsegroup">Groups</a></li>
		</ul>
	</li>
</ul>
<ul class="nav pull-right">
	<li class="">
		<form class="navbar-form" id="headsearch_form" action="{$smarty.const.WWW_TOP}/search/" method="get">
				<select class="input-small" id="headcat" name="t">
					<option class="grouping" value="-1">All</option>
					{foreach from=$parentcatlist item=parentcat}
					<option {if $header_menu_cat==$parentcat.ID}selected="selected"{/if} class="grouping" value="{$parentcat.ID}">{$parentcat.title}</option>
					{foreach from=$parentcat.subcatlist item=subcat}
					<option {if $header_menu_cat==$subcat.ID}selected="selected"{/if} value="{$subcat.ID}">&nbsp;&nbsp;{$subcat.title}</option>
					{/foreach}
					{/foreach}
				</select>
				<input class="span3" id="headsearch" name="search" value="{if $header_menu_search == ""}{else}{$header_menu_search|escape:"htmlall"}{/if}" placeholder="Keyword" type="text" />
				<input class="btn" id="headsearch_go" type="submit" value="Search"/>
		</form>
	</li>
</ul>

