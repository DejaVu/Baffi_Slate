<ul class="breadcrumb">
	<li><a href="{$smarty.const.WWW_TOP}{$site->home_link}">Home</a> <span class="divider">/</span></li>
	<li class="active">{$catname|escape:"htmlall"}</li>
</ul>

{$site->adbrowse}	

{if $shows}
<center>
<div class="btn-group">
	<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/series" title="View available TV series">Series List</a> | 
	<a class="btn btn-small" title="Manage your shows" href="{$smarty.const.WWW_TOP}/myshows">Manage My Shows</a> | 
	<a class="btn btn-small" title="All releases in your shows as an RSS feed" href="{$smarty.const.WWW_TOP}/rss?t=-3&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}">Rss <i class="fa-icon-rss"></i></a>
</div>
</center>
<br/>
{/if}

{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">

	<div class="well well-small">
		<div class="nzb_multi_operations">
			<table width="100%">
				<tr>
					<td width="30%">
						With Selected:
						<div class="btn-group">
							<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
							<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
							{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
						</div>
					</td>
					<td width="50%">
						<center>
							{$pager}
						</center>
					</td>
					<td width="20%">
						<div class="pull-right">
						{if $isadmin}
							Admin: 	
							<div class="btn-group">	
								<input type="button" class="nzb_multi_operations_edit btn btn-small btn-warning" value="Edit" />
								<input type="button" class="nzb_multi_operations_delete btn btn-small btn-danger" value="Delete" />
							</div>
							&nbsp;
						{/if}
						{if $section != ''}
							<a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}"><i class="fa-icon-th-list"></i></a>
							&nbsp;
						{/if}
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>

	<table style="100%" class="data highlight icons table table-striped" id="browsetable">

		<tr>
			<th style="padding-top:0px; padding-bottom:0px;">
				<input id="chkSelectAll" type="checkbox" class="nzb_check_all" />
				<label for="chkSelectAll" style="display:none;">Select All</label>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">name<br/>
				<a title="Sort Descending" href="{$orderbyname_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbyname_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">category<br/>
				<a title="Sort Descending" href="{$orderbycat_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbycat_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">posted<br/>
				<a title="Sort Descending" href="{$orderbyposted_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbyposted_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">size<br/>
				<a title="Sort Descending" href="{$orderbysize_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbysize_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">files<br/>
				<a title="Sort Descending" href="{$orderbyfiles_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbyfiles_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>

			<th style="padding-top:0px; padding-bottom:0px;">stats<br/>
				<a title="Sort Descending" href="{$orderbystats_desc}">
					<i class="fa-icon-caret-down"></i>
				</a>
				<a title="Sort Ascending" href="{$orderbystats_asc}">
					<i class="fa-icon-caret-up"></i>
				</a>
			</th>
			<th>action</th>
		</tr>

		{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}{if $lastvisit|strtotime<$result.adddate|strtotime} new{/if}" id="guid{$result.guid}">
			<td class="check">
				<input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" value="{$result.guid}" />
			</td>

			<td class="item">
				<label for="chk{$result.guid|substr:0:7}">
					<a class="title" title="View details"  href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}"><h5>{$result.searchname|escape:"htmlall"|replace:".":" "}</h5></a>
				</label>

				{if $result.passwordstatus == 2}
				<i class="fa-icon-lock"></i>
				{elseif $result.passwordstatus == 1}
				<i class="fa-icon-lock"></i>
				{/if}

				{if $userdata.canpre == 1 && $result.nuketype != ''}
				&nbsp;<img title="{$result.nuketype}" src="{$smarty.const.WWW_TOP}/templates/default/images/icons/nuke.png" width="10" height="10" alt="{$result.nuketype}" />
				{/if}

				<div class="resextra">
					<div class="btns">{strip}
						{if $result.nfoID > 0}
						<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="modal_nfo badge halffade" rel="nfo">Nfo</a> 
						{/if}

						{if $result.preID > 0 && $userdata.canpre == 1}
						<span class="preinfo badge halffade" title="{$result.searchname}">Pre'd {$result.ctime|timeago}</span> 
						{/if}

						{if $result.movieinfoID > 0}
						<a href="{$smarty.const.WWW_TOP}/movies?imdb={$result.imdbID}" title="View movie info" class="badge badge-inverse halffade" rel="movie" >Movie</a> 
						{/if}

						{if $result.haspreview == 1 && $userdata.canpreview == 1}
						<a href="{$smarty.const.WWW_TOP}/covers/preview/{$result.guid}_thumb.jpg" name="name{$result.guid}" 
						title="View Screenshot" class="modal_prev badge badge-success halffade" rel="preview">Preview</a> 
						{/if}

						{if $result.haspreview == 2 && $userdata.canpreview == 1}
						<a href="#" name="audio{$result.guid}" title="Listen to Preview" class="audioprev badge badge-success halffade" rel="audio">Listen</a> 
						<audio id="audprev{$result.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" preload="none"></audio>
						{/if}

						{if $result.musicinfoID > 0}
						<a href="#" name="name{$result.musicinfoID}" title="View music info" class="modal_music badge badge-success halffade" rel="music" >Cover</a> 
						{/if}

						{if $result.consoleinfoID > 0}
						<a href="#" name="name{$result.consoleinfoID}" title="View console info" class="modal_console badge badge-success halffade" rel="console" >Cover</a> 
						{/if}

						{if $result.bookinfoID > 0}
						<a href="#" name="name{$result.bookinfoID}" title="View book info" class="modal_book badge badge-success halffade" rel="console" >Cover</a> 
						{/if}

						{if $result.rageID > 0}
						<a class="badge badge-inverse halffade" href="{$smarty.const.WWW_TOP}/series/{$result.rageID}" title="View all episodes">View Series</a> 
						{/if}

						{if $result.anidbID > 0}
						<a class="badge badge-inverse halffade" href="{$smarty.const.WWW_TOP}/anime/{$result.anidbID}" title="View all episodes">View Anime</a> 
						{/if}

						{if $result.tvairdate != ""}
						<span class="seriesinfo badge badge-success halffade" title="{$result.guid}">Aired {if $result.tvairdate|strtotime > $smarty.now}in future{else}{$result.tvairdate|daysago}
							{/if}
						</span> 
						{/if}

						{if $result.reID > 0}
						<span class="mediainfo badge badge-inverse halffade" title="{$result.guid}">Media</span> 
						{/if}

						{/strip}
					</div>
				</div>
			</td>
			
			<td class="less">
				<a title="Browse {$result.category_name}" href="{$smarty.const.WWW_TOP}/browse?t={$result.categoryID}">{$result.category_name}</a>
			</td>

			<td class="less mid" title="{$result.postdate}">{$result.postdate|timeago}</td>

			<td class="less right">
				{$result.size|fsize_format:"MB"}
				{if $result.completion > 0}<br />
				{if $result.completion < 100}
				<span class="label label-important">{$result.completion}%</span>
				{else}
				<span class="label label-success">{$result.completion}%</span>
				{/if}
				{/if}
			</td>
			<td class="less mid">
				<a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart}</a> <i class="fa-icon-file"></i>
				
				{if $result.rarinnerfilecount > 0}
				<div class="rarfilelist">
					<img src="{$smarty.const.WWW_TOP}/templates/baffi/images/icons/magnifier.png" alt="{$result.guid}" class="tooltip" />				
				</div>
				{/if}
			</td>
			<td class="less nowrap">
				<a title="View comments" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{$result.comments}</a> <i class="fa-icon-comments-alt"></i>
				<br/>{$result.grabs} <i class="fa-icon-download-alt"></i>
			</td>
			<td class="icons" style='width:100px;'>
				<ul class="inline">
					<li>
						<div class="icon icon_nzb">
							<a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}"><img src="{$smarty.const.WWW_TOP}/templates/baffi/images/icons/nzbup.png"></a>
						</div>
					</li>
					<li>
						<a class="icon icon_cart" href="#" title="Add to Cart">
							<img src="{$smarty.const.WWW_TOP}/templates/baffi/images/icons/cartup.png">
						</a>
					</li>
					{if $sabintegrated}
					<li>
						<a class="icon icon_sab" href="#" title="Send to Sab">
							<img class="icon icon_sab" alt="Send to my Sabnzbd" src="{$smarty.const.WWW_TOP}/templates/baffi/images/icons/sabup.png">
						</a>
					</li>
					{/if}
				</ul>
			</td>
		</tr>
		{/foreach}
	</table>

	{if $results|@count > 10}
	<div class="well well-small">
		<div class="nzb_multi_operations">
			<table width="100%">
				<tr>
					<td width="30%">
						With Selected:
						<div class="btn-group">
							<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
							<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
							{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
						</div>
					</td>
					<td width="50%">
						<center>
							{$pager}
						</center>
					</td>
					<td width="20%">
						<div class="pull-right">
						{if $isadmin}
							Admin: 	
							<div class="btn-group">	
								<input type="button" class="nzb_multi_operations_edit btn btn-small btn-warning" value="Edit" />
								<input type="button" class="nzb_multi_operations_delete btn btn-small btn-danger" value="Delete" />
							</div>
							&nbsp;
						{/if}
						{if $section != ''}
							<a href="{$smarty.const.WWW_TOP}/{$section}?t={$category}"><i class="fa-icon-th-list"></i></a>
							&nbsp;
						{/if}
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	{/if}
	
</form>

{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong> There is nothing here at the moment.
</div>
{/if}
