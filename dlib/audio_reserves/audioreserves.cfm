<cfif not isDefined("session.reservelist")><cflocation url="current.cfm?i=1"></cfif>
<!DOCTYPE html>
  <!--[if IEMobile 7]><html class="no-js ie iem7" lang="en" dir="ltr"><![endif]-->
  <!--[if lte IE 6]><html class="no-js ie lt-ie9 lt-ie8 lt-ie7" lang="en" dir="ltr"><![endif]-->
  <!--[if (IE 7)&(!IEMobile)]><html class="no-js ie lt-ie9 lt-ie8" lang="en" dir="ltr"><![endif]-->
  <!--[if IE 8]><html class="no-js ie lt-ie9" lang="en" dir="ltr"><![endif]-->
  <!--[if (gte IE 9)|(gt IEMobile 7)]><html class="no-js ie" lang="en" dir="ltr"><![endif]-->
  <!--[if !IE]><!--><html class="no-js" lang="en" dir="ltr"><!--<![endif]-->
<head>
  <title>Music Library | UCLA Library</title>
  <meta charset="utf-8" />
<meta http-equiv="cleartype" content="on" />
<link rel="apple-touch-icon-precomposed" href="http://www.library.ucla.edu/sites/all/themes/omega/omega/apple-touch-icon-precomposed-144x144.png" sizes="144x144" />
<link rel="apple-touch-icon-precomposed" href="http://www.library.ucla.edu/sites/all/themes/omega/omega/apple-touch-icon-precomposed.png" />
<link rel="apple-touch-icon-precomposed" href="http://www.library.ucla.edu/sites/all/themes/omega/omega/apple-touch-icon-precomposed-72x72.png" sizes="72x72" />
<link rel="apple-touch-icon-precomposed" href="http://www.library.ucla.edu/sites/all/themes/omega/omega/apple-touch-icon-precomposed-114x114.png" sizes="114x114" />
<meta name="MobileOptimized" content="width" />
<meta name="HandheldFriendly" content="true" />
<link rel="canonical" href="/music" />
<meta name="Generator" content="Drupal 7 (http://drupal.org)" />
<link rel="shortlink" href="/node/375" />
<link rel="shortcut icon" href="http://www.library.ucla.edu/sites/all/themes/uclalib_omega/favicon.ico" type="image/vnd.microsoft.icon" />
<link rel="profile" href="http://www.w3.org/1999/xhtml/vocab" />
<meta name="viewport" content="width=device-width" />
  <style>@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/system/system.base.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/system/system.messages.theme.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/system/system.theme.css?ncli9j");</style>
<style media="screen">@import url("http://www.library.ucla.edu/sites/all/modules/contrib/tipsy/stylesheets/tipsy.css?ncli9j");</style>
<style>@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/comment/comment.theme.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/date/date_api/date.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/date/date_popup/themes/datepicker.1.7.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/field/field.theme.css?ncli9j");
@import url("http://www.library.ucla.edu/modules/node/node.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/custom/powell_res/powell_res.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/custom/rc_res/rc_res.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/search/search.theme.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/custom/site_alert/css/site-alert.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/unlimitedfield_remove/unlimitedfield_remove.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/user/user.theme.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/omega/omega/css/modules/user/user.base.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/views/css/views.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/ckeditor/css/ckeditor.css?ncli9j");</style>
<style>@import url("http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/ui/themes/base/minified/jquery.ui.core.min.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/ui/themes/base/minified/jquery.ui.theme.min.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/ui/themes/base/minified/jquery.ui.tabs.min.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/custom/bsp_event_cal/bsp_event_cal.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/ctools/css/ctools.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/libraries/fancybox/source/jquery.fancybox.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/panels/css/panels.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/shib_auth/shib_auth.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/views_tooltip/views_tooltip.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/panels/layouts/sidebar-left-golden/../../../css/layouts/sidebar-left-golden/sidebar-left-golden.layout.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/icons/style.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/modules/contrib/panels/plugins/layouts/onecol/onecol.css?ncli9j");</style>
<style>@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/css/modules/system/system.menus.theme.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/fonts/stylesheet.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/css/uclalib-omega.normalize.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/css/uclalib-omega.hacks.css?ncli9j");
@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/css/uclalib-omega.styles.css?ncli9j");</style>

