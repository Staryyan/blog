<%-- The main page of the whole website.--%>
<html>
<head>
    <title>Title</title>
    <link href="css/material-icons.css" type="text/css" rel="stylesheet">
    <link href="plugin/materialize/css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="plugin/materialize/css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection"/>
    <link href="css/main.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <script>
        (function($){
            $(function(){

                $('.button-collapse').sideNav();

            }); // end of document ready
        })(jQuery); // end of jQuery name space
    </script>
    <style>
        header, main, footer {
            padding-left: 300px;
        }

        @media only screen and (max-width : 992px) {
            header, main, footer {
                padding-left: 0;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <jsp:include page="Navigation.jsp" />
        <%--header introduction--%>
    <h1 class="header center red-text">Stary's blog</h1>
    <div class="row-center">
        <h5 class="header col s12 light">An interesting blog, but more than a blog, based on Material Design.</h5>
    </div>
    <br>
    <div class="row center">
        <a href="article.jsp" id="download-button" class="btn-large waves-effect waves-red red">Join us!</a>
    </div>
        <%--detail introduction--%>
    <div class="section">
        <div class="row">
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="large material-icons">thumb_up</i></h2>
                    <h5 class="center">Read Article freely!</h5>
                    <p class="light">In this blog, you can read funny and useful technique articles freely and review whenever you have some questions about the topic.</p>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="large material-icons">group</i></h2>
                    <h5 class="center">Discussion With friends!</h5>
                    <p class="light">This blog is more than a blog. You can initialize a discussion about your interested topic and invite your friend to join in.
                        Discussing with your friends, you will must be better than now.
                    </p>
                </div>
            </div>
            <div class="col s12 m4">
                <div class="icon-block">
                    <h2 class="center light-blue-text"><i class="large material-icons">settings</i></h2>
                    <h5 class="center">Share your knowledge!</h5>
                    <p class="light">In order to keep the quality of articles, we can't let every one to write,
                        but if you really like this blog and wanna share your knowledge with others, you
                        can send us an email, we decide if your article can be published. And of course, we will reserve your right.</p>
                </div>
            </div>
        </div>
    </div>

    <ul id="slide-out" class="side-nav">
        <%--<li><div class="userView">--%>
            <%--<img class="background" src="images/office.jpg">--%>
            <%--<a href="#!user"><img class="circle" src="images/yuna.jpg"></a>--%>
            <%--<a href="#!name"><span class="white-text name">John Doe</span></a>--%>
            <%--<a href="#!email"><span class="white-text email">jdandturk@gmail.com</span></a>--%>
        <%--</div></li>--%>
        <li><a href="#!"><i class="material-icons">cloud</i>First Link With Icon</a></li>
        <li><a href="#!">Second Link</a></li>
        <li><div class="divider"></div></li>
        <li><a class="subheader">Subheader</a></li>
        <li><a class="waves-effect" href="#!">Third Link With Waves</a></li>
    </ul>
    <a href="#" class="button-collapse" data-activates="slide-out"><i class="material-icons">menu</i>Click me!</a>
</div>
<jsp:include page="Footer.jsp" />
<!--  Scripts-->
<script src="js/jquery-3.1.0.min.js"></script>
<script src="plugin/materialize/js/materialize.js"></script>
<script src="plugin/materialize/js/materialize.min.js"></script>
</body>
</html>
