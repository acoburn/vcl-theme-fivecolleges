<!DOCTYPE html>
<html lang="{{lang}}">
<head>
  <title>Virtual Computing Lab</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <link rel="stylesheet" type="text/css" href="css/vcl.css">
  <link rel="stylesheet" type="text/css" href="themes/{{theme}}/css/fivecolleges.min.css">
  <link rel="stylesheet" type="text/css" href="themes/{{theme}}/css/font-awesome.min.css">
  <link rel="icon" type="image/png" href="themes/{{theme}}/images/icon.png">
  <script src="js/code.js?v={{version}}" type="text/javascript"></script>
{{#usenls}}
  <script type="text/javascript" src="js/nls/{{lang}}/messages.js?v={{version}}"></script>
{{/usenls}}
  <script src="themes/{{theme}}/js/jquery-1.10.2.min.js" type="text/javascript"></script>
  <script src="themes/{{theme}}/js/bootstrap.min.js" type="text/javascript"></script>
  <script type="text/javascript">
	var cookiedomain = '{{cookieDomain}}';
    usenls = false;
    var vcl = {
        preferredSize: [{{userWidth}}, {{userHeight}}],
        theme: '{{theme}}'
    };
  </script>
  <script type="text/javascript" src="themes/{{theme}}/js/fivecolleges.js"></script>
  {{{dojo}}}
{{#refresh}}
    <noscript><META HTTP-EQUIV=REFRESH CONTENT=20></noscript>
{{/refresh}}
{{#css}}
    <link rel="stylesheet" type="text/css" href="css/{{ . }}">
{{/css}}
</head>
<body class="fivecolleges">
  <a class=hidden href="#content" accesskey=2>Skip to content</a>
  <header role="banner" id="banner">
    <div class="container">
      <h1 class="pull-left"><a href="{{home}}">Virtual Computing Lab</a></h1>
      <nav id="navigation" role="navigation" class="pull-right">
{{#authed}}
        <div class="navbar vcl-prefs">
          <ul class="nav pull-right">
             <li><a href="index.php?mode=userpreferences"><i class="icon-user"></i> Preferences</a></li>
             <li><a href="{{help}}" class="{{helpClass}}"><i class="icon-question"></i> Help</a></li>
             <li><a href="index.php?mode=logout"><i class="icon-signout"></i> Logout</a></li>
          </ul>
        </div><br />
        <div class="navbar vcl-menu">
          <ul id="navMenu" class="nav pull-right">
  {{#reservation}}
    {{#count}}
            <li class="dropdown {{selected}}">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-time"></i> Reservations</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="Reservations Menu">
      {{#items}}
                <li><a href="{{url}}">{{label}}</a></li>
      {{/items}}
              </ul>
            </li>
    {{/count}}
  {{/reservation}}

  {{#management}}
    {{#count}}
            <li class="dropdown {{selected}}">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-edit"></i> Management</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="Management Menu">
      {{#items}}
                <li><a href="{{url}}">{{label}}</a></li>
      {{/items}}
              </ul>
            </li>
    {{/count}}
  {{/management}}
  {{#reporting}}
    {{#count}}
            <li class="dropdown {{selected}}">
              <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-bar-chart"></i> Reporting</a>
              <ul class="dropdown-menu" role="menu" aria-labelledby="Reporting Menu">
      {{#items}}
                <li><a href="{{url}}">{{label}}</a></li>
      {{/items}}
              </ul>
            </li>
    {{/count}}
  {{/reporting}}
        </div>
{{/authed}}
{{^authed}}
        <div class="vcl-intro navbar">
          <ul class="nav pull-right" style="padding-top: 10px">
            <li><a href="{{help}}" class="{{helpClass}}"><i class="icon-info-sign"></i> Using the VCL</a></li>
          </ul>
        </div>
{{/authed}}
      </nav>
    </div>
  </header>
  <article class="container" id="content" role="main">
    <br clear="both"/>
