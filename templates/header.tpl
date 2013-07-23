<!DOCTYPE html>
<html lang="{{lang}}">
<head>
  <title>Virtual Computing Lab</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="themes/fivecolleges/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="css/vcl.css">
  <link rel="stylesheet" type="text/css" href="themes/fivecolleges/css/fivecolleges.css">
  <link rel="stylesheet" type="text/css" href="themes/fivecolleges/css/font-awesome.min.css">
  <link rel="icon\" type=\"image/png\" href="themes/fivecolleges/images/icon.png"/>
  <script src="js/code.js?v={{version}}" type="text/javascript"></script>
{{#usenls}}
  <script type="text/javascript" src="js/nls/{{lang}}/messages.js?v={{version}}"></script>
{{/usenls}}
  <script src="themes/fivecolleges/js/jquery-1.10.2.min.js" type="text/javascript"></script>
  <script src="themes/fivecolleges/js/bootstrap.min.js" type="text/javascript"></script>
  <script type="text/javascript">
	var cookiedomain = '{{cookieDomain}}';
    usenls = false;
    var vcl = {
        preferredSize: [{{userWidth}}, {{userHeight}}]
    };
  </script>
  <script type="text/javascript" src="themes/fivecolleges/js/fivecolleges.js"></script>
  {{{dojo}}}
{{#refresh}}
    <noscript><META HTTP-EQUIV=REFRESH CONTENT=20></noscript>
{{/refresh}}
{{#css}}
    <link rel="stylesheet" type="text/css" href="css/{{ . }}">
{{/css}}
</head>
<body class="fivecolleges">
  <script type="text/template" id="vcl-loading-tpl">
    <div class="vcl-loading"><i class="icon-spinner icon-2x icon-spin"></i></div>
  </script>
  <a class=hidden href="#content" accesskey=2>Skip to content</a>
  <header role="banner" id="banner">
    <div class="container">
      <h1 class="pull-left"><a href="{{home}}">Virtual Computing Lab</a></h1>
      <nav id="navigation" role="navigation" class="pull-right">
{{#authed}}
        <div id="prefs" class="navbar">
          <ul class="nav pull-right">
             <li><a href="index.php?mode=userpreferences"><i class="icon-user"></i> Preferences</a></li>
             <li><a href="{{help}}"><i class="icon-question"></i> Help</a></li>
             <li><a href="index.php?mode=logout"><i class="icon-signout"></i> Logout</a></li>
          </ul>
        </div><br />
        <div id="menulist" class="navbar">
          <ul id="navMenu" class="nav pull-right">
  {{#reservation}}
            <li class="dropdown {{selected}}">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-time"></i> Reservations</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="Reservations Menu">
    {{#items}}
                <li><a href="{{url}}">{{label}}</a></li>
    {{/items}}
              </ul>
            </li>
  {{/reservation}}

  {{#management}}
            <li class="dropdown {{selected}}">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-edit"></i> Management</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="Management Menu">
    {{#items}}
                <li><a href="{{url}}">{{label}}</a></li>
    {{/items}}
              </ul>
            </li>
  {{/management}}
  {{#reporting}}
            <li class="dropdown {{selected}}">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-bar-chart"></i> Reporting</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="Reporting Menu">
    {{#items}}
                <li><a href="{{url}}">{{label}}</a></li>
    {{/items}}
              </ul>
            </li>
  {{/reporting}}
        </div>
{{/authed}}
{{^authed}}
        <div class="vcl-intro navbar">
          <ul class="nav pull-right">
            <li><a href="{{help}}"><i class="icon-question-sign"></i> Using the VCL</a></li>
          </ul>
        </div>
{{/authed}}
      </nav>
    </div>
  </header>
  <article class="container" id="content" role="main">
    <br clear="both"/>
