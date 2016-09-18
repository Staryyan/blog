<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Article" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        /* fallback */
        @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src: local('Material Icons'), local('MaterialIcons-Regular'),
            url(https://fonts.gstatic.com/s/materialicons/v18/2fcrYFNaTjcS6g4U3t-Y5UEw0lE80llgEseQY3FEmqw.woff2) format('woff2');
        }

        .material-icons {
            font-family: 'Material Icons';
            font-weight: normal;
            font-style: normal;
            font-size: 24px;
            line-height: 1;
            letter-spacing: normal;
            text-transform: none;
            display: inline-block;
            white-space: nowrap;
            word-wrap: normal;
            direction: ltr;
            -webkit-font-feature-settings: 'liga';
            -webkit-font-smoothing: antialiased;
        }
    </style>
    <link href="plugin/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="plugin/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/main.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/Article.js"></script>
</head>
<body>
<div class="container">
    <jsp:include page="Navigation.jsp" />
    <div style="position: fixed; bottom: 90px; right: 30px;">
        <a class="btn-floating btn-large waves-effect waves-light red"><i class="material-icons">add</i></a>
    </div>

    <ul id="list" class="collapsible popout" data-collapsible="accordion" style="margin-top: 40px;">
    </ul>

</div>
<jsp:include page="Footer.jsp"/>
<!--  Scripts-->
<script src="js/jquery-3.1.0.min.js"></script>
<script src="plugin/materialize/js/materialize.js"></script>
<script src="plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