<!--[if lte IE 8]>
<style>@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/css/uclalib-omega.no-query.css?ncli9j");</style>
<![endif]-->
<style>@import url("http://www.library.ucla.edu/sites/all/themes/uclalib_omega/css/layouts/basic/basic.layout.css?ncli9j");</style>
  <script src="http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/jquery/1.7/jquery.min.js?v=1.7.1"></script>
<script src="http://www.library.ucla.edu/misc/jquery.once.js?v=1.2"></script>
<script src="http://www.library.ucla.edu/misc/drupal.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/themes/omega/omega/js/no-js.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/tipsy/javascripts/jquery.tipsy.js?v=0.1.7"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/tipsy/javascripts/tipsy.js?v=0.1.7"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/ui/ui/minified/jquery.ui.core.min.js?v=1.8.11"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/ui/ui/minified/jquery.ui.widget.min.js?v=1.8.11"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/jquery_update/replace/ui/ui/minified/jquery.ui.tabs.min.js?v=1.8.11"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/navbar/js/debounce.js?v=7.26"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/navbar/js/displace.js?v=7.26"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/navbar/js/navbar-tableheader.js?v=7.26"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/features/uclalib_opening_hours/uclalib_opening_hours.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/fancybox/fancybox.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/libraries/fancybox/source/jquery.fancybox.pack.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/linkit/editors/ckeditor/linkitDialog.js?v=7.3"></script>
<script src="http://www.library.ucla.edu/misc/tableheader.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/features/uclalib_location/uclalib_location.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/contrib/panels_tabs/js/panels_tabs.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/modules/custom/site_alert/site_alert.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/themes/uclalib_omega/js/uclalib-omega.behaviors.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/themes/uclalib_omega/js/qualaroo.js?ncli9j"></script>
<script src="http://www.library.ucla.edu/sites/all/themes/uclalib_omega/js/libsurvey.js?ncli9j"></script>
<script>jQuery.extend(Drupal.settings, {"basePath":"\/","pathPrefix":"","fancybox":{"options":{"autoSize":0,"autoResize":0,"autoCenter":0,"fitToView":0,"mouseWheel":0,"loop":0,"openEffect":"elastic","closeEffect":"elastic","openOpacity":0,"closeOpacity":0},"helpers":{"title":{"position":"top"},"overlay_enabled":0,"overlay":null,"thumbs":{"width":"","height":"","position":"top"}},"callbacks":{"beforeShow":"fancybox_beforeshow","afterShow":"fancybox_aftershow"}},"tipsy":{"custom_selectors":[{"selector":".tipsy","options":{"fade":1,"gravity":"w","delayIn":0,"delayOut":0,"trigger":"hover","opacity":"0.8","offset":0,"html":0,"tooltip_content":{"source":"attribute","selector":"title"}}},{"selector":".views-tooltip","options":{"fade":1,"gravity":"autoNS","delayIn":0,"delayOut":0,"trigger":"hover","opacity":"0.8","offset":0,"html":1,"tooltip_content":{"source":"attribute","selector":"tooltip-content"}}}]},"locationNid":{"nid":"375"},"panelsTabs":{"tabsID":["tabs-0-below_main_left"]},"googleanalytics":{"trackOutbound":1,"trackMailto":1,"trackDownload":1,"trackDownloadExtensions":"7z|aac|arc|arj|asf|asx|avi|bin|csv|doc|exe|flv|gif|gz|gzip|hqx|jar|jpe?g|js|mp(2|3|4|e?g)|mov(ie)?|msi|msp|pdf|phps|png|ppt|qtm?|ra(m|r)?|sea|sit|tar|tgz|torrent|txt|wav|wma|wmv|wpd|xls|xml|z|zip"},"tableHeaderOffset":"Drupal.navbar.height"});</script>

<script type="text/javascript" src="http://jwpsrv.com/library/UvuochZ3EeSzjCIACtqXBA.js"></script>

