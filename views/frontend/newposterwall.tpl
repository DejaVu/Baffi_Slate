<div class="category-movie" style="padding-bottom:20px;">
        <h2 class="main-title">
            <a class="see-more" href="movies">see more &raquo;</a>
            The <strong>newest releases</strong> for <strong>Movies</strong>...
        </h2>
    <div class="main-wrapper">
        <div class="main-content">
            <!-- library -->
            <div class="library-wrapper">
                {foreach from=$newestmovies item=result}
                <div class="library-show">
                    <h4>
                        <div class="title-overflow"></div>
                        <a class="title" href="{$smarty.const.WWW_TOP}/../details/{$result.guid}">{$result.name}</a>
                    </h4>
                    <div class="poster">
                        <a href="{$smarty.const.WWW_TOP}/../details/{$result.guid}"><img alt="" src="{$smarty.const.WWW_TOP}/covers/movies/{if $result.cover == 1}{$result.imdbID}-cover.jpg{else}no-cover.jpg{/if}" /></a>
                    </div>
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</div>

<div class="category-console" style="padding-bottom:20px;">
		<h2 class="main-title">
			<a class="see-more" href="console">see more &raquo;</a>
			The <strong>newest releases</strong> for <strong>Console</strong>...
		</h2>
    <div class="main-wrapper">
        <div class="main-content">
            <!-- library -->
            <div class="library-wrapper">
			    {foreach from=$newestconsole item=result}
                <div class="library-show">
                    <h4>
                        <div class="title-overflow"></div>
                        <a class="title" href="{$smarty.const.WWW_TOP}/../details/{$result.guid}">{$result.name}</a>
                    </h4>
                    <div class="poster">
                        <a href="{$smarty.const.WWW_TOP}/../details/{$result.guid}"><img alt="" src="{$smarty.const.WWW_TOP}/covers/console/{if $result.cover == 1}{$result.consoleinfoID}.jpg{else}no-cover.jpg{/if}" /></a>
                    </div>
                    </div>
				{/foreach}
            </div>
        </div>
    </div>
</div>

<div class="category-audio" style="padding-bottom:20px;">
        <h2 class="main-title">
			<a class="see-more" href="music?t=3010">see more &raquo;</a>
			The <strong>newest releases</strong> for <strong>MP3 Albums</strong>...
		</h2>
    <div class="main-wrapper">
        <div class="main-content">
            <!-- library -->
            <div class="library-wrapper">
			    {foreach from=$newestmp3s item=result}
                <div class="library-show">
                    <h4 style="width:170px;">
                        <div class="title-overflow" style="width:170px;"></div>
                        <a class="title" href="{$smarty.const.WWW_TOP}/../details/{$result.guid}">{$result.name}</a>
                    </h4>
                    <div class="poster">
                        <a href="{$smarty.const.WWW_TOP}/../details/{$result.guid}"><img style="width:170px;height:170px;" alt="" src="{$smarty.const.WWW_TOP}/covers/music/{if $result.cover == 1}{$result.musicinfoID}.jpg{else}no-cover.jpg{/if}" /></a>
                    </div>
                    </div>
				{/foreach}
            </div>
        </div>
    </div>
</div>

<div class="category-ebook" style="padding-bottom:20px;">
        <h2 class="main-title">
			<a class="see-more" href="books">see more &raquo;</a>
			The <strong>newest releases</strong> for <strong>Ebooks</strong>...
		</h2>
    <div class="main-wrapper">
        <div class="main-content">
            <!-- library -->
            <div class="library-wrapper">

			    {foreach from=$newestbooks item=result}
                <div class="library-show">
                    <h4>
                        <div class="title-overflow"></div>
                        <a class="title" href="{$smarty.const.WWW_TOP}/../details/{$result.guid}">{$result.name}</a>
                    </h4>
                    <div class="poster">
                        <a href="{$smarty.const.WWW_TOP}/../details/{$result.guid}"><img alt="" src="{$smarty.const.WWW_TOP}/covers/book/{if $result.cover == 1}{$result.bookinfoID}.jpg{else}no-cover.jpg{/if}" /></a>
                    </div>
                    </div>
				{/foreach}
            </div>
        </div>
    </div>
</div>
