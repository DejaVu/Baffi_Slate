<!DOCTYPE html>
<html lang="en">

<!--[if IE 6]>
    <link href="ie6.min.css" rel="stylesheet">
<![endif]-->

<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta name="keywords" content="{$page->meta_keywords}{if $page->meta_keywords != "" && $site->metakeywords != ""},{/if}{$site->metakeywords}" />
	<meta name="description" content="{$page->meta_description}{if $page->meta_description != "" && $site->metadescription != ""} - {/if}{$site->metadescription}" />	
	<meta name="robots" content="noindex,nofollow"/>
	<meta name="application-name" content="newznab-{$site->version}" />
	<title>{$page->meta_title}{if $page->meta_title != "" && $site->metatitle != ""} - {/if}{$site->metatitle}</title>
{if $loggedin=="true"}	<link rel="alternate" type="application/rss+xml" title="{$site->title} Full Rss Feed" href="{$smarty.const.WWW_TOP}/rss?t=0&amp;dl=1&amp;i={$userdata.ID}&amp;r={$userdata.rsstoken}" />{/if}

{if $site->google_adsense_acc != ''}	
	<link href="http://www.google.com/cse/api/branding.css" rel="stylesheet" type="text/css" media="screen" />
{/if}
	<link href="{$smarty.const.WWW_TOP}/templates/baffi_slate/styles/posterwall.css" rel="stylesheet" type="text/css" media="screen" />
	<link href="{$smarty.const.WWW_TOP}/templates/baffi_slate/styles/style.css" rel="stylesheet" type="text/css" media="screen" />

	<!-- FAVICON -->
	<link rel="shortcut icon" type="image/ico" href="{$smarty.const.WWW_TOP}/templates/default/images/favicon.ico"/>
	<link rel="search" type="application/opensearchdescription+xml" href="{$smarty.const.WWW_TOP}/opensearch" title="{$site->title|escape}" />
	
	<!-- Javascripts -->
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/default/scripts/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/default/scripts/jquery.qtip2.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/baffi_slate/scripts/utils.js"></script>
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/default/scripts/sorttable.js"></script>
	
	<!-- Added the Bootstrap JS -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/baffi_slate/scripts/bootstrap.js"></script>
	
	<!-- Pines Notify -->
	<script type="text/javascript" src="{$smarty.const.WWW_TOP}/templates/baffi_slate/scripts/jquery.pnotify.js"></script>
	
	
	
	<script type="text/javascript">
	/* <![CDATA[ */	
		var WWW_TOP = "{$smarty.const.WWW_TOP}";
		var SERVERROOT = "{$serverroot}";
		var UID = "{if $loggedin=="true"}{$userdata.ID}{else}{/if}";
		var RSSTOKEN = "{if $loggedin=="true"}{$userdata.rsstoken}{else}{/if}";
	/* ]]> */		
	</script>
	{$page->head}
</head>
<body {$page->body}>

<!-- NAV
	================================================== -->

	<!-- If you want the navbar "white" remove Navbar-inverse -->
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner" style="padding-left:30px; padding-right:30px;">
			<div class="container">
<!--		{if $loggedin=="true"}
         <center><div id="procStatus" style="width:100%; color:#999999; font-size:0.7em;">
                <span class="releaseCount"><strong style="color: #5ebc5e;">{$zfilecount}</strong>&nbsp;left to import |</span>                
				<span class="releaseCount"><strong style="color: #51b6d4;">{$ztotalreleases}</strong>&nbsp;imported |</span>
                <span class="processCount"><strong style="color: #006dcc;">{$zpendingprocess}</strong>&nbsp;left to process |</span>
                <span class="processFinished"><strong style="color: #faaa39;">{$zfinishedprocess}</strong>&nbsp;processed releases</span>
                </div></center>
        {/if} -->
				<a class="brand" href="{$smarty.const.WWW_TOP}{$site->home_link}">{$site->title}</a>				
						{if $loggedin=="true"}
							{$header_menu}
						{/if}
					{if $loggedin=="true"}
						<ul class="nav pull-right">
							<li class="dropdown">
								<a id="dropUser" class="dropdown-toggle" data-toggle="dropdown" href="#">{$userdata.username} <b class="caret"></b></a>
								<ul class="dropdown-menu" role="menu" aria-labelledby="dropUser">
									<li class="">
										<a href="{$smarty.const.WWW_TOP}/profile">Profile</a>
									</li>
                                                                        <li class="divider"></li>
                                                                        <li class="">
                                                                                <a href="{$smarty.const.WWW_TOP}/cart">My Cart</a>
                                                                                <a href="{$smarty.const.WWW_TOP}/mymovies">My Movies</a>
                                                                        </li>
                                                                        {if $isadmin}
                                                                                <li class="divider"></li>
                                                                                <li class="">
                                                                                        <a href="{$smarty.const.WWW_TOP}/admin">Site Admin</a>
                                                                                </li>
                                                                        {/if}
									<li class="divider"></li>
									<li class="">
										<a href="{$smarty.const.WWW_TOP}/logout">Logout</a>
									</li>
								</ul>
							</li>
						</ul>
					{/if}
			</div>
		</div><div style="width:100%; background-color:#151719; white-space:nowrap; font-size:0.8em; color:#7a8288;"><center>Buy me a <a href="/content/4/beer-donations/">beer</a> for my efforts.</center></div>
	</div>
	</br>
	</br>
	</br>

	<!-- Container
		================================================== -->
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span1-5">
					<ul class="nav nav-list">
					{$main_menu}

					{$article_menu}

					{$useful_menu}

					{$recentposts_menu}

					</ul>
				</div>

				<div class="span10-5">
					{$page->content}
				</div>

			</div>
		</div>
		<footer class="footer navbar-fixed-bottom">
			<div class="container">
				<ul class="footer-links">
					<li><a href="{$smarty.const.WWW_TOP}/terms-and-conditions">{$site->title} terms and conditions</a></li>
				</ul>
			</div>
		</footer>

		        {if $site->google_analytics_acc != ''}
		        {literal}
		        <script type="text/javascript">
		        /* <![CDATA[ */
		          var _gaq = _gaq || [];
		          _gaq.push(['_setAccount', '{/literal}{$site->google_analytics_acc}{literal}']);
		          _gaq.push(['_trackPageview']);
		          _gaq.push(['_trackPageLoadTime']);
		
		          (function() {
		                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		          })();
		        /* ]]> */
		        </script>
		
		        {/literal}
		        {/if}

			{if $loggedin=="true"}
				<input type="hidden" name="UID" value="{$userdata.ID}" />
				<input type="hidden" name="RSSTOKEN" value="{$userdata.rsstoken}" />
			{/if}
	
</body>
</html>