</head>
<body class="html not-front not-logged-in page-node page-node- page-node-375 node-type-location section-music">
  <a href="#main-content" class="element-invisible element-focusable">Skip to main content</a>
    <div class="l-page has-no-sidebars">
  <div class="l-header-wrapper">
    <div class="l-header" role="banner">
        <div class="l-region l-region--branding">
    <div class="panel-pane pane-page-logo" >
  
      
  
  <div class="pane-content">
    <a href="http://www.library.ucla.edu/" rel="home" id="logo" title="Home"><img src="http://www.library.ucla.edu/sites/all/themes/uclalib_omega/logo.png" alt="Home" /></a>  </div>

  
  </div>
  </div>
        <div class="l-region l-region--header">
    <div class="panel-pane pane-block pane-system-user-menu" >
  
      
  
  <div class="pane-content">
    <ul class="menu"><li class="first leaf"><a href="http://www.library.ucla.edu/hours">Hours</a></li>
<li class="last collapsed"><a href="http://www.library.ucla.edu/contact">Contact</a></li>
</ul>  </div>

  
  </div>
<div class="panel-pane pane-custom pane-3 pane-ask-a-librarian" >
  
      
  
  <div class="pane-content">
    <p><a class="btn-ask" href="http://www.library.ucla.edu/support/research-help"><span class="icon-help"></span> Ask A Librarian</a></p>
  </div>

  
  </div>
<div class="panel-pane pane-search-form" >
  
      
  
  <div class="pane-content">
        <div class="header-search-form-wrapper">
      <form class="header-search-form" action="http://www.library.ucla.edu/site-search" method="get" accept-charset="UTF-8">
        <div class="form-wrapper">
          <div class="form-item form-type-textfield">
            <input type="text" class="form-text" id='' name="search_query" value="" size="15" maxlength="128"  placeholder="Site Search">
          </div>
          <div class="form-actions">
            <input type="submit" class="form-submit" id="submit" value="Go" >
          </div>
        </div>
      </form>
    </div>  </div>

  
  </div>
  </div>
    </div>
  </div>
<!---
  <div class="l-navigation-wrapper">
    <div id="menu" class="l-navigation">
        <div class="l-region l-region--navigation">
    <div class="panel-pane pane-page-primary-links" >
  
      
  
  <div class="pane-content">
    <ul class="links primary-links">
<li class="menu-1612"><a href="http://www.library.ucla.edu/">Home</a></li>
<li class="menu-2649"><a href="http://www.library.ucla.edu/search">Search</a></li>
<li class="menu-2090"><a href="http://www.library.ucla.edu/support">Research &amp; Teaching Support</a></li>
<li class="menu-721 active-trail"><a href="http://www.library.ucla.edu/locations" title="" class="active-trail">Locations</a></li>
<li class="menu-1072"><a href="http://www.library.ucla.edu/news-events" title="">News &amp; Events</a></li>
<li class="menu-2433 last"><a href="http://www.library.ucla.edu/use">Using the Library</a></li>
</ul>  </div>

  
  </div>
  </div>
    </div>
  </div>
--->
    <div class="l-highlighted-wrapper">
    <div class="l-highlighted">
        <div class="l-region l-region--help">
    <div class="panel-pane pane-panels-mini pane-alert-pane" >
  
      
  
  <div class="pane-content">
    <div class="panel-display panel-1col clearfix" id="mini-panel-alert_pane">
  <div class="panel-panel panel-col">
    <div><div class="panel-pane pane-page-site-alert" >
  
      
  
  <div class="pane-content">
    <div class="site-alert"></div>  </div>

  
  </div>
</div>
  </div>
</div>
  </div>

  
  </div>
  </div>
        <div class="l-region l-region--highlighted">
    <div class="panel-pane pane-page-title" >
  
      
  
  <div class="pane-content">
    <h1></h1>
  </div>

  
  </div>
  </div>
    </div>
  </div>
  
  <div class="l-main-wrapper">
    <div class="l-main">

      <div class="l-content" role="main">
        <a name="main-content"></a>
        <div class="panel-pane pane-page-content" >
  
      
  
  <div class="pane-content">
    <div class="sidebar-left-golden panel-sidebar-left-golden with-sidebar-left">
