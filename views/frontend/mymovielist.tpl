{if $data|@count > 0}

<table style="width:100%;" class="data highlight icons table table-striped" id="coverstable">
		<tr>
			<th style="padding-top:0px; padding-bottom:0px;"></th>
			<th style="padding-top:0px; padding-bottom:0px;">Name</th>
		</tr>

		{foreach $data as $result}
		{if $result->imdb_id != ""}
		{assign var=imdbid value=$result->imdb_id|replace:"tt":""}
		<tr class="{cycle values=",alt"}">
			<td class="mid" style="width:140px;">
			
				<div class="movcover">
					<center>
					<img class="shadow img img-polaroid" src="{if $result->coverimg ==""}{$smarty.const.WWW_TOP}/covers/movies/no-cover.jpg{else}{$result->coverimg}{/if}" width="120" border="0" alt="{$result->name|escape:"htmlall"}" />
					<div class="movextra">
						{if $ourmovies[$imdbid] != ""}
						<a href="#" name="name{$imdbid}" title="View movie info" class="rndbtn modal_imdb badge" rel="movie" >Cover</a>
						{/if}
						<a class="rndbtn badge badge-imdb" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/{$result->imdb_id}" title="View Imdb">Imdb</a>
					</div>
					</center>
				</div>
			</td>
			<td colspan="3" class="left">
				<h4>
				<a href="{$smarty.const.WWW_TOP}/movies?title={$result->name}">{$result->name|escape:"htmlall"}</a> 
				{if $result->released != ""}(<a class="title" href="{$smarty.const.WWW_TOP}/movies?year={$result->released|date_format:"Y"}">{$result->released|date_format:"Y"}</a>){/if}
				{if $result->rating > 0}{$result->rating}/10{/if}
				</h4>				
				
				{$result->overview}

				<br/><br/>
				{if $ourmovies[$imdbid] != ""}
					<a class="rndbtn btn btn-mini btn-success" href="{$smarty.const.WWW_TOP}/movies?imdb={$imdbid}">Download</a>
				{else}
					<a {if $userimdbs[$imdbid] != ""}style="display:none;"{/if} onclick="mymovie_add('{$imdbid}', this);return false;" class="rndbtn btn btn-mini btn-info" href="#">Add To My Movies</a>
				{/if}
				<a {if $userimdbs[$imdbid] == ""}style="display:none;"{/if} onclick="mymovie_del('{$imdbid}', this);return false;" href="#" class="rndbtn btn btn-mini btn-danger">Remove From My Movies</a>
			</td>
		</tr>
		{/if}
		{/foreach}
</table>

{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Sorry!</strong>
	No results found.
</div>
{/if}
