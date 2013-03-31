{if $nodata != ""}

<h2>View TV Series</h2>

<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong>
	{$nodata}
</div>
{else}

<h2>
	{foreach $rage as $r}
	{if $isadmin}
	<a title="Edit rage data" href="{$smarty.const.WWW_TOP}/admin/rage-edit.php?id={$r.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}">{$r.releasetitle} </a>
	{else}
	{$r.releasetitle} 
	{/if}
	{if !$r@last} / {/if}
	{/foreach}

	{if $catname != ''} in {$catname|escape:"htmlall"}{/if}

</h2>

<div>
	<b><a title="Manage your shows" href="{$smarty.const.WWW_TOP}/myshows">My Shows</a></b>:
	<div class="btn-group">

		{if $myshows.ID != ''}
		<a class="btn btn-mini btn-warning" href="{$smarty.const.WWW_TOP}/myshows/edit/{$rage[0].rageID}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows" rel="edit" name="series{$rage[0].rageID}" title="Edit Categories for this show">Edit</a> | 
		<a class="btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/myshows/delete/{$rage[0].rageID}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows" rel="remove" name="series{$rage[0].rageID}" title="Remove from My Shows">Remove</a>
		{else}
		<a class="btn btn-mini btn-success" href="{$smarty.const.WWW_TOP}/myshows/add/{$rage[0].rageID}?from={$smarty.server.REQUEST_URI|escape:"url"}" class="myshows" rel="add" name="series{$rage[0].rageID}" title="Add to My Shows">Add</a>
		{/if}
	</div>
</div>

<div class="tvseriesheading">
	{if $rage[0].imgdata != ""}
	<center>
		<img class="shadow img img-polaroid" style="max-height:300px;" alt="{$rage[0].releasetitle} Logo" src="{$smarty.const.WWW_TOP}/getimage?type=tvrage&amp;id={$rage[0].ID}" />
	</center>
	<br/>
	{/if}
	<p>
		{if $seriesGenre != ''}<b>{$seriesgenre}</b><br />{/if}
		<span class="descinitial">{$seriesdescription|escape:"htmlall"|nl2br|magicurl}</span>
	</p>

</div>

<center>
	<div class="btn-group">
		{if $rage|@count == 1 && $isadmin}
		<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/admin/rage-edit.php?id={$r.ID}&amp;action=update&amp;from={$smarty.server.REQUEST_URI|escape:"url"}">Update From Tv Rage</a>
		{/if}
		<a class="btn btn-small" target="_blank" href="{$site->dereferrer_link}http://www.tvrage.com/shows/id-{$rage[0].rageID}" title="View in TvRage">View in Tv Rage</a>
		<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/rss?rage={$rage[0].rageID}{if $category != ''}&amp;t={$category}{/if}&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}">Rss for this Series <i class="fa-icon-rss"></i></a>
	</div>
</center>

<br/>