<!---
      <div class="l-region l-region--top">
      <div class="panel-pane pane-panels-mini pane-location-header" >
  
      
  
  <div class="pane-content">
    <div class="panel-display panel-1col clearfix" id="mini-panel-location_header">
  <div class="panel-panel panel-col">
    <div><div class="panel-pane pane-node-title" >
  
      
  <!---
  <div class="pane-content">
    <h1><a href="http://www.library.ucla.edu/music" class="active">Music Library</a></h1>
  </div>
--->
  
  </div>
<!---<div class="panel-pane pane-views-panes pane-location-map-pin-map-pin-pane" >
  
      
  
  <div class="pane-content">
    <div class="view view-location-map-pin view-id-location_map_pin view-display-id-map_pin_pane view-dom-id-85914a0dc8f796af1cb5cd1357973ab1">
        
  
  
      <div class="view-content">
        <div class="views-row views-row-1 views-row-odd views-row-first views-row-last">
      
  <div class="views-field views-field-field-location-map-link">        <div class="field-content"><a href="http://maps.ucla.edu/campus/?%3Fz=14&amp;locid=83846"><span class="icon icon-mappin"></span></a></div>  </div>  </div>
    </div>
  
  
  
  
  
  
</div>  </div>

  
  </div>
<div class="panel-pane pane-entity-field pane-node-field-address" >
  
      
  
  <div class="pane-content">
    <div class="field field--name-field-address field--type-text-long field--label-hidden"><div class="field__items"><div class="field__item even">1102 Schoenberg Music Building
Los Angeles, CA  90095-9006</div></div></div>  </div>

  
  </div>--->
<!---<div class="panel-pane pane-entity-field pane-node-field-location-phone" >
  
      
  
  <div class="pane-content">
    <div class="field field--name-field-location-phone field--type-phone field--label-hidden"><div class="field__items"><div class="field__item even">(310) 825-4882</div></div></div>  </div>

  
  </div>
<div class="panel-pane pane-entity-field pane-node-field-location-social-links" >
  
      
  
  <div class="pane-content">
    <div class="field field--name-field-location-social-links field--type-social-links field--label-hidden"><div class="field__items"><div class="field__item even"><a href="https://www.facebook.com/UCLA.Music.Library"><img class="social-link social-link-facebook" src="/sites/all/modules/features/uclalib_location/social_icons/facebook-32-black.png"/></a></div></div></div>  </div>

  
  </div>--->
</div>
  </div>
</div>
  </div>

  
  </div>
    </div>
  --->
      <!---<div class="l-region l-region--sidebar-left">
      <div class="panel-pane pane-open-now sidebar-tier-1" >
  
      
  
  <div class="pane-content">
    <div class="open-now-pane"></div>  </div>

  
  </div>
<!---<div class="panel-pane pane-block pane-menu-block-1 sidebar-tier-1" >
  
      
  
  <div class="pane-content">
    <div class="menu-block-wrapper menu-block-1 menu-name-main-menu parent-mlid-0 menu-level-3">
  <ul class="menu"><li class="first leaf menu-mlid-1761"><a href="http://www.library.ucla.edu/music/about" title="About">About</a></li>
<li class="collapsed menu-mlid-1754"><a href="http://www.library.ucla.edu/music/at-this-location" title="At this location">At this location</a></li>
<li class="leaf menu-mlid-2383"><a href="http://www.library.ucla.edu/music/collections">Collections</a></li>
<li class="leaf menu-mlid-2413"><a href="http://www.library.ucla.edu/music/events">Events</a></li>
<li class="leaf menu-mlid-2400"><a href="http://www.library.ucla.edu/music/giving-music-library">Giving to the Music Library</a></li>
<li class="last leaf menu-mlid-3056"><a href="http://www.library.ucla.edu/music/hugo-davise-fund-contemporary-music">Hugo Davise Fund for Contemporary Music</a></li>
</ul></div>
  </div>

  
  </div>--->
<!---<div class="panel-pane pane-quick-links sidebar-tier-2" >
  
        <h2 class="pane-title">Quick Links</h2>
    
  
  <div class="pane-content">
    <div class="field field--name-field-quick-links field--type-link-field field--label-hidden"><div class="field__items"><div class="field__item even"><a href="http://unitproj.library.ucla.edu/dlib/audio_reserves/current.cfm?i=1">Digital Audio Reserves</a></div><div class="field__item odd"><a href="http://guides.library.ucla.edu/musicresearch">Music Research Resources Online</a></div><div class="field__item even"><a href="http://guides.library.ucla.edu/cat.php?cid=6065">Guides to Music Research</a></div><div class="field__item odd"><a href="http://www.library.ucla.edu/support/research-help/drop-and-scheduled-research-assistance/music-library">Schedule a Consultation</a></div></div></div>  </div>

  
  </div>--->
<!---<div class="panel-pane pane-custom pane-2 sidebar-tier-3" >
  
      
  
  <div class="pane-content">
    <p>Have questions about your research? <a href="http://www.library.ucla.edu/support/research-help" style="font-weight: normal">We can help!</a></p>
  </div>

  
  </div>--->
    </div>--->
  
 <!---<div class="l-region l-region--main-column">---><div >

  
      
  


<p>&nbsp;</p>

<H2>Digital Audio Reserves</h2>

<hr>

<p><strong>Notice:</strong> The U.S. Copyright Law (Title 17 U.S. Code) governs the making of photocopies or other reproductions of copyrighted materials. These sound files have been prepared to provide instructional support for students enrolled in UCLA classes. Copying, downloading, redistribution, modification and/or archiving of these files is prohibited.</p>

<!---<p>Online listening assignments are password protected and open only to those enrolled in class. Ask your instructor or
the Music Library about accessing your online reserves listening assignment. <p>--->

<p><strong>WiFi connections:</strong> On campus, the preferred network is EDUROAM. UCLA_WIFI may also work. In the dorms try UCLA WEB RES WIFI or UCLA WIFI RES.</p>

<p><strong>Questions? </strong>Contact<strong> <a href="mailto:music-circ@library.ucla.edu">Music Circulation</a></strong>. </p>
<hr>
<p><font color="#FF0000"><strong>We are interested in your feedback on the NEW Digital Audio Reserves site. After you have listened to reserve recordings please take our survey. Thank you. <a href="https://www.surveymonkey.com/s/7XKGNXY" target="new">TAKE THE SURVEY NOW</a> (a new window will open).</strong></font></p>

<hr>



<a name="top"></a> 

<cfif isdefined("form.classid")>
	<cfset session.classid = form.classid>
<cfelseif isdefined("url.classid")>
	<cfset session.classid = url.classid>
</cfif>

<!--- REDIRECT --->
<cfif session.classid is not "none" and session.classid is not "" and session.classid is not "all">
	<cfquery name="goto" datasource="#dsn#">
		select redirect from classes
			where classes.classid = #session.classid#
	</cfquery>

	<cfoutput>
	<cfif goto.redirect is not "">
		<cflocation url="#goto.redirect#" addtoken="no">
	</cfif>
	</cfoutput>
</cfif>

<cfif session.classid is "none" or session.classid is "">
	<p><font face="Verdana, Arial, Helvetica, sans-serif">Invalid choice. Return to the previous page and try again.</font></p>
<cfelse>

<cfif session.classid is "all">
	<cfquery name="yearquarter" datasource="#dsn#">
		select * from currentquarter
	</cfquery>
	<cfquery name="instinfo" datasource="#dsn#">
		select * from instructors, classes, currentquarter
			where instructors.instructorID = classes.instructorID
				and classes.year = currentquarter.year
				and classes.quarter = currentquarter.quarter
	</cfquery>
	<cfquery name="worklist" datasource="#dsn#">
		select * from works, link
			where works.workid = link.workid
				and classes.classID = link.classID
				and classes.year = currentquarter.year
				and classes.quarter = currentquarter.quarter
			order by works.classinfo, works.composer, works.title, classes.classid
	</cfquery>	
	<cfquery name="reslist" datasource="#dsn#">
		select classes.classid, instructor, department, classnumber, works.classinfo, works.incl, works.composer, works.title, works.video, performers, note1, note2, label, labelnumber, librarycallnumber, caption, volume, disc, side, track, baseaddress, link.workid, ramlink, score, scorecaption, imgbaseaddr, startimageID, lowestimageID, highestimageID, EncFormat, itemid, LocalHTMFile, LFileCaption, wwwLink, wLinkCaption, include, excludefrom, 