<form id="nzb_multi_operations_form" action="get">

	<div class="well well-small">
		<div class="nzb_multi_operations">
			With Selected:
			<div class="btn-group">
				<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
				<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
				{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
			</div>

			{if $isadmin}
			<div class="pull-right">
				Admin: 	
				<div class="btn-group">	
					<input type="button" class="nzb_multi_operations_edit btn btn-small btn-warning" value="Edit" />
					<input type="button" class="nzb_multi_operations_delete btn btn-small btn-danger" value="Delete" />
				</div>
			</div>
			{/if}	
		</div>
	</div>

	<br clear="all" />

	<a id="latest"></a>



	<div class="tabbable">
		<ul class="nav nav-tabs">
			{foreach $seasons as $seasonnum => $season name="seas"}
			<li {if $smarty.foreach.seas.first}class="active"{/if}><a title="View Season {$seasonnum}" href="#{$seasonnum}" data-toggle="tab">{$seasonnum}</a></li>
			{/foreach}
		</ul>

		<div class="tab-content">
			{foreach $seasons as $seasonnum => $season name=tv}
			<div class="tab-pane{if $smarty.foreach.tv.first} active{/if}" id="{$seasonnum}">
				<table class="tb_{$seasonnum} data highlight icons table table-striped" id="browsetable">
					<tr>
						<th>Ep</th>
						<th>Name</th>
						<th><input id="chkSelectAll{$seasonnum}" type="checkbox" name="{$seasonnum}" class="nzb_check_all_season" /><label for="chkSelectAll{$seasonnum}" style="display:none;">Select All</label></th>
						<th>Category</th>
						<th style="text-align:center;">Posted</th>
						<th width="80" >Size</th>
						<th>Files</th>
						<th>Stats</th>
						<th></th>
					</tr>
					{foreach $season as $episodes}
					{foreach $episodes as $result}
					<tr class="{cycle values=",alt"}" id="guid{$result.guid}">
						{if $result@total>1 && $result@index == 0}
						<td width="20" rowspan="{$result@total}" class="static"><h4>{$episodes@key}</h4></td>
						{else if $result@total == 1}
						<td width="20" class="static"><h4>{$episodes@key}</h4></td>
						{/if}
						<td>
							<a title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}"><h5>{$result.searchname|escape:"htmlall"|replace:".":" "}</h5></a>

							<div class="resextra">
								<div class="btns">
									{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="modal_nfo rndbtn badge halffade" rel="nfo">Nfo</a>{/if}
									{if $result.haspreview == 1 && $userdata.canpreview == 1}<a href="{$smarty.const.WWW_TOP}/covers/preview/{$result.guid}_thumb.jpg" name="name{$result.guid}" title="View Screenshot" class="modal_prev rndbtn badge halffade" rel="preview">Preview</a>{/if}
									{if $result.tvairdate != ""}<span class="rndbtn badge badge-success halffade" title="{$result.tvtitle} Aired on {$result.tvairdate|date_format}">Aired {if $result.tvairdate|strtotime > $smarty.now}in future{else}{$result.tvairdate|daysago}{/if}</span>{/if}
									{if $result.reID > 0}<span class="mediainfo rndbtn badge halffade" title="{$result.guid}">Media</span>{/if}
								</div>
							</div>
						</td>
						<td class="check"><input id="chk{$result.guid|substr:0:7}" type="checkbox" class="nzb_check" name="{$seasonnum}" value="{$result.guid}" /></td>
						<td class="less"><a title="This series in {$result.category_name}" href="{$smarty.const.WWW_TOP}/series/{$result.rageID}?t={$result.categoryID}">{$result.category_name}</a></td>
						<td class="less mid" width="40" title="{$result.postdate}">{$result.postdate|timeago}</td>
						
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
								<img src="{$smarty.const.WWW_TOP}/templates/default/images/icons/magnifier.png" alt="{$result.guid}" class="tooltip" />				
							</div>
							{/if}							
						</td>
						<td width="40" class="less nowrap">
							<a title="View comments for {$result.searchname|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{$result.comments} <i class="fa-icon-comments-alt"></i></a>
							<br/>{$result.grabs} <i class="fa-icon-download-alt"></i></td>
						<td class="icons" style='width:100px;'>
							<ul class="inline">
								<li>
									<div class="icon icon_nzb">
										<a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}"><img src="/templates/default/images/icons/nzbup.png"></a>
									</div>
								</li>
								<li>
									<a class="icon icon_cart" href="#" title="Add to Cart">
										<img src="/templates/default/images/icons/cartup.png">
									</a>
								</li>
								{if $sabintegrated}
								<li>
									<a class="icon icon_sab" href="#" title="Send to Sab">
										<img class="icon icon_sab" alt="Send to my Sabnzbd" src="/templates/default/images/icons/sabup.png">
									</a>
								</li>
								{/if}

                                                                {if $isadmin}
                                                                	<br/><br/>
                                                                	<div class="admin" style="margin-bottom:-40px;">
                                                                        	<div class="btn-group">
                                                                                	<a class="rndbtn btn btn-mini btn-warning" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release">Edit</a>
                                                                                	<a class="rndbtn confirm_action btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.ID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release">Delete</a>
                                                                        	</div>
                                                                	</div>
                                                                {/if}
							</ul>
						</td>
					</tr>
					{/foreach}
					{/foreach}
				</table>
			</div>
			{/foreach}
		</div>
	</div>
</form>
{/if}