works.exLink, items.audioLink, items.hLink
			from works, link, items, classes, currentquarter
			where works.workid = link.workid
				and works.workid = items.workid
				and classes.classID = link.classID
				and classes.year = currentquarter.year
				and classes.quarter = currentquarter.quarter
			order by works.classinfo, works.composer, works.title, items.ordr, items.itemID, classes.classid
	</cfquery>
<cfelse>
	<cfquery name="instinfo" datasource="#dsn#">
		select * 
			from instructors,classes 
			where instructors.instructorID = classes.instructorID
				and classes.classid = #session.classid#
	</cfquery>
	<cfquery name="worklist" datasource="#dsn#">
		select * from works, link
			where works.workid = link.workid
				and link.classid = #session.classid#
			order by works.classinfo, works.composer, works.title
	</cfquery>	
	<cfquery name="reslist" datasource="#dsn#">
		select * from works, link, items
			where works.workid = link.workid
				and works.workid = items.workid
				and link.classid = #session.classid#
			order by works.classinfo, works.composer, works.title, items.ordr, items.itemID
	</cfquery>
	<cfquery name="itemannot" datasource="#dsn#">
		select itemannot.* from itemannot, link
			where itemannot.id = link.id
			and link.classid = #session.classid#
	</cfquery>
</cfif>

<cfif instinfo.recordcount is 0 or session.classid is "none">
	<p><font face="Verdana, Arial, Helvetica, sans-serif">List not found. <a href="right.cfm">Return</a> to the previous page and try again.</font></p>
<cfelse>

<cfif session.classid is "all">
	<p><font size="+1" face="Verdana, Arial, Helvetica, sans-serif">ALL AUDIO SELECTIONS</font></p>
    <!---<p><strong>Having trouble connecting with wifi? <em>Try the EDUROAM connection first!</em></strong>
    <p><strong>NOTICE</strong>: Please use the embedded player to play audio. The Real version of Audio Reserves is being retired. For a short time the Real stream will still be available by clicking the TITLE of each item.<p>--->
    
	<cfoutput query="yearquarter">
	<p><font face="Verdana, Arial, Helvetica, sans-serif"><b>#quarter# #year#</b></font></p>
	</cfoutput>
<cfelse>
	<cfoutput query="instinfo">
	<p><font face="Verdana, Arial, Helvetica, sans-serif"><b>#instinfo.instructor#<br>
	  #department# #classnumber#<br>
	  #title#</b><br>
	  <font size="-1">#quarter# #year#</font></font></p>
    <!---<p><strong>Having trouble connecting with wifi? <em>Try the EDUROAM connection first!</em></strong>
    <p><strong>NOTICE</strong>: Please use the embedded player to play audio. The Real version of Audio Reserves is being retired. For a short time the Real stream will still be available by clicking the TITLE of each item.<p><p>--->
    
	</cfoutput>
</cfif>

	<cfinclude template="audio_res_list.cfm">

</cfif>

</cfif>

<!---<a name="format"></a>
<p><strong>Audio format</strong>: Audio Reserves are currently available in two different formats:</p>
<ul>
<li>MP3, through the embedded viewer. This should work on most computers, tablets and smartphones.</li>
<li>Real Audio, using a Real Cloud plugin. Click on the TITLE to initiate the audio stream. If needed, the free playback client can be downloaded from <a href="https://realnetworks.zendesk.com/entries/23690683-Installing-RealPlayer-for-the-first-time" target="_blank">www.real.com</a>.</li>
</ul>
<a name="labs"></a>  
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Where to use 
  these files:</b> For the best sound quality these files should be used over 
  the campus network, in multimedia-equipped computer labs. These include the 
  <a href="http://www.clicc.ucla.edu/" style="text-decoration: none" target="_top">College Library CLICC lab</a>, <a href="http://www.cdh.ucla.edu/labs" style="text-decoration: none" target="_top">Center for Digital Humanities Computer Labs</a>, and <a href="https://www.it.ucla.edu/ucla-computer-labs" style="text-decoration: none" target="_top">other labs</a>. 
  There are also six multimedia/internet computer workstations in the Music 
  Library Media Room.</font></p>
<a name="offcampus"></a>
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Off-campus 
  access: </b>These files may also be accessed over a modem from off campus. The sound quality 
  over a modem is considerably lower than over the campus network.</font></font></p>
<a name="problems"></a>
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Email questions/problems</b> to 
<a href="mailto:music-circ@library.ucla.edu" style="text-decoration: none">music-circ@library.ucla.edu</a></font>
</p>

<a name="wifi"></a>
<p><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>WiFi:</b>
  If you are experiencing connection problems, try using a different wireless connection. 
On campus, the preferred network is "eduroam", but "UCLA_WIFI" may also work. "UCLA_SECURE" does not work.
In the dorms, "UCLA WEB RES WIFI", "UCLA WIFI RES" have been known to work. "UCLA WEB RES" does not work.
</p>
--->
    

  
  </div>
  
</div>
  </div>

  
  </div>
      </div>

                </div>
  </div>
<!---
  <div class="l-colophon-wrapper">
    <div class="l-colophon" role="contentinfo">
        <div class="l-region l-region--colophon-first">
    <div class="panel-pane pane-bean-text-block pane-bean-colophon-about" >
  
      
  
  <div class="pane-content">
    <div class="entity entity-bean bean-text-block clearfix" class="entity entity-bean bean-text-block">

  <div class="content">
    <div class="field field--name-field-text-block field--type-text-long field--label-hidden"><div class="field__items"><div class="field__item even"><h2>
	<span>UCLA Library</span></h2>
<p>The mission of the UCLA Library is to provide access to and delivery of information resources to UCLA students, faculty, and staff in support of the research and instructional mission of the university. Relying on its highly skilled staff, the Library encourages innovation, capitalizes on appropriate technologies, forges effective partnerships and aggressively promotes excellence.</p>
</div></div></div>  </div>
</div>
  </div>

  
  </div>
  </div>
        <div class="l-region l-region--colophon-second">
    <div class="panel-pane pane-block pane-menu-menu-colophon-first" >
  
      
  
  <div class="pane-content">
    <ul class="menu"><li class="first leaf"><a href="http://www.library.ucla.edu/about" title="">About UCLA Library</a></li>
<li class="leaf"><a href="http://www.library.ucla.edu/about/collections" title="">About the Collections</a></li>
<li class="last leaf"><a href="http://www.library.ucla.edu/about/giving-library" title="">Giving to UCLA Library</a></li>
</ul>  </div>

  
  </div>
  </div>
        <div class="l-region l-region--colophon-third">
    <div class="panel-pane pane-block pane-menu-menu-colophon-second" >
  
      
  
  <div class="pane-content">
    <ul class="menu"><li class="first leaf"><a href="http://www.library.ucla.edu/about/employment-human-resources" title="">Employment</a></li>
<li class="leaf"><a href="http://www.ucla.edu/" title="">UCLA Homepage</a></li>
<li class="last leaf"><a href="http://www.library.ucla.edu/about/social-media-directory" title="">Social Media Directory</a></li>
</ul>  </div>

  
  </div>
  </div>
    </div>
  </div>
--->
  <div class="l-footer-wrapper">
    <div class="l-footer" role="contentinfo">
        <div class="l-region l-region--footer">
    <div class="panel-pane pane-block pane-menu-menu-footer" >
  
      
  
  <div class="pane-content">
    <ul class="menu"><li class="first last leaf"><span title="" class="footer-copyright nolink">2014 &copy; UC Regents</span></li>
</ul>  </div>

  
  </div>
  </div>
    </div>
  </div>
</div>
  </body>
</html>
